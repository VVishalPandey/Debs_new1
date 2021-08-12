import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'
import testData from '../test-data'
import {
    explicitPagePause,
    waitElementVisible,
    waitElementPresent,
    waitElementNotPresent
} from '../methods/explicitWait'
import {
    pcaDeliveryAddressGuest,
    deliveryAddressGuest
} from '../methods/addressForm'
import {countElements} from '../methods/elements'
import {click} from '../methods/click'

const cssSelectorsList = new PageObjects()

const testDataSet = process.env.TEST_DATA_SET || 'UK'

export const deliveryCheckoutRegistered = async () => {
    await client.pause(testData.implicitTimeOut)
    await waitElementNotPresent('loader', 'commonPage')
    await waitElementNotPresent('skeletonBlock', 'commonPage')
    if (testDataSet === 'TABLET') {
        await client.getText(
            cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                .deliveryOptionheaderText,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'How would you like to receive your order?'
                )
            }
        )
    } else if (testDataSet === 'ROI') {
        await client.getText(
            cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                .headerText,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'How would you like to receive your order?'
                )
            }
        )
    } else {
        await client.getText(
            cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                .headerTextUk,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'How would you like to receive your order?'
                )
            }
        )
    }
    await click('homeDeliveryOption', 'deliveryOptionPage')
    await explicitPagePause()
    await waitElementNotPresent('loader', 'commonPage')
    await waitElementNotPresent('skeletonBlock', 'commonPage')
    await client.pause(testData.implicitTimeOut)
    if (testDataSet === 'TABLET') {
        await client.getText(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                .deliveryAddressheaderText,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'Where are we delivering to?'
                )
            }
        )
    } else {
        await client.getText(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors.headerText,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'Where are we delivering to?'
                )
            }
        )
    }
    await click('useThisAddressButton', 'homeDeliveryPage')
    await explicitPagePause()
    await waitElementNotPresent('loader', 'commonPage')
    await waitElementNotPresent('skeletonBlock', 'commonPage')
    await client.pause(testData.implicitTimeOut)
    if (testDataSet === 'TABLET') {
        await client.getText(
            cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                .deliveryTypeheaderText,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'Choose your delivery option'
                )
            }
        )
    } else if (testDataSet === 'ROI') {
        await client.getText(
            cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                .headerText,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'Choose your delivery option'
                )
            }
        )
    } else {
        await client.getText(
            cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                .headerTextUk,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'Choose your delivery option'
                )
            }
        )
    }
    await click('standardOption', 'deliveryOptionPage')
    await waitElementNotPresent('loader', 'commonPage')
    await waitElementNotPresent('skeletonBlock', 'commonPage')
    await client.waitForElementVisible(
        'a[href="/webapp/wcs/stores/servlet/PaymentPageDisplayCmd?langId=-1&storeId=10701&catalogId=10001"]',
        testData.implicitTimeOut
    )
}

export const deliveryCheckoutRegisteredROI = async () => {
    await waitElementNotPresent('loader', 'commonPage')
    await waitElementNotPresent('skeletonBlock', 'commonPage')
    if (testDataSet.includes('TABLET-ROI')) {
        await waitElementPresent(
            'deliveryOptionheaderText',
            'deliveryOptionPage'
        )
        await waitElementVisible(
            'deliveryOptionheaderText',
            'deliveryOptionPage'
        )
        await client.pause(testData.implicitTimeOut)
        await client.getText(
            cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                .deliveryOptionheaderText,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'How would you like to receive your order?'
                )
            }
        )
    } else {
        await client.pause(testData.implicitTimeOut)
        await client.getText(
            cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                .headerTextUk,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'How would you like to receive your order?'
                )
            }
        )
    }
    await click('homeDeliveryOption', 'deliveryOptionPage')
    await waitElementNotPresent('loader', 'commonPage')
    await waitElementNotPresent('skeletonBlock', 'commonPage')
    await explicitPagePause()
    await client.pause(testData.implicitTimeOut)
    if (testDataSet.includes('TABLET-ROI')) {
        await client.getText(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                .deliveryAddressheaderText,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'Where are we delivering to?'
                )
            }
        )
    } else {
        await client.getText(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors.headerText,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'Where are we delivering to?'
                )
            }
        )
    }
    await explicitPagePause()
    await waitElementNotPresent('loader', 'commonPage')
    await waitElementNotPresent('skeletonBlock', 'commonPage')
    await client.pause(testData.implicitTimeOut)
    await click('useThisAddressButton', 'homeDeliveryPage')
    await waitElementNotPresent('loader', 'commonPage')
    await waitElementNotPresent('skeletonBlock', 'commonPage')
    await explicitPagePause()
    await client.pause(testData.implicitTimeOut)
    if (testDataSet.includes('TABLET-ROI')) {
        await client.getText(
            cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                .deliveryTypeheaderText,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'Choose your delivery option'
                )
            }
        )
    } else {
        await client.getText(
            cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                .headerTextUk,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'Choose your delivery option'
                )
            }
        )
    }
}

export const deliveryCheckoutRegisteredINT = async () => {
    await waitElementNotPresent('skeletonBlock', 'commonPage')
    await waitElementPresent('headerText', 'deliveryOptionPage')
    await client.getText(
        cssSelectorsList.pageObjects.deliveryOptionPage.selectors.headerText,
        result => {
            client.assert.equal(
                result.value.trim(),
                'Where are we delivering to?'
            )
        }
    )
    await client.pause(testData.implicitTimeOut)
    await waitElementNotPresent('loader', 'commonPage')
    await waitElementNotPresent('skeletonBlock', 'commonPage')
    await waitElementVisible('useThisAddressButton', 'homeDeliveryPage')
    await click('useThisAddressButton', 'homeDeliveryPage')
    await client.pause(testData.implicitTimeOut)
    await waitElementNotPresent('loader', 'commonPage')
    await waitElementNotPresent('skeletonBlock', 'commonPage')
    await waitElementVisible('deliveryTypeheaderTextInt', 'deliveryOptionPage')
    await client.getText(
        cssSelectorsList.pageObjects.deliveryOptionPage.selectors
            .deliveryTypeheaderTextInt,
        result => {
            client.assert.equal(
                result.value.trim(),
                'Choose your delivery option'
            )
        }
    )
}

export const deliveryCheckoutRegisteredNewAddress = async () => {
    await client.pause(testData.implicitTimeOut)
    await waitElementNotPresent('loader', 'commonPage')
    await waitElementNotPresent('skeletonBlock', 'commonPage')
    if (testDataSet.includes('TABLET') || testDataSet.includes('DESKTOP')) {
        await client.getText(
            cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                .deliveryOptionheaderText,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'How would you like to receive your order?'
                )
            }
        )
    } else {
        await client.getText(
            cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                .headerTextUk,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'How would you like to receive your order?'
                )
            }
        )
    }
    await click('homeDeliveryOption', 'deliveryOptionPage')

    await waitElementNotPresent('loader', 'commonPage')
    await waitElementNotPresent('skeletonBlock', 'commonPage')
    await explicitPagePause()
    await client.pause(testData.implicitTimeOut)
    if (testDataSet === 'TABLET') {
        await client.getText(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                .deliveryAddressheaderText,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'Where are we delivering to?'
                )
            }
        )
    } else {
        await client.getText(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors.headerText,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'Where are we delivering to?'
                )
            }
        )
    }

    await waitElementNotPresent('skeletonBlock', 'commonPage')
    await click('newAddressRadioButton', 'homeDeliveryPage')
    await waitElementNotPresent('skeletonBlock', 'commonPage')
    await explicitPagePause()
    await client.pause(testData.implicitTimeOut)
    await client.clearValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.firstName
    )
    await client.setValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.firstName,
        testData.testHDFirstName
    )
    await client.pause(testData.implicitTimeOut)
    await client.elements(
        'css selector',
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.lastName,
        result => {
            if (result.value.length) {
                client.clearValue(
                    cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                        .lastName
                )
                client.setValue(
                    cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                        .lastName,
                    testData.testHDLastName
                )
            }
        }
    )
    await client.pause(testData.implicitTimeOut)
    await client.clearValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.phoneNumber
    )
    await client.setValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.phoneNumber,
        testData.testHDPhoneNumber
    )
    await client.pause(testData.implicitTimeOut)
    const addressFieldCheck = await countElements(
        'homeDeliveryPage',
        'pcaAddressField'
    )
    if (addressFieldCheck === 0) {
        await deliveryAddressGuest()
    } else {
        await pcaDeliveryAddressGuest()
    }
    await click('useThisAddressButton', 'homeDeliveryPage')
    await waitElementNotPresent('loader', 'commonPage')
    await waitElementNotPresent('skeletonBlock', 'commonPage')
    await client.pause(testData.implicitTimeOut)
    if (testDataSet.includes('TABLET')) {
        await waitElementVisible('deliveryTypeheaderText', 'deliveryOptionPage')
        await client.getText(
            cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                .deliveryTypeheaderText,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'Choose your delivery option'
                )
            }
        )
    } else if (testDataSet.includes('ROI')) {
        await waitElementVisible(
            'deliveryTypeheaderTextInt',
            'deliveryOptionPage'
        )
        await client.getText(
            cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                .deliveryTypeheaderTextInt,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'Choose your delivery option'
                )
            }
        )
    } else {
        await waitElementVisible('headerTextUk', 'deliveryOptionPage')
        await client.getText(
            cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                .headerTextUk,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'Choose your delivery option'
                )
            }
        )
    }
}
