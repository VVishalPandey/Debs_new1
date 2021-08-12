import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'
import {waitElementVisible, waitElementNotPresent} from './explicitWait'
import {click} from './click'
import {clearText} from './clearText'
import {setValue} from './setValue'
import testData from '../test-data'
import {scrollToPosition} from './scrollTo'
import {cookieBannerClose} from '../methods/cookies'
import {clearValue} from './clearValue'

const cssSelectorsList = new PageObjects()
const testDataSet = process.env.TEST_DATA_SET || 'UK'
const browser = process.env.testBrowser

export const enterLoginDetails = async () => {
    let username
    await cookieBannerClose()
    await waitElementVisible('emailAddressFieldSignIn', 'loginPage')
    await clearText('emailAddressFieldSignIn', 'loginPage')
    await client.pause(testData.implicitTimeOut)
    if (testDataSet.includes('DESKTOP')) {
        username = browser.concat('UserDesktop')
        await setValue(
            'emailAddressFieldSignIn',
            'loginPage',
            testData[username]
        )
    } else if (testDataSet.includes('TABLET')) {
        await client.setValue(
            cssSelectorsList.pageObjects.loginPage.selectors
                .emailAddressFieldSignIn,
            testData.testTabletEmail
        )
    } else {
        await client.setValue(
            cssSelectorsList.pageObjects.loginPage.selectors
                .emailAddressFieldSignIn,
            testData.testEmail
        )
    }
    // await setValue('emailAddressFieldSignIn', 'loginPage', testData[username])
    await client.clearValue(
        cssSelectorsList.pageObjects.loginPage.selectors.passwordField
    )
    await client.pause(testData.implicitTimeOut)
    await setValue('passwordField', 'loginPage', testData.testPassword)
    await scrollToPosition('loginPage', 'signInButton')
    await click('signInButton', 'loginPage')
    await waitElementNotPresent('signInButton', 'loginPage')
    await client.pause(testData.implicitTimeOut)
}

export const enterLoginDetailsPartialLogin = async userType => {
    let username
    await waitElementVisible('emailAddressFieldSignIn', 'loginPage')
    await clearText('emailAddressFieldSignIn', 'loginPage')
    await client.pause(testData.implicitTimeOut)
    switch (userType) {
        case 'sameUser':
            if (testDataSet.includes('DESKTOP')) {
                username = browser.concat('UserDesktop')
                await setValue(
                    'emailAddressFieldSignIn',
                    'loginPage',
                    testData[username]
                )
            } else if (testDataSet.includes('TABLET')) {
                await setValue(
                    'emailAddressFieldSignIn',
                    'loginPage',
                    testData.testTabletEmail
                )
            } else {
                await setValue(
                    'emailAddressFieldSignIn',
                    'loginPage',
                    testData.testEmail
                )
            }
            await clearValue('passwordField', 'loginPage')
            await client.pause(testData.implicitTimeOut)
            await setValue('passwordField', 'loginPage', testData.testPassword)
            break

        case 'differentUser':
            await clearText('emailAddressFieldSignIn', 'loginPage')
            await setValue(
                'emailAddressFieldSignIn',
                'loginPage',
                testData.e2eTestEmail
            )
            await clearValue('passwordField', 'loginPage')
            await setValue(
                'passwordField',
                'loginPage',
                testData.e2eTestPassword
            )

            break

        default:
            console.log('userType should se sameUser  or differentUser')
    }
    await scrollToPosition('loginPage', 'signInButton')
    await click('signInButton', 'loginPage')
    await waitElementNotPresent('signInButton', 'loginPage')
    await client.pause(testData.implicitTimeOut)
}
