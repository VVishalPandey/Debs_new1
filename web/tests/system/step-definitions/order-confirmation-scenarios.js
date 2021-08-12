import {client} from 'nightwatch-cucumber'
import {defineSupportCode} from 'cucumber'
import PageObjects from '../page-objects/page-objects'
import testData from '../test-data'
import {countElements} from '../methods/elements'
import {getAttributeValue} from '../methods/getAttribute'
import {click, clickUsingJS} from '../methods/click'
import {setValue} from '../methods/setValue'
import {scrollToPosition} from '../methods/scrollTo'
import {selectdayEveNextNominatedOption} from '../methods/nextNominatedOptionSelect'
import {
    explicitPagePause,
    waitElementVisible,
    waitElementNotPresent,
    waitElementPresent
} from '../methods/explicitWait'
import {
    deliveryCheckoutGuest,
    deliveryCheckoutGuestROI
} from '../methods/guestHdCheckout'
import {clearValue} from '../methods/clearValue'
import {checkoutLoginPresent} from '../methods/checkoutLogin'
import {
    billingAddressUK,
    billingAddressROI
} from '../methods/billingAddressPayment'
import {selectStore} from '../methods/selectStore'

const cssSelectorsList = new PageObjects()

const testDataSet = process.env.TEST_DATA_SET || 'UK'

defineSupportCode(({Given, When}) => {
    Given(/I switch to iFrame for 3ds and submit the password$/, async () => {
        const frameValue = await getAttributeValue(
            cssSelectorsList.pageObjects.paymentPage.selectors
                .threeDsCardinalIframe,
            'id'
        )
        await client.frame(frameValue)
        const threeDsOtpBoxExist = await countElements(
            'paymentPage',
            'threeDSScreenOtpTextInfo'
        )
        if (threeDsOtpBoxExist) {
            await setValue(
                'threeDSOTtpInputBox',
                'paymentPage',
                testData.threeDsPinOtp
            )
        } else {
            await setValue(
                'threeDSPassword',
                'paymentPage',
                testData.threeDsPinOtp
            )
        }
        await clickUsingJS(
            cssSelectorsList.pageObjects.paymentPage.selectors
                .threeDsSubmitButton
        )
        await client.frame(null)
    })

    When(
        /^I navigate from basket page to delivery page as a "(.*?)" user$/,
        async usertype => {
            await waitElementVisible('checkoutButton', 'myBagPage')
            await click('checkoutButton', 'myBagPage')
            await explicitPagePause()
            const secureCheckoutPopUpExist = await countElements(
                'basketCheckoutPage',
                'secureCheckoutLoginPage'
            )
            if (secureCheckoutPopUpExist) {
                switch (usertype) {
                    case 'guest':
                        if (!testDataSet.includes('DESKTOP')) {
                            await waitElementPresent(
                                'guestLogin',
                                'basketCheckoutPage'
                            )
                            await click('guestLogin', 'basketCheckoutPage')
                            await waitElementVisible(
                                'emailAddressField',
                                'basketCheckoutPage'
                            )
                            await clearValue(
                                'emailAddressField',
                                'basketCheckoutPage'
                            )
                            await setValue(
                                'emailAddressField',
                                'basketCheckoutPage',
                                testData.newEmail
                            )
                            await client.pause(testData.implicitTimeOut)
                            await waitElementVisible(
                                'guestLoginContinueButton',
                                'basketCheckoutPage'
                            )
                            await click(
                                'guestLoginContinueButton',
                                'basketCheckoutPage'
                            )
                            await waitElementNotPresent(
                                'guestLoginContinueButton',
                                'basketCheckoutPage'
                            )
                        } else {
                            const checkoutLoginVariant = await checkoutLoginPresent()
                            if (checkoutLoginVariant === 'variant2') {
                                await click('guestLogin', 'basketCheckoutPage')
                            } else if (checkoutLoginVariant === 'variant1') {
                                await click(
                                    'newCustomerRadioButton',
                                    'basketCheckoutPage'
                                )
                            }
                            await waitElementVisible(
                                'emailAddressField',
                                'basketCheckoutPage'
                            )
                            await clearValue(
                                'emailAddressField',
                                'basketCheckoutPage'
                            )
                            await setValue(
                                'emailAddressField',
                                'basketCheckoutPage',
                                testData.newEmail
                            )
                            await client.pause(testData.implicitTimeOut)
                            const signInButtonExist = await countElements(
                                'basketCheckoutPage',
                                'signInButton'
                            )
                            if (signInButtonExist) {
                                await click(
                                    'signInButton',
                                    'basketCheckoutPage'
                                )
                                await client.pause(3000)
                            } else {
                                await click(
                                    'continueButton',
                                    'basketCheckoutPage'
                                )
                                await client.pause(3000)
                            }
                        }
                        await waitElementNotPresent(
                            'skeletonBlock',
                            'commonPage'
                        )
                        if (
                            !testDataSet.includes('ROI') &&
                            (testDataSet.includes('DESKTOP') ||
                                testDataSet.includes('TABLET'))
                        ) {
                            await client.pause(testData.implicitTimeOut)
                            await waitElementVisible(
                                'deliveryOptionheaderText',
                                'deliveryOptionPage'
                            )
                            await client.getText(
                                cssSelectorsList.pageObjects.deliveryOptionPage
                                    .selectors.deliveryOptionheaderText,
                                result => {
                                    client.assert.equal(
                                        result.value.trim(),
                                        'How would you like to receive your order?'
                                    )
                                }
                            )
                        } else if (testDataSet.includes('ROI')) {
                            await client.pause(testData.implicitTimeOut)
                            await waitElementVisible(
                                'headerText',
                                'deliveryOptionPage'
                            )
                            await client.getText(
                                cssSelectorsList.pageObjects.deliveryOptionPage
                                    .selectors.headerText,
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
                                'headerTextUk',
                                'deliveryOptionPage'
                            )
                            await client.getText(
                                cssSelectorsList.pageObjects.deliveryOptionPage
                                    .selectors.headerTextUk,
                                result => {
                                    client.assert.equal(
                                        result.value.trim(),
                                        'How would you like to receive your order?'
                                    )
                                }
                            )
                        }

                        break
                    default:
                }
            }
        }
    )

    When(
        /^I navigate to payment page of UK with the delivery options as "(.*?)"$/,
        async deliverytype => {
            switch (deliverytype) {
                case 'Standard':
                    await client.pause(testData.implicitTimeOut)
                    await deliveryCheckoutGuest()
                    await click('standardOption', 'deliveryOptionPage')
                    await waitElementNotPresent('loader', 'commonPage')
                    await waitElementNotPresent('skeletonBlock', 'commonPage')
                    await waitElementVisible(
                        'proceedPaymentButton',
                        'deliveryOptionPage'
                    )
                    await click('proceedPaymentButton', 'deliveryOptionPage')
                    await waitElementNotPresent('skeletonBlock', 'commonPage')
                    await client.pause(testData.implicitTimeOut)
                    break

                case 'Next':
                    await client.pause(testData.implicitTimeOut)
                    await deliveryCheckoutGuest()
                    await click('nextNominatedOptionUk', 'deliveryOptionPage')
                    await waitElementNotPresent('skeletonBlock', 'commonPage')
                    await waitElementNotPresent('loader', 'commonPage')
                    if (!testDataSet.includes('ROI')) {
                        await waitElementVisible(
                            'daytimeTab',
                            'deliveryOptionPage'
                        )
                        await waitElementVisible(
                            'daytimeOptions',
                            'deliveryOptionPage'
                        )
                        await client.getText(
                            cssSelectorsList.pageObjects.deliveryOptionPage
                                .selectors.nextNominatedSectionHeaderText,
                            result => {
                                client.assert.equal(
                                    result.value.trim(),
                                    'When would you like to receive your delivery?'
                                )
                            }
                        )
                        await click('daytimeTab', 'deliveryOptionPage')
                        await selectdayEveNextNominatedOption()
                    } else {
                        await waitElementVisible(
                            'deliveryMessage',
                            'deliveryOptionPage'
                        )
                    }
                    await waitElementVisible(
                        'proceedPaymentButton',
                        'deliveryOptionPage'
                    )
                    await click('proceedPaymentButton', 'deliveryOptionPage')
                    await waitElementNotPresent('loader', 'commonPage')
                    await waitElementNotPresent('skeletonBlock', 'commonPage')
                    await client.pause(testData.implicitTimeOut)
                    break

                case 'Click&Collect':
                    await client.pause(testData.implicitTimeOut)
                    await click('clickCollectOption', 'deliveryOptionPage')
                    await waitElementNotPresent('loader', 'commonPage')
                    await waitElementNotPresent('skeletonBlock', 'commonPage')
                    await client.pause(testData.implicitTimeOut)
                    await client.getText(
                        cssSelectorsList.pageObjects.locateStorePage.selectors
                            .collectFromheaderText,
                        result => {
                            client.assert.equal(
                                result.value.trim(),
                                'Test would you like to collect from?'
                            )
                        }
                    )
                    await waitElementVisible(
                        'findtStoreText',
                        'locateStorePage'
                    )
                    await waitElementVisible(
                        'locateStoreButton',
                        'locateStorePage'
                    )
                    await client.setValue(
                        cssSelectorsList.pageObjects.locateStorePage.selectors
                            .locateStoreField,
                        'E16FQ'
                    )
                    await click('locateStoreButton', 'locateStorePage')
                    await client.pause(testData.implicitTimeOut)
                    await client.assert.containsText(
                        cssSelectorsList.pageObjects.locateStorePage.selectors
                            .pudoStoreSearchResultText,
                        'results for'
                    )
                    // }
                    await selectStore(
                        'select',
                        'Nisa Local',
                        '1.04 Miles',
                        'locateStorePage'
                    )
                    await click('selectedStoreSelectButton', 'locateStorePage')
                    await waitElementNotPresent('loader', 'commonPage')
                    await waitElementNotPresent('skeletonBlock', 'commonPage')
                    await waitElementVisible(
                        'proceedPaymentButton',
                        'deliveryOptionPage'
                    )
                    await click('proceedPaymentButton', 'deliveryOptionPage')
                    await waitElementNotPresent('skeletonBlock', 'commonPage')
                    await client.pause(testData.implicitTimeOut)
                    await client.pause(testData.implicitTimeOut)
                    break

                default:
                    console.log(
                        'default===> enter the delivery type name as Standard OR Nominated OR Click&Collect'
                    )
            }
        }
    )

    When(
        /^I navigate to payment page of ROI with the delivery options as "(.*?)"$/,
        async deliverytype => {
            switch (deliverytype) {
                case 'Standard':
                    await client.pause(testData.implicitTimeOut)
                    await deliveryCheckoutGuestROI()
                    await click('standardOption', 'deliveryOptionPage')
                    await waitElementNotPresent('loader', 'commonPage')
                    await waitElementNotPresent('skeletonBlock', 'commonPage')
                    await waitElementVisible(
                        'proceedPaymentButton',
                        'deliveryOptionPage'
                    )
                    await click('proceedPaymentButton', 'deliveryOptionPage')
                    await waitElementNotPresent('skeletonBlock', 'commonPage')
                    await client.pause(testData.implicitTimeOut)
                    break

                case 'Next':
                    await client.pause(testData.implicitTimeOut)
                    await deliveryCheckoutGuestROI()
                    await click('nextNominatedOption', 'deliveryOptionPage')
                    await waitElementNotPresent('loader', 'commonPage')
                    await waitElementNotPresent('skeletonBlock', 'commonPage')
                    await client.pause(testData.implicitTimeOut)
                    await waitElementVisible(
                        'deliveryMessage',
                        'deliveryOptionPage'
                    )
                    await client.getText(
                        cssSelectorsList.pageObjects.deliveryOptionPage
                            .selectors.deliveryMessage,
                        result => {
                            client.assert.equal(
                                result.value.trim(),
                                'Your order will arrive on , between 8am - 6pm (excludes public holidays)'
                            )
                        }
                    )
                    await waitElementVisible(
                        'proceedPaymentButton',
                        'deliveryOptionPage'
                    )
                    await click('proceedPaymentButton', 'deliveryOptionPage')
                    await waitElementNotPresent('loader', 'commonPage')
                    await waitElementNotPresent('skeletonBlock', 'commonPage')
                    await client.pause(testData.implicitTimeOut)
                    break
                default:
                    console.log(
                        'default===> enter the delivery type name as Standard OR Next'
                    )
            }
        }
    )

    When(
        /^I procced the "(.*?)" card payment with "(.*?)" using card pin as "(.*?)"$/,
        async (paymentoptions, cardnumber, cardpin) => {
            await explicitPagePause()
            await waitElementNotPresent('loader', 'commonPage')
            await waitElementNotPresent('skeletonBlock', 'commonPage')
            if (testDataSet.includes('ROI')) {
                await client.pause(testData.implicitTimeOut)
                await billingAddressROI()
            } else {
                await client.pause(testData.implicitTimeOut)
                await billingAddressUK()
            }

            switch (paymentoptions) {
                case 'Credit':
                    await scrollToPosition('paymentPage', 'creditCardIDField')
                    await waitElementVisible('creditCardIDField', 'paymentPage')
                    await client.clearValue(
                        cssSelectorsList.pageObjects.paymentPage.selectors
                            .creditCardIDField
                    )
                    await client.setValue(
                        cssSelectorsList.pageObjects.paymentPage.selectors
                            .creditCardIDField,
                        cardnumber
                    )
                    await scrollToPosition('paymentPage', 'creditCardIDField')
                    await click('creditCardDateJanMonth', 'paymentPage')
                    await click('creditCardDateNextYear', 'paymentPage')
                    await client.clearValue(
                        cssSelectorsList.pageObjects.paymentPage.selectors
                            .creditCardSecurityNumber
                    )
                    await client.setValue(
                        cssSelectorsList.pageObjects.paymentPage.selectors
                            .creditCardSecurityNumber,
                        cardpin
                    )
                    break

                case 'Gift':
                    await scrollToPosition('paymentPage', 'giftCardAccordion')
                    await client.pause(testData.implicitTimeOut)
                    await waitElementVisible('giftCardAccordion', 'paymentPage')
                    await client.getText(
                        cssSelectorsList.pageObjects.paymentPage.selectors
                            .giftCardAccordion,
                        result => {
                            client.assert.equal(
                                result.value.trim(),
                                'Pay with a Gift card'
                            )
                        }
                    )
                    await click('giftCardAccordion', 'paymentPage')
                    await client.clearValue(
                        cssSelectorsList.pageObjects.paymentPage.selectors
                            .giftCardIDField
                    )
                    await client.setValue(
                        cssSelectorsList.pageObjects.paymentPage.selectors
                            .giftCardIDField,
                        cardnumber
                    )
                    await client.clearValue(
                        cssSelectorsList.pageObjects.paymentPage.selectors
                            .giftCardPinField
                    )
                    await client.setValue(
                        cssSelectorsList.pageObjects.paymentPage.selectors
                            .giftCardPinField,
                        cardpin
                    )
                    await client.pause(testData.implicitTimeOut)
                    await click('giftCardApplyButton', 'paymentPage')
                    await client.pause(testData.implicitTimeOut)
                    await waitElementNotPresent('loader', 'commonPage')
                    await waitElementNotPresent('skeletonBlock', 'commonPage')
                    await waitElementVisible(
                        'giftCard1AppliedRemoveLink',
                        'paymentPage'
                    )
                    break

                case 'Beauty':
                    await scrollToPosition('paymentPage', 'beautyCardAccordion')
                    await client.pause(testData.implicitTimeOut)
                    await waitElementVisible('giftCardAccordion', 'paymentPage')
                    await client.getText(
                        cssSelectorsList.pageObjects.paymentPage.selectors
                            .beautyCardAccordionTitle,
                        result => {
                            client.assert.equal(
                                result.value.trim(),
                                'Pay with a Beauty Club card'
                            )
                        }
                    )
                    await click('beautyCardAccordion', 'paymentPage')
                    await client.pause(testData.implicitTimeOut)
                    await client.getText(
                        cssSelectorsList.pageObjects.paymentPage.selectors
                            .beautyCardPreID,
                        result => {
                            client.assert.equal(result.value.trim(), '633586')
                        }
                    )
                    await client.clearValue(
                        cssSelectorsList.pageObjects.paymentPage.selectors
                            .beautyCardIDField
                    )
                    await client.setValue(
                        cssSelectorsList.pageObjects.paymentPage.selectors
                            .beautyCardIDField,
                        cardnumber
                    )
                    await client.clearValue(
                        cssSelectorsList.pageObjects.paymentPage.selectors
                            .beautyCardPinField
                    )
                    await client.setValue(
                        cssSelectorsList.pageObjects.paymentPage.selectors
                            .beautyCardPinField,
                        cardpin
                    )
                    await client.pause(testData.implicitTimeOut)
                    await click('beautyCardApplyButton', 'paymentPage')
                    await client.pause(testData.implicitTimeOut)
                    await waitElementNotPresent('loader', 'commonPage')
                    await waitElementNotPresent('skeletonBlock', 'commonPage')
                    await waitElementVisible(
                        'beautyCardAppliedRemoveLink',
                        'paymentPage'
                    )

                    break

                default:
                    console.log(
                        'default===> enter the credit card type name as Credit OR Gift OR Beauty'
                    )
            }
        }
    )
})
