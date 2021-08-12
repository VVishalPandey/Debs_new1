import {client} from 'nightwatch-cucumber'
import testData from '../test-data'
import PageObjects from '../page-objects/page-objects'
import {waitElementVisible} from '../methods/explicitWait'
import {clickByJQuery} from '../methods/click'
import {countElements} from './elements'

const cssSelectorsList = new PageObjects()
const testDataSet = process.env.TEST_DATA_SET || 'UK'

export const pcaDeliveryAddressGuestWithdebenhamsMVTOn = async () => {
    // with checkoutlocate debenhamsMVT on

    await client.getText(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.countrySelected,
        result => {
            client.assert.equal(result.value, testData.pcaFullAddressLine5)
        }
    )
    await client.getValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.houseNumber,
        result => {
            client.assert.equal(result.value, testData.pcaFullAddressLine1)
        }
    )

    await client.getValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.addressLine1,
        result => {
            client.assert.equal(result.value, testData.pcaFullAddressLine2)
        }
    )
    await client.getValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.city,
        result => {
            client.assert.equal(result.value, testData.pcaFullAddressLine3)
        }
    )

    await client.getValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.zipcode,
        result => {
            client.assert.equal(result.value, testData.pcaFullAddressLine4)
        }
    )
}

export const pcaDeliveryAddressGuest = async () => {
    let tempData
    if (
        testDataSet.includes('PREPROD') ||
        testDataSet.includes('CCC-DESKTOP')
    ) {
        await client.clearValue(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                .pcaAddressField
        )
        await client.setValue(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                .pcaAddressField,
            testData.wcsTestEnvAddress
        )
        await client.pause(testData.implicitTimeOut)
        await client.setValue(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                .pcaAddressField,
            testData.wcsTestEnvAddPostcode
        )
        await client.pause(testData.implicitTimeOut)
        await waitElementVisible('pcaDropFirstOption', 'homeDeliveryPage')
        await clickByJQuery(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                .pcaDropFirstOption
        )
        await client.pause(testData.implicitTimeOut)
    } else {
        await client.clearValue(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                .pcaAddressField
        )
        await client.setValue(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                .pcaAddressField,
            testData.testPcaAddress
        )
        await client.pause(testData.implicitTimeOut)
        await client.setValue(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                .pcaAddressField,
            testData.testPcaPostcode
        )
        await client.pause(testData.implicitTimeOut)
        await waitElementVisible('pcaDropFirstOption', 'homeDeliveryPage')
        await clickByJQuery(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                .pcaDropFirstOption
        )
        await client.pause(testData.implicitTimeOut)
        // Condition for PCA desktop and others(mobile & tablet)
        if (testDataSet === 'DESKTOP' || testDataSet === 'TABLET') {
            await client.assert.containsText(
                cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                    .pcaSelectedAddress,
                testData.pcaFullBillAddressLine1
            )
            await client.assert.containsText(
                cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                    .pcaSelectedAddress,
                testData.pcaFullAddressLine2
            )
            await client.assert.containsText(
                cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                    .pcaSelectedAddress,
                testData.pcaFullAddressLine3
            )
            await client.assert.containsText(
                cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                    .pcaSelectedAddress,
                testData.pcaFullAddressLine4
            )
            await client.assert.containsText(
                cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                    .pcaSelectedAddress,
                testData.pcaFullAddressLine5
            )
        } else {
            tempData = await countElements(
                'homeDeliveryPage',
                'countrySelected'
            )
            if (tempData) {
                await pcaDeliveryAddressGuestWithdebenhamsMVTOn()
            } else {
                await client.getValue(
                    cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                        .pcaAddressField,
                    result => {
                        client.assert.equal(
                            result.value,
                            testData.testPcaCompleteAddress
                        )
                    }
                )
            }
        }
    }
}

export const deliveryAddressGuest = async () => {
    await client.clearValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.houseNumber
    )
    await client.setValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.houseNumber,
        testData.testHDHouseNumber
    )
    await client.pause(testData.implicitTimeOut)

    if (testDataSet.includes('ROI')) {
        await client.clearValue(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors.city
        )
        await client.setValue(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors.city,
            testData.testHDCity
        )
        await client.clearValue(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors.state
        )
        await client.setValue(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors.state,
            testData.testHDCounty
        )
        await client.clearValue(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors.zipcode
        )
        await client.setValue(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors.zipcode,
            testData.testHDEirCode
        )
        await client.click(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                .useThisAddressButton
        )
    } else {
        await client.clearValue(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors.postcode
        )
        await client.setValue(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors.postcode,
            testData.testHDPostcode
        )
        await client.click(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                .findYourAddressButton
        )
        // await client.pause(testData.implicitTimeOut)
        await waitElementVisible('city', 'homeDeliveryPage')
        // await client.waitForElementVisible(
        //     cssSelectorsList.pageObjects.homeDeliveryPage.selectors.city,
        //     10000
        // )
        await client.getValue(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors.city,
            result => {
                client.assert.equal(result.value, 'LONDON')
            }
        )
    }
}

export const newBillingAddressGuest = async () => {
    await client.clearValue(
        cssSelectorsList.pageObjects.paymentPage.selectors.houseNumberField
    )
    await client.setValue(
        cssSelectorsList.pageObjects.paymentPage.selectors.houseNumberField,
        testData.testHDHouseNumber
    )
    await client.clearValue(
        cssSelectorsList.pageObjects.paymentPage.selectors.postcodeField
    )
    await client.setValue(
        cssSelectorsList.pageObjects.paymentPage.selectors.postcodeField,
        testData.testHDPostcode
    )
    await client.click(
        cssSelectorsList.pageObjects.paymentPage.selectors.findAddressButton
    )
    // await client.pause(testData.implicitTimeOut)
    await waitElementVisible('addressOne', 'paymentPage')
    // await client.waitForElementVisible(
    //     cssSelectorsList.pageObjects.paymentPage.selectors.addressOne,
    //     10000
    // )
    if (testDataSet === 'DESKTOP') {
        await client.assert.containsText(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                .pcaSelectedAddress,
            testData.pcaFullAddressLine1
        )
        await client.assert.containsText(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                .pcaSelectedAddress,
            testData.pcaFullAddressLine2
        )
        await client.assert.containsText(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                .pcaSelectedAddress,
            testData.pcaFullAddressLine3
        )
        await client.assert.containsText(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                .pcaSelectedAddress,
            testData.pcaFullAddressLine4
        )
        await client.assert.containsText(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                .pcaSelectedAddress,
            testData.pcaFullAddressLine5
        )
    } else {
        await client.getText(
            cssSelectorsList.pageObjects.paymentPage.selectors.addressOne,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    testData.testHDFullAddress
                )
            }
        )
    }
}
