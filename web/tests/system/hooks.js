import {defineSupportCode} from 'cucumber'

defineSupportCode(({After}) => {
    After({tags: '@end'}, () => {
        // This hook will be executed after all scenarios with end tag
    })
})
 /*
import {client} from 'nightwatch-cucumber'
import {defineSupportCode} from 'cucumber'
import SauceLabs from 'saucelabs'

console.log('I am in Hooks')

// let SauceLabs = require('saucelabs')
defineSupportCode(({Before, After}) => {
    // const {Before, After} = require('cucumber')

    Before(() => {
        console.log('I am in Hooks Before')
        console.log(`WIN SIZE IS  ${process.env.winSize}`)
        const winSizeString = process.env.winSize
        console.log('WIN SIZE String  ' + winSizeString)
        const winsizeARRAY = winSizeString.split('=')
        console.log(winsizeARRAY)
        console.log(winsizeARRAY[0])
        console.log(winsizeARRAY[1])
        const screenSizeArray = winsizeARRAY[1].split(',')
        console.log(`SS ARRAY ${screenSizeArray}`)
        console.log(screenSizeArray[0])
        console.log(screenSizeArray[1])
        client.resizeWindow(screenSizeArray[0], screenSizeArray[1])

        // client.maximizeWindow();
    })

    After(scenarioResult => {
        console.log('I am in Hooks After')
        console.log(client.capabilities['webdriver.remote.sessionid'])
        console.log('client.capabilities ---->>>>> ', client.capabilities)
        if (process.env.SAUCELAB === 'Y') {
            let deviceName = ''
            let browserType = ''
            let orientationType = ''

            if (client.capabilities.deviceName) {
                deviceName = client.capabilities.deviceName
                browserType = client.capabilities.browserName
                orientationType = client.capabilities.orientation
            }
            console.log(`Device Under Test is : ${deviceName}`)
            console.log(`BrowserType Under Test is : ${browserType}`)
            console.log(`OrientationType Under Test is : ${orientationType}`)
            const saucelabs = new SauceLabs({
                username: 'vmalhotra1',
                password: '8bcd78c4-08a4-46a2-ab29-c412ad80dd0d'
            })

            const sessionid = client.capabilities['webdriver.remote.sessionid']
            const jobName = scenarioResult.scenario.feature.name
            // const passed = 'passed'
            const saucelabsJobName = `${deviceName}_${browserType}_${orientationType}`
            console.log(
                `SauceOnDemandSessionID=${sessionid} job-name='${jobName}`
            )
            console.log(`Setting saucelabsJobName to : ${saucelabsJobName}`)

            saucelabs.updateJob(sessionid, {
                //   passed: passed,
                name: saucelabsJobName
            })
        }
    })
})
// */
