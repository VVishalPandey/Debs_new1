import {client} from 'nightwatch-cucumber'
import {defineSupportCode} from 'cucumber'
import PageObjects from '../page-objects/page-objects'
import testData from '../test-data'
import {
    deliveryCheckoutRegistered,
    deliveryCheckoutRegisteredROI,
    deliveryCheckoutRegisteredINT,
    deliveryCheckoutRegisteredNewAddress
} from '../methods/registeredHdCheckout'
import {
    deliveryCheckoutGuest,
    deliveryCheckoutGuestROI,
    deliveryCheckoutGuestINT,
    selectedAddressVerification
} from '../methods/guestHdCheckout'
import {clickCollectDeliveryCheckout} from '../methods/clickCollectCheckout'
import {deliveryCheckoutGhost} from '../methods/ghostHdCheckout'
import {
    pcaDeliveryAddressGuest,
    newBillingAddressGuest,
    pcaDeliveryAddressGuestWithdebenhamsMVTOn
} from '../methods/addressForm'
import {countElements} from '../methods/elements'
import {
    explicitPagePause,
    waitElementVisible,
    waitElementNotPresent,
    waitElementNotVisible,
    waitElementPresent
} from '../methods/explicitWait'
import {click} from '../methods/click'
import {clearValue} from '../methods/clearValue'
import {setValue} from '../methods/setValue'
import {checkoutLoginPresent} from '../methods/checkoutLogin'

import {profiles} from '../site-ssr'

const cssSelectorsList = new PageObjects()

const testDataSet = process.env.TEST_DATA_SET || 'UK'

defineSupportCode(({Given}) => {
    Given(/^I navigate to basket checkout login page$/, async () => {
        await profiles(testData.basketCheckoutUrl)
        await waitElementVisible('checkoutButton', 'myBagPage')
        await client.click(
            cssSelectorsList.pageObjects.myBagPage.selectors.checkoutButton
        )
        await waitElementVisible('continueButton', 'basketCheckoutPage')
    })

    Given(/^I navigate to delivery option as guest$/, async () => {
        await profiles(testData.basketCheckoutUrl)
        await explicitPagePause()
        await click('checkoutButton', 'myBagPage')
        await client.pause(testData.implicitTimeOut)
        await waitElementVisible('emailAddressField', 'basketCheckoutPage')

        await client.clearValue(
            cssSelectorsList.pageObjects.basketCheckoutPage.selectors
                .emailAddressField
        )
        await client.setValue(
            cssSelectorsList.pageObjects.basketCheckoutPage.selectors
                .emailAddressField,
            testData.newEmail
        )
        await client.pause(testData.implicitTimeOut)
        await click('newCustomerRadioButton', 'basketCheckoutPage')
        await client.pause(testData.implicitTimeOut)
        await click('continueButton', 'basketCheckoutPage')
        await waitElementNotVisible('continueButton', 'basketCheckoutPage')
    })

    Given(/^I navigate to delivery options as guest user$/, async () => {
        await waitElementVisible('checkoutButton', 'myBagPage')
        await client.click(
            cssSelectorsList.pageObjects.myBagPage.selectors.checkoutButton
        )
        await client.pause(testData.implicitTimeOut)

        if (!testDataSet.includes('DESKTOP')) {
            await waitElementPresent('guestLogin', 'basketCheckoutPage')
            await click('guestLogin', 'basketCheckoutPage')
            await waitElementVisible('emailAddressField', 'basketCheckoutPage')
            await client.clearValue(
                cssSelectorsList.pageObjects.basketCheckoutPage.selectors
                    .emailAddressField
            )
            await client.setValue(
                cssSelectorsList.pageObjects.basketCheckoutPage.selectors
                    .emailAddressField,
                testData.newEmail
            )
            await client.pause(1000)
            await waitElementVisible(
                'guestLoginContinueButton',
                'basketCheckoutPage'
            )
            await click('guestLoginContinueButton', 'basketCheckoutPage')
            await waitElementNotPresent(
                'guestLoginContinueButton',
                'basketCheckoutPage'
            )
        } else {
            const checkoutLoginVariant = await checkoutLoginPresent()
            console.log(checkoutLoginVariant)
            if (checkoutLoginVariant === 'variant2') {
                await click('guestLogin', 'basketCheckoutPage')
            } else if (checkoutLoginVariant === 'variant1') {
                await click('newCustomerRadioButton', 'basketCheckoutPage')
                await click('newCustomerRadioButton', 'basketCheckoutPage')
            }
            await waitElementVisible('emailAddressField', 'basketCheckoutPage')

            await client.clearValue(
                cssSelectorsList.pageObjects.basketCheckoutPage.selectors
                    .emailAddressField
            )
            await client.setValue(
                cssSelectorsList.pageObjects.basketCheckoutPage.selectors
                    .emailAddressField,
                testData.newEmail
            )
            await client.pause(1000)
            // await waitElementVisible(
            //     'newCustomerRadioButton',
            //     'basketCheckoutPage'
            // )
            // await click('newCustomerRadioButton', 'basketCheckoutPage')
            await client.pause(testData.implicitTimeOut)
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects.basketCheckoutPage.selectors
                    .signInButton,
                result => {
                    if (result.value.length) {
                        client.click(
                            cssSelectorsList.pageObjects.basketCheckoutPage
                                .selectors.signInButton
                        )
                        client.pause(3000)
                    } else {
                        client.click(
                            cssSelectorsList.pageObjects.basketCheckoutPage
                                .selectors.continueButton
                        )
                        client.pause(3000)
                    }
                }
            )
        }
        await waitElementNotPresent('skeletonBlock', 'commonPage')
        if (
            !testDataSet.includes('ROI') &&
            (testDataSet.includes('DESKTOP') || testDataSet.includes('TABLET'))
        ) {
            await client.pause(testData.implicitTimeOut)
            await client.pause(testData.implicitTimeOut)
            await waitElementVisible(
                'deliveryOptionheaderText',
                'deliveryOptionPage'
            )
            await client.pause(testData.implicitTimeOut)
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
        } else if (testDataSet.includes('ROI')) {
            await client.pause(testData.implicitTimeOut)
            await waitElementVisible('headerText', 'deliveryOptionPage')
            await client.getText(
                cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                    .headerText,
                result => {
                    client.assert.equal(
                        result.value.trim(),
                        'Where are we delivering to?'
                    )
                }
            )
        } else {
            await client.pause(testData.implicitTimeOut)
            await waitElementVisible(
                'deliveryOptionheaderText',
                'deliveryOptionPage'
            )
            await client.pause(testData.implicitTimeOut)
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
    })

    Given(
        /^I navigate to international delivery options as guest user$/,
        async () => {
            let tempData

            await waitElementNotPresent('skeletonBlock', 'commonPage')
            await waitElementVisible('checkoutButton', 'myBagPage')
            await click('checkoutButton', 'myBagPage')
            await waitElementNotPresent('skeletonBlock', 'commonPage')
            await client.pause(testData.implicitTimeOut)
            if (!testDataSet.includes('DESKTOP')) {
                let checkoutLoginPage
                await client.elements(
                    'css selector',
                    cssSelectorsList.pageObjects.basketCheckoutPage.selectors
                        .secureCheckoutLoginPage,
                    result => {
                        checkoutLoginPage = result.value
                    }
                )
                if (checkoutLoginPage.length) {
                    await click('guestLogin', 'basketCheckoutPage')
                    await client.pause(testData.implicitTimeOut)
                    await waitElementNotPresent('skeletonBlock', 'commonPage')
                    await waitElementVisible(
                        'emailAddressField',
                        'basketCheckoutPage'
                    )
                    await client.clearValue(
                        cssSelectorsList.pageObjects.basketCheckoutPage
                            .selectors.emailAddressField
                    )
                    await client.setValue(
                        cssSelectorsList.pageObjects.basketCheckoutPage
                            .selectors.emailAddressField,
                        testData.newEmail
                    )
                    await waitElementVisible(
                        'guestLoginContinueButton',
                        'basketCheckoutPage'
                    )
                    await click(
                        'guestLoginContinueButton',
                        'basketCheckoutPage'
                    )

                    await client.pause(testData.implicitTimeOut)
                }
            } else {
                await waitElementVisible(
                    'emailAddressField',
                    'basketCheckoutPage'
                )
                await client.clearValue(
                    cssSelectorsList.pageObjects.basketCheckoutPage.selectors
                        .emailAddressField
                )
                await client.setValue(
                    cssSelectorsList.pageObjects.basketCheckoutPage.selectors
                        .emailAddressField,
                    testData.newEmail
                )
                await waitElementVisible(
                    'newCustomerRadioButton',
                    'basketCheckoutPage'
                )
                await click('newCustomerRadioButton', 'basketCheckoutPage')
                const guestRadioButton = await countElements(
                    'basketCheckoutPage',
                    'newCustomerRadioButton'
                )
                if (guestRadioButton === 0) {
                    await click('newCustomerRadioButton', 'basketCheckoutPage')
                }
                await client.pause(testData.implicitTimeOut)
                await click('continueButton', 'basketCheckoutPage')
                await waitElementNotPresent(
                    'continueButton',
                    'basketCheckoutPage'
                )
            }
            await waitElementNotPresent('skeletonBlock', 'commonPage')
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                    .headerText,
                result => {
                    tempData = result.value
                }
            )
            if (tempData.length) {
                await waitElementVisible('headerText', 'deliveryOptionPage')
                await client.getText(
                    cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                        .headerText,
                    result => {
                        client.assert.equal(
                            result.value.trim(),
                            'Where are we delivering to?'
                        )
                    }
                )
            } else {
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
            }
        }
    )

    Given(
        /^I navigate to delivery options as user with saved address$/,
        async () => {
            await waitElementVisible('checkoutButton', 'myBagPage')
            await click('checkoutButton', 'myBagPage')
            await waitElementNotVisible('continueButton', 'basketCheckoutPage')
            await click('returningCustomerRadioButton', 'basketCheckoutPage')
            await client.pause(testData.implicitTimeOut)
            await client.clearValue(
                cssSelectorsList.pageObjects.basketCheckoutPage.selectors
                    .emailAddressField
            )
            await client.setValue(
                cssSelectorsList.pageObjects.basketCheckoutPage.selectors
                    .emailAddressField,
                testData.testSavedAddressEmail
            )
            await client.pause(testData.implicitTimeOut)
            await client.clearValue(
                cssSelectorsList.pageObjects.basketCheckoutPage.selectors
                    .passwordField
            )
            await client.setValue(
                cssSelectorsList.pageObjects.basketCheckoutPage.selectors
                    .passwordField,
                testData.testSavedAddressPassword
            )
            await client.pause(testData.implicitTimeOut)
            await click('continueButton', 'basketCheckoutPage')
            await waitElementVisible('headerText', 'deliveryOptionPage')
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
        }
    )

    Given(
        /I select home delivery and provide UK address details and navigate to delivery options under it$/,
        async () => {
            await deliveryCheckoutGuest()
            if (testDataSet.includes('ROI')) {
                await click('nextNominatedOptionText', 'deliveryOptionPage')
            } else {
                await click('nextNominatedOptionTextUk', 'deliveryOptionPage')
            }
        }
    )

    Given(
        /I select home delivery and provide UK address details$/,
        async () => {
            await deliveryCheckoutGuest()
        }
    )

    Given(
        /I provide Australia address details and navigate to delivery options under it$/,
        async () => {
            return await deliveryCheckoutGuestINT()
        }
    )

    Given(
        /I navigate to delivery options as already logged in with Australia address$/,
        async () => {
            await waitElementVisible('checkoutButton', 'myBagPage')
            await click('checkoutButton', 'myBagPage')
            await client.pause(3000)
            return await deliveryCheckoutRegisteredINT()
        }
    )

    Given(
        /I navigate to delivery options as already logged in with UK address$/,
        async () => {
            await waitElementVisible('checkoutButton', 'myBagPage')
            await click('checkoutButton', 'myBagPage')
            await explicitPagePause()
            return await deliveryCheckoutRegistered()
        }
    )

    Given(
        /^I navigate to delivery options as user already loggedIn with IE savedAddress$/,
        async () => {
            await waitElementVisible('checkoutButton', 'myBagPage')
            await click('checkoutButton', 'myBagPage')
            if (testDataSet.includes('DESKTOP')) {
                await waitElementNotVisible('checkoutButton', 'myBagPage')
            } else {
                await waitElementNotPresent('checkoutButton', 'myBagPage')
            }
            // return await deliveryCheckoutRegisteredROI()
            return await deliveryCheckoutRegisteredINT()
        }
    )

    Given(
        /^I select home delivery and provide IE address details and navigate to delivery options under it$/,
        async () => {
            return await deliveryCheckoutGuestROI()
        }
    )

    Given(
        /^I select home delivery type and navigate to delivery address page$/,
        async () => {
            await waitElementVisible('homeDeliveryOption', 'deliveryOptionPage')
            await click('homeDeliveryOption', 'deliveryOptionPage')
            await waitElementVisible('headerText', 'homeDeliveryPage')
            await client.getText(
                cssSelectorsList.pageObjects.homeDeliveryPage.selectors
                    .headerText,
                result => {
                    client.assert.equal(
                        result.value.trim(),
                        'Where are we delivering to?'
                    )
                }
            )
        }
    )

    Given(/^I provide user details on delivery address page$/, async () => {
        await client.clearValue(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors.firstName
        )
        await client.setValue(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors.firstName,
            testData.testHDFirstName
        )
        await client.pause(testData.implicitTimeOut)
        await client.clearValue(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors.lastName
        )
        await client.setValue(
            cssSelectorsList.pageObjects.homeDeliveryPage.selectors.lastName,
            testData.testHDLastName
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
    })

    Given(/^I should verify the clickCollect delivery type$/, async () => {
        await clickCollectDeliveryCheckout()
    })

    Given(
        /I navigate to delivery options as ghost user with UK address$/,
        async () => {
            await click('checkoutButton', 'myBagPage')
            await explicitPagePause()
            let checkoutLoginPage

            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects.basketCheckoutPage.selectors
                    .secureCheckoutLoginPage,
                result => {
                    checkoutLoginPage = result.value
                }
            )

            if (checkoutLoginPage.length) {
                await client.assert.elementPresent(
                    cssSelectorsList.pageObjects.basketCheckoutPage.selectors
                        .guestLogin
                )
                await client.assert.elementPresent(
                    cssSelectorsList.pageObjects.basketCheckoutPage.selectors
                        .returningCustomerLogin
                )
                return await deliveryCheckoutGhost()
            } else {
                await deliveryCheckoutGuest()
                await click('standardOption', 'deliveryOptionPage')
            }
        }
    )

    Given(
        /I select new billing address and provide UK address details and use this address$/,
        async () => {
            await client.clearValue(
                cssSelectorsList.pageObjects.paymentPage.selectors
                    .firstNameField
            )
            await client.setValue(
                cssSelectorsList.pageObjects.paymentPage.selectors.firstName,
                testData.testHDFirstName
            )
            await client.clearValue(
                cssSelectorsList.pageObjects.paymentPage.selectors.lastNameField
            )
            await client.setValue(
                cssSelectorsList.pageObjects.paymentPage.selectors
                    .lastNameField,
                testData.testHDLastName
            )
            await client.clearValue(
                cssSelectorsList.pageObjects.paymentPage.selectors
                    .phoneNumberField
            )
            await client.setValue(
                cssSelectorsList.pageObjects.paymentPage.selectors
                    .phoneNumberField,
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
    )

    Given(
        /I select home delivery and provide new address details when already logged In and navigate to delivery options under it$/,
        async () => {
            await click('checkoutButton', 'myBagPage')
            await waitElementNotPresent('skeletonBlock', 'commonPage')
            await deliveryCheckoutRegisteredNewAddress()
        }
    )

    Given(/I select pca address in address field$/, async () => {
        await pcaDeliveryAddressGuest()
    })

    Given(
        /I select pca address in address field with debenhamsMVT on$/,
        async () => {
            // Checkout with debenhamsMVT varient on
            await pcaDeliveryAddressGuestWithdebenhamsMVTOn()
        }
    )

    Given(/I should see the selected address$/, async () => {
        await selectedAddressVerification()
    })
})
