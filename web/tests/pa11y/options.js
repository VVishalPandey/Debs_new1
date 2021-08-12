/* eslint-disable import/no-commonjs */

module.exports = {
    viewport: {
        width: 320,
        height: 480,
        deviceScaleFactor: 2,
        isMobile: true
    },
    // chromeLaunchConfig: {
    //     executablePath: '',
    //     viewport: {
    //         width: 320,
    //         height: 480
    //     },
    //     isMobile: true
    // },
    userAgent: 'Chrome MobifyPreview',
    // Available Options ['Section508', 'WCAG2A', 'WCAG2AA', 'WCAG2AAA']
    standard: 'WCAG2AA',
    screenCapture: './reports/my-screen-capture.png',
    timeout: 30000,
    wait: 2000,
    // beforeScript(page, options, next) {
    //     const waitUntil = (condition, retries, waitOver) => {
    //         page.evaluate(condition, (error, result) => {
    //             if (result || retries < 1) {
    //                 // Once the changes have taken place continue with pa11y testing
    //                 waitOver()
    //             } else {
    //                 retries -= 1
    //                 setTimeout(() => {
    //                     waitUntil(condition, retries, waitOver)
    //                 }, 200)
    //             }
    //         })
    //     }

    //     // The script to manipulate the page must be run with
    //     // page.evaluate to be run within the context of the page
    //     page.evaluate(() => {

    //     }, () => {
    //         // Use the waitUntil function to set the condition,
    //         // number of retries and the callback
    //         waitUntil(() => {
    //             return window.Progressive.initialPageLoaded
    //         }, 20, next)
    //     })
    // }
}
