import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'
import testData from '../test-data'
import {scrollToPosition} from '../methods/scrollTo'
import {deliveryCheckoutGuest} from '../methods/guestHdCheckout'
import {
    waitElementVisible,
    waitElementVisibleBySelector
} from '../methods/explicitWait'
import {click} from '../methods/click'

const cssSelectorsList = new PageObjects()

const testDataSet = process.env.TEST_DATA_SET || 'UK'

export const deliveryCheckoutGhost = async () => {
    let guestLogin
    await client.pause(testData.implicitTimeOut)
    await click('guestLogin', 'basketCheckoutPage')
    await client.elements(
        'css selector',
        cssSelectorsList.pageObjects.basketCheckoutPage.selectors.guestLogin,
        result => {
            guestLogin = result.value
        }
    )
    if (guestLogin.length) {
        await click('guestLogin', 'basketCheckoutPage')
    }
    await waitElementVisible('emailAddressField', 'basketCheckoutPage')
    await client.clearValue(
        cssSelectorsList.pageObjects.basketCheckoutPage.selectors
            .emailAddressField
    )
    await client.setValue(
        cssSelectorsList.pageObjects.basketCheckoutPage.selectors
            .emailAddressField,
        testData.testEmail
    )
    await click('guestLoginContinueButton', 'basketCheckoutPage')
    await waitElementVisible('emailAddressGhost', 'basketCheckoutPage')
    await client.getText(
        cssSelectorsList.pageObjects.basketCheckoutPage.selectors
            .emailAddressGhost,
        result => {
            client.assert.equal(result.value.trim(), testData.testEmail)
        }
    )
    await client.getText(
        cssSelectorsList.pageObjects.basketCheckoutPage.selectors
            .quickerSignText,
        result => {
            client.assert.equal(
                result.value.trim().toUpperCase(),
                'Sign in for a quicker checkout'.toUpperCase()
            )
        }
    )
    await client.assert.elementPresent(
        cssSelectorsList.pageObjects.basketCheckoutPage.selectors
            .ghostSignInButton
    )
    await client.assert.elementPresent(
        cssSelectorsList.pageObjects.basketCheckoutPage.selectors
            .continueAsGuestButton
    )
    await scrollToPosition('basketCheckoutPage', 'continueAsGuestButton')
    await client.getLocationInView(
        cssSelectorsList.pageObjects.basketCheckoutPage.selectors
            .continueAsGuestButton
    )
    await click('continueAsGuestButton', 'basketCheckoutPage')
    await deliveryCheckoutGuest()
    if (
        !testDataSet.includes('ROI') &&
        !testDataSet.includes('UK') &&
        !testDataSet.includes('DESKTOP')
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
        !testDataSet.includes('ROI') &&
        !testDataSet.includes('UK') &&
        !testDataSet.includes('TABLET')
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
    } else {
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
    await waitElementVisible('standardOption', 'deliveryOptionPage')
    await click('standardOption', 'deliveryOptionPage')
    await waitElementVisibleBySelector(
        'a[href="/webapp/wcs/stores/servlet/PaymentPageDisplayCmd?langId=-1&storeId=10701&catalogId=10001"]'
    )
}
