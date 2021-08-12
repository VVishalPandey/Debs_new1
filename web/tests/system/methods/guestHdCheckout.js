import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'
import testData from '../test-data'
import {countElements} from '../methods/elements'
import {
    pcaDeliveryAddressGuest,
    deliveryAddressGuest
} from '../methods/addressForm'
import {
    waitElementVisible,
    waitElementNotPresent,
    explicitPagePause
} from '../methods/explicitWait'
import {click} from '../methods/click'
import {clearValue} from '../methods/clearValue'
import {setValue} from '../methods/setValue'

const cssSelectorsList = new PageObjects()

const testDataSet = process.env.TEST_DATA_SET || 'UK'

export const deliveryCheckoutGuest = async () => {
    await explicitPagePause()
    await waitElementNotPresent('loader', 'commonPage')
    await waitElementNotPresent('skeletonBlock', 'commonPage')
    await waitElementVisible('homeDeliveryOption', 'deliveryOptionPage')
    await click('homeDeliveryOption', 'deliveryOptionPage')
    await client.pause(testData.implicitTimeOut)
    await waitElementNotPresent('loader', 'commonPage')
    await waitElementNotPresent('skeletonBlock', 'commonPage')
    await client.pause(testData.implicitTimeOut)

    // This condition has been put ito click on add new addres for registered user flow
    const newAddressButtonExist = await countElements(
        'deliveryOptionPage',
        'newaddressLink'
    )
    if (newAddressButtonExist) {
        await click('newaddressLink', 'deliveryOptionPage')
        await client.pause(testData.implicitTimeOut)
    }
    if (
        !testDataSet.includes('ROI') &&
        !testDataSet.includes('UK') &&
        !testDataSet.includes('DESKTOP')
    ) {
        await waitElementVisible(
            'deliveryAddressheaderText',
            'homeDeliveryPage'
        )
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
    } else if (
        !testDataSet.includes('ROI') &&
        !testDataSet.includes('UK') &&
        !testDataSet.includes('TABLET')
    ) {
        await waitElementVisible(
            'deliveryAddressheaderText',
            'homeDeliveryPage'
        )
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
        await waitElementVisible('headerText', 'homeDeliveryPage')
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
    if (testDataSet.includes('CCC-DESKTOP')) {
        await clearValue('cccEmailAddressField', 'homeDeliveryPage')
        await setValue(
            'cccEmailAddressField',
            'homeDeliveryPage',
            testData.emailAddresDelivery
        )
    }
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
    await client.pause(testData.implicitTimeOut)
    await waitElementNotPresent('loader', 'commonPage')
    await waitElementNotPresent('skeletonBlock', 'commonPage')
    if (
        !testDataSet.includes('DESKTOP') &&
        !testDataSet.includes('ROI') &&
        !testDataSet.includes('UK')
    ) {
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
    } else if (
        !testDataSet.includes('UK') &&
        !testDataSet.includes('DESKTOP') &&
        !testDataSet.includes('TABLET')
    ) {
        await waitElementVisible('headerText', 'deliveryOptionPage')
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
    } else if (!testDataSet.includes('UK') && !testDataSet.includes('TABLET')) {
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
    } else {
        await waitElementNotPresent('loader', 'commonPage')
        await waitElementNotPresent('skeletonBlock', 'commonPage')
        await waitElementVisible('headerTextUk', 'deliveryOptionPage')
        await client.pause(testData.implicitTimeOut)
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

export const deliveryCheckoutGuestROI = async () => {
    await waitElementNotPresent('skeletonBlock', 'commonPage')
    await waitElementVisible('headerText', 'deliveryOptionPage')
    await client.getText(
        cssSelectorsList.pageObjects.deliveryOptionPage.selectors.headerText,
        result => {
            client.assert.equal(
                result.value.trim(),
                'Where are we delivering to?'
            )
        }
    )
    await client.clearValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.firstName
    )
    await client.setValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.firstName,
        testData.testHDFirstName
    )
    if (testDataSet.includes('CCC-DESKTOP-ROI')) {
        await clearValue('cccEmailAddressField', 'homeDeliveryPage')
        await setValue(
            'cccEmailAddressField',
            'homeDeliveryPage',
            testData.emailAddresDelivery
        )
    }
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
    await client.clearValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.phoneNumber
    )
    await client.setValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.phoneNumber,
        testData.testHDPhoneNumber
    )
    await client.pause(testData.implicitTimeOut)
    await client.clearValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.houseNumber
    )
    await client.setValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.houseNumber,
        testData.testHDHouseNumber
    )
    await client.pause(testData.implicitTimeOut)
    await client.clearValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.city
    )
    await client.setValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.city,
        testData.testHDCity
    )
    await client.pause(testData.implicitTimeOut)
    await client.clearValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.state
    )
    await client.setValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.state,
        testData.testHDCounty
    )
    await client.pause(testData.implicitTimeOut)
    await client.clearValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.zipcode
    )
    await client.setValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.zipcode,
        testData.testHDEirCode
    )
    await client.pause(testData.implicitTimeOut)
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

export const selectedAddressVerification = async () => {
    // with checkoutlocate debenhamsMVT on

    await client.assert.containsText(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.savedAddress,
        testData.pcaFullAddressLine1
    )
    await client.assert.containsText(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.savedAddress,
        testData.pcaFullAddressLine2
    )
    await client.assert.containsText(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.savedAddress,
        testData.pcaFullAddressLine3
    )
    await client.assert.containsText(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.savedAddress,
        testData.pcaFullAddressLine4
    )
    await client.assert.containsText(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.savedAddress,
        testData.pcaFullAddressLine5
    )
}

export const deliveryCheckoutGuestINT = async () => {
    await waitElementNotPresent('loader', 'commonPage')
    await waitElementNotPresent('skeletonBlock', 'commonPage')
    await waitElementVisible('headerText', 'homeDeliveryPage')
    await client.getText(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.headerText,
        result => {
            client.assert.equal(
                result.value.trim(),
                'Where are we delivering to?'
            )
        }
    )
    await waitElementNotPresent('loader', 'commonPage')
    await waitElementNotPresent('skeletonBlock', 'commonPage')
    await waitElementVisible('firstName', 'homeDeliveryPage')
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
    await client.clearValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.houseNumber
    )
    await client.setValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.houseNumber,
        testData.testHDHouseNumber
    )
    await client.pause(testData.implicitTimeOut)
    await client.clearValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.city
    )
    await client.setValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.city,
        testData.testHDAustCity
    )
    await client.pause(testData.implicitTimeOut)
    await client.clearValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.zipcode
    )
    await client.setValue(
        cssSelectorsList.pageObjects.homeDeliveryPage.selectors.zipcode,
        testData.testHDAustPostcode
    )
    await client.pause(testData.implicitTimeOut)
    await click('useThisAddressButton', 'homeDeliveryPage')
    await client.pause(testData.implicitTimeOut)
    await waitElementNotPresent('loader', 'commonPage')
    await waitElementNotPresent('skeletonBlock', 'commonPage')
    if (testDataSet.includes('TABLET')) {
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
    }
}
