/* * *  *  * *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  * */
/* Copyright (c) 2017 Mobify Research & Development Inc. All rights reserved. */
/* * *  *  * *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  * */

// import rimraf from 'rimraf'
// const rimraf = require('rimraf')

const testFeatureFile = process.env.TEST_DATA_SET

const testInstance = process.env.INSTANCE || 'chrome'
const gridValue = process.env.GRID
const parallelRun = process.env.PARALLEL_RUN || false

let reportFolderName = testInstance.concat(testFeatureFile)
let testBrowser = testInstance
let parallelRunSetting

process.env.isHeadless = 'NO'
if (
    process.argv
        .toString()
        .toUpperCase()
        .includes('REMOTE')
) {
    process.env.isHeadless = 'YES'
}

if (testInstance.includes(',')) {
    testBrowser = process.argv
        .toString()
        .split('-e')[1]
        .split(',')[1]
    reportFolderName = testBrowser.concat(testFeatureFile)
}

process.env.reportFolderName = reportFolderName

if (testInstance.toUpperCase().includes('DEVICE')) {
    testBrowser = 'chrome'
}
process.env.testBrowser = testBrowser

console.log('reportFolderName - ', reportFolderName)
console.log('testBrowser - ', testBrowser)

const featureFile = {
    uk: 'tests/system/features-uk',
    roi: 'tests/system/features-roi',
    tablet: 'tests/system/features-tablet-uk',
    tabletRoi: 'tests/system/features-tablet-roi',
    desktop: 'tests/system/features-desktop-uk',
    desktopRoi: 'tests/system/features-desktop-roi',
    desktopCccUk: 'tests/system/features-ccc-uk',
    desktopCccRoi: 'tests/system/features-ccc-roi'
}
let finalFeatureFile
const mobileWindowSize = {width: 360, height: 640, pixelRatio: 3}
const tabletWindowSize = {width: 768, height: 1024, pixelRatio: 2}
// const tabletWindowSize = 'window-size=768,1024'
const desktopWindowSize = 'window-size=1440,900'
let windowSize
let screensize
let channel
let country

if (testFeatureFile.includes('TABLET')) {
    windowSize = tabletWindowSize
    screensize = 'Tablet'
} else if (testFeatureFile.includes('DESKTOP')) {
    windowSize = desktopWindowSize
    screensize = 'Desktop'
} else {
    windowSize = mobileWindowSize
    screensize = 'Mobile'
}
process.env.winSize = windowSize
process.env.device = screensize

if (
    testFeatureFile === 'UK' ||
    testFeatureFile === 'PREPROD-UK' ||
    testFeatureFile === 'ALPHA-UK' ||
    testFeatureFile === 'STAGE-UK'
) {
    finalFeatureFile = featureFile.uk
    country = 'UK'
    channel = 'Mobile'
} else if (
    testFeatureFile === 'ROI' ||
    testFeatureFile === 'PREPROD-ROI' ||
    testFeatureFile === 'ALPHA-ROI'
) {
    finalFeatureFile = featureFile.roi
    country = 'ROI'
    channel = 'Mobile'
} else if (
    testFeatureFile === 'TABLET' ||
    testFeatureFile === 'PREPROD-TABLET' ||
    testFeatureFile === 'ALPHA-TABLET'
) {
    finalFeatureFile = featureFile.tablet
    country = 'UK'
    channel = 'Tablet'
} else if (
    testFeatureFile === 'TABLET-ROI' ||
    testFeatureFile === 'PREPROD-TABLET-ROI' ||
    testFeatureFile === 'ALPHA-TABLET-ROI'
) {
    finalFeatureFile = featureFile.tabletRoi
    country = 'ROI'
    channel = 'Tablet'
} else if (
    testFeatureFile === 'DESKTOP' ||
    testFeatureFile === 'PREPROD-DESKTOP' ||
    testFeatureFile === 'ALPHA-DESKTOP'
) {
    finalFeatureFile = featureFile.desktop
    country = 'UK'
    channel = 'Desktop'
} else if (
    testFeatureFile === 'DESKTOP-ROI' ||
    testFeatureFile === 'PREPROD-DESKTOP-ROI' ||
    testFeatureFile === 'ALPHA-DESKTOP-ROI'
) {
    finalFeatureFile = featureFile.desktopRoi
    country = 'ROI'
    channel = 'Desktop'
} else if (testFeatureFile === 'TESTCCC-DESKTOP') {
    finalFeatureFile = featureFile.desktopCccUk
    country = 'UK'
    channel = 'Desktop'
} else if (testFeatureFile === 'TESTCCC-DESKTOP-ROI') {
    finalFeatureFile = featureFile.desktopCccRoi
    country = 'ROI'
    channel = 'Desktop'
}

process.env.country = country
process.env.channel = channel

let standalonePath =
    './node_modules/selenium-server-standalone-jar/jar/selenium-server-standalone-3.4.0.jar'
if (testInstance === 'chrome' && gridValue.toUpperCase() === 'FALSE') {
    standalonePath =
        './node_modules/nightwatch-commands/selenium/selenium-server.jar'
}

let chromeConfig
// if (testFeatureFile.includes('TABLET')) {
//     chromeConfig = [
//         /**
//          * To facilitate testing of Push notifications, we need
//          * a user agent that is supported. Unfortunately, Selenium
//          * doesn't seem to have any emulated mobile devices that
//          * we support.
//          */
//         windowSize,
//         '--allow-running-insecure-content',
//         '--test-type'
//     ]
// }

if (testFeatureFile.includes('DESKTOP')) {
    chromeConfig = {
        args: [
            'start-fullscreen',
            'user-agent= "Mozilla/5.0 (X11; CrOS x86_64 8172.45.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.64 Safari/537.36"'
        ],
        prefs: {
            'profile.default_content_setting_values.notifications': 1
        }
    }
} else if (testFeatureFile.includes('TABLET')) {
    // chromeConfig.push(
    //     '--user-agent="Mozilla/5.0 (iPad; CPU OS 10_3_3 like Mac OS X) AppleWebKit/603.3.8 (KHTML, like Gecko) Version/10.0 Mobile/14G60 Safari/602.1"'
    // )
    chromeConfig = {
        mobileEmulation: {
            deviceMetrics: windowSize,
            userAgent:
                'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36'
        },
        prefs: {
            'profile.default_content_setting_values.notifications': 1
        }
    }
} else {
    chromeConfig = {
        mobileEmulation: {
            deviceMetrics: windowSize,
            userAgent:
                'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Mobile Safari/537.36'
        },
        prefs: {
            'profile.default_content_setting_values.notifications': 1
        }
    }
}

let chromeCapabilities
// if (testFeatureFile.includes('TABLET')) {
//     chromeCapabilities = {
//         browserName: 'chrome',
//         chromeOptions: {
//             args: chromeConfig,
//             prefs: {
//                 'profile.default_content_setting_values.notifications': 1
//             }
//         },
//         javascriptEnabled: true,
//         acceptSslCerts: true
//     }
// } else {
chromeCapabilities = {
    browserName: 'chrome',
    chromeOptions: chromeConfig,
    javascriptEnabled: true,
    acceptSslCerts: true
}
// }

const reportsPath =
    process.env.CIRCLE_TEST_REPORTS || `./reports/e2e/${reportFolderName}`
const screenshotsPath =
    process.env.CIRCLE_ARTIFACTS ||
    `./reports/e2e/${reportFolderName}/screenshots`

process.env.reportsPath = reportsPath
process.env.screenshotsPath = screenshotsPath

// rimraf(reportsPath + '/*', function() {
//     console.log('done')
// })

if (parallelRun.includes('true')) {
    finalFeatureFile = finalFeatureFile.concat('/0-end-to-end-scripts')
    parallelRunSetting = {
        enabled: parallelRun,
        workers: 'auto'
    }
}

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
        `json:reports/e2e/${reportFolderName}/cucumber.json`,
        '--require',
        'tests/system/hooks.js',
        finalFeatureFile
    ]
})

let seleniumValue
let defaultTestSetting
if (testInstance.toUpperCase().includes('DEVICE')) {
    seleniumValue = {
        selenium_start_process: false,
        launch_url: 'http://127.0.0.1:4723/wd/hub',
        host: '127.0.0.1',
        port: 4723,
        cli_args: {
            'webdriver.chrome.driver': 'bin/chromedriver.exe',
            'webdriver.gecko.driver': 'bin/geckodriver64.exe',
            'webdriver.edge.driver': 'bin/MicrosoftWebDriver.exe'
        }
    }
    defaultTestSetting = {
        launch_url: 'http://test.com',
        selenium_port: 4723,
        selenium_host: '127.0.0.1',
        silent: true,
        operationTimeout: 6000,
        end_session_on_fail: false,
        output: true,
        exclude: ['page-objects', 'test-scripts'],
        screenshots: {
            enabled: true,
            on_error: true,
            path: screenshotsPath,
            on_failure: true
        }
    }
} else if (testInstance.includes('Samsung')) {
    defaultTestSetting = {
        launch_url: 'http://localhost',
        selenium_port: 80,
        selenium_host: 'ondemand.saucelabs.com',
        silent: true,
        screenshots: {
            enabled: false,
            path: ''
        },
        globals: {
            waitForConditionTimeout: 10000,
            commandTimeout: 10000,
            idleTimeout: 10000
        },
        username: 'vmalhotra1',
        access_key: '8bcd78c4-08a4-46a2-ab29-c412ad80dd0d',

        skip_testcases_on_fail: false,

        desiredCapabilities: {
            javascriptEnabled: true,
            acceptSslCerts: true
        }
    }
} else {
    if (
        gridValue.toUpperCase() === 'TRUE' &&
        testFeatureFile.toUpperCase().includes('DESKTOP')
    ) {
        let port
        let id
        if (!testFeatureFile.toUpperCase().includes('ROI')) {
            port = 5555
            id = 1
        } else if (testFeatureFile.toUpperCase().includes('ROI')) {
            port = 6666
            id = 2
        }
        seleniumValue = {
            start_process: true,
            role: 'node',
            hub: 'http://localhost:4444/grid/register',
            port: port,
            server_path: `./node_modules/selenium-server-standalone-jar/jar/selenium-server-standalone-3.4.0.${id}.jar`,
            log_path: './node_modules/nightwatch-commands/selenium/',
            cli_args: {
                'webdriver.gecko.driver': `./node_modules/geckodriver/geckodriver${id}`,
                'webdriver.chrome.driver': `./node_modules/nightwatch-commands/selenium/drivers/chromedriver${id}`,
                'webdriver.ie.driver':
                    './node_modules/nightwatch-commands/selenium/drivers/InternetExplorerDriver.exe',
                'webdriver.edge.driver':
                    './node_modules/nightwatch-commands/selenium/drivers/MicrosoftWebDriver.exe'
            }
        }
    } else {
        seleniumValue = {
            start_process: true,
            // server_path:
            //     './node_modules/nightwatch-commands/selenium/selenium-server.jar',
            server_path: standalonePath,
            log_path: './node_modules/nightwatch-commands/selenium/',
            cli_args: {
                'webdriver.gecko.driver':
                    './node_modules/geckodriver/geckodriver',
                'webdriver.chrome.driver':
                    './node_modules/nightwatch-commands/selenium/drivers/chromedriver',
                'webdriver.ie.driver':
                    './node_modules/nightwatch-commands/selenium/drivers/InternetExplorerDriver.exe',
                'webdriver.edge.driver':
                    './node_modules/nightwatch-commands/selenium/drivers/MicrosoftWebDriver.exe'
            }
        }
    }
    defaultTestSetting = {
        globals: {
            waitForConditionTimeout: 10000,
            waitForConditionPollInterval: 500
        },
        end_session_on_fail: false,
        silent: true,
        output: true,
        exclude: ['page-objects', 'test-scripts'],
        screenshots: {
            enabled: true,
            path: screenshotsPath,
            on_failure: true
        },
        desiredCapabilities: chromeCapabilities,
        test_workers: parallelRunSetting
    }
}

module.exports = {
    live_output: true,
    output_folder: reportsPath,
    custom_commands_path: './node_modules/nightwatch-commands/commands',
    custom_assertions_path: './node_modules/nightwatch-commands/assertions',
    selenium: seleniumValue,

    test_settings: {
        default: defaultTestSetting,

        chrome: {
            // your local Chrome browser (chromedriver)
            desiredCapabilities: chromeCapabilities
        },

        firefox: {
            desiredCapabilities: {
                browserName: 'firefox',
                marionette: true,
                javascriptEnabled: true,
                acceptSslCerts: true,
                acceptInsecureCerts: true
            }
        },

        safari: {
            webdriver: {
                use_legacy_jsonwire: false,
                start_process: true,
                server_path: '/usr/bin/safaridriver',
                port: 4445
            },
            desiredCapabilities: {
                browserName: 'safari',
                javascriptEnabled: true,
                acceptSslCerts: true,
                acceptInsecureCerts: true,
                safariOptions: {
                    args: ['--legacy', chromeConfig],
                    prefs: {
                        'profile.default_content_setting_values.notifications': 1
                    }
                }
            }
        },

        ie: {
            desiredCapabilities: {
                browserName: 'internet explorer',
                javascriptEnabled: true,
                acceptSslCerts: true,
                elementScrollBehavior: 1,
                acceptInsecureCerts: true
            }
        },

        msedge: {
            desiredCapabilities: {
                browserName: 'MicrosoftEdge',
                platform: 'Windows 10',
                version: '13.10586',
                javascriptEnabled: true,
                acceptSslCerts: true,
                elementScrollBehavior: 1,
                acceptInsecureCerts: true,
                trustAllSSLCertificates: true,
                InPrivate: true
            }
        },

        remote: {
            globals: {
                waitForConditionTimeout: 10000,
                waitForConditionPollInterval: 500
            },
            end_session_on_fail: false,
            silent: true,
            output: true,
            exclude: ['page-objects'],
            screenshots: {
                enabled: true,
                path: screenshotsPath,
                on_failure: true
            },
            desiredCapabilities: {
                browserName: 'chrome',
                javascriptEnabled: true,
                acceptSslCerts: true,
                chromeOptions: {
                    args: [
                        /**
                         * To facilitate testing of Push notifications, we need
                         * a user agent that is supported. Unfortunately, Selenium
                         * doesn't seem to have any emulated mobile devices that
                         * we support.
                         */
                        '--user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36"',
                        `${windowSize}`,
                        'allow-running-insecure-content',
                        'test-type',
                        'headless',
                        'no-sandbox',
                        'disable-gpu',
                        'ignore-certificate-errors'
                    ]
                },
                prefs: {
                    'profile.default_content_setting_values.notifications': 1
                }
                // binary : './node_modules/chromedriver/lib/chromedriver/chromedriver.exe',
            }
        },

        safariXCode: {
            globals: {
                waitForConditionTimeout: 10000,
                waitForConditionPollInterval: 500
            },
            end_session_on_fail: false,
            silent: true,
            output: true,
            exclude: ['page-objects', 'test-scripts'],
            screenshots: {
                enabled: true,
                path: screenshotsPath,
                on_failure: true
            },
            automationName: 'XCUITest',
            selenium_start_process: 'false',
            selenium_port: '4723',
            selenium_host: '0.0.0.0',
            desiredCapabilities: {
                browserName: 'Safari',
                platformName: 'iOS',
                platformVersion: '11.2',
                deviceName: 'iPhone 6s',
                javascriptEnabled: true,
                acceptSslCerts: true
            },
            selenium: {
                cli_args: {
                    'webdriver.chrome.driver':
                        './node_modules/nightwatch-commands/selenium/drivers/chromedriver'
                }
            }
        },

        deviceAndroidNative: {
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

        deviceAndroidBrowser: {
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

        deviceAndroid: {
            selenium_start_process: false,
            selenium_port: 4723,
            selenium_host: '127.0.0.1',
            silent: true,
            desiredCapabilities: {
                browserName: 'Chrome',
                chromedriverExecutable: '/usr/local/bin/chromedriver80',
                platformName: 'Android',
                platformVersion: '9',
                device: 'Android',
                deviceName: 'Galaxy S8',
                deviceId: '10.194.12.124:5554',
                //       "avd": "Galaxy S8",
                automationName: 'UiAutomator2'
            }
        },

        deviceAndroid3: {
            selenium_start_process: false,
            selenium_port: 4723,
            selenium_host: '127.0.0.1',
            silent: true,
            desiredCapabilities: {
                browserName: 'Chrome',
                platformName: 'Android',
                platformVersion: '8.1.0',
                device: 'Android',
                deviceName: 'Redmi',
                //       "avd": "Galaxy S8",
                automationName: 'UiAutomator2'
            }
        },

        deviceAndroid4: {
            selenium_start_process: false,
            selenium_port: 4724,
            selenium_host: '127.0.0.1',
            silent: true,
            desiredCapabilities: {
                browserName: 'Chrome',
                chromedriverExecutable: '/usr/local/bin/chromedriver81',
                platformName: 'Android',
                platformVersion: '8.1.0',
                device: 'Android',
                deviceName: 'Pixel C',
                deviceId: '10.194.12.13:5555',
                //       "avd": "Galaxy S8",
                automationName: 'UiAutomator2'
            }
        },

        deviceAndroid5: {
            selenium_start_process: false,
            selenium_port: 4725,
            selenium_host: '127.0.0.1',
            silent: true,
            desiredCapabilities: {
                browserName: 'Chrome',
                chromedriverExecutable: '/usr/local/bin/chromedriver2',
                platformName: 'Android',
                platformVersion: '5.0',
                device: 'Android',
                deviceName: 'Debenhams (Galaxy Note',
                deviceId: '10.194.13.23:5556',
                //       "avd": "Galaxy S8",
                automationName: 'UiAutomator2'
            }
        },

        deviceAndroid_samsungGalaxyTabA: {
            selenium_start_process: false,
            selenium_port: 4726,
            selenium_host: '127.0.0.1',
            silent: true,
            desiredCapabilities: {
                browserName: 'Chrome',
                chromedriverExecutable: '/usr/local/bin/chromedriver79',
                platformName: 'Android',
                platformVersion: '7.1.1',
                device: 'Android',
                deviceName: 'Galaxy Tab A',
                deviceId: '10.194.13.24:5557',
                //       "avd": "Galaxy S8",
                automationName: 'UiAutomator2'
            }
        },

        deviceAndroidHuawei: {
            selenium_start_process: false,
            selenium_port: 4727,
            selenium_host: '127.0.0.1',
            silent: true,
            desiredCapabilities: {
                browserName: 'Chrome',
                chromedriverExecutable: '/usr/local/bin/chromedriver80.1',
                platformName: 'Android',
                platformVersion: '6.0',
                device: 'Android',
                deviceName: 'Huawei',
                deviceId: '10.194.12.212:5558',
                //       "avd": "Huawei",
                automationName: 'UiAutomator2'
            }
        },

        deviceAndroid_samsungNote4: {
            selenium_start_process: false,
            selenium_port: 4723,
            selenium_host: '127.0.0.1',
            silent: true,
            desiredCapabilities: {
                browserName: 'Chrome',
                chromedriverExecutable: '/usr/local/bin/chromedriver78',
                platformName: 'Android',
                platformVersion: '6.0.1',
                device: 'Android',
                deviceName: 'Samsung Note 4',
                // deviceId: '10.194.12.149:5559',
                automationName: 'UiAutomator2'
            }
        },

        deviceAndroid_samsungGalaxyTabS3: {
            selenium_start_process: false,
            selenium_port: 4728,
            selenium_host: '127.0.0.1',
            silent: true,
            desiredCapabilities: {
                browserName: 'Chrome',
                chromedriverExecutable: '/usr/local/bin/chromedriver78',
                platformName: 'Android',
                platformVersion: '7.0',
                device: 'Android',
                deviceName: 'Galaxy Tab S3',
                deviceId: '10.194.12.149:5559',
                automationName: 'UiAutomator2'
            }
        },

        selenium: {
            cli_args: {
                'webdriver.chrome.driver':
                    './node_modules/nightwatch-commands/selenium/drivers/chromedriver'
            }
        },

        deviceiOS: {
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
        },

        Samsung_S7_Emulator: {
            desiredCapabilities: {
                browserName: 'chrome',
                deviceOrientation: 'portrait',
                deviceName: 'Samsung Galaxy S6 GoogleAPI Emulator',
                platformVersion: '7.1',
                platformName: 'Android'
            }
        }
    }
}
