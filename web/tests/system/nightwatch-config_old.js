/* * *  *  * *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  * */
/* Copyright (c) 2017 Mobify Research & Development Inc. All rights reserved. */
/* * *  *  * *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  * */

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
} else if (
    testFeatureFile === 'ROI' ||
    testFeatureFile === 'PREPROD-ROI' ||
    testFeatureFile === 'ALPHA-ROI'
) {
    finalFeatureFile = featureFile.roi
} else if (
    testFeatureFile === 'INT' ||
    testFeatureFile === 'PREPROD-INT' ||
    testFeatureFile === 'ALPHA-INT'
) {
    finalFeatureFile = featureFile.int
} else if (
    testFeatureFile === 'TABLET' ||
    testFeatureFile === 'PREPROD-TABLET' ||
    testFeatureFile === 'ALPHA-TABLET'
) {
    finalFeatureFile = featureFile.tablet
} else if (
    testFeatureFile === 'TABLET-INT' ||
    testFeatureFile === 'PREPROD-TABLET-INT' ||
    testFeatureFile === 'ALPHA-TABLET-INT'
) {
    finalFeatureFile = featureFile.tabletInt
} else if (
    testFeatureFile === 'TABLET-ROI' ||
    testFeatureFile === 'PREPROD-TABLET-ROI' ||
    testFeatureFile === 'ALPHA-TABLET-ROI'
) {
    finalFeatureFile = featureFile.tabletRoi
} else if (
    testFeatureFile === 'DESKTOP' ||
    testFeatureFile === 'PREPROD-DESKTOP' ||
    testFeatureFile === 'ALPHA-DESKTOP'
) {
    finalFeatureFile = featureFile.desktop
} else if (
    testFeatureFile === 'DESKTOP-ROI' ||
    testFeatureFile === 'PREPROD-DESKTOP-ROI' ||
    testFeatureFile === 'ALPHA-DESKTOP-ROI'
) {
    finalFeatureFile = featureFile.desktopRoi
} else if (
    testFeatureFile === 'DESKTOP-INT' ||
    testFeatureFile === 'PREPROD-DESKTOP-INT' ||
    testFeatureFile === 'ALPHA-DESKTOP-INT'
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
} else if (testFeatureFile.includes('TABLET')) {
    arr.push(
        '--user-agent="Mozilla/5.0 (iPad; CPU OS 10_3_3 like Mac OS X) AppleWebKit/603.3.8 (KHTML, like Gecko) Version/10.0 Mobile/14G60 Safari/602.1"'
    )
} else {
    arr.push(
        '--user-agent="Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Mobile Safari/537.36"'
    )
}

var reportsPath = process.env.CIRCLE_TEST_REPORTS || './reports/e2e/chrome'
var screenshotsPath =
    process.env.CIRCLE_ARTIFACTS || './reports/e2e/chrome/screenshots'

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
        'json:reports/e2e/chrome/cucumber.json',
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
            './node_modules/nightwatch-commands/selenium/selenium-server.jar',
        log_path: './node_modules/nightwatch-commands/selenium/'
    },

    // ./node_modules/chromedriver/lib/chromedriver/chromedriver
    test_settings: {
        // 'default': {
        //    'globals': {
        //        'waitForConditionTimeout': 60000,
        //        'waitForConditionPollInterval': 500
        //    },
        //    'launch_url': 'http://localhost',
        //    'selenium_host': '127.0.0.1',
        //    'selenium_port': 4444,
        //    'silent': true,
        //    'output': true,
        //    'end_session_on_fail': false,
        //    'screenshots': {
        //        'enabled': true,
        //        'on_failure': true,
        //        'on_error': true,
        //        'path': screenshotsPath
        //    },
        //    'exclude': ['page-objects'],
        //    'desiredCapabilities': {
        //        'browserName': 'phantomjs',
        //        'javascriptEnabled': true,
        //        'acceptSslCerts': true,
        //        'userAgent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36',
        //     //    'phantomjs.page.settings.userAgent':
        //        'phantomjs.cli.args': ['--ignore-ssl-errors=true']
        //    },
        //    'selenium': {
        //      'cli_args': {
        //          'phantomjs.binary.path': './node_modules/phantomjs-prebuilt/bin/phantomjs'
        //      }
        //    }
        // },
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
                browserName: 'chrome',
                // 'browserName': 'safari',
                chromeOptions: {
                    // 'safariOptions': {
                    args: arr,
                    prefs: {
                        'profile.default_content_setting_values.notifications': 1
                    }
                },
                javascriptEnabled: true,
                acceptSslCerts: true
            },
            // 'automationName': 'XCUITest',
            // 'selenium_start_process': 'false',
            // 'selenium_port': '4723',
            // 'selenium_host': '0.0.0.0',
            // 'desiredCapabilities': {
            //     'browserName': 'Safari',
            //     'platformName': 'iOS',
            //     'platformVersion': '11.2',
            //     'deviceName': 'iPhone 6s',
            //     'javascriptEnabled': true,
            //     'acceptSslCerts': true
            // },
            selenium: {
                cli_args: {
                    'webdriver.chrome.driver':
                        './node_modules/nightwatch-commands/selenium/drivers/chromedriver'
                }
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
        // 'ios': {
        //     'globals' : {
        //         'waitForConditionTimeout' : 10000,
        //         'waitForConditionPollInterval': 500,
        //     },
        //     'end_session_on_fail': false,
        //     'silent': true,
        //     'output': true,
        //     'exclude': ['page-objects', 'test-scripts'],
        //     'screenshots': {
        //         'enabled': true,
        //         'path': screenshotsPath,
        //         'on_failure': true,
        //     },
        //     'automationName': 'XCUITest',
        //     'selenium_start_process': 'false',
        //     'selenium_port': '4723',
        //     'selenium_host': '0.0.0.0',
        //     'desiredCapabilities': {
        //         'browserName': 'Safari',
        //         'platformName': 'iOS',
        //         'platformVersion': '11.2',
        //         // 'platformVersion': '10.3',
        //         'deviceName': 'iPhone 6s',
        //         // 'deviceName': 'iPhone 6s Plus',
        //         'javascriptEnabled': true,
        //         'acceptSslCerts': true
        //     },
        //     'selenium': {
        //       'cli_args': {
        //           'webdriver.chrome.driver': './node_modules/nightwatch-commands/selenium/drivers/chromedriver'
        //       }
        //     }
        // }
    }
}
