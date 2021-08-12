import {client} from 'nightwatch-cucumber'
import {defineSupportCode} from 'cucumber'
import PageObjects from '../page-objects/page-objects'
import {
    explicitPagePause,
    waitElementVisible,
    waitElementPresent,
    waitElementNotPresent,
    waitElementNotVisible
} from '../methods/explicitWait'
import {getText} from '../methods/getText'
import {
    swatchColorAvailableOption,
    swatchSizeAvailableOptions,
    dropdownRangePriceAvailableOption,
    dropdownAvailableOption
} from '../methods/pdpSizeColorSelector'
import {profiles} from '../site-ssr'
import {scrollToPosition, scrollToPositionBySelector} from '../methods/scrollTo'

import testData from '../test-data'

const cssSelectorsList = new PageObjects()

const testDataSet = process.env.TEST_DATA_SET || 'UK'

defineSupportCode(({Given, Then}) => {
    let productNames = []
    let productAvailableSizeLoc = 0
    let productOutOfStockSizeLoc = 0
    let tempData

    Given(/^I navigate to my saved item login page$/, async () => {
        await profiles('mySavedItemPageUrl')
        await explicitPagePause()
        // await client.waitForElementVisible('body', 3000)
        // await client.pause(4000)
        await client.elements(
            'css selector',
            cssSelectorsList.pageObjects.commonPage.selectors.cookiesClose,
            result => {
                tempData = result.value
            }
        )
        if (tempData.length) {
            await client.click(
                cssSelectorsList.pageObjects.commonPage.selectors.cookiesClose
            )
            await client.pause(testData.implicitTimeOut)
        }
        await client.elements(
            'css selector',
            cssSelectorsList.pageObjects.commonPage.selectors
                .countrySelectorpopupclose,
            result => {
                tempData = result.value
            }
        )
        if (tempData.length) {
            await client.click(
                cssSelectorsList.pageObjects.commonPage.selectors
                    .countrySelectorpopupclose
            )
            await waitElementNotVisible(
                'countrySelectorpopupclose',
                'commonPage'
            )
        }
    })
    Then(
        /^I store value of first "(.*?)" products and select save item on pspPage$/,
        async numberOfProducts => {
            let j
            let i
            let productSavedStatus
            productNames = []
            const savedItemsCountBefore = await getText(
                'savedItemCount',
                'mySavedItemPage'
            )
            for (j = 1; j <= numberOfProducts; j++) {
                productSavedStatus = 'false'
                await client.getText(
                    cssSelectorsList.pageObjects.pspPage.selectors.pspNthProductName.replace(
                        'productNumber',
                        j
                    ),
                    result => {
                        productNames[j - 1] = result.value.trim()
                    }
                )
                await client.getAttribute(
                    cssSelectorsList.pageObjects.pspPage.selectors.pspNthProductSavedElement.replace(
                        'productNumber',
                        j
                    ),
                    'class',
                    result => {
                        if (result.value.includes('saved')) {
                            productSavedStatus = 'true'
                        }
                    }
                )
                if (productSavedStatus === 'false') {
                    i = 0
                    await client.click(
                        cssSelectorsList.pageObjects.pspPage.selectors.pspNthProductSavedElementButton.replace(
                            'productNumber',
                            j
                        )
                    )
                    await client.pause(testData.implicitTimeOut)
                    await client.elements(
                        'css selector',
                        cssSelectorsList.pageObjects.pspPage.selectors
                            .saveItemSignInPageCloseIcon,
                        result => {
                            const els = result.value
                            els.forEach(() => i++)
                        }
                    )
                    if (i > 0) {
                        await client.click(
                            cssSelectorsList.pageObjects.pspPage.selectors
                                .saveItemContinueShoppingButton
                        )
                        if (testDataSet.includes('DESKTOP')) {
                            await waitElementNotPresent(
                                'saveItemContinueShoppingButton',
                                'pspPage'
                            )
                            // } else {
                            //     await waitElementNotVisible(
                            //         'saveItemContinueShoppingButton',
                            //         'pspPage'
                            //     )
                        }
                    }
                }
            }
            await waitElementNotPresent('loader', 'commonPage')
            await waitElementNotPresent('skeletonBlock', 'commonPage')
            await client.pause(testData.implicitTimeOut)
            const savedItemsCountAfter = await getText(
                'savedItemCount',
                'mySavedItemPage'
            )
            await client.assert.notEqual(
                savedItemsCountBefore,
                savedItemsCountAfter,
                'Minibag count are same'
            )
        }
    )

    Then(
        /^I store name of product and select save item on pdpPage$/,
        async () => {
            let j
            let i
            let productSavedStatus
            productNames = []
            productSavedStatus = 'false'
            await client.getText(
                cssSelectorsList.pageObjects.pdpPage.selectors.productName,
                result => {
                    productNames[j - 1] = result.value.trim()
                }
            )
            await client.getAttribute(
                cssSelectorsList.pageObjects.pdpPage.selectors.saveLaterIcon,
                'class',
                result => {
                    if (result.value.includes('saved')) {
                        productSavedStatus = 'true'
                    }
                }
            )
            if (productSavedStatus === 'false') {
                i = 0
                await scrollToPosition('pdpPage', 'saveLaterIcon')
                await client.click(
                    cssSelectorsList.pageObjects.pdpPage.selectors.saveLaterIcon
                )
                await client.pause(testData.implicitTimeOut)
                await client.elements(
                    'css selector',
                    cssSelectorsList.pageObjects.pspPage.selectors
                        .saveItemSignInPageCloseIcon,
                    result => {
                        const els = result.value
                        els.forEach(() => i++)
                    }
                )
                if (i > 0) {
                    await client.pause(testData.implicitTimeOut)
                    await client.click(
                        cssSelectorsList.pageObjects.pspPage.selectors
                            .saveItemContinueShoppingButton
                    )
                    await waitElementNotPresent(
                        'saveItemContinueShoppingButton',
                        'pspPage'
                    )
                }
            }
        }
    )

    Then(/^I select save item for the chanel product on pdpPage$/, async () => {
        let i
        let productSavedStatus
        productSavedStatus = 'false'

        await client.getAttribute(
            cssSelectorsList.pageObjects.pdpPage.selectors
                .saveForLaterButtonChanel,
            'class',
            result => {
                if (result.value.includes('saved')) {
                    productSavedStatus = 'true'
                }
            }
        )
        if (productSavedStatus === 'false') {
            i = 0
            await scrollToPosition('pdpPage', 'saveForLaterButtonChanel')
            await client.click(
                cssSelectorsList.pageObjects.pdpPage.selectors
                    .saveForLaterButtonChanel
            )
            await client.pause(testData.implicitTimeOut)
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects.pspPage.selectors
                    .saveItemSignInPageCloseIcon,
                result => {
                    const els = result.value
                    els.forEach(() => i++)
                }
            )
            if (i > 0) {
                await client.pause(testData.implicitTimeOut)
                await client.click(
                    cssSelectorsList.pageObjects.pspPage.selectors
                        .saveItemContinueShoppingButton
                )
                await waitElementNotPresent(
                    'saveItemContinueShoppingButton',
                    'pspPage'
                )
            }
        }
    })

    Then(/^I validate products are saved on mySavedItemPage$/, async () => {
        const productNamesCount = productNames.length
        let j
        let i = 0
        let k
        let productFoundStatus
        await client.elements(
            'css selector',
            cssSelectorsList.pageObjects.mySavedItemPage.selectors
                .allProductNameElements,
            result => {
                const els = result.value
                els.forEach(() => i++)
            }
        )
        for (j = 0; j < productNamesCount; j++) {
            productFoundStatus = 'product not found'
            for (k = 1; k <= i; k++) {
                await client.getText(
                    `.dbh-items-container .c-saved-product-item:nth-child(${k}) .dbh-product-title`,
                    result => {
                        if (
                            result.value
                                .trim()
                                .toLowerCase()
                                .includes(productNames[j].toLowerCase())
                        ) {
                            productFoundStatus = 'product found'
                        }
                    }
                )
            }
            await client.assert.equal(productFoundStatus, 'product found')
        }
    })

    Then(
        /^I store name of product and select save item on pspPage$/,
        async () => {
            let j
            let i
            let productSavedStatus
            productNames = []
            productSavedStatus = 'false'
            await client.getText(
                cssSelectorsList.pageObjects.pspPage.selectors.productName,
                result => {
                    productNames[j - 1] = result.value.trim()
                }
            )
            await client.getAttribute(
                cssSelectorsList.pageObjects.pspPage.selectors.saveLaterIcon,
                'class',
                result => {
                    if (result.value.includes('saved')) {
                        productSavedStatus = 'true'
                    }
                }
            )
            if (productSavedStatus === 'false') {
                i = 0
                await client.click(
                    cssSelectorsList.pageObjects.pspPage.selectors.saveLaterIcon
                )
                await client.pause(testData.implicitTimeOut)
                await client.elements(
                    'css selector',
                    cssSelectorsList.pageObjects.pspPage.selectors
                        .saveItemSignInPageCloseIcon,
                    result => {
                        const els = result.value
                        els.forEach(() => i++)
                    }
                )
            }
        }
    )

    Then(/^I select available size from "(.*?)"$/, async option => {
        await swatchColorAvailableOption()
        await swatchSizeAvailableOptions()
        await dropdownRangePriceAvailableOption()
        await dropdownAvailableOption()
    })

    Then(/^I empty mySavedItemPage$/, async () => {
        let isSelectorPresent
        await waitElementNotPresent('loader', 'commonPage')
        // await waitElementNotPresent('skeletonBlock', 'commonPage')
        await client.elements('css selector', 'a.dbh-remove', result => {
            isSelectorPresent = result.value
        })
        if (isSelectorPresent.length) {
            await scrollToPosition('mySavedItemPage', 'removeAllLink')
            await client.click(
                cssSelectorsList.pageObjects.mySavedItemPage.selectors
                    .removeAllLink
            )
            await client.pause(testData.implicitTimeOut)
            await waitElementNotPresent('loader', 'commonPage')
            await client.click(
                cssSelectorsList.pageObjects.mySavedItemPage.selectors.yesButton
            )
        }
    })
})
