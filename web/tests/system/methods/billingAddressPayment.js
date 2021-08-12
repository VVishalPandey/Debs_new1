import {client} from 'nightwatch-cucumber'
import testData from '../test-data'
import PageObjects from '../page-objects/page-objects'
import {waitElementVisible, waitElementNotPresent} from './explicitWait'
import {click} from './click'
import {countElements} from './elements'
import {scrollToPosition} from './scrollTo'
import {clearValue} from './clearValue'
import {setValue} from './setValue'
import {pcaDeliveryAddressGuest, newBillingAddressGuest} from './addressForm'

const cssSelectorsList = new PageObjects()
const testDataSet = process.env.TEST_DATA_SET || 'UK'

export const billingAddressUK = async () => {
    await waitElementVisible('headerText', 'paymentPage')
    if (testDataSet.includes('UK')) {
        await client.getText(
            cssSelectorsList.pageObjects.paymentPage.selectors.headerText,
            result => {
                client.assert.equal(result.value.trim(), 'Payment')
            }
        )
    } else {
        await client.getText(
            cssSelectorsList.pageObjects.paymentPage.selectors.headerText,
            result => {
                client.assert.equal(result.value.trim(), 'Your order')
            }
        )
    }
    await scrollToPosition('paymentPage', 'billingAddressHeaderText')
    await waitElementVisible('billingAddressHeaderText', 'paymentPage')
    const isPresent = await countElements('paymentPage', 'newAddressText')
    if (isPresent) {
        await click('newAddressText', 'paymentPage')
        await clearValue('firstNameField', 'paymentPage')
        await setValue('firstName', 'paymentPage', testData.testHDFirstName)
        await clearValue('lastNameField', 'paymentPage')
        await setValue('lastNameField', 'paymentPage', testData.testHDLastName)
        await clearValue('phoneNumberField', 'paymentPage')
        await setValue(
            'phoneNumberField',
            'paymentPage',
            testData.testHDPhoneNumber
        )
    } else {
        await clearValue('firstNameField', 'paymentPage')
        await setValue('firstName', 'paymentPage', testData.testHDFirstName)
        await clearValue('lastNameField', 'paymentPage')
        await setValue('lastNameField', 'paymentPage', testData.testHDLastName)
        await clearValue('phoneNumberField', 'paymentPage')
        await setValue(
            'phoneNumberField',
            'paymentPage',
            testData.testHDPhoneNumber
        )
    }

    if (testDataSet.includes('CCC-DESKTOP')) {
        await clearValue('cccEmailAddressField', 'homeDeliveryPage')
        await setValue(
            'cccEmailAddressField',
            'homeDeliveryPage',
            testData.emailAddresDelivery
        )
    }
    const addressFieldCheck = await countElements(
        'homeDeliveryPage',
        'pcaAddressField'
    )
    if (addressFieldCheck === 0) {
        await click('countryGB', 'paymentPage')
        await newBillingAddressGuest()
    } else {
        await pcaDeliveryAddressGuest()
    }
    await click('useAddressButton', 'paymentPage')
    await waitElementNotPresent('useAddressButton', 'paymentPage')
}

export const billingAddressROI = async () => {
    await waitElementVisible('headerText', 'paymentPage')
    if (
        testDataSet.includes('UK') ||
        (!testDataSet.includes('DESKTOP') && !testDataSet.includes('TABLET'))
    ) {
        await client.getText(
            cssSelectorsList.pageObjects.paymentPage.selectors.headerText,
            result => {
                client.assert.equal(result.value.trim(), 'Payment')
            }
        )
    } else {
        await client.getText(
            cssSelectorsList.pageObjects.paymentPage.selectors.headerText,
            result => {
                client.assert.equal(result.value.trim(), 'Your order')
            }
        )
    }
    await scrollToPosition('paymentPage', 'billingAddressHeaderText')
    await waitElementVisible('billingAddressHeaderText', 'paymentPage')
    await click('newAddressText', 'paymentPage')
    await clearValue('firstNameField', 'paymentPage')
    await setValue('firstName', 'paymentPage', testData.testHDFirstName)
    await clearValue('lastNameField', 'paymentPage')
    await setValue('lastNameField', 'paymentPage', testData.testHDLastName)
    await clearValue('phoneNumberField', 'paymentPage')
    await setValue(
        'phoneNumberField',
        'paymentPage',
        testData.testHDPhoneNumber
    )
    await clearValue('addressInput', 'paymentPage')
    await setValue('addressInput', 'paymentPage', testData.testHDHouseNumber)
    await clearValue('city', 'homeDeliveryPage')
    await setValue('city', 'homeDeliveryPage', testData.testHDCity)
    await clearValue('county', 'paymentPage')
    await setValue('county', 'paymentPage', testData.testHDCounty)
    await clearValue('eirCode', 'paymentPage')
    await setValue('eirCode', 'paymentPage', testData.testHDEirCode)
    await client.pause(testData.implicitTimeOut)

    if (testDataSet.includes('CCC-DESKTOP')) {
        await clearValue('cccEmailAddressField', 'homeDeliveryPage')
        await setValue(
            'cccEmailAddressField',
            'homeDeliveryPage',
            testData.emailAddresDelivery
        )
    }
    await click('useAddressButton', 'paymentPage')
    await waitElementNotPresent('useAddressButton', 'paymentPage')
}
