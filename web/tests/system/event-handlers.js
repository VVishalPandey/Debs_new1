import {client} from 'nightwatch-cucumber'
import {defineSupportCode} from 'cucumber'
import reporter from 'cucumber-html-reporter'
import {featureRunTime} from './influx/runtimeCalculation'

const d = Date.now()
const reportFile = `${process.env.reportsPath}/archive/Report_${d}/index.html`

const testInstance = process.env.INSTANCE || 'chrome'
const testInstancesCount = testInstance.split(',').length
const testBrowser = process.env.testBrowser.toUpperCase()
const parallelRun = process.env.PARALLEL_RUN || false
let cucumberID = ''
let reportTitle = 'Cucumberjs Run Report'

if (parallelRun === 'true') {
    cucumberID = `-${process.env.__NIGHTWATCH_ENV_KEY.split('_')[1]}`
}

if (testInstancesCount > 1) {
    for (let i = 2; i <= testInstancesCount; i++) {
        if (testBrowser === testInstance.split(',')[i - 1].toUpperCase()) {
            cucumberID = `-${i}`
        }
    }
}

if (process.env.TAG.includes('automatedSanity') || process.env.TAG === 'e2e') {
    reportTitle = 'Sanity Suite Run Report'
}

const optionsBackup = {
    brandTitle: reportTitle,
    theme: 'bootstrap',
    jsonFile: `${process.env.reportsPath}/cucumber${cucumberID}.json`,
    output: reportFile,
    reportSuiteAsScenarios: true,
    launchReport: false,
    metadata: {
        'Country & Channel': `${
            process.env.country
        } & ${process.env.channel.toUpperCase()}`,
        Environment: `${process.env.TEST_PROFILE.toUpperCase()}`,
        Browser: `${testBrowser}`,
        'Is Headless': `${process.env.isHeadless}`
    }
}

const optionsGeneric = {
    // name: `<b> Country: </b> <span style="font-weight:normal;">${process.env.country} </span> <b> Channel: </b> <span style="font-weight:normal;"> ${process.env.channel} </span> <b> Brower: </b> <span style="font-weight:normal;"> ${testBrowser}</span>`,
    brandTitle: reportTitle,
    scenarioTimestamp: true,
    theme: 'bootstrap',
    jsonFile: `${process.env.reportsPath}/cucumber${cucumberID}.json`,
    output: `${process.env.reportsPath}/index.html`,
    reportSuiteAsScenarios: true,
    launchReport: false,
    metadata: {
        'Country & Channel': `${
            process.env.country
        } & ${process.env.channel.toUpperCase()}`,
        Environment: `${process.env.TEST_PROFILE.toUpperCase()}`,
        Browser: `${testBrowser}`,
        'Is Headless': `${process.env.isHeadless}`
    }
}

defineSupportCode(({registerHandler}) => {
    registerHandler('AfterFeatures', (features, callback) => {
        setTimeout(async () => {
            await client.end()
            await console.log('json file path: ', optionsGeneric.jsonFile)
            // await reporter.generate(optionsBackup)
            await reporter.generate(optionsGeneric)
            if (
                process.env.isHeadless === 'YES' &&
                process.env.TEST_DATA_SET.includes('DESKTOP') &&
                process.env.TAG === 'automatedSanity'
            ) {
                await featureRunTime(
                    `${process.env.reportsPath}/cucumber${cucumberID}.json`,
                    `${process.env.reportsPath}/index.html`
                )
            }
            await callback()
        }, 1000)
    })
})
