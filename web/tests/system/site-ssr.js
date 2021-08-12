import {client} from 'nightwatch-cucumber'
import testData from './test-data'

const testProfile = process.env.TEST_PROFILE || 'local'
const testDataSet = process.env.TEST_DATA_SET

export const profiles = async url => {
    if (testProfile === 'production' || testProfile === 'bundle') {
        await client.url(testData[url])
    } else if (testProfile === 'local') {
        if (
            testDataSet.includes('ROI') &&
            testData[url].includes(testData.key)
        ) {
            await client.url(
                testData[url].replace(testData.key, 'localhost:3444')
            )
        } else if (
            testDataSet.includes('ROI') &&
            testData[url].includes(testData.keyUK)
        ) {
            await client.url(
                testData[url].replace(testData.keyUK, 'localhost:3444')
            )
        } else if (!testDataSet.includes('ROI')) {
            await client.url(
                testData[url].replace(testData.key, 'localhost:3443')
            )
        }
    } else if (
        testProfile.includes('bundleUat') &&
        testDataSet.includes('ROI')
    ) {
        {
            const envNumber = testProfile.split('bundleUat')[1]
            if (testData[url].includes(testData.key)) {
                await client.url(
                    testData[url].replace(
                        testData.key,
                        `uat-${envNumber}-ie-debenhams-progressive.mobify-storefront.com`
                    )
                )
            } else if (testData[url].includes(testData.keyUK)) {
                await client.url(
                    testData[url].replace(
                        testData.keyUK,
                        `uat-${envNumber}-debenhams-progressive.mobify-storefront.com`
                    )
                )
            }
        }
    } else if (
        testProfile.includes('bundleUat') &&
        !testDataSet.includes('ROI')
    ) {
        const envNumber = testProfile.split('bundleUat')[1]
        if (testData[url].includes(testData.key)) {
            await client.url(
                testData[url].replace(
                    testData.key,
                    `uat-${envNumber}-debenhams-progressive.mobify-storefront.com`
                )
            )
        } else if (testData[url].includes(testData.keyROI)) {
            await client.url(
                testData[url].replace(
                    testData.keyROI,
                    `uat-${envNumber}-ie-debenhams-progressive.mobify-storefront.com`
                )
            )
        }
    } else if (testProfile === 'prodToBe' && !testDataSet.includes('ROI')) {
        if (testData[url].includes(testData.key)) {
            await client.url(
                testData[url].replace(
                    testData.key,
                    'uk-intl.mobify-debenhams.com'
                )
            )
        } else if (testData[url].includes(testData.keyROI)) {
            await client.url(
                testData[url].replace(
                    testData.keyROI,
                    'ie.mobify-debenhams.com'
                )
            )
        }
    } else if (testProfile === 'prodToBe' && testDataSet.includes('ROI')) {
        if (testData[url].includes(testData.key)) {
            await client.url(
                testData[url].replace(testData.key, 'ie.mobify-debenhams.com')
            )
        } else if (testData[url].includes(testData.keyUK)) {
            await client.url(
                testData[url].replace(
                    testData.keyUK,
                    'uk-intl.mobify-debenhams.com'
                )
            )
        }
    } else if (testProfile === 'nonProd' && testDataSet.includes('TESTCCC')) {
        if (testData[url].includes(testData.key)) {
            await client.url(
                testData[url].replace(
                    testData.key,
                    'nonprod-ccc-debenhams-progressive.mobify-storefront.com'
                )
            )
        } else if (testData[url].includes(testData.keyROI)) {
            await client.url(
                testData[url].replace(
                    testData.keyROI,
                    'nonprod-ccc-ie-debenhams-progressive.mobify-storefront.com'
                )
            )
        }
    }

    if (testDataSet.includes('DESKTOP')) {
        await client.windowMaximize()
    }
}
