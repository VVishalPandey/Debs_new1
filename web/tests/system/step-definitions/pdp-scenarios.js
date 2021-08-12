import {client} from 'nightwatch-cucumber'
import {defineSupportCode} from 'cucumber'
import PageObjects from '../page-objects/page-objects'
import {
    explicitPagePause,
    waitElementVisible,
    waitElementNotPresent,
    waitElementVisibleBySelector
} from '../methods/explicitWait'
import {
    addToBag,
    addToBagMultipleItems,
    addToBagCheckout
} from '../methods/addToBag'
import {countElements} from '../methods/elements'
import {getAttributeValue} from '../methods/getAttribute'
import {getText, getTextBySelector} from '../methods/getText'
import {enterValue} from '../methods/enterValue'
import {
    swatchColorAvailableOption,
    swatchSizeAvailableOptions,
    dropdownRangePriceAvailableOption,
    dropdownAvailableOption
} from '../methods/pdpSizeColorSelector'
import {profiles} from '../site-ssr'
import {carouselProductValidation} from '../methods/pdpCarouselProductValidation'
import {click} from '../methods/click'

import testData from '../test-data'
const cssSelectorsList = new PageObjects()
const testDataSet = process.env.TEST_DATA_SET || 'UK'

defineSupportCode(({Given, When, Then}) => {
    let pspFinalProductName
    let pspFinalPrice
    let pspBrandName
    let pspProductName
    let productAvailableSizeLoc = 0
    let productOutOfStockSizeLoc = 0
    let productLowStockSizeLoc = 0
    let productAvailableSize
    let tempData
    let feetColor
    let fabricColor
    let tempPspNameForPdp

    Given(/^I navigate to pdp "(.*?)" and add to bag$/, async pdpPage => {
        let selectAvailableSize
        let i = 0
        let j = 1
        if (pdpPage === 'dress') {
            await profiles(testData.testDressPdpURL)
            await explicitPagePause()
            //await waitElementVisible('body', 3000)
            //await client.pause(4000)
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects.commonPage.selectors.cookiesClose,
                result => {
                    tempData = result.value
                }
            )
            if (result.value.length) {
                await client.click(
                    cssSelectorsList.pageObjects.commonPage.selectors
                        .cookiesClose
                )
                await client.pause(testData.implicitTimeOut)
            }
            i = 0
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects.pdpPage.selectors.allSizeElements,
                result => {
                    const els = result.value
                    els.forEach(() => i++)
                }
            )
            for (j = i; j >= 1; j--) {
                await client.getAttribute(
                    `.pw-swatch__items > div:nth-child(${j})`,
                    'class',
                    result => {
                        if (result.value.includes('-nostock')) {
                            productOutOfStockSizeLoc = j
                        } else {
                            productAvailableSizeLoc = j
                        }
                    }
                )
            }
            await client.click(
                `.pw-swatch__items > div:nth-child(${productAvailableSizeLoc})`
            )
            await client.pause(testData.implicitTimeOut)
        } else if (pdpPage === 'furniture') {
            // await client.preview(testData.testFurniturePdpURL)
            await profiles(testData.testFurniturePdpURL)
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects.commonPage.selectors.cookiesClose,
                result => {
                    if (result.value.length) {
                        client.click(
                            cssSelectorsList.pageObjects.commonPage.selectors
                                .cookiesClose
                        )
                        client.pause(testData.implicitTimeOut)
                    }
                }
            )
        } else if (pdpPage === 'perfume') {
            // await client.preview(testData.testPerfumePdpURL)
            await profiles(testData.testPerfumePdpURL)
            await waitElementVisible('body', 3000)
            await client.pause(4000)
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects.commonPage.selectors.cookiesClose,
                result => {
                    if (result.value.length) {
                        client.click(
                            cssSelectorsList.pageObjects.commonPage.selectors
                                .cookiesClose
                        )
                        client.pause(testData.implicitTimeOut)
                    }
                }
            )
            i = 0
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects.pdpPage.selectors
                    .sizeDropdownOptionElements,
                result => {
                    const els = result.value
                    els.forEach(() => i++)
                }
            )
            for (j = i; j > 1; j--) {
                await client.getAttribute(
                    `.t-product-details__size-dropdown select option:nth-child(${j})`,
                    'data-msg',
                    result => {
                        if (result.value.includes('out of stock')) {
                            productOutOfStockSizeLoc = j
                        } else {
                            productAvailableSizeLoc = j
                        }
                    }
                )
            }
            await client.click(
                `.t-product-details__size-dropdown select option:nth-child(${productAvailableSizeLoc})`
            )
            await client.pause(testData.implicitTimeOut)
        } else if (pdpPage === 'channel') {
            await profiles(testData.testChannelPdpURL)
            await explicitPagePause()
            // await waitElementVisible('body', 3000)
            // await client.pause(4000)
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects.commonPage.selectors.cookiesClose,
                result => {
                    if (result.value.length) {
                        client.click(
                            cssSelectorsList.pageObjects.commonPage.selectors
                                .cookiesClose
                        )
                        client.pause(testData.implicitTimeOut)
                    }
                }
            )
        }
        await client.click(
            cssSelectorsList.pageObjects.pdpPage.selectors.addToBagButton
        )
        await waitElementVisible('viewBasketCheckoutButton', 'pdpPage')
        // await client.pause(3000)
        await client.assert.elementPresent(
            cssSelectorsList.pageObjects.pdpPage.selectors
                .viewBasketCheckoutButton
        )
        await client.click(
            cssSelectorsList.pageObjects.pdpPage.selectors
                .viewBasketCheckoutButton
        )
        await explicitPagePause()
        // await waitElementVisible('body', 4000)
        // await client.pause(4000)
        await client.getText(
            cssSelectorsList.pageObjects.myBagPage.selectors.headerText,
            result => {
                client.assert.equal(result.value.trim(), 'My Bag')
            }
        )
    })

    Then(/^I should validate final price on "(.*?)"$/, async page => {
        let i = 0
        let j = 1
        let temp = 'poduct not found'
        let productLocation = 0
        if (page === 'pspPage') {
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects[page].selectors.firstProductPrice,
                result => {
                    const els = result.value
                    els.forEach(() => i++)
                }
            )
            if (i === 0) {
                await client.getText(
                    cssSelectorsList.pageObjects[page].selectors
                        .firstProductPriceNow,
                    result => {
                        pspFinalPrice = result.value.trim()
                    }
                )
            } else {
                await client.getText(
                    cssSelectorsList.pageObjects[page].selectors
                        .firstProductPrice,
                    result => {
                        pspFinalPrice = result.value.trim()
                    }
                )
            }
        } else if (page === 'pdpPage') {
            await waitElementVisible('productPrice', page)
            // await waitElementVisible(cssSelectorsList.pageObjects[page].selectors.productPrice, 10000)
            await client.getText(
                cssSelectorsList.pageObjects[page].selectors.productPrice,
                result => {
                    client.assert.equal(result.value.trim(), pspFinalPrice)
                }
            )
        } else if (page === 'myBagPage') {
            i = 0
            await waitElementVisibleBySelector(
                '.t-cart__product-list .dbh-product-price'
            )
            await client.elements(
                'css selector',
                '.t-cart__product-list .dbh-product-price',
                result => {
                    const els = result.value
                    els.forEach(() => i++)
                }
            )
            for (j = 1; j <= i; j = j + 1) {
                await client.getText(
                    `.pw-list > .c-product-item:nth-child(${j}) .dbh-product-title`,
                    result => {
                        let myBagProductName = result.value
                            .trim()
                            .replace(/\n/g, ' ')
                        if (pspFinalProductName.includes(myBagProductName)) {
                            temp = 'product found'
                            productLocation = j
                        }
                    }
                )
            }
            let splitPspPrice
            let splitBagPrice
            await client.assert.equal(temp, 'product found')
            await client.getText(
                `.pw-list > .c-product-item:nth-child(${productLocation}) .dbh-product-price`,
                result => {
                    splitBagPrice = result.value.trim().split('£')
                    splitPspPrice = pspFinalPrice.split('£')
                    client.assert.equal(splitBagPrice[1], splitPspPrice[1])
                }
            )
        }
    })

    Then(/^I should validate product name on "(.*?)"$/, async page => {
        let tempConcatText
        let j
        let i = 0
        let productFoundStatus = 'product not found'
        if (page === 'pspPage') {
            await waitElementVisible('firstProductBrand', page)
            await client.getText(
                cssSelectorsList.pageObjects[page].selectors.firstProductBrand,
                result => {
                    pspBrandName = result.value.trim()
                }
            )
            await client.getText(
                cssSelectorsList.pageObjects[page].selectors.firstProductName,
                result => {
                    pspProductName = result.value.trim()
                }
            )

            tempConcatText = ' - '
            pspFinalProductName = pspBrandName.concat(
                tempConcatText,
                pspProductName
            )
        } else if (page === 'pdpPage') {
            await waitElementVisible('productName', page)
            await client.getText(
                cssSelectorsList.pageObjects[page].selectors.productName,
                result => {
                    client.assert.equal(
                        result.value.toLowerCase(),
                        pspFinalProductName.toLowerCase()
                    )
                }
            )
        } else if (page === 'quickShop') {
            await waitElementVisible('productName', 'pdpPage')
            await client.getText(
                cssSelectorsList.pageObjects.pdpPage.selectors.productName,
                result => {
                    client.assert.equal(
                        result.value.trim().toLowerCase(),
                        pspFinalProductName.toLowerCase()
                    )
                }
            )
        } else if (page === 'myBagPage') {
            await waitElementVisible('allProductNameElements', 'myBagPage')
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects.myBagPage.selectors
                    .allProductNameElements,
                result => {
                    const els = result.value
                    els.forEach(() => i++)
                }
            )
            for (j = 1; j <= i; j++) {
                await client.getText(
                    `.t-cart__product-main .c-product-item:nth-child(${j}) .dbh-product-title .pw-dangerous-html span`,
                    result => {
                        if (
                            result.value
                                .trim()
                                .toLowerCase()
                                .includes(pspProductName.toLowerCase())
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
        /^I should see "(.*?)" as Brand Name on "(.*?)"$/,
        async (locator, page) => {
            await waitElementVisible(locator, page)
            await client.getText(
                cssSelectorsList.pageObjects[page].selectors[locator],
                result => {
                    client.assert.equal(result.value.trim(), pspBrandName)
                }
            )
        }
    )

    Then(/^I validate all sizes on "(.*?)"$/, async page => {
        let i = 0
        let j = 1
        await waitElementVisible('allSizeElements', page)
        await client.elements(
            'css selector',
            cssSelectorsList.pageObjects[page].selectors.allSizeElements,
            result => {
                const els = result.value
                els.forEach(() => i++)
            }
        )
        for (j = i; j >= 1; j--) {
            await client.getAttribute(
                `.pw-swatch__items > div:nth-child(${j})`,
                'class',
                result => {
                    if (result.value.includes('-nostock')) {
                        productOutOfStockSizeLoc = j
                    } else if (result.value.includes('-lowstock')) {
                        productLowStockSizeLoc = j
                    } else {
                        productAvailableSizeLoc = j
                    }
                }
            )
        }
        if (
            (productAvailableSizeLoc > productLowStockSizeLoc &&
                productLowStockSizeLoc !== 0) ||
            productAvailableSizeLoc === 0
        ) {
            productAvailableSizeLoc = productLowStockSizeLoc
        }
        await client.getText(
            `.pw-swatch__items > div:nth-child(${productAvailableSizeLoc})`,
            result => {
                productAvailableSize = result.value.trim()
            }
        )
    })

    Then(/^I validate out of stock message on "(.*?)"$/, async page => {
        await client.click(
            `.pw-swatch__items > div:nth-child(${productOutOfStockSizeLoc})`
        )
        await client.pause(testData.implicitTimeOut)
        await client.getText(
            cssSelectorsList.pageObjects[page].selectors.productSizeMessage,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    testData.outOfStockMessage
                )
            }
        )
    })

    Then(/^I validate low stock message on "(.*?)"$/, async page => {
        console.log('productLowStockSizeLoc :', productLowStockSizeLoc)
        await client.click(
            `.pw-swatch__items > div:nth-child(${productLowStockSizeLoc})`
        )
        await client.pause(testData.implicitTimeOut)
        await client.assert.containsText(
            cssSelectorsList.pageObjects[page].selectors.productSizeMessage,
            'Hurry'
        )
    })

    Then(/^I validate size on my bag page from "(.*?)"$/, async page => {
        let i = 0
        let j = 1
        let temp = 'product not found'
        let productLocation
        let prodBagTempSize
        let prodBagSize
        let prodBagTempColour
        let prodBagColour
        await client.click(
            `.pw-swatch__items > div:nth-child(${productAvailableSizeLoc})`
        )
        await client.pause(testData.implicitTimeOut)
        await client.click(
            cssSelectorsList.pageObjects.pdpPage.selectors.addToBagButton
        )
        await waitElementVisible('viewBasketCheckoutButton', 'pdpPage')
        // await client.pause(3000)
        await client.assert.elementPresent(
            cssSelectorsList.pageObjects.pdpPage.selectors
                .viewBasketCheckoutButton
        )
        await client.click(
            cssSelectorsList.pageObjects.pdpPage.selectors
                .viewBasketCheckoutButton
        )
        await waitElementVisible('headerText', 'myBagPage')
        // await client.pause(3000)
        await client.getText(
            cssSelectorsList.pageObjects.myBagPage.selectors.headerText,
            result => {
                client.assert.equal(result.value.trim(), 'My Bag')
            }
        )
        await client.elements(
            'css selector',
            '.t-cart__product-list .dbh-product-price',
            result => {
                const els = result.value
                els.forEach(() => i++)
            }
        )
        for (j = 1; j <= i; j = j + 1) {
            await client.getText(
                `.pw-list > article:nth-child(${j}) .dbh-product-title`,
                result => {
                    if (
                        result.value
                            .trim()
                            .includes(testData.testDressProductName)
                    ) {
                        temp = 'product found'
                        productLocation = j
                    }
                }
            )
        }
        i = 0
        await client.elements(
            'css selector',
            `.pw-list > article:nth-child(${productLocation}) .dbh-product-options > div`,
            result => {
                const els = result.value
                els.forEach(() => i++)
            }
        )
        for (j = 1; j <= i; j = j + 1) {
            await client.getText(
                `.pw-list > article:nth-child(${productLocation}) .dbh-product-options > div:nth-child(${j})`,
                result => {
                    if (result.value.trim().includes('Size')) {
                        prodBagTempSize = result.value.trim().split(':')
                        prodBagSize = prodBagTempSize[1]
                        prodBagSize = prodBagSize.trim()
                        client.assert.equal(prodBagSize, productAvailableSize)
                    } else if (result.value.trim().includes('Colour')) {
                        prodBagTempColour = result.value.trim().split(':')
                        prodBagColour = prodBagTempColour[1]
                        prodBagColour = prodBagColour.trim()
                        client.assert.equal(
                            prodBagColour,
                            testData.testDressProductColour
                        )
                    }
                }
            )
        }
    })

    Then(/^I select available size on "(.*?)"$/, async page => {
        let i = 0
        let j
        if (testDataSet.includes('DESKTOP')) {
            await dropdownRangePriceAvailableOption()
            await dropdownAvailableOption()
        } else {
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects.pdpPage.selectors.allSizeElements,
                result => {
                    const els = result.value
                    els.forEach(() => i++)
                }
            )
            for (j = 1; j <= i; j++) {
                await client.getAttribute(
                    `.pw-swatch__items > div:nth-child(${j})`,
                    'class',
                    result => {
                        if (result.value.includes('-nostock')) {
                            productOutOfStockSizeLoc = j
                        } else {
                            productAvailableSizeLoc = j
                        }
                    }
                )
            }
            await client.click(
                `.pw-swatch__items > div:nth-child(${productAvailableSizeLoc})`
            )
            await client.pause(testData.implicitTimeOut)
        }
    })

    Then(/^I add the product to bag and go to my bag page$/, async () => {
        await swatchColorAvailableOption()
        await swatchSizeAvailableOptions()
        await dropdownRangePriceAvailableOption()
        await dropdownAvailableOption()
        await addToBagCheckout()
    })

    Then(
        /^I add to bag quantity "(.*?)" and go to my bag page$/,
        async quantity => {
            await swatchColorAvailableOption()
            await swatchSizeAvailableOptions()
            await dropdownRangePriceAvailableOption()
            await dropdownAvailableOption()
            await enterValue(quantity, 'stepperCount', 'pdpPage')
            await addToBagMultipleItems(quantity)
            await click('viewBasketCheckoutButton', 'pdpPage')
            await client.pause(testData.implicitTimeOut)
            await waitElementNotPresent('desktopSkelton', 'commonPage')
            const myBagHeader = await getText('headerText', 'myBagPage')
            await client.assert.equal(myBagHeader, 'My Bag')
        }
    )

    Then(
        /^I should validate the name of product no. "(.*?)" on "(.*?)"$/,
        async (position, page) => {
            let tempConcatText
            let j
            let i = 0
            let productFoundStatus = 'product not found'
            if (page === 'pspPage') {
                await waitElementVisibleBySelector(
                    '.pw-grid__inner > div:nth-child(' +
                        position +
                        ') .dbh-brand-name'
                )
                await client.getText(
                    '.pw-grid__inner > div:nth-child(' +
                        position +
                        ') .dbh-brand-name',
                    result => {
                        pspBrandName = result.value.trim()
                    }
                )
                await client.getText(
                    '.pw-grid__inner > div:nth-child(' +
                        position +
                        ') .dbh-product-name',
                    result => {
                        pspProductName = result.value.trim()
                    }
                )
                tempConcatText = ' - '
                pspFinalProductName = pspBrandName.concat(
                    tempConcatText,
                    pspProductName
                )
            } else if (page === 'pdpPage') {
                await waitElementVisible('productName', page)
                // await waitElementVisible(cssSelectorsList.pageObjects[page].selectors.productName, 10000)
                await client.getText(
                    cssSelectorsList.pageObjects[page].selectors.productName,
                    result => {
                        client.assert.equal(
                            result.value.trim(),
                            pspFinalProductName
                        )
                    }
                )
            } else if (page === 'myBagPage') {
                await waitElementVisible('allProductNameElements', 'myBagPage')
                // await waitElementVisible(cssSelectorsList.pageObjects.myBagPage.selectors.allProductNameElements, 10000)
                await client.elements(
                    'css selector',
                    cssSelectorsList.pageObjects.myBagPage.selectors
                        .allProductNameElements,
                    result => {
                        const els = result.value
                        els.forEach(() => i++)
                    }
                )
                for (j = 1; j <= i; j++) {
                    await client.getText(
                        `.t-cart__product-list article:nth-child(${j}) .dbh-product-title`,
                        result => {
                            if (
                                result.value
                                    .trim()
                                    .toLowerCase()
                                    .includes(pspProductName.toLowerCase())
                            ) {
                                productFoundStatus = 'product found'
                            }
                        }
                    )
                }
                await client.assert.equal(productFoundStatus, 'product found')
            }
        }
    )

    Then(
        /^I should validate final price of product no. "(.*?)" on "(.*?)"$/,
        async (position, page) => {
            let i = 0
            let j = 1
            let temp = 'poduct not found'
            let productLocation = 0
            if (page === 'pspPage') {
                await client.elements(
                    'css selector',
                    '.pw-grid__inner > div:nth-child(' +
                        position +
                        ') .dbh-price',
                    result => {
                        const els = result.value
                        els.forEach(() => i++)
                    }
                )
                if (i === 0) {
                    await client.getText(
                        '.pw-grid__inner > div:nth-child(' +
                            position +
                            ') .dbh-now',
                        result => {
                            pspFinalPrice = result.value.trim()
                        }
                    )
                } else {
                    await client.getText(
                        '.pw-grid__inner > div:nth-child(' +
                            position +
                            ') .dbh-price',
                        result => {
                            pspFinalPrice = result.value.trim()
                        }
                    )
                }
            } else if (page === 'pdpPage') {
                await waitElementVisible('productPrice', page)
                // await waitElementVisible(cssSelectorsList.pageObjects[page].selectors.productPrice, 10000)
                await client.getText(
                    cssSelectorsList.pageObjects[page].selectors.productPrice,
                    result => {
                        client.assert.equal(result.value.trim(), pspFinalPrice)
                    }
                )
            } else if (page === 'myBagPage') {
                i = 0
                await waitElementVisibleBySelector(
                    '.t-cart__product-list .dbh-product-price'
                )
                await client.elements(
                    'css selector',
                    '.t-cart__product-list .dbh-product-price',
                    result => {
                        const els = result.value
                        els.forEach(() => i++)
                    }
                )
                for (j = 1; j <= i; j = j + 1) {
                    await client.getText(
                        `.pw-list > article:nth-child(${j}) .dbh-product-title`,
                        result => {
                            if (
                                pspFinalProductName.includes(
                                    result.value.trim()
                                )
                            ) {
                                temp = 'product found'
                                productLocation = j
                            }
                        }
                    )
                }
                let splitPspPrice
                let splitBagPrice
                await client.assert.equal(temp, 'product found')
                await client.getText(
                    `.pw-list > article:nth-child(${productLocation}) .dbh-product-price`,
                    result => {
                        splitBagPrice = result.value.trim().split('£')
                        splitPspPrice = pspFinalPrice.split('£')
                        client.assert.equal(splitBagPrice[1], splitPspPrice[1])
                    }
                )
            }
        }
    )

    Then(/^I should see selected colour as "(.*?)"$/, async colour => {
        await client.expect.element(
            '.pw--selected.dbh-color-swatch .pw-image img[alt="' + colour + '"]'
        ).to.be.present
        await client.pause(testData.implicitTimeOut)
    })

    Then(
        /^I select available colour "(.*?)" as "(.*?)" from "(.*?)"$/,
        async (position, colour, option) => {
            if (option === 'colourSwatch') {
                await client.click(
                    '.pw-swatch__items > div:nth-child(' +
                        position +
                        ') > button.pw-button'
                )
                await client.pause(testData.implicitTimeOut)
            } else if (option === 'colourDropDown') {
                await client.click(
                    '.dbh-product-color-dropdown-elem option:nth-child(' +
                        position +
                        ')'
                )
                await client.pause(testData.implicitTimeOut)
            }
            await client.expect.element(
                '.pw--selected .pw-image img[alt="' + colour + '"]'
            ).to.be.present
            await client.pause(testData.implicitTimeOut)
        }
    )

    Then(/^I select Out of Stock colour from Colourswatches$/, async () => {
        await client.click(
            cssSelectorsList.pageObjects['pdpPage'].selectors[
                'outOfStockColourSwatch'
            ]
        )
        await client.pause(testData.implicitTimeOut)
        await client.expect.element('.pw--selected.pw-swatch__item--oos').to.be
            .present
        await client.pause(testData.implicitTimeOut)
    })

    Then(/^I select Low Stock colour from Colourswatches$/, async () => {
        await client.click(
            cssSelectorsList.pageObjects['pdpPage'].selectors[
                'lowStockColourSwatch'
            ]
        )
        await client.pause(testData.implicitTimeOut)
        await client.expect.element('.pw--selected.pw-swatch__item').to.be
            .present
        await client.pause(testData.implicitTimeOut)
    })

    Then(/^I should see all size swatches are out of Stock$/, async () => {
        let totalSizeSwatches = 0
        let countOOSSizeSwatches = 0
        let j = 1
        let attributeValue
        totalSizeSwatches = await countElements('pdpPage', 'sizeSwatches')
        for (j = 1; j <= totalSizeSwatches; j++) {
            attributeValue = await getAttributeValue(
                cssSelectorsList.pageObjects.pdpPage.selectors.sizeSwatches.concat(
                    `:nth-child(${j}`
                ),
                'class'
            )
            if (attributeValue.includes('-nostock')) {
                countOOSSizeSwatches++
            }
        }
        await client.assert.equal(totalSizeSwatches, countOOSSizeSwatches)
    })

    Then(
        /^I validate add to bag message as per quantity "(.*?)" selector on "(.*?)"$/,
        async (quantity, page) => {
            let expectedText
            if (quantity === '1') {
                expectedText = quantity + ' item added to bag'
            } else {
                expectedText = quantity + ' items added to bag'
            }
            //await client.pause(testData.implicitTimeOut)
            await waitElementVisible('addToBagTooltip', 'pdpPage')
            //await client.assert.elementPresent(cssSelectorsList.pageObjects[page].selectors['addToBagTooltip'])
            await client.getText(
                cssSelectorsList.pageObjects[page].selectors['addToBagTooltip'],
                result => {
                    client.assert.equal(
                        result.value.trim().toUpperCase(),
                        expectedText.toUpperCase()
                    )
                }
            )
        }
    )

    Then(
        /^I should see age notifcation anchor link for alocoholic product$/,
        async () => {
            await client.assert.elementPresent(
                cssSelectorsList.pageObjects['pdpPage'].selectors[
                    'promoPDPLink'
                ]
            )
        }
    )

    Then(
        /^I validate "(.*?)" espot "(.*?)" on "(.*?)"$/,
        async (text, option, page) => {
            if (option === 'alcohol' || option === 'electrical') {
                await client.assert.elementPresent(
                    cssSelectorsList.pageObjects[page].selectors['eSpotPDP']
                )
                await client.getText(
                    cssSelectorsList.pageObjects[page].selectors[
                        'eSpotTitlePDP'
                    ],
                    result => {
                        client.assert.equal(
                            result.value.trim().toUpperCase(),
                            text.toUpperCase()
                        )
                    }
                )
            } else if (option === 'nonreturnable') {
                await client.assert.elementPresent(
                    cssSelectorsList.pageObjects[page].selectors[
                        'nonReturnableeSpot'
                    ]
                )
                await client.getText(
                    cssSelectorsList.pageObjects[page].selectors[
                        'nonReturnableeSpotTitle'
                    ],
                    result => {
                        client.assert.equal(
                            result.value.trim().toUpperCase(),
                            text.toUpperCase()
                        )
                    }
                )
            }
        }
    )

    Then(
        /^I should select available size for first product in alsoInRange column$/,
        async () => {
            let i = 0
            let j
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects.pdpPage.selectors
                    .selectTheSizedropDown,
                result => {
                    const els = result.value
                    els.forEach(() => i++)
                }
            )
            for (j = 2; j <= i; j++) {
                await client.getAttribute(
                    `.t-related-products__item div .u-margin-bottom-md .t-related-products__select select option:nth-child(${j})`,
                    'data-type',
                    result => {
                        if (result.value.includes('oos')) {
                            productOutOfStockSizeLoc = j
                        } else if (result.value.includes('instock')) {
                            productAvailableSizeLoc = j
                        } else if (result.value.includes('low')) {
                            productAvailableSizeLoc = j
                        }
                    }
                )
            }
            await client.click(
                `.t-related-products__item div .u-margin-bottom-md .t-related-products__select select option:nth-child(${productAvailableSizeLoc})`
            )
            await client.pause(testData.implicitTimeOut)
        }
    )

    Then(
        /^I verify page reload on selecting a different colour swatch$/,
        async () => {
            let currentUrl
            let newUrl
            let productAlreadySelected
            let i = 0
            let j
            let selected = 'false'
            let enable = 'false'
            await client.url(result => {
                currentUrl = result.value
            })
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects.pdpPage.selectors
                    .selectColourSwatch,
                result => {
                    const els = result.value
                    els.forEach(() => i++)
                }
            )
            for (j = 1; j <= i; j++) {
                selected = 'false'
                enable = 'false'
                await client.getAttribute(
                    `.dbh-product-color-selector .pw-swatch__items div:nth-child(${j}) .pw-swatch__item`,
                    'class',
                    result => {
                        if (result.value.includes('selected')) {
                            selected = 'true'
                        }
                    }
                )
                await client.getAttribute(
                    `.dbh-product-color-selector .pw-swatch__items div:nth-child(${j}) a .pw-swatch__item`,
                    'class',
                    result => {
                        if (result.value.includes('oos')) {
                            productOutOfStockSizeLoc = j
                        } else if (!result.value.includes('oos')) {
                            enable = 'true'
                        }
                    }
                )
                if (enable === 'true' && selected === 'false') {
                    productAvailableSizeLoc = j
                }
            }

            await client.click(
                `.dbh-product-color-selector .pw-swatch__items div:nth-child(${productAvailableSizeLoc}) a button.pw-button`
            )
            await client.pause(testData.implicitTimeOut)
            await client.pause(testData.implicitTimeOut)
            await waitElementNotPresent('loader', 'commonPage')
            await client.url(result => {
                newUrl = result.value
            })
            await client.assert.notEqual(currentUrl, newUrl, 'Url are same')
        }
    )

    Then(/^I select the available size swatch$/, async () => {
        let i = 0
        let j
        await client.elements(
            'css selector',
            cssSelectorsList.pageObjects.pdpPage.selectors.selectSizeswatch,
            result => {
                const els = result.value
                els.forEach(() => i++)
            }
        )
        for (j = 1; j <= i; j++) {
            await client.getAttribute(
                `.pw-swatch__items div:nth-child(${j})`,
                'class',
                result => {
                    if (
                        result.value.includes('-oos') ||
                        result.value.includes('-nostock')
                    ) {
                        productOutOfStockSizeLoc = j
                    } else {
                        productAvailableSizeLoc = j
                    }
                }
            )
        }
        await client.click(
            `.pw-swatch__items div:nth-child(${productAvailableSizeLoc}) button.pw-button`
        )
        await client.pause(testData.implicitTimeOut)
    })

    Then(
        /^I validate all the details for grid bundle product "(.*?)" and add to bag$/,
        async product => {
            await client.assert.elementPresent(
                '.u-padding-lg div:nth-child(' +
                    product +
                    ') .c-bundle-product div:nth-child(1) .u-flex-none .pw-image img'
            )
            await client.assert.elementPresent(
                '.u-padding-lg div:nth-child(' +
                    product +
                    ') .c-bundle-product div:nth-child(1) .u-flex a'
            )
            await client.assert.elementPresent(
                '.u-padding-lg div:nth-child(' +
                    product +
                    ') .c-bundle-product div:nth-child(1) .u-flex .dbh-price'
            )
            await client.assert.elementPresent(
                '.u-padding-lg div:nth-child(' +
                    product +
                    ') .c-bundle-product div:nth-child(2) .pw-stepper div div .pw-stepper__inner div:nth-child(2)'
            )
            await client.assert.elementPresent(
                '.u-padding-lg div:nth-child(' +
                    product +
                    ') .c-bundle-product div:nth-child(2) .dbh-add-to-bag'
            )
            await client.click(
                '.u-padding-lg div:nth-child(' +
                    product +
                    ') .c-bundle-product div:nth-child(2) .dbh-add-to-bag'
            )
            await client.pause(testData.implicitTimeOut)
        }
    )

    Then(
        /^I validate all the details for list bundle product "(.*?)" and choose size as "(.*?)" for add to bag$/,
        async (product, size) => {
            if (testDataSet === 'TABLET') {
                await client.assert.elementPresent(
                    '.u-padding-lg div:nth-child(2) div:nth-child(' +
                        product +
                        ') .c-bundle-product div:nth-child(1) .u-flex-none .pw-image img'
                )
                await client.assert.elementPresent(
                    '.u-padding-lg div:nth-child(2) div:nth-child(' +
                        product +
                        ') .c-bundle-product div:nth-child(1) .u-flex a'
                )
                await client.assert.elementPresent(
                    '.u-padding-lg div:nth-child(2) div:nth-child(' +
                        product +
                        ') .c-bundle-product div:nth-child(1) .u-flex .dbh-price'
                )
                await client.assert.elementPresent(
                    '.u-padding-lg div:nth-child(2) div:nth-child(' +
                        product +
                        ') .c-bundle-product div:nth-child(2) .pw--stack .pw-field__input'
                )
                await client.click(
                    '.u-padding-lg div:nth-child(2) div:nth-child(' +
                        product +
                        ') .c-bundle-product div:nth-child(2) .pw--stack .pw-field__input select option:nth-child(' +
                        size +
                        ')'
                )
                await client.assert.elementPresent(
                    '.u-padding-lg div:nth-child(2) div:nth-child(' +
                        product +
                        ') .c-bundle-product div:nth-child(4) .pw-stepper div div .pw-stepper__inner div:nth-child(2)'
                )
                await client.assert.elementPresent(
                    '.u-padding-lg div:nth-child(2) div:nth-child(' +
                        product +
                        ') .c-bundle-product div:nth-child(4) .dbh-add-to-bag'
                )
                await client.click(
                    '.u-padding-lg div:nth-child(2) div:nth-child(' +
                        product +
                        ') .c-bundle-product div:nth-child(4) .dbh-add-to-bag'
                )
                await client.pause(testData.implicitTimeOut)
            } else {
                await client.assert.elementPresent(
                    '.t-product-details__content .u-padding-lg .u-padding-lg div:nth-child(' +
                        product +
                        ') .c-bundle-product div:nth-child(1) .u-flex-none .pw-image img'
                )
                await client.assert.elementPresent(
                    '.t-product-details__content .u-padding-lg .u-padding-lg div:nth-child(' +
                        product +
                        ') .c-bundle-product div:nth-child(1) .u-flex a'
                )
                await client.assert.elementPresent(
                    '.t-product-details__content .u-padding-lg .u-padding-lg div:nth-child(' +
                        product +
                        ') .c-bundle-product div:nth-child(1) .u-flex .dbh-price'
                )
                await client.assert.elementPresent(
                    '.t-product-details__content .u-padding-lg .u-padding-lg div:nth-child(' +
                        product +
                        ') .c-bundle-product div:nth-child(2) .pw--stack .pw-field__input'
                )
                await client.click(
                    '.t-product-details__content .u-padding-lg .u-padding-lg div:nth-child(' +
                        product +
                        ') .c-bundle-product div:nth-child(2) .pw--stack .pw-field__input select option:nth-child(' +
                        size +
                        ')'
                )
                await client.assert.elementPresent(
                    '.t-product-details__content .u-padding-lg .u-padding-lg div:nth-child(' +
                        product +
                        ') .c-bundle-product div:nth-child(4) .pw-stepper div div .pw-stepper__inner div:nth-child(2)'
                )
                await client.assert.elementPresent(
                    '.t-product-details__content .u-padding-lg .u-padding-lg div:nth-child(' +
                        product +
                        ') .c-bundle-product div:nth-child(4) .dbh-add-to-bag'
                )
                await client.click(
                    '.t-product-details__content .u-padding-lg .u-padding-lg div:nth-child(' +
                        product +
                        ') .c-bundle-product div:nth-child(4) .dbh-add-to-bag'
                )
                await client.pause(testData.implicitTimeOut)
            }
        }
    )

    Then(
        /^I change "(.*?)" the product changes on "(.*?)"$/,
        async (choice, page) => {
            let i
            let j
            let selectedProductPosition
            let notSelectedProductPosition
            let selectingColorName
            let currentUrl
            let attiruteValue
            await client.url(result => {
                currentUrl = result.value
            })
            if (choice === 'SelectedFabric') {
                notSelectedProductPosition = 0
                i = 0
                await client.elements(
                    'css selector',
                    cssSelectorsList.pageObjects[page].selectors
                        .fabricColorListFurniture,
                    result => {
                        const els = result.value
                        els.forEach(() => i++)
                    }
                )
                for (j = 1; j <= i; j++) {
                    await client.getAttribute(
                        `${cssSelectorsList.pageObjects[page].selectors.fabricColorListFurniture}:nth-child(${j}) .t-product-details__furniture-chip`,
                        'class',
                        result => {
                            attiruteValue = result.value
                        }
                    )
                    if (attiruteValue.includes('-selected')) {
                        selectedProductPosition = j
                    } else {
                        notSelectedProductPosition = j
                        break
                    }
                }
                await client.getText(
                    `${cssSelectorsList.pageObjects[page].selectors.fabricColorListFurniture}:nth-child(${notSelectedProductPosition}) .t-product-details__furniture-chip`,
                    result => {
                        selectingColorName = result.value.trim()
                    }
                )
                await client.click(
                    `${cssSelectorsList.pageObjects[page].selectors.fabricColorListFurniture}:nth-child(${notSelectedProductPosition}) .t-product-details__furniture-chip`
                )
                await client.url(result => {
                    client.assert.notEqual(
                        result.value,
                        currentUrl,
                        'Url are same'
                    )
                })
            } else if (choice === 'SelectedFeet') {
                i = 0
                notSelectedProductPosition = 0
                await client.elements(
                    'css selector',
                    cssSelectorsList.pageObjects[page].selectors
                        .feetColorListFurniture,
                    result => {
                        const els = result.value
                        els.forEach(() => i++)
                    }
                )
                for (j = 1; j <= i; j++) {
                    await client.getAttribute(
                        `${cssSelectorsList.pageObjects[page].selectors.feetColorListFurniture}:nth-child(${j}) .t-product-details__furniture-chip`,
                        'class',
                        result => {
                            attiruteValue = result.value
                        }
                    )
                    if (attiruteValue.includes('-selected')) {
                        selectedProductPosition = j
                    } else {
                        notSelectedProductPosition = j
                        break
                    }
                }
                await client.getText(
                    `${cssSelectorsList.pageObjects[page].selectors.feetColorListFurniture}:nth-child(${notSelectedProductPosition}) .t-product-details__furniture-chip`,
                    result => {
                        selectingColorName = result.value.trim()
                    }
                )
                await client.click(
                    `${cssSelectorsList.pageObjects[page].selectors.feetColorListFurniture}:nth-child(${notSelectedProductPosition}) .t-product-details__furniture-chip`
                )
            }
        }
    )
    // --------------------------------------------------------------------------
    Then(
        /^I should validate product brand matching in "(.*?)" on "(.*?)"$/,
        async (locator, page) => {
            return await carouselProductValidation(locator, page)
        }
    )

    Then(
        /^I should match product name of first product "(.*?)" in carousel on "(.*?)"$/,
        async (locator, page) => {
            let pdpRelatedProductName
            let expectedValue = 'false'
            await waitElementVisible(locator, page)
            // await waitElementVisible(cssSelectorsList.pageObjects[page].selectors[locator])
            await client.getText(
                cssSelectorsList.pageObjects[page].selectors[locator],
                result => {
                    pdpRelatedProductName = result.value.trim()
                }
            )
            await client.click(
                cssSelectorsList.pageObjects[page].selectors[locator]
            )
            await client.pause(testData.implicitTimeOut)
            await waitElementVisible('productName', page)
            await client.getText(
                cssSelectorsList.pageObjects[page].selectors.productName,
                result => {
                    if (pdpRelatedProductName.includes(result.value.trim())) {
                        expectedValue = 'true'
                    }
                }
            )
            await client.assert.equal(expectedValue, 'true')
        }
    )

    Then(/^I select available size and add to bag on pdpPage$/, async () => {
        await swatchColorAvailableOption()
        await swatchSizeAvailableOptions()
        await dropdownRangePriceAvailableOption()
        await dropdownAvailableOption()
        await addToBag()
    })

    Then(
        /^I select available size enter quantity as "(.*?)" and add to bag on pdpPage$/,
        async quantity => {
            await swatchColorAvailableOption()
            await swatchSizeAvailableOptions()
            await dropdownRangePriceAvailableOption()
            await dropdownAvailableOption()
            await enterValue(quantity, 'stepperCount', 'pdpPage')
            await addToBagMultipleItems(quantity)
        }
    )

    Then(/^I select "(.*?)" size from "(.*?)"$/, async (stockValue, option) => {
        let i = 0
        let j
        let attributeValue
        let count
        if (option === 'swatch') {
            i = 0
            i = await countElements('pdpPage', 'showmoreColorsButton')
            if (i > 0) {
                const text = await getText('showmoreColorsButton', 'pdpPage')
                if (text.includes('more colours')) {
                    await click('showmoreColorsButton', 'pdpPage')
                }
            }

            count = await countElements('pdpPage', 'colorSwatchHeader')

            i = 0
            i = await countElements('pdpPage', 'allSizeElements')
            for (j = 1; j <= i; j++) {
                if (count > 0) {
                    attributeValue = await getAttributeValue(
                        cssSelectorsList.pageObjects.pdpPage.selectors.allSizeElements.concat(
                            `:nth-child(${j}) .pw-swatch__item`
                        ),
                        'class'
                    )
                } else {
                    attributeValue = await getAttributeValue(
                        cssSelectorsList.pageObjects.pdpPage.selectors.allSizeElements.concat(
                            `:nth-child(${j})`
                        ),
                        'class'
                    )
                }
                if (
                    attributeValue.includes('-oos') ||
                    attributeValue.includes('-nostock')
                ) {
                    productOutOfStockSizeLoc = j
                } else if (
                    attributeValue.includes('-los') ||
                    attributeValue.includes('-lowstock')
                ) {
                    productLowStockSizeLoc = j
                } else {
                    productAvailableSizeLoc = j
                }
            }
            if (stockValue === 'Available') {
                await client.click(
                    cssSelectorsList.pageObjects.pdpPage.selectors.allSizeElements.concat(
                        `:nth-child(${productAvailableSizeLoc})`
                    )
                )
            } else if (stockValue === 'Out of Stock') {
                await client.click(
                    cssSelectorsList.pageObjects.pdpPage.selectors.allSizeElements.concat(
                        `:nth-child(${productOutOfStockSizeLoc})`
                    )
                )
            } else if (stockValue === 'low stock') {
                await client.click(
                    cssSelectorsList.pageObjects.pdpPage.selectors.allSizeElements.concat(
                        `:nth-child(${productLowStockSizeLoc})`
                    )
                )
            }
            await client.pause(testData.implicitTimeOut)
        } else if (option === 'dropdown') {
            await click('sizeAsDropdown', 'pdpPage')
            i = 0
            await waitElementVisible('sizeDropdownOptionElements', 'pdpPage')
            i = await countElements('pdpPage', 'sizeDropdownOptionElements')

            for (j = i; j > 1; j--) {
                const text = await getTextBySelector(
                    cssSelectorsList.pageObjects.pdpPage.selectors.sizeDropdownOptionElements.concat(
                        `:nth-child(${j}`
                    )
                )
                if (text.includes('Low in Stock')) {
                    productLowStockSizeLoc = j
                } else if (text.includes('Out of Stock')) {
                    productOutOfStockSizeLoc = j
                } else {
                    productAvailableSizeLoc = j
                }
            }
            if (stockValue === 'Available') {
                await client.click(
                    cssSelectorsList.pageObjects.pdpPage.selectors.sizeDropdownOptionElements.concat(
                        `:nth-child(${productAvailableSizeLoc})`
                    )
                )
            } else if (stockValue === 'Out of Stock') {
                await client.click(
                    cssSelectorsList.pageObjects.pdpPage.selectors.sizeDropdownOptionElements.concat(
                        `:nth-child(${productOutOfStockSizeLoc})`
                    )
                )
            } else if (stockValue === 'low stock') {
                await client.click(
                    cssSelectorsList.pageObjects.pdpPage.selectors.sizeDropdownOptionElements.concat(
                        `:nth-child(${productLowStockSizeLoc})`
                    )
                )
            }
            await client.pause(testData.implicitTimeOut)
        } else if (option === 'quickShopDropdown') {
            await click('quickShopColourDropDown', 'pspPage')
            i = 0
            await waitElementVisible('quickShopColourDropDownElems', 'pspPage')
            i = await countElements('pspPage', 'quickShopColourDropDownElems')
            for (j = i; j > 1; j--) {
                const text = await getTextBySelector(
                    cssSelectorsList.pageObjects.pspPage.selectors.quickShopColourDropDownElems.concat(
                        `:nth-child(${j}`
                    )
                )
                if (text.includes('Low in Stock')) {
                    productLowStockSizeLoc = j
                } else if (text.includes('Out of Stock')) {
                    productOutOfStockSizeLoc = j
                } else {
                    productAvailableSizeLoc = j
                }
            }
            if (stockValue === 'Available') {
                await client.click(
                    cssSelectorsList.pageObjects.pspPage.selectors.quickShopColourDropDownElems.concat(
                        `:nth-child(${productAvailableSizeLoc})`
                    )
                )
            } else if (stockValue === 'Out of Stock') {
                await client.click(
                    cssSelectorsList.pageObjects.pspPage.selectors.quickShopColourDropDownElems.concat(
                        `:nth-child(${productOutOfStockSizeLoc})`
                    )
                )
            } else if (stockValue === 'low stock') {
                await client.click(
                    cssSelectorsList.pageObjects.pspPage.selectors.quickShopColourDropDownElems.concat(
                        `:nth-child(${productLowStockSizeLoc})`
                    )
                )
            }
            await client.pause(testData.implicitTimeOut)
        }
    })

    Then(
        /^I validate "(.*?)" message from  "(.*?)" on  "(.*?)"$/,
        async (stockmessage, optionmethod, page) => {
            await waitElementVisible('productSizeMessage', 'pdpPage')
            if (optionmethod === 'swatch') {
                if (stockmessage === 'Out of Stock') {
                    const actualText = await getText('productSizeMessage', page)
                    await client.assert.equal(
                        actualText,
                        testData.outOfStockMessage
                    )
                } else if (stockmessage === 'low stock') {
                    await client.assert.containsText(
                        cssSelectorsList.pageObjects[page].selectors
                            .productSizeMessage,
                        'Hurry'
                    )
                }
            } else if (optionmethod === 'dropdown') {
                if (stockmessage === 'Out of Stock') {
                    await client.getText(
                        cssSelectorsList.pageObjects[page].selectors
                            .productSizeMessage,
                        result => {
                            client.assert.equal(
                                result.value.trim(),
                                testData.outOfStockMessage
                            )
                        }
                    )
                } else if (stockmessage === 'low stock') {
                    await client.assert.containsText(
                        cssSelectorsList.pageObjects[page].selectors
                            .productSizeMessage,
                        'Hurry'
                    )
                }
            }
        }
    )

    Then(
        /^I should see "(.*?)" products in "(.*?)" on "(.*?)"$/,
        async (count, locator, page) => {
            let i = 0
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects[page].selectors[locator],
                result => {
                    const els = result.value
                    els.forEach(() => i++)
                }
            )
            await client.assert.equal(i, count)
        }
    )

    // This method counts the elements by locator and validate if its greater than the countValue
    When(
        /^I count number of "(.*?)" greater than "(.*?)" on "(.*?)"$/,
        async (locator, countValue, page) => {
            let i = 0
            await waitElementVisible(locator, page)
            i = await countElements(page, locator)
            await client.assert.ok(i > countValue)
        }
    )

    Then(/^I store the furniture colour on pdpPage$/, async () => {
        await client.getText(
            cssSelectorsList.pageObjects.pdpPage.selectors.selectedFabricColor,
            result => {
                fabricColor = result.value.trim()
            }
        )
        await client.pause(testData.implicitTimeOut)
        await client.getText(
            cssSelectorsList.pageObjects.pdpPage.selectors.selectedFeetColor,
            result => {
                feetColor = result.value.trim()
            }
        )
    })

    Then(/^I validate the furniture colour on myBagPage$/, async () => {
        let tempColor
        let outcome
        await client.getText(
            cssSelectorsList.pageObjects.myBagPage.selectors
                .selectedFabricColor,
            result => {
                tempColor = result.value.trim().replace('Colour:', '')
            }
        )
        outcome = fabricColor.includes(tempColor)
        await client.assert.equal(outcome, true)
        //await client.assert.containsText(fabricColor, tempColor)
        //     await client.getText(
        //         cssSelectorsList.pageObjects.myBagPage.selectors.selectedFeetColor,
        //         result => {
        //             console.log(result.value.trim())
        //             tempColor = result.value.trim().replace('Feet:', '')
        //             tempColor = tempColor.replace(/^\s+/g, '')
        //         }
        //     )
        //     outcome = feetColor.includes(tempColor)
        //     await client.assert.equal(outcome, true)
    })

    Then(/^I change the stepper count to "(.*?)"$/, async quantity => {
        await enterValue(quantity, 'stepperCount', 'pdpPage')
    })
})
