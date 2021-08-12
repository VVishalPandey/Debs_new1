/* * *  *  * *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  * */
/* Copyright (c) 2017 Mobify Research & Development Inc. All rights reserved. */
/* * *  *  * *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  * */

const testFeatureFile = process.env.TEST_DATA_SET || 'UK'
const testDevice = process.env.DEVICE || 'android3'

const featureFile = {
    uk: 'tests/system/features-uk',
    roi: 'tests/system/features-roi',
    int: 'tests/system/features-int',
    tablet: 'tests/system/features-tablet-uk',
    tabletInt: 'tests/system/features-tablet-int',
    tabletRoi: 'tests/system/features-tablet-roi'
}

let finalFeatureFile
let tabWindowSize = 'window-size=375,667'

if (testFeatureFile === 'UK') {
    finalFeatureFile = featureFile.uk
} else if (testFeatureFile === 'ROI') {
    finalFeatureFile = featureFile.roi
} else if (testFeatureFile === 'INT') {
    finalFeatureFile = featureFile.int
} else if (testFeatureFile === 'TABLET') {
    finalFeatureFile = featureFile.tablet
    tabWindowSize = 'window-size=768,1024'
} else if (testFeatureFile === 'TABLET-INT') {
    finalFeatureFile = featureFile.tabletInt
    tabWindowSize = 'window-size=768,1024'
} else if (testFeatureFile === 'TABLET-ROI') {
    finalFeatureFile = featureFile.tabletRoi
    tabWindowSize = 'window-size=768,1024'
}

const arr = [
    /**
     * To facilitate testing of Push notifications, we need
     * a user agent that is supported. Unfortunately, Selenium
     * doesn't seem to have any emulated mobile devices that
     * we support.
     */
    tabWindowSize,
    '--allow-running-insecure-content',
    '--test-type'
]

// if (testFeatureFile !== 'TABLET') {
arr.push(
    '--user-agent="Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Mobile Safari/537.36"'
)
// }

let reportsPath =
    process.env.CIRCLE_TEST_REPORTS || './reports/e2e/' + testDevice
console.log(reportsPath)
let screenshotsPath =
    process.env.CIRCLE_ARTIFACTS ||
    './reports/e2e/' + testDevice + '/screenshots'
// var reportsPath = process.env.CIRCLE_TEST_REPORTS || './reports/e2e'
// var screenshotsPath =
//     process.env.CIRCLE_ARTIFACTS || './reports/e2e/screenshots'

process.env.reportsPath = reportsPath
process.env.screenshotsPath = screenshotsPath

require('babel-core/register')

require('nightwatch-cucumber')({
    cucumberArgs: [
        '--compiler',
        'js:babel-core/register',
        '--require',
        'tests/system/event-handlers.js',
        '--require',
        'tests/system/timeout.js',
        '--require',
        'tests/system/step-definitions',
        '--format',
        'pretty',
        '--format',
        'json:reports/e2e/' + testDevice + '/cucumber.json',
        '--require',
        'tests/system/hooks.js',
        finalFeatureFile
    ]
})

module.exports = {
    output_folder: reportsPath,
    custom_commands_path: './node_modules/nightwatch-commands/commands',
    custom_assertions_path: './node_modules/nightwatch-commands/assertions',
    selenium: {
        selenium_start_process: false,
        launch_url: 'http://127.0.0.1:4723/wd/hub',
        host: '127.0.0.1',
        port: 4723,
        cli_args: {
            'webdriver.chrome.driver': 'bin/chromedriver.exe',
            'webdriver.gecko.driver': 'bin/geckodriver64.exe',
            'webdriver.edge.driver': 'bin/MicrosoftWebDriver.exe'
        }
    },
    // "test_workers" : {"enabled" : true, "workers" : "auto"},

    // ./node_modules/chromedriver/lib/chromedriver/chromedriver
    test_settings: {
        default: {
            launch_url: 'http://test.com',
            selenium_port: 4723,
            selenium_host: '127.0.0.1',
            silent: true,
            operationTimeout: 6000,
            screenshots: {
                enabled: true,
                path: 'screenshots'
            }
        },
        androidNative: {
            desiredCapabilities: {
                automationName: 'Appium',
                browserName: '',
                appPackage: 'com.android.calculator2',
                appActivity: 'com.android.calculator2.Calculator',
                platformName: 'Android',
                platformVersion: '6.0',
                device: 'Android',
                deviceName: 'test',
                avd: 'test'
            }
        },

        androidBrowser: {
            desiredCapabilities: {
                automationName: 'Appium',
                browserName: 'Chrome',
                platformName: 'Android',
                platformVersion: '6.0',
                device: 'Android',
                deviceName: 'test',
                avd: 'test'
            }
        },

        android: {
            selenium_start_process: false,
            selenium_port: 4723,
            selenium_host: '127.0.0.1',
            silent: true,
            desiredCapabilities: {
                browserName: 'Chrome',
                platformName: 'Android',
                platformVersion: '7.0',
                device: 'Android',
                deviceName: 'Galaxy S8',
                //       "avd": "Galaxy S8",
                automationName: 'UiAutomator2'
            }
        },

        android_S6: {
            selenium_start_process: false,
            selenium_port: 4723,
            selenium_host: '127.0.0.1',
            silent: true,
            desiredCapabilities: {
                browserName: 'Chrome',
                platformName: 'Android',
                platformVersion: '7.0',
                device: 'Android',
                deviceName: 'Galaxy S6',
                //       "avd": "Galaxy S8",
                automationName: 'UiAutomator2'
            }
        },

        android2: {
            selenium_start_process: false,
            selenium_port: 4723,
            selenium_host: '127.0.0.1',
            silent: true,
            desiredCapabilities: {
                browserName: 'Chrome',
                platformName: 'Android',
                platformVersion: '5.1.1',
                device: 'Android',
                deviceName: '2nd_fire',
                //       "avd": "Galaxy S8",
                automationName: 'UiAutomator2'
            }
        },

        android3: {
            selenium_start_process: false,
            selenium_port: 4823,
            selenium_host: '127.0.0.1',
            silent: true,
            desiredCapabilities: {
                browserName: 'Chrome',
                platformName: 'Android',
                platformVersion: '8.1.0',
                device: 'Android',
                deviceName: 'Vadri',
                //       "avd": "Galaxy S8",
                automationName: 'UiAutomator2'
            }
        },

        android4: {
            selenium_start_process: false,
            selenium_port: 4723,
            selenium_host: '127.0.0.1',
            silent: true,
            desiredCapabilities: {
                browserName: 'Chrome',
                platformName: 'Android',
                platformVersion: '8.1.0',
                device: 'Android',
                deviceName: 'Pixel C',
                //       "avd": "Galaxy S8",
                automationName: 'UiAutomator2'
            }
        },

        android5: {
            selenium_start_process: false,
            selenium_port: 4824,
            selenium_host: '127.0.0.1',
            silent: true,
            desiredCapabilities: {
                browserName: 'Chrome',
                platformName: 'Android',
                platformVersion: '5.0',
                device: 'Android',
                deviceName: 'Debenhams (Galaxy Note',
                //       "avd": "Galaxy S8",
                automationName: 'UiAutomator2'
            }
        },

        android_samsungTab: {
            selenium_start_process: false,
            selenium_port: 4723,
            selenium_host: '127.0.0.1',
            silent: true,
            desiredCapabilities: {
                browserName: 'Chrome',
                platformName: 'Android',
                platformVersion: '5.0.2',
                device: 'Android',
                deviceName: 'Galaxy Tab 4',
                //       "avd": "Galaxy S8",
                automationName: 'UiAutomator2'
            }
        },

        android_samsungGalaxyTabA: {
            selenium_start_process: false,
            selenium_port: 4723,
            selenium_host: '127.0.0.1',
            silent: true,
            desiredCapabilities: {
                browserName: 'Chrome',
                platformName: 'Android',
                platformVersion: '7.1.1',
                device: 'Android',
                deviceName: 'Galaxy Tab A',
                //       "avd": "Galaxy S8",
                automationName: 'UiAutomator2'
            }
        },
        android1: {
            selenium_start_process: false,
            selenium_port: 4723,
            selenium_host: '127.0.0.1',
            silent: true,
            desiredCapabilities: {
                browserName: 'Chrome',
                platformName: 'Android',
                platformVersion: '8.1.0',
                device: 'Android',
                deviceName: 'd9a70646',
                //       "avd": "Galaxy S8",
                automationName: 'UiAutomator2'
            }
        },

        selenium: {
            cli_args: {
                'webdriver.chrome.driver':
                    './node_modules/nightwatch-commands/selenium/drivers/chromedriver'
            }
        },

        iOS: {
            selenium_start_process: false,
            selenium_port: 4723,
            selenium_host: '127.0.0.1',
            silent: true,
            desiredCapabilities: {
                browserName: 'Safari',
                platformName: 'iOS',
                deviceName: 'iPhone 7',
                automationName: 'XCUITest',
                startIWDP: true,
                udid: 'auto',
                showXcodeLog: true,
                xcodeSigningId: 'iPhone Developer',
                xcodeOrgId: 'NNZP58UQQ9',
                updatedWDABundleId: 'com.Sapient.WebDriverAgentRunner.debenhams'
            }
        }
    }
}
