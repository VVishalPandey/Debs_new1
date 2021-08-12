import {client} from 'nightwatch-cucumber'
import {defineSupportCode} from 'cucumber'
import PageObjects from '../page-objects/page-objects'
// import {menuValidationBigScreen, subMenuValidationBigScreen} from '../methods/menuFunctionsBigScreen'
import {
    waitElementVisible,
    waitElementPresent,
    waitElementNotPresent
} from '../methods/explicitWait'
import testData from '../test-data'

import {subMenuValidationBigScreen} from '../methods/subMenuValidation'
import {itemValidationInList} from '../methods/itemValidationInList'
import {
    // moveToElementByJQuery,
    moveToElementBySelector,
    moveToElementByJQueryRevertChange
} from '../methods/moveToElement'
import {scrollToPosition} from '../methods/scrollTo.js'
import {click, clickBySelector} from '../methods/click.js'
import {removeAddresses} from '../methods/removeProducts'

const cssSelectorsList = new PageObjects()
let count
let position
let isPresent

defineSupportCode(({When, Then}) => {
    Then(
        /^I should see value of position "(.*?)" as "(.*?)"$/,
        async (position, text) => {
            await client.getText(
                `.pw-nav-menu__panel > .pw-list-tile:nth-child(${position}) .pw-list-tile__primary`,
                result => {
                    client.assert.equal(result.value.trim(), text)
                }
            )
        }
    )

    When(/^I click on "(.*?)" position "(.*?)"$/, async (text, position) => {
        await client.getText(
            `.pw-nav-menu__panel > .pw-list-tile:nth-child(${position}) a.pw-link.pw-list-tile__primary`,
            result => {
                client.assert.equal(result.value.trim(), text)
                client.click(
                    `.pw-nav-menu__panel > .pw-list-tile:nth-child(${position}) a.pw-link.pw-list-tile__primary`
                )
                client.pause(testData.implicitTimeOut)
            }
        )
    })

    Then(/^I should see nav menu back option as "(.*?)"$/, async text => {
        await waitElementVisible('navMenuBack', 'commonPage')
        // await client.waitForElementVisible(cssSelectorsList.pageObjects.commonPage.selectors.navMenuBack, 10000)
        await client.getText(
            cssSelectorsList.pageObjects.commonPage.selectors.navMenuBack,
            result => {
                client.assert.equal(result.value.trim(), text)
            }
        )
    })

    When(/^I click on nav menu back option as "(.*?)"$/, async text => {
        await waitElementVisible('navMenuBack', 'commonPage')
        // await client.waitForElementVisible(cssSelectorsList.pageObjects.commonPage.selectors.navMenuBack, 10000)
        await client.getText(
            cssSelectorsList.pageObjects.commonPage.selectors.navMenuBack,
            result => {
                client.assert.equal(result.value.trim(), text)
                client.click(
                    cssSelectorsList.pageObjects.commonPage.selectors
                        .navMenuBack
                )
                client.pause(1000)
            }
        )
    })

    When(
        /^I "(.*?)" menu option "(.*?)" on commonPage bigscreen$/,
        async (option, parentOption) => {
            isPresent = await itemValidationInList(
                parentOption,
                'globalNavMenuOptions',
                'commonPage'
            )
            count = isPresent[0]
            position = isPresent[1]
            await client.assert.equal(count, '1')
            if (option === 'validate & click') {
                // await moveToElementBySelector(cssSelectorsList.pageObjects.commonPage.selectors.globalNavMenuOptions.concat(`:nth-child(${position})`))
                await client.click(
                    cssSelectorsList.pageObjects.commonPage.selectors.globalNavMenuOptions.concat(
                        `:nth-child(${position})`
                    )
                )
            }
        }
    )

    When(
        /^I "(.*?)" brand option "(.*?)" on commonPage bigscreen$/,
        async (option, parentOption) => {
            isPresent = await itemValidationInList(
                parentOption,
                'brandAtoZlist',
                'pdpPage'
            )
            count = isPresent[0]
            position = isPresent[1]
            await client.assert.equal(count, '1')
            if (option === 'validate & click') {
                // await moveToElementBySelector(cssSelectorsList.pageObjects.commonPage.selectors.globalNavMenuOptions.concat(`:nth-child(${position})`))
                await client.click(
                    cssSelectorsList.pageObjects.pdpPage.selectors.brandAtoZlist.concat(
                        `:nth-child(${position})`
                    )
                )
            }
        }
    )

    When(
        /^I "(.*?)" subMenu option "(.*?)" under "(.*?)" on commonPage bigscreen$/,
        async (option, childOption, parentOption) => {
            let currentUrl
            isPresent = await itemValidationInList(
                parentOption,
                'globalNavMenuOptions',
                'commonPage'
            )
            count = isPresent[0]
            const parentPosition = isPresent[1]
            await client.assert.equal(count, '1')
            const parentlocator = cssSelectorsList.pageObjects.commonPage.selectors.globalNavMenuOptionsList.replace(
                /[0-9]/g,
                parentPosition
            )

            // if (process.env.INSTANCE === 'chrome') {
            //     await moveToElementBySelector(
            //         cssSelectorsList.pageObjects.commonPage.selectors.globalNavMenuOptions.concat(
            //             `:nth-child(${parentPosition})`
            //         )
            //     )
            // } else {
            // await moveToElementByJQuery('global nav', parentPosition)
            await moveToElementBySelector(parentlocator)
            // }
            await client.pause(testData.implicitTimeOut)
            const childSelector = await subMenuValidationBigScreen(childOption)
            if (option === 'validate & click') {
                await client.click(childSelector)
            }
            await waitElementNotPresent('desktopSkelton', 'commonPage')
            if (!childOption.includes('Brand')) {
                await client.url(result => {
                    currentUrl = result.value
                })
                // Below check is for Beauty Club Content Landing page as there is no dropdown and product image exists
                if (!currentUrl.includes('content')) {
                    await waitElementPresent('sortDropdown', 'pspPage')
                    await scrollToPosition('pspPage', 'sortDropdown')
                    await waitElementPresent('firstProductImage', 'pspPage')
                }
                // if (!(process.env.INSTANCE === 'chrome')) {
                await moveToElementByJQueryRevertChange(
                    'global nav',
                    parentPosition
                )
            }
        }
    )

    When(
        /^I "(.*?)" mainMenu option "(.*?)" on commonPage smallscreen$/,
        async (option, selectionValue) => {
            await click('menuIcon', 'commonPage')
            const isPresent = await itemValidationInList(
                selectionValue,
                'globalNavMenuOptions',
                'commonPage'
            )
            count = isPresent[0]
            position = isPresent[1]
            await client.assert.equal(count, '1')
            if (option === 'validate & click') {
                await client.click(
                    cssSelectorsList.pageObjects.commonPage.selectors.globalNavMenuOptions.concat(
                        `:nth-child(${position})`
                    )
                )
            }
        }
    )

    Then(/^I remove the addresses from my account address book$/, async () => {
        await clickBySelector(`.dbh-link-addressbook`)
        await removeAddresses()
    })

    Then(/^I click on "(.*?)" on brand AtoZ page$/, async option => {
        await clickBySelector(`a[title="${option}"]`)
    })
})
