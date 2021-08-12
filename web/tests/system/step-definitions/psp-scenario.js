import {client} from 'nightwatch-cucumber'
import {defineSupportCode} from 'cucumber'
import PageObjects from '../page-objects/page-objects'
import testData from '../test-data'
import {
    waitElementNotPresent,
    waitElementPresentBySelector,
    waitElementPresent,
    waitElementVisible
} from '../methods/explicitWait'
import {itemValidationInList} from '../methods/itemValidationInList'
import {collapseOpenAccordionSelector} from '../methods/collapseOpenAccordion'
import {subFilterValidationBigScreen} from '../methods/subFilterValidation'
import {getText} from '../methods/getText'
import {scrollToPosition, scrollToWithinSelector} from '../methods/scrollTo'
import {moveToElementBySelector} from '../methods/moveToElement'
import {expectElementEquals} from '../methods/cssPropertyValidate'
import {click} from '../methods/click'
import {countElements, countElementsBySelector} from '../methods/elements'
import {dropdownAvailableOption} from '../methods/pdpSizeColorSelector'
import {quickViewValidation} from '../methods/quickView'
import {clickCollectDeliveryCheckout} from '../methods/clickCollectCheckout'

const testDataSet = process.env.TEST_DATA_SET || 'UK'

const cssSelectorsList = new PageObjects()
let count
let position
let isPresent

defineSupportCode(({When, Then}) => {
    Then(
        /^I should count and validate "(.*?)" on "(.*?)"$/,
        async (locator, page) => {
            let i = 0
            let text = 'Total items not matched the expected count'
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects[page].selectors[locator],
                result => {
                    const els = result.value
                    els.forEach(() => i++)
                }
            )
            if (
                locator === 'imagesOnScreen' ||
                locator === 'totalBrandCount' ||
                locator === 'totalProductCount' ||
                locator === 'totalSaveIconCount'
            ) {
                if (testDataSet.includes('DESKTOP')) {
                    const pagePerViewText = await getText(
                        'productViewPerPageLink',
                        page
                    )
                    if (
                        pagePerViewText.includes(
                            testData.pspPagePerItemCount
                        ) ||
                        (pagePerViewText ===
                            testData.pspPageAllProductsTestText &&
                            i === testData.womenDressesPspPage1Count) ||
                        i === testData.pspPagePerItemCount
                    ) {
                        text = 'Total items matched the expected count'
                    }
                } else {
                    if (
                        i === testData.womenDressesPspPage1Count ||
                        i === testData.pspPagePerItemCount
                    ) {
                        text = 'Total items matched the expected count'
                    }
                }
            } else if (locator === 'pageNumberText') {
                if (i === testData.womenDressesPspPageCount) {
                    text = 'Total items matched the expected count'
                }
            } else if (locator === 'totalMoreColourOptionsCount') {
                if (i > 0) {
                    text = 'Total items matched the expected count'
                }
            }
            await console.log(locator, ' count is ', i)
            await client.assert.equal(
                text,
                'Total items matched the expected count'
            )
        }
    )

    Then(
        /^I should validate "(.*?)" exist on "(.*?)"$/,
        async (locator, page) => {
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects[page].selectors[locator],
                result => {
                    const els = result.value
                    let i = 0
                    let text = 'Items not appear on screen'
                    els.forEach(() => i++)
                    if (i > 0) {
                        text = 'Items to appear on screen'
                    }
                    client.assert.equal(text, 'Items to appear on screen')
                }
            )
        }
    )

    Then(
        /^I should validate width size of "(.*?)" in "(.*?)" on "(.*?)"$/,
        async (locator, pageView, page) => {
            let text = 'Image width not coming as expected count'
            let imageWidth
            await client.getCssProperty(
                cssSelectorsList.pageObjects[page].selectors[locator],
                'width',
                result => {
                    imageWidth = result.value.split('px')
                    if (pageView === 'gridView') {
                        if (
                            imageWidth < testData.womenDressesPspGridViewWidth
                        ) {
                            text = 'Image width coming as expected count'
                        }
                    } else if (pageView === 'columnView') {
                        if (
                            imageWidth > testData.womenDressesPspColumnViewWidth
                        ) {
                            text = 'Image width coming as expected count'
                        }
                    }
                    client.assert.equal(
                        text,
                        'Image width coming as expected count'
                    )
                }
            )
        }
    )

    Then(
        /^I should validate number of "(.*?)" as per "(.*?)" on "(.*?)"$/,
        async (verify, locator, page) => {
            if (verify === 'pages') {
                let pageNumber = 0
                let pageSplit = 0
                let productSplit1 = 0
                let productCount = 0
                let pageCountFromProduct = 0
                await client.getText(
                    cssSelectorsList.pageObjects[page].selectors.pageNumberText,
                    result => {
                        pageSplit = result.value.trim().split(' of ')
                        pageNumber = pageSplit[1]
                    }
                )
                await client.getText(
                    cssSelectorsList.pageObjects[page].selectors
                        .totalCountOfProducts,
                    result => {
                        productSplit1 = result.value.trim().split(' ')
                        productCount = productSplit1[0].split('(')
                        pageCountFromProduct = Math.ceil(
                            productCount[1] / testData.womenDressesPspPage1Count
                        )
                    }
                )
                await client.assert.equal(pageCountFromProduct, pageNumber)
            }
        }
    )

    Then(
        /^I should see page number "(.*?)" of total on "(.*?)"$/,
        async (expectedPage, page) => {
            let pageNumber = 0
            let pageSplit = 0
            await waitElementNotPresent('loader', 'commonPage')
            if (
                testDataSet.includes('TABLET') ||
                testDataSet.includes('DESKTOP')
            ) {
                let i = 0
                let j = 1
                await client.elements(
                    'css selector',
                    cssSelectorsList.pageObjects[page].selectors.pageNumberText,
                    result => {
                        const els = result.value
                        els.forEach(() => i++)
                    }
                )
                while (pageNumber === 0 && j <= i) {
                    await client.getAttribute(
                        `.pw-pagination__pages > button:nth-child(${j})`,
                        'class',
                        result => {
                            if (result.value.includes('-active')) {
                                pageNumber = j
                            }
                        }
                    )
                    j = j + 1
                }
            } else {
                await client.getText(
                    cssSelectorsList.pageObjects[page].selectors.pageNumberText,
                    result => {
                        pageSplit = result.value.trim().split(' ')
                        pageNumber = pageSplit[1]
                    }
                )
            }
            await client.assert.equal(pageNumber, expectedPage)
        }
    )

    Then(
        /^I should see value of parentfilter position "(.*?)" as "(.*?)"$/,
        async (position, text) => {
            await client.getText(
                '.c-product-filters > [role=tablist] > div:nth-child(' +
                    position +
                    ') .pw-accordion__title',
                result => {
                    client.assert.equal(result.value.trim(), text)
                    client.getLocationInView(
                        '.c-product-filters > [role=tablist] > div:nth-child(' +
                            position +
                            ') .pw-accordion__title',
                        function(result) {
                            client.expect.element(
                                '.c-product-filters > [role=tablist] > div:nth-child(' +
                                    position +
                                    ') .pw-accordion__title'
                            ).to.be.present
                        }
                    )
                }
            )
        }
    )

    Then(
        /^I should see value of filter position "(.*?)" as "(.*?)" under parentfilter "(.*?)" "(.*?)"$/,
        async (position, text, parentPosition, parentFilter) => {
            let selector
            if (parentFilter === 'Categories' || parentFilter === 'Price') {
                await client.assert.containsText(
                    '.c-product-filters > [role=tablist] > div:nth-child(' +
                        parentPosition +
                        ') p:nth-child(' +
                        position +
                        ')',
                    text
                )
            } else if (
                text === 'View' &&
                (position === '11' ||
                    position === '20' ||
                    position === '16' ||
                    position === '21')
            ) {
                await client.assert.containsText(
                    '.c-product-filters > [role=tablist] > div:nth-child(' +
                        parentPosition +
                        ') .t-product-list__filter-modal-items > div .pw-link.u-display-block.u-padding-bottom-md.u-text-size-base',
                    text
                )
            } else {
                if (
                    await countElementsBySelector(
                        '.c-product-filters > [role=tablist] > div:nth-child(' +
                            parentPosition +
                            ') .t-product-list__filter-modal-items > div > div:nth-child(' +
                            position +
                            ') label'
                    )
                ) {
                    await client.assert.containsText(
                        '.c-product-filters > [role=tablist] > div:nth-child(' +
                            parentPosition +
                            ') .t-product-list__filter-modal-items > div > div:nth-child(' +
                            position +
                            ') label',
                        text
                    )
                } else if (
                    await countElementsBySelector(
                        '.c-product-filters > [role=tablist] > div:nth-child(' +
                            parentPosition +
                            ') .t-product-list__filter-modal-items > div > p:nth-child(' +
                            position +
                            ') a'
                    )
                ) {
                    await client.assert.containsText(
                        '.c-product-filters > [role=tablist] > div:nth-child(' +
                            parentPosition +
                            ') .t-product-list__filter-modal-items > div > p:nth-child(' +
                            position +
                            ') a',
                        text
                    )
                }
            }
        }
    )

    Then(
        /^I click on position "(.*?)" "(.*?)" under parentfilter "(.*?)" "(.*?)"$/,
        async (position, text, parentPosition, parentFilter) => {
            if (
                parentFilter === 'Categories' ||
                parentFilter === 'Price' ||
                parentFilter === 'Discount'
            ) {
                await client.assert.containsText(
                    '.c-product-filters > [role=tablist] > div:nth-child(' +
                        parentPosition +
                        ') p:nth-child(' +
                        position +
                        ')',
                    text
                )
                await client.click(
                    '.c-product-filters > [role=tablist] > div:nth-child(' +
                        parentPosition +
                        ') div:nth-child(' +
                        position +
                        ') input'
                )
            } else if (
                text === 'View' &&
                (position === '11' ||
                    position === '20' ||
                    position === '16' ||
                    position === '21')
            ) {
                await client.assert.containsText(
                    '.c-product-filters > [role=tablist] > div:nth-child(' +
                        parentPosition +
                        ') .t-product-list__filter-modal-items > div .pw-link.u-display-block.u-padding-bottom-md.u-text-size-base',
                    text
                )
                await client.click(
                    '.c-product-filters > [role=tablist] > div:nth-child(' +
                        parentPosition +
                        ') .t-product-list__filter-modal-items > div .pw-link'
                )
            } else {
                if (
                    await countElementsBySelector(
                        '.c-product-filters > [role=tablist] > div:nth-child(' +
                            parentPosition +
                            ') .t-product-list__filter-modal-items > div > div:nth-child(' +
                            position +
                            ') label'
                    )
                ) {
                    await client.assert.containsText(
                        '.c-product-filters > [role=tablist] > div:nth-child(' +
                            parentPosition +
                            ') .t-product-list__filter-modal-items > div > div:nth-child(' +
                            position +
                            ') label',
                        text
                    )
                    await client.click(
                        '.c-product-filters > [role=tablist] > div:nth-child(' +
                            parentPosition +
                            ') .t-product-list__filter-modal-items > div > div:nth-child(' +
                            position +
                            ') input'
                    )
                } else if (
                    await countElementsBySelector(
                        '.c-product-filters > [role=tablist] > div:nth-child(' +
                            parentPosition +
                            ') .t-product-list__filter-modal-items > div > p:nth-child(' +
                            position +
                            ') a'
                    )
                ) {
                    await client.assert.containsText(
                        '.c-product-filters > [role=tablist] > div:nth-child(' +
                            parentPosition +
                            ') .t-product-list__filter-modal-items > div > p:nth-child(' +
                            position +
                            ') a',
                        text
                    )
                    await client.click(
                        '.c-product-filters > [role=tablist] > div:nth-child(' +
                            parentPosition +
                            ') .t-product-list__filter-modal-items > div > p:nth-child(' +
                            position +
                            ') a'
                    )
                }
            }
            await client.pause(testData.implicitTimeOut)
        }
    )

    Then(
        /^I click to "(.*?)" filter "(.*?)" position "(.*?)"$/,
        async (state, text, position) => {
            await client.getLocationInView(
                '.c-product-filters > [role=tablist] > div:nth-child(' +
                    position +
                    ') [role=tabpanel]'
            )
            let currentState
            await client.assert.containsText(
                '.c-product-filters > [role=tablist] > div:nth-child(' +
                    position +
                    ') .pw-accordion__title',
                text
            )
            await client.getAttribute(
                '.c-product-filters > [role=tablist] > div:nth-child(' +
                    position +
                    ') [role=tabpanel]',
                'aria-hidden',
                result => {
                    currentState = result.value
                }
            )
            if (
                (state === 'collapse' && currentState === 'false') ||
                (state === 'expand' && currentState === 'true')
            ) {
                await client.click(
                    '.c-product-filters > [role=tablist] > div:nth-child(' +
                        position +
                        ') .pw-accordion__title'
                )
            }
            await client.pause(testData.implicitTimeOut)
            await client.getAttribute(
                '.c-product-filters > [role=tablist] > div:nth-child(' +
                    position +
                    ') [role=tabpanel]',
                'aria-hidden',
                result => {
                    currentState = result.value
                }
            )
            if (state === 'collapse') {
                await client.assert.equal(currentState, 'true')
            } else if (state === 'expand') {
                await client.assert.equal(currentState, 'false')
            }
        }
    )

    Then(
        /^I "(.*?)" "(.*?)" position "(.*?)" in filtered by$/,
        async (choice, text, position) => {
            if (choice === 'should see' && text === 'Designers') {
                await client.getText(
                    '.t-product-list__selection button:nth-child(' +
                        position +
                        ')',
                    result => {
                        client.assert.equal(result.value.trim(), text)
                    }
                )
            } else if (choice === 'remove') {
                await client.getText(
                    '.t-product-list__selection a:nth-child(' + position + ')',
                    result => {
                        client.assert.equal(result.value.trim(), text)
                    }
                )
                await client.click(
                    '.t-product-list__selection a:nth-child(' + position + ')'
                )
                await client.pause(testData.implicitTimeOut)
            } else if (choice === 'should see') {
                await client.getText(
                    '.t-product-list__selection div.t-category-list:nth-child(' +
                        position +
                        ') a',
                    result => {
                        client.assert.equal(result.value.trim(), text)
                    }
                )
            }
        }
    )

    Then(/^I should see "(.*?)" images$/, async imageSize => {
        let text = 'Image width not coming as expected count'
        let imageWidth
        let imageHeight

        await client.getCssProperty(
            cssSelectorsList.pageObjects.pspPage.selectors.firstProductImage,
            'width',
            result => {
                imageWidth = result.value.split('px')
            }
        )
        await client.getCssProperty(
            cssSelectorsList.pageObjects.pspPage.selectors.firstProductImage,
            'height',
            result => {
                imageHeight = result.value.split('px')
            }
        )
        await console.log('Image width is:', imageWidth)
        await console.log('Image height is:', imageHeight)
        let device
        if (testDataSet.includes('DESKTOP')) {
            device = 'Desktop'
        } else if (testDataSet.includes('TABLET')) {
            device = 'Tablet'
        } else {
            device = 'Mobile'
        }
        if (imageSize === 'large') {
            if (
                imageWidth >= testData[`largeimageMinWidth${device}`] &&
                imageWidth <= testData[`largeimageMaxWidth${device}`] &&
                imageHeight >= testData[`largeimageMinHeight${device}`] &&
                imageHeight <= testData[`largeimageMaxHeight${device}`]
            ) {
                text = 'Image width coming as expected count'
            }
        } else if (imageSize === 'normal') {
            if (
                imageWidth >= testData[`normalimageMinWidth${device}`] &&
                imageWidth <= testData[`normalimageMaxWidth${device}`] &&
                imageHeight >= testData[`normalimageMinHeight${device}`] &&
                imageHeight <= testData[`normalimageMaxHeight${device}`]
            ) {
                text = 'Image width coming as expected count'
            }
        }
        await client.assert.equal(text, 'Image width coming as expected count')
    })

    Then(
        /^I should see value as "(.*?)" in position "(.*?)" in filter search result under parentfilter "(.*?)"$/,
        async (text, position, parentPosition) => {
            await client.assert.containsText(
                `.c-product-filters > [role=tablist] > div:nth-child(${parentPosition}) .t-product-list__filter-modal-items > div > div label`,
                text
            )
        }
    )

    Then(
        /^I click on "(.*?)" in position "(.*?)" in filter search result under parentfilter "(.*?)"$/,
        async (text, position, parentPosition) => {
            await client.assert.containsText(
                `.c-product-filters > [role=tablist] > div:nth-child(${parentPosition}) .t-product-list__filter-modal-items > div > div label`,
                text
            )
            await client.click(
                `.c-product-filters > [role=tablist] > div:nth-child(${parentPosition}) .t-product-list__filter-modal-items > div > div label`
            )
            await client.pause(testData.implicitTimeOut)
        }
    )

    Then(
        /^I click on the image of product no. "(.*?)" on pspPage$/,
        async position => {
            await client.getLocationInView(
                `.pw-grid__inner > div:nth-child(${position}) img`
            )
            await client.click(
                `.pw-grid__inner > div:nth-child(${position}) img`
            )
        }
    )

    When(
        /^I "(.*?)" filter option "(.*?)" on commonPage bigscreen$/,
        async (option, parentOption) => {
            await waitElementPresentBySelector(
                cssSelectorsList.pageObjects.pspPage.selectors.filterOptions.concat(
                    `:nth-child(1)`
                )
            )
            await scrollToPosition('pspPage', 'filterOptions')
            isPresent = await itemValidationInList(
                parentOption,
                'filterOptions',
                'pspPage'
            )
            count = isPresent[0]
            position = isPresent[1]
            await client.assert.equal(count, '1')
            if (option === 'validate & click') {
                await collapseOpenAccordionSelector(
                    'open',
                    cssSelectorsList.pageObjects.pspPage.selectors.filterOptions.concat(
                        `:nth-child(${position}) button`
                    )
                )
            }
        }
    )

    When(
        /^I "(.*?)" subFilter option "(.*?)" under "(.*?)" on commonPage bigscreen$/,
        async (option, childOption, parentOption) => {
            await waitElementNotPresent('loader', 'commonPage')
            await waitElementPresentBySelector(
                cssSelectorsList.pageObjects.pspPage.selectors.filterOptions.concat(
                    `:nth-child(1)`
                )
            )
            await scrollToPosition('pspPage', 'filterOptions')
            const isPresent = await itemValidationInList(
                parentOption,
                'filterOptions',
                'pspPage'
            )
            count = isPresent[0]
            const parentPosition = isPresent[1]
            await client.assert.equal(count, '1')
            await collapseOpenAccordionSelector(
                'open',
                cssSelectorsList.pageObjects.pspPage.selectors.filterOptions.concat(
                    `:nth-child(${parentPosition}) button`
                )
            )

            await scrollToPosition('pspPage', 'filterOptions')
            await scrollToWithinSelector(
                cssSelectorsList.pageObjects.pspPage.selectors.filterOptions.concat(
                    `:nth-child(${parentPosition + 1})`
                )
            )

            const childSelector = await subFilterValidationBigScreen(
                parentOption,
                parentPosition,
                childOption
            )
            if (option === 'validate & click') {
                await scrollToPosition('pspPage', 'filterOptions')
                await client.click(childSelector)
            }
        }
    )

    When(/^I scroll to "(.*?)" within filters$/, async locator => {
        await scrollToPosition('pspPage', 'filterOptions')
        await scrollToWithinSelector(
            cssSelectorsList.pageObjects.pspPage.selectors[locator]
        )
    })

    When(
        /^I "(.*?)" the applied filter "(.*?)" on commonPage bigscreen$/,
        async (option, appliedFilterName) => {
            await waitElementNotPresent('loader', 'commonPage')
            await scrollToPosition('pspPage', 'filteredByOptions')
            const isPresent = await itemValidationInList(
                appliedFilterName,
                'filteredByOptions',
                'pspPage'
            )
            count = isPresent[0]
            const filterPosition = isPresent[1]
            await client.assert.equal(count, '1')
            if (option === 'validate & remove') {
                await client.click(
                    cssSelectorsList.pageObjects.pspPage.selectors.filteredByOptions.concat(
                        `:nth-child(${filterPosition}) a`
                    )
                )
            }
            await waitElementNotPresent('loader', 'commonPage')
        }
    )

    When(
        /^I hover over product "(.*?)" on "(.*?)"$/,
        async (productNumber, page) => {
            let youMayAlsoLikeSectionExists = 1
            let defaultFirstImage = 'firstProductImage'

            if (page === 'pdpPage') {
                youMayAlsoLikeSectionExists = await countElements(
                    'pdpPage',
                    'firstProductImage'
                )
                if (youMayAlsoLikeSectionExists === 0) {
                    defaultFirstImage = 'firstProductCustomerBoughtImage'
                    await scrollToPosition('pdpPage', 'baynoteCWMABSection')
                }
            }
            await moveToElementBySelector(
                cssSelectorsList.pageObjects[page].selectors[
                    defaultFirstImage
                ].replace('1', productNumber)
            )
        }
    )

    When(
        /^I should see quickShop button "(.*?)" on product "(.*?)" on "(.*?)"$/,
        async (status, productNumber, page) => {
            let youMayAlsoLikeSectionExists = 1
            let defaultFirstImage = 'firstProductImage'

            if (page === 'pdpPage') {
                youMayAlsoLikeSectionExists = await countElements(
                    'pdpPage',
                    'firstProductImage'
                )
                if (youMayAlsoLikeSectionExists === 0) {
                    defaultFirstImage = 'firstProductCustomerBoughtImage'
                }
            }
            if (status === 'appear') {
                await expectElementEquals(
                    cssSelectorsList.pageObjects[page].selectors[
                        defaultFirstImage
                    ].replace('1', productNumber),
                    'opacity',
                    '1'
                )
            } else {
                await moveToElementBySelector(
                    cssSelectorsList.pageObjects[page].selectors[
                        defaultFirstImage
                    ].replace('1', productNumber)
                )
            }
        }
    )

    When(
        /^I click quickShop button on product "(.*?)" on "(.*?)"$/,
        async (productNumber, page) => {
            await quickViewValidation(page)
        }
    )

    Then(
        /^I select the product "(.*?)" in "(.*?)" and add to bag from quickView$/,
        async (productNumber, page) => {
            let minibagBeforeCount = 0
            const elementFound = await countElements(
                'minibagPage',
                'minibagCount'
            )
            if (elementFound === 1) {
                minibagBeforeCount = await getText(
                    'minibagCount',
                    'minibagPage'
                )
            } else if (testDataSet.includes('DESKTOP')) {
                minibagBeforeCount = 'My Bag'
            }
            await quickViewValidation(page)
            await dropdownAvailableOption()
            await click('quickShopAddToBagButton', 'pdpPage')
            await click('quickShopCloseButton', 'pspPage')
            await click('logoDebenhams', 'commonPage')
            await click('myBagButton', 'commonPage')
            if (!testDataSet.includes('DESKTOP')) {
                await click('miniCartCheckoutButton', 'minibagPage')
            }
            const minibagAfterCount = await getText(
                'minibagCount',
                'minibagPage'
            )
            await client.assert.notEqual(
                minibagBeforeCount,
                minibagAfterCount,
                'Minibag count are same'
            )
        }
    )
})
