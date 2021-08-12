import {client} from 'nightwatch-cucumber'
import {defineSupportCode} from 'cucumber'
import PageObjects from '../page-objects/page-objects'
import {
    explicitPagePause,
    waitElementVisible,
    waitElementNotVisible,
    waitElementPresent,
    waitElementNotPresent
} from '../methods/explicitWait'
import {profiles} from '../site-ssr'
import testData from '../test-data'
import {clearText} from '../methods/clearText'
import {click, clickUsingJS} from '../methods/click.js'
import {itemValidationInList} from '../methods/itemValidationInList'
import {
    enterLoginDetails,
    enterLoginDetailsPartialLogin
} from '../methods/login.js'
import {getCookie, cookieBannerClose} from '../methods/cookies'
import {setValue} from '../methods/setValue'
import {clearValue} from '../methods/clearValue'
import {countElements} from '../methods/elements'

const cssSelectorsList = new PageObjects()
const testDataSet = process.env.TEST_DATA_SET || 'UK'
const browser = process.env.testBrowser

defineSupportCode(({Given, When}) => {
    let count
    let position
    Given(/^I am on create an account screen$/, async () => {
        // await client.url(testData.loginUrl)
        await profiles(testData.loginUrl)
        await cookieBannerClose()
        await client.click(
            cssSelectorsList.pageObjects.loginPage.selectors.tab2
        )
        await client.setValue(
            cssSelectorsList.pageObjects.loginPage.selectors
                .emailAddressFieldCreateAccount,
            testData.newEmail
        )
        await client.pause(testData.implicitTimeOut)
        await client.click(
            cssSelectorsList.pageObjects.loginPage.selectors.createAccountButton
        )
        await waitElementNotVisible('createAccountButton', 'registerPage')
        // await client.waitForElementVisible(cssSelectorsList.pageObjects.registerPage.selectors.createAccountButton, 4000)
    })

    When(/^I am on my details page$/, async () => {
        await profiles('homeURL')
        count = await countElements('commonPage', 'debenhamsPromo')
        if (count === 1) {
            await click('debenhamsPromo', 'commonPage')
        }
        await cookieBannerClose()
        await explicitPagePause()
        if (!testDataSet.includes('DESKTOP')) {
            await waitElementVisible('menuIcon', 'commonPage')
            await client.click(
                cssSelectorsList.pageObjects.commonPage.selectors.menuIcon
            )
            await client.pause(testData.implicitTimeOut)
            await waitElementVisible('menuIcon', 'commonPage')
            await click('menuIcon', 'commonPage')
            const isPresent = await itemValidationInList(
                'Create Account/Sign In',
                'globalNavMenuOptions',
                'commonPage'
            )
            count = isPresent[0]
            position = isPresent[1]
            await client.assert.equal(count, '1')
            await client.click(
                cssSelectorsList.pageObjects.commonPage.selectors.globalNavMenuOptions.concat(
                    `:nth-child(${position})`
                )
            )
        } else {
            await client.click(
                cssSelectorsList.pageObjects.commonPage.selectors
                    .createAccountLink
            )
        }
        await cookieBannerClose()
        await enterLoginDetails()
        await waitElementVisible('fullName', 'myDetailsPage')
    })

    When(/^I navigate to sign in page$/, async () => {
        // await client.pause(2000)
        await waitElementVisible('menuIcon', 'commonPage')
        await client.click(
            cssSelectorsList.pageObjects.commonPage.selectors.menuIcon
        )
        // await client.pause(1000)
        await waitElementNotVisible('menuIcon', 'commonPage')
        if (testDataSet === 'ROI') {
            await client.getText(
                cssSelectorsList.pageObjects.commonPage.selectors
                    .signInOptionRoi,
                result => {
                    client.assert.equal(
                        result.value.trim(),
                        'Create Account/Sign In'
                    )
                    client.click(
                        cssSelectorsList.pageObjects.commonPage.selectors
                            .signInOptionRoi
                    )
                }
            )
        } else {
            await client.getText(
                cssSelectorsList.pageObjects.commonPage.selectors.signInOption,
                result => {
                    client.assert.equal(
                        result.value.trim(),
                        'Create Account/Sign In'
                    )
                    client.click(
                        cssSelectorsList.pageObjects.commonPage.selectors
                            .signInOption
                    )
                }
            )
        }
        await explicitPagePause()
        // await client.waitForElementVisible('body', 3000)
        // await client.pause(2000)
    })

    Given(/^I navigate to forgot password page$/, async () => {
        // await client.url(testData.loginUrl)
        await profiles(testData.loginUrl)
        await cookieBannerClose()
        await client.click(
            cssSelectorsList.pageObjects.loginPage.selectors.forgotPasswordLink
        )
        await waitElementVisible('resetPasswordButton', 'forgotPasswordPage')
        // await client.waitForElementVisible(cssSelectorsList.pageObjects.forgotPasswordPage.selectors.resetPasswordButton, 4000)
    })

    Given(/^I am logged in$/, async () => {
        await profiles(testData.loginUrl)
        await explicitPagePause()
        // await client.waitForElementVisible('body', 3000)
        // await client.pause(3000)
        await client.clearValue(
            cssSelectorsList.pageObjects.loginPage.selectors
                .emailAddressFieldSignIn
        )
        await client.setValue(
            cssSelectorsList.pageObjects.loginPage.selectors
                .emailAddressFieldSignIn,
            testData.testEmail
        )
        await client.pause(testData.implicitTimeOut)
        await client.clearValue(
            cssSelectorsList.pageObjects.loginPage.selectors.passwordField
        )
        await client.setValue(
            cssSelectorsList.pageObjects.loginPage.selectors.passwordField,
            testData.testPassword
        )
        await client.pause(testData.implicitTimeOut)
        await client.click(
            cssSelectorsList.pageObjects.loginPage.selectors.signInButton
        )
        await waitElementNotVisible('signInButton', 'loginPage')
        await client.assert.elementNotPresent(
            cssSelectorsList.pageObjects.loginPage.selectors.tab1
        )
    })

    Given(/^I am logged in with saved address$/, async () => {
        await profiles(testData.loginUrl)
        await explicitPagePause()
        // await client.waitForElementVisible('body', 3000)
        // await client.pause(3000)
        await client.clearValue(
            cssSelectorsList.pageObjects.loginPage.selectors
                .emailAddressFieldSignIn
        )
        await client.setValue(
            cssSelectorsList.pageObjects.loginPage.selectors
                .emailAddressFieldSignIn,
            testData.testSavedAddressEmail
        )
        await client.pause(testData.implicitTimeOut)
        await client.clearValue(
            cssSelectorsList.pageObjects.loginPage.selectors.passwordField
        )
        await client.setValue(
            cssSelectorsList.pageObjects.loginPage.selectors.passwordField,
            testData.testSavedAddressPassword
        )
        await client.pause(testData.implicitTimeOut)
        await client.click(
            cssSelectorsList.pageObjects.loginPage.selectors.signInButton
        )
        await waitElementNotVisible('signInButton', 'loginPage')
        await client.assert.elementNotPresent(
            cssSelectorsList.pageObjects.loginPage.selectors.tab1
        )
    })

    Given(/^I am logged in without saved address and card$/, async () => {
        await profiles(testData.loginUrl)
        await explicitPagePause()
        // await client.waitForElementVisible('body', 3000)
        // await client.pause(3000)
        await client.clearValue(
            cssSelectorsList.pageObjects.loginPage.selectors
                .emailAddressFieldSignIn
        )
        await client.setValue(
            cssSelectorsList.pageObjects.loginPage.selectors
                .emailAddressFieldSignIn,
            testData.testWithoutSavedAddressEmail
        )
        await client.pause(testData.implicitTimeOut)
        await client.clearValue(
            cssSelectorsList.pageObjects.loginPage.selectors.passwordField
        )
        await client.setValue(
            cssSelectorsList.pageObjects.loginPage.selectors.passwordField
        )
        await waitElementNotVisible('signInButton', 'loginPage')
        await client.assert.elementNotPresent(
            cssSelectorsList.pageObjects.loginPage.selectors.tab1
        )
    })

    When(/^I am on my details page with e2e credentials$/, async () => {
        await profiles(testData.loginUrl)
        await explicitPagePause()
        // await client.waitForElementVisible('body', 3000)
        // await client.pause(3000)
        await client.setValue(
            cssSelectorsList.pageObjects.loginPage.selectors
                .emailAddressFieldSignIn,
            testData.e2eTestEmail
        )
        await client.setValue(
            cssSelectorsList.pageObjects.loginPage.selectors.passwordField,
            testData.e2eTestPassword
        )
        await client.click(
            cssSelectorsList.pageObjects.loginPage.selectors.signInButton
        )
        await waitElementNotVisible('signInButton', 'loginPage')
    })

    When(/^I enter email in "(.*?)" on "(.*?)"$/, async (locator, page) => {
        const chars = 'abcdefghijklmnopqrstuvwxyz1234567890'
        let string = ''
        let email = ''
        for (let ii = 0; ii < 15; ii++) {
            string += chars[Math.floor(Math.random() * chars.length)]
        }
        email = `${string}@gmail.com`
        await waitElementVisible(locator, page)
        await clearText(locator, page)
        await client.setValue(
            cssSelectorsList.pageObjects[page].selectors[locator],
            email
        )
    })

    When(/^I sign in from my saved items$/, async () => {
        await getCookie('WC_USERTYPE')
        await waitElementPresent('signInLinkHeaderText', 'mySavedItemPage')
        // await click('signInLinkHeaderText', 'mySavedItemPage')
        await clickUsingJS(
            cssSelectorsList.pageObjects.mySavedItemPage.selectors
                .signInLinkHeaderText
        )
        await enterLoginDetails()
        await getCookie('WC_USERTYPE')
    })

    Given(/^I am enacting as a guest using CCC$/, async () => {
        if (testDataSet.includes('CCC-DESKTOP')) {
            await profiles('loginUrl')
            await explicitPagePause()
            await clearValue('cccLoginField', 'cccLoginPage')
            await setValue('cccLoginField', 'cccLoginPage', testData.cccLogin)
            await clearValue('cccPasswordField', 'cccLoginPage')
            await setValue(
                'cccPasswordField',
                'cccLoginPage',
                testData.cccPassword
            )
            await click('cccSignInButton', 'cccLoginPage')
            await waitElementPresent(
                'shopOnBehalfOfCustomerCTA',
                'cccLoginPage'
            )
        }
    })

    Given(/^I am enacting as a customer using DSC$/, async () => {
        if (testDataSet.includes('CCC-DESKTOP')) {
            await profiles('loginUrl')
            await explicitPagePause()
            await clearValue('cccLoginField', 'cccLoginPage')
            await setValue('cccLoginField', 'cccLoginPage', testData.cccLogin)
            await clearValue('cccPasswordField', 'cccLoginPage')
            await setValue(
                'cccPasswordField',
                'cccLoginPage',
                testData.cccPassword
            )
            await click('cccSignInButton', 'cccLoginPage')
            await waitElementPresent(
                'shopOnBehalfOfCustomerCTA',
                'cccLoginPage'
            )
            await waitElementPresent('searchCTA', 'cccCustomerSearchPage')
            await clearValue('emailaddressfield', 'cccCustomerSearchPage')
            await setValue(
                'emailaddressfield',
                'cccCustomerSearchPage',
                testData.customerSearchEmailAddress
            )
            await click('searchCTA', 'cccCustomerSearchPage')
            await waitElementPresent(
                'selectResultRadioButton',
                'cccCustomerSearchPage'
            )
            await click('selectResultRadioButton', 'cccCustomerSearchPage')
            await waitElementPresent(
                'enactCustomerButton',
                'cccCustomerSearchPage'
            )
            await click('enactCustomerButton', 'cccCustomerSearchPage')
            await waitElementPresent('cccshopOnBehalfBanner', 'cccLoginPage')
            await client.pause(testData.implicitTimeOut)
            await client.getText(
                cssSelectorsList.pageObjects.cccLoginPage.selectors
                    .cccshopOnBehalfBanner,
                result => {
                    client.assert.equal(
                        result.value.trim(),
                        testData.shoponBehalfOfRegisteredCustomerBannerText
                    )
                }
            )
        }
    })

    Given(/^I redirect user to partial login page$/, async () => {
        let sessionUniqueKey
        await client.getCookie('sc_ibm_id', result => {
            sessionUniqueKey = result.value
        })
        await client.deleteCookie('WC_SESSION_ESTABLISHED')
        await client.deleteCookie(`WC_AUTHENTICATION_${sessionUniqueKey}`)
        await client.deleteCookie(`WC_USERACTIVITY_${sessionUniqueKey}`)
        await client.deleteCookie('WC_ACTIVEPOINTER')
        await client.deleteCookie('WC_REG')
        await client.deleteCookie('WC_USERTYPE')
        if (!testDataSet.includes('TABLET')) {
            await click('myBagButton', 'commonPage')
        } else {
            await click('myBagButton', 'commonPage')
            await click('goToMyBagMiniCartBtn', 'minibagPage')
        }
        await client.pause(testData.implicitTimeOut)
        await waitElementNotPresent('desktopSkelton', 'commonPage')
        await waitElementNotPresent('loader', 'commonPage')
        await click('checkoutButton', 'myBagPage')
        await waitElementNotPresent('desktopSkelton', 'commonPage')
        await waitElementNotPresent('loader', 'commonPage')
        await waitElementVisible('partialLoginHeader', 'loginPage')
        await client.assert.containsText(
            cssSelectorsList.pageObjects.loginPage.selectors.partialLoginHeader,
            'Welcome back'
        )
        await client.getText(
            cssSelectorsList.pageObjects.loginPage.selectors
                .partialLoginWelcomeMessage,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'Please re-enter your email and password to continue'
                )
            }
        )
    })

    When(
        /^I login back through the partial login screen with the "(.*?)"$/,
        async userType => {
            await client.assert.containsText(
                cssSelectorsList.pageObjects.loginPage.selectors
                    .partialLoginHeader,
                'Welcome back'
            )
            await client.getText(
                cssSelectorsList.pageObjects.loginPage.selectors
                    .partialLoginWelcomeMessage,
                result => {
                    client.assert.equal(
                        result.value.trim(),
                        'Please re-enter your email and password to continue'
                    )
                }
            )
            switch (userType) {
                case 'sameUser':
                    await enterLoginDetailsPartialLogin('sameUser')
                    await waitElementNotPresent('desktopSkelton', 'commonPage')
                    await waitElementNotPresent('loader', 'commonPage')
                    await waitElementVisible(
                        'deliveryOptionheaderText',
                        'deliveryOptionPage'
                    )
                    await click('homeDeliveryOption', 'deliveryOptionPage')
                    await waitElementNotPresent('desktopSkelton', 'commonPage')
                    await waitElementNotPresent('loader', 'commonPage')
                    await waitElementVisible(
                        'savedAddressOption',
                        'deliveryOptionPage'
                    )
                    await profiles('myAccountUrl')
                    await client.pause(testData.implicitTimeOut)
                    await waitElementNotPresent('desktopSkelton', 'commonPage')
                    await waitElementNotPresent('loader', 'commonPage')
                    if (testDataSet.includes('DESKTOP')) {
                        const username = browser.concat('UserDesktop')
                        await client.assert.containsText(
                            cssSelectorsList.pageObjects.myAccountPage.selectors
                                .emailAddress,
                            testData[username]
                        )
                    } else if (testDataSet.includes('TABLET')) {
                        await client.assert.containsText(
                            cssSelectorsList.pageObjects.myAccountPage.selectors
                                .emailAddress,
                            testData.testTabletEmail
                        )
                    } else {
                        await client.assert.containsText(
                            cssSelectorsList.pageObjects.myAccountPage.selectors
                                .emailAddress,
                            testData.testEmail
                        )
                    }
                    break

                case 'differentUser':
                    await enterLoginDetailsPartialLogin('differentUser')
                    await waitElementNotPresent('desktopSkelton', 'commonPage')
                    await waitElementNotPresent('loader', 'commonPage')
                    await waitElementVisible('myAccountLink', 'myAccountPage')
                    await client.assert.containsText(
                        cssSelectorsList.pageObjects.myAccountPage.selectors
                            .emailAddress,
                        testData.e2eTestEmail
                    )
                    break

                case 'guestUser':
                    await click('partialLoginContGuestBtn', 'loginPage')
                    await waitElementVisible(
                        'partialLoginGuestTitle',
                        'loginPage'
                    )
                    await client.getText(
                        cssSelectorsList.pageObjects.loginPage.selectors
                            .partialLoginGuestTitle,
                        result => {
                            client.assert.equal(
                                result.value.trim(),
                                'Continue as guest'
                            )
                        }
                    )
                    await clearText('partialLoginGuestEmailInput', 'loginPage')
                    await setValue(
                        'partialLoginGuestEmailInput',
                        'loginPage',
                        'testttttt3333@gmail.com'
                    )
                    await click('partialLoginGuestContinueBtn', 'loginPage')
                    await waitElementNotPresent('desktopSkelton', 'commonPage')
                    await waitElementNotPresent('loader', 'commonPage')
                    await waitElementVisible(
                        'deliveryOptionheaderText',
                        'deliveryOptionPage'
                    )
                    await waitElementNotPresent(
                        'savedAddressOption',
                        'deliveryOptionPage'
                    )
                    break

                default:
                    console.log(
                        'userType should be sameUser or differentUser or guestUser'
                    )
            }
        }
    )
})
