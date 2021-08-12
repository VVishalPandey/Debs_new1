import fs from 'fs'
import path from 'path'
import {InfluxDB} from 'influx'

const country = process.env.country
const channel = process.env.channel
const browser = process.env.testBrowser || 'chrome'
const environment = process.env.TEST_PROFILE
let pass
let fail
let runTime = 0

// for running in Jenkins
const host = '10.133.80.4'
const _username = 'admin'
const _pass = 'lklw5erJqwqnsdE12s'

export const influx = new InfluxDB({
    host,
    database: 'e2e_run_status',
    username: _username,
    password: _pass
})

// for running in local
// export const influx = new InfluxDB({
//     host: 'localhost',
//     database: 'e2e_run_status'
// });

// createDatabase is used to create a database if it does not exist
export const createDatabase = async () => {
    console.log('----- create DB -----')
    await influx.getDatabaseNames().then(names => {
        return names.includes('e2e_run_status')
            ? ''
            : influx.createDatabase('e2e_run_status')
    })
}

// saveData is used to write the data into the influxdb into seperate measurements
export const saveData = async () => {
    console.log('----- save DB -----')
    console.log('run_time -> ', runTime)
    console.log('channel -> ', channel)
    console.log('country -> ', country)
    console.log('browser -> ', browser)
    console.log('env -> ', environment)
    console.log('pass -> ', pass)
    console.log('fail -> ', fail)
    await influx
        .writePoints(
            [
                {
                    measurement: 'run_status',
                    tags: {
                        browser,
                        channel,
                        country,
                        environment
                    },
                    fields: {
                        pass,
                        fail,
                        run_time: runTime
                    }
                }
            ],
            {
                database: 'e2e_run_status',
                precision: 's'
            }
        )
        .catch(error => {
            console.error(`Error saving data to InfluxDB! ${error.stack}`)
        })
}

export const featureRunTime = async (jsonPath, htmlPath) => {
    const rootDir = process.cwd()
    const reportJsonPath = path.resolve(rootDir, jsonPath)
    const reportHtmlPath = path.resolve(rootDir, htmlPath)

    const readFile = path => {
        return new Promise((resolve, reject) => {
            fs.readFile(path, 'utf8', (err, data) => {
                if (err) {
                    reject(err)
                }
                resolve(data)
            })
        })
    }

    const calculateScenarioTime = feature => {
        let featureRunTime = 0
        feature.elements.forEach(scenario => {
            scenario.steps.forEach(step => {
                if (step.result.status !== 'skipped') {
                    featureRunTime = featureRunTime + step.result.duration
                }
            })
        })
        return featureRunTime
    }

    await readFile(reportHtmlPath)
        .then(data => {
            pass = Number(data.split('Passed: ')[1].split('</span>')[0])
            fail = Number(data.split('Failed: ')[1].split('</span>')[0])
        })
        .then(async () => {
            await readFile(reportJsonPath).then(data => {
                let featureRunTime
                const fullJson = JSON.parse(data)
                fullJson.forEach((feature, index) => {
                    console.log('feature number -> ', index + 1)
                    featureRunTime = calculateScenarioTime(feature)
                    console.log(
                        'feature run time -> ',
                        typeof Number(
                            (Number(featureRunTime) / 1000).toFixed(2)
                        )
                    )
                    runTime =
                        Number(runTime) +
                        Number((Number(featureRunTime) / 1000).toFixed(2))
                })
            })
        })
        .then(async () => {
            await createDatabase()
            await saveData()
        })
}
