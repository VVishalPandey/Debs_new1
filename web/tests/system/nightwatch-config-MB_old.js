/* * *  *  * *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  * */
/* Copyright (c) 2017 Mobify Research & Development Inc. All rights reserved. */
/* * *  *  * *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  * */

// import rimraf from 'rimraf'
// const rimraf = require('rimraf')

const argments = process.argv
const argumentsString = argments.toString()
const parts = argumentsString.split('-e')
const secondPart = parts[1]
const partsArray = secondPart.split(',')
const browser = partsArray[1]

const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

const featureFile = {
    uk: 'tests/system/features-uk',
    roi: 'tests/system/features-roi',
    int: 'tests/system/features-int',
    tablet: 'tests/system/features-tablet-uk',
    tabletInt: 'tests/system/features-tablet-int',
    tabletRoi: 'tests/system/features-tablet-roi',
    desktop: 'tests/system/features-desktop-uk',
    desktopInt: 'tests/system/features-desktop-int',
    desktopRoi: 'tests/system/features-desktop-roi'
}
let finalFeatureFile
const mobileWindowSize = 'window-size=375,667'
const tabletWindowSize = 'window-size=768,1024'
const desktopWindowSize = 'window-size=1440,900'
let windowSize

if (testFeatureFile.includes('TABLET')) {
    windowSize = tabletWindowSize
} else if (testFeatureFile.includes('DESKTOP')) {
    windowSize = desktopWindowSize
} else {
    windowSize = mobileWindowSize
}
process.env.winSize = windowSize

if (
    testFeatureFile === 'UK' ||
    testFeatureFile === 'PREPROD-UK' ||
    testFeatureFile === 'ALPHA-UK' ||
    testFeatureFile === 'STAGE-UK'
) {
    finalFeatureFile = featureFile.uk
} else if (testFeatureFile === 'ROI' || testFeatureFile === 'PREPROD-ROI') {
    finalFeatureFile = featureFile.roi
} else if (testFeatureFile === 'INT' || testFeatureFile === 'PREPROD-INT') {
    finalFeatureFile = featureFile.int
} else if (
    testFeatureFile === 'TABLET' ||
    testFeatureFile === 'PREPROD-TABLET'
) {
    finalFeatureFile = featureFile.tablet
} else if (
    testFeatureFile === 'TABLET-INT' ||
    testFeatureFile === 'PREPROD-TABLET-INT'
) {
    finalFeatureFile = featureFile.tabletInt
} else if (
    testFeatureFile === 'TABLET-ROI' ||
    testFeatureFile === 'PREPROD-TABLET-ROI'
) {
    finalFeatureFile = featureFile.tabletRoi
} else if (
    testFeatureFile === 'DESKTOP' ||
    testFeatureFile === 'PREPROD-DESKTOP'
) {
    finalFeatureFile = featureFile.desktop
} else if (
    testFeatureFile === 'DESKTOP-ROI' ||
    testFeatureFile === 'PREPROD-DESKTOP-ROI'
) {
    finalFeatureFile = featureFile.desktopRoi
} else if (
    testFeatureFile === 'DESKTOP-INT' ||
    testFeatureFile === 'PREPROD-DESKTOP-INT'
) {
    finalFeatureFile = featureFile.desktopInt
}
const arr = [
    /**
     * To facilitate testing of Push notifications, we need
     * a user agent that is supported. Unfortunately, Selenium
     * doesn't seem to have any emulated mobile devices that
     * we support.
     */
    windowSize,
    '--allow-running-insecure-content',
    '--test-type'
]

if (testFeatureFile.includes('DESKTOP')) {
    arr.push(
        '--user-agent="Mozilla/5.0 (X11; CrOS x86_64 8172.45.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.64 Safari/537.36"'
    )
} else {
    arr.push(
        '--user-agent="Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Mobile Safari/537.36"'
    )
}

/* let reportsPath = process.env.CIRCLE_TEST_REPORTS || './reports/e2e'
let screenshotsPath = process.env.CIRCLE_ARTIFACTS || './reports/e2e/screenshots'
*/

const reportsPath =
    process.env.CIRCLE_TEST_REPORTS || './reports/e2e/' + browser
const screenshotsPath =
    process.env.CIRCLE_ARTIFACTS || './reports/e2e/' + browser + '/screenshots'
// const reportsPath = './reports/e2e/' + browser
// const screenshotsPath = './reports/e2e/' + browser + '/screenshots'
// rimraf(reportsPath + '/*', function() {
//     console.log('done')
// })
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
        'json:reports/e2e/' + browser + '/cucumber.json',
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
        start_process: true,
        server_path:
            './node_modules/nightwatch-commands/selenium/selenium-server-standalone-3.4.0.jar',
        log_path: './node_modules/nightwatch-commands/selenium/',
        cli_args: {
            'webdriver.gecko.driver':
                './node_modules/nightwatch-commands/selenium/drivers/geckodriver',
            'webdriver.chrome.driver':
                './node_modules/nightwatch-commands/selenium/drivers/chromedriver',
            'webdriver.ie.driver':
                './node_modules/nightwatch-commands/selenium/drivers/InternetExplorerDriver.exe',
            'webdriver.edge.driver':
                './node_modules/nightwatch-commands/selenium/drivers/MicrosoftWebDriver.exe'
        }
    },

    /*   "test_workers": {
        "enabled": true,
        "workers": "auto",
        "detailed_output": false

      }  ,*/

    // ./node_modules/chromedriver/lib/chromedriver/chromedriver
    test_settings: {
        default: {
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
            desiredCapabilities: {
                javascriptEnabled: true,
                acceptSslCerts: true
            }
        },

        chrome: {
            // your local Chrome browser (chromedriver)
            desiredCapabilities: {
                browserName: 'chrome',
                javascriptEnabled: true,
                acceptSslCerts: true,
                chromeOptions: {
                    args: arr,
                    prefs: {
                        'profile.default_content_setting_values.notifications': 1
                    }
                }
            }
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
            desiredCapabilities: {
                browserName: 'safari',
                javascriptEnabled: true,
                acceptSslCerts: true,
                acceptInsecureCerts: true,
                safariOptions: {
                    args: ['--legacy', arr],
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
                trustAllSSLCertificates: true
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
                chromeOptions: {
                    args: [
                        /**
                         * To facilitate testing of Push notifications, we need
                         * a user agent that is supported. Unfortunately, Selenium
                         * doesn't seem to have any emulated mobile devices that
                         * we support.
                         */
                        '--user-agent="Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Mobile Safari/537.36"',
                        // 'window-size=320,850',
                        '--window-size=1920,1080',

                        '--allow-running-insecure-content',
                        '--test-type',
                        '--headless',
                        '--no-sandbox',
                        '--disable-gpu'
                    ],
                    prefs: {
                        'profile.default_content_setting_values.notifications': 1
                    }
                },
                javascriptEnabled: true,
                acceptSslCerts: true
            },
            selenium: {
                cli_args: {
                    'webdriver.chrome.driver':
                        './node_modules/chromedriver/lib/chromedriver/chromedriver'
                }
            }
        }
    }
}
