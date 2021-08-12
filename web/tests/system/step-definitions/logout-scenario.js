import {client} from 'nightwatch-cucumber'
import {defineSupportCode} from 'cucumber'
import PageObjects from '../page-objects/page-objects'
import {profiles} from '../site-ssr'
import {countElements} from '../methods/elements'
import {waitElementVisible} from '../methods/explicitWait'

import testData from '../test-data'
import {click} from '../methods/click.js'
import {itemValidationInList} from '../methods/itemValidationInList'
import {cookieBannerClose} from '../methods/cookies'

const cssSelectorsList = new PageObjects()
const testDataSet = process.env.TEST_DATA_SET || 'UK'

defineSupportCode(({Then}) => {
    Then(/^I logout$/, async () => {
        if (testDataSet.includes('CCC')) {
            await profiles('loginUrl')
        } else {
            await profiles('homeURL')
        }
        const count = await countElements('commonPage', 'debenhamsPromo')
        if (count === 1) {
            await click('debenhamsPromo', 'commonPage')
        }
        await cookieBannerClose()

        if (!testDataSet.includes('DESKTOP')) {
            let count
            let position
            await waitElementVisible('menuIcon', 'commonPage')
            await click('menuIcon', 'commonPage')
            count = await countElements('commonPage', 'debenhamsPromo')
            if (count === 1) {
                await click('debenhamsPromo', 'commonPage')
            }
            const isPresent = await itemValidationInList(
                'My Account',
                'globalNavMenuOptions',
                'commonPage'
            )
            count = isPresent[0]
            position = isPresent[1]
            if (count === 1) {
                const isPresent = await itemValidationInList(
                    'Sign out',
                    'globalNavMenuOptions',
                    'commonPage'
                )
                count = isPresent[0]
                position = isPresent[1]
                await client.click(
                    cssSelectorsList.pageObjects.commonPage.selectors.globalNavMenuOptions.concat(
                        `:nth-child(${position})`
                    )
                )
            } else {
                await waitElementVisible('closeIcon', 'commonPage')
                await client.click(
                    cssSelectorsList.pageObjects.commonPage.selectors.closeIcon
                )
            }
        } else if (testDataSet.includes('DESKTOP')) {
            const counter = await countElements('commonPage', 'signOutLink')
            if (counter === 1) {
                let isSignInDesktopPresent
                await client.getText(
                    cssSelectorsList.pageObjects.commonPage.selectors
                        .signOutLink,
                    result => {
                        isSignInDesktopPresent = result.value.trim()
                    }
                )
                if (
                    isSignInDesktopPresent.toUpperCase() ===
                    'Sign Out'.toUpperCase()
                ) {
                    await client.click(
                        cssSelectorsList.pageObjects.commonPage.selectors
                            .signOutLink
                    )
                }
            }
        } else {
            await waitElementVisible('signInOption', 'commonPage')
            let isSignInPresent
            await client.getText(
                cssSelectorsList.pageObjects.commonPage.selectors.signInOption,
                result => {
                    isSignInPresent = result.value.trim()
                }
            )
            if (isSignInPresent === 'Create Account/Sign In') {
                await waitElementVisible('closeIcon', 'commonPage')
                await client.click(
                    cssSelectorsList.pageObjects.commonPage.selectors.closeIcon
                )
            } else {
                await client.click(
                    cssSelectorsList.pageObjects.commonPage.selectors
                        .signOutOption
                )
            }
        }
        await client.pause(testData.implicitTimeOut)
    })
})
