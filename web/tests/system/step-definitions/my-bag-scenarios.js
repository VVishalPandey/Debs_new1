import {client} from 'nightwatch-cucumber'
import {defineSupportCode} from 'cucumber'
import PageObjects from '../page-objects/page-objects'
import {
    explicitPagePause,
    waitElementVisible,
    waitElementNotPresent,
    waitElementPresent
} from '../methods/explicitWait'
import {getText} from '../methods/getText'
import {scrollToPositionBySelector} from '../methods/scrollTo'
import {clickBySelector, click} from '../methods/click'
import {itemValidationInMyBag} from '../methods/itemValidationInList'
import {profiles} from '../site-ssr'
import testData from '../test-data'
import {collapseOpenAccordionLocator} from '../methods/collapseOpenAccordion'
import {countElements} from '../methods/elements'
import {
    getFinanceBannerDate,
    financeBannerCalculation
} from '../methods/financeBanner'
import {expectElementEquals} from '..//methods/cssPropertyValidate'
import cssData from '../test-data-files/css-data.json'
import {upselldropdownAmountOptionSelect} from '../methods/pdpSizeColorSelector'
import {upsellGCaddToBag} from '../methods/addToBag'

const cssSelectorsList = new PageObjects()

const testDataSet = process.env.TEST_DATA_SET || 'UK'

defineSupportCode(({When, Then}) => {
    let tempData

    let productLocation = 0
    Then(/^I validate the "(.*?)"$/, async validation => {
        let headerSplitBySpace
        let totalSplitBySpace
        let totalProductValueTemp
        let totalProductValue
        let productValueTemp
        let productValue
        let discountTemp
        let discount
        let prodDiscountTemp
        let prodDiscount
        let subtotalTemp
        let subtotal
        let bannerAmountTemp1
        let bannerAmountTemp2
        let bannerAmount
        let bannerText
        let bannerTextExpected

        await client.getText(
            cssSelectorsList.pageObjects.myBagPage.selectors.productValue,
            result => {
                totalProductValueTemp = result.value
                    .trim()
                    .split(testData.currencySymbol)
                totalProductValue = totalProductValueTemp[1]
                totalProductValue = totalProductValue.replace(/,/g, '')
                totalProductValue = Number(totalProductValue)
            }
        )
        await client.getText(
            cssSelectorsList.pageObjects.myBagPage.selectors
                .productDiscountText,
            result => {
                if (result.value.trim() === 'Discounts') {
                    client.getText(
                        cssSelectorsList.pageObjects.myBagPage.selectors
                            .productDiscountValue,
                        result1 => {
                            prodDiscountTemp = result1.value.split(
                                testData.currencySymbol
                            )
                            prodDiscount = prodDiscountTemp[1]
                            prodDiscount = prodDiscount.replace(/,/g, '')
                            prodDiscount = Number(prodDiscount)
                            prodDiscount = prodDiscount.toFixed(2)
                            discount = Number(prodDiscount)
                        }
                    )
                    // client.getText(cssSelectorsList.pageObjects.myBagPage.selectors.discountValueWithPD, (result2) => {
                    //     console.log(result2.value)
                    //     discountTemp = (result2.value).split('£')
                    //     discount = discountTemp[1]
                    //     discount = discount.replace(/,/g, '')
                    //     discount = Number(discount)
                    //     discount = discount.toFixed(2)
                    //     discount = Number(prodDiscount) + Number(discount)
                    // })
                } else if (result.value.trim() === 'Promotional Discounts') {
                    client.getText(
                        cssSelectorsList.pageObjects.myBagPage.selectors
                            .discountValue,
                        result3 => {
                            discountTemp = result3.value.split(
                                testData.currencySymbol
                            )
                            discount = discountTemp[1]
                            discount = discount.replace(/,/g, '')
                            discount = Number(discount)
                        }
                    )
                }
            }
        )
        await client.getText(
            cssSelectorsList.pageObjects.myBagPage.selectors.subtotalValue,
            result => {
                subtotalTemp = result.value
                    .trim()
                    .split(testData.currencySymbol)
                subtotal = subtotalTemp[1]
                subtotal = subtotal.replace(/,/g, '')
                subtotal = Number(subtotal)
            }
        )
        await client.pause(testData.implicitTimeOut)
        if (validation === 'total items') {
            let i = 0
            let j = 1
            let count = 0
            await client.elements(
                'css selector',
                '.t-cart__product-list .dbh-product-price',
                result => {
                    const els = result.value
                    els.forEach(() => i++)
                }
            )
            for (j = 1; j <= i; j++) {
                await client.getText(
                    `.pw-list :nth-child(${j}) .dbh-product-price`,
                    result => {
                        if (result.value.trim() === 'Free') {
                            count++
                        } else {
                            client.getAttribute(
                                `.pw-list :nth-child(${j}) input`,
                                'value',
                                result => {
                                    count = Number(count) + Number(result.value)
                                }
                            )
                        }
                    }
                )
            }
            await client.getText(
                cssSelectorsList.pageObjects.myBagPage.selectors
                    .headerItemsCount,
                result => {
                    //headerSplitBySpace = (result.value.trim()).split(' ')
                    headerSplitBySpace = result.value
                        .trim()
                        .match(/\d+/g)
                        .map(Number)
                }
            )
            await client.getText(
                cssSelectorsList.pageObjects.myBagPage.selectors
                    .totalItemsCount,
                result => {
                    //totalSplitBySpace = (result.value.trim()).split(' ')
                    totalSplitBySpace = result.value
                        .trim()
                        .match(/\d+/g)
                        .map(Number)
                }
            )
            await client.assert.equal(count, totalSplitBySpace[0])
            await client.assert.equal(count, headerSplitBySpace[0])
        } else if (
            (validation === 'banner price' ||
                validation === 'banner message') &&
            subtotal < testData.deliveryThresholdValue
        ) {
            const bannerMessage = await getText('banner1Content', 'myBagPage')
            if (
                bannerMessage !== testData.freeStandardDeliveryBanner &&
                bannerMessage !== testData.freeClickAndCollectBanner
            ) {
                await client.getText(
                    cssSelectorsList.pageObjects.myBagPage.selectors
                        .banner1Content,
                    result => {
                        bannerText = result.value.trim()
                        bannerAmountTemp1 = result.value
                            .trim()
                            .split(testData.currencySymbol)
                        bannerAmountTemp2 = bannerAmountTemp1[1].split(' ')
                        if (!testDataSet.includes('ROI')) {
                            bannerAmount = bannerAmountTemp2[0]
                        } else if (testDataSet.includes('ROI')) {
                            bannerAmount = bannerAmountTemp2[1]
                        }
                    }
                )
                if (
                    !testDataSet.includes('ROI') &&
                    testDataSet.includes('DESKTOP')
                ) {
                    const savedItemsSectionExist = await countElements(
                        'myBagPage',
                        'savedItemsCarousal'
                    )
                    bannerTextExpected = `You're ${testData.currencySymbol}${bannerAmount} away from FREE Standard delivery.`
                    if (savedItemsSectionExist > 0) {
                        bannerTextExpected = bannerTextExpected.concat(
                            ` View saved items below`
                        )
                    }
                } else if (
                    !testDataSet.includes('ROI') &&
                    !testDataSet.includes('DESKTOP')
                ) {
                    bannerTextExpected = `Spend ${testData.currencySymbol}${bannerAmount} more and get FREE Standard Delivery.`
                }
                if (testDataSet.includes('ROI')) {
                    bannerTextExpected = `Spend ${testData.currencySymbol} ${bannerAmount} more and get FREE Standard Delivery.`
                }

                const difference = (
                    testData.deliveryThresholdValue - subtotal
                ).toFixed(2)

                await client.assert.equal(bannerAmount, difference)
                await client.assert.equal(bannerText, bannerTextExpected)
            }
        } else if (
            (validation === 'banner price' ||
                validation === 'banner message') &&
            subtotal >= testData.deliveryThresholdValue
        ) {
            await client.getText(
                cssSelectorsList.pageObjects.myBagPage.selectors.banner1Content,
                result => {
                    bannerText = result.value.trim()
                }
            )
            if (bannerText !== testData.freeClickAndCollectBanner) {
                bannerTextExpected = `Your shopping bag qualifies for FREE Standard Delivery.`
                await client.assert.equal(bannerText, bannerTextExpected)
            }
        } else if (validation === 'subtotal') {
            let actualSubtotal = totalProductValue - discount
            actualSubtotal = actualSubtotal.toFixed(2)
            await client.assert.equal(subtotal, actualSubtotal)
        } else if (validation === 'total product price') {
            let i = 0
            let j = 1
            let cost = 0
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
                    `.pw-list :nth-child(${j}) .dbh-product-price`,
                    result => {
                        if (result.value.trim() !== 'Free') {
                            productValueTemp = result.value
                                .trim()
                                .split(testData.currencySymbol)
                            productValue = productValueTemp[1]
                            productValue = productValue.replace(/,/g, '')
                            cost = Number(cost) + Number(productValue)
                        } else {
                            cost = Number(cost) + 0.01
                            cost = cost.toFixed(2)
                        }
                    }
                )
            }
            cost = cost.toFixed(2)
            await client.assert.equal(totalProductValue, cost)
        } else if (validation === 'total product discounts') {
            let i = 0
            let j = 1
            let temp = 0
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
                    `.pw-list > article:nth-child(${j}) .dbh-product-price`,
                    result1 => {
                        if (result1.value === 'Free') {
                            temp++
                        }
                    }
                )
            }
            if (i > 0) {
                await client.assert.equal(prodDiscount * 100, temp)
            }
        } else if (
            validation.includes('finance banner value') &&
            !testDataSet.includes('ROI') &&
            (testDataSet.includes('TABLET') || testDataSet.includes('DESKTOP'))
        ) {
            let actualDiscountAmount = 0
            const currencyPound = '£'
            const bannerType = await getFinanceBannerDate()
            const actualDiscountAmount1 = await financeBannerCalculation(
                bannerType
            )
            actualDiscountAmount = currencyPound.concat(actualDiscountAmount1)
            await client.assert.containsText(
                cssSelectorsList.pageObjects.myBagPage.selectors
                    .financeBannerAmount,
                actualDiscountAmount
            )
            await waitElementVisible('financeBannerHeader', 'myBagPage')
            if (bannerType === 'PB') {
                await expectElementEquals(
                    cssSelectorsList.pageObjects.myBagPage.selectors
                        .financeBanner,
                    'background-color',
                    cssData.privateBannerBackgroundColor
                )
            }
            await client.assert.containsText(
                cssSelectorsList.pageObjects.myBagPage.selectors
                    .financeBannerHeader,
                testData[bannerType.concat('FinanceBannerOfferHeaderText')]
            )
        }
    })

    When(
        /^I remove first product and select "(.*?)" then I validate bag on myBagPage$/,
        async validation => {
            let productName
            let i = 0
            let j = 1
            let saveForLaterProductName
            let saveForLaterProductNameTemp
            let productNameTemp
            let myBagProductName
            await client.pause(testData.implicitTimeOut)
            await waitElementPresent('firstProductName', 'myBagPage')
            await client.getText(
                cssSelectorsList.pageObjects.myBagPage.selectors
                    .firstProductName,
                result => {
                    productName = result.value.trim()
                }
            )
            await waitElementPresent('firstProductRemove', 'myBagPage')
            await client.click(
                cssSelectorsList.pageObjects.myBagPage.selectors
                    .firstProductRemove
            )
            await client.pause(testData.implicitTimeOut)
            await waitElementPresent('removePopUpYesButton', 'myBagPage')
            if (validation === 'Yes, remove it') {
                await client.click(
                    cssSelectorsList.pageObjects.myBagPage.selectors
                        .removePopUpYesButton
                )
                await client.pause(testData.implicitTimeOut)
                await client.elements(
                    'css selector',
                    '.t-cart__product-list .dbh-product-price',
                    result => {
                        const els = result.value
                        els.forEach(() => i++)
                    }
                )
                for (j = 1; j <= i; j = j + 1) {
                    await client.expect
                        .element(
                            `.pw-list > article :nth-child(${j}) .dbh-product-title`
                        )
                        .text.not.to.equal(productName)
                }
            } else if (validation === 'Save for later') {
                await waitElementPresent(
                    'removePopUpSaveLaterButton',
                    'myBagPage'
                )
                await client.click(
                    cssSelectorsList.pageObjects.myBagPage.selectors
                        .removePopUpSaveLaterButton
                )
                await client.pause(testData.implicitTimeOut)
                await client.elements(
                    'css selector',
                    '.t-cart__product-list .dbh-product-price',
                    result => {
                        const els = result.value
                        els.forEach(() => i++)
                    }
                )
                for (j = 1; j <= i; j = j + 1) {
                    await client.expect
                        .element(`.pw-list :nth-child(${j}) .dbh-product-title`)
                        .text.not.to.equal(productName)
                }
                if (testDataSet === 'UK' || testDataSet === 'ROI') {
                    await collapseOpenAccordionLocator(
                        'open',
                        'saveForLaterAccordion',
                        'myBagPage'
                    )
                }
                await client.getText(
                    cssSelectorsList.pageObjects.myBagPage.selectors
                        .saveForLaterFirstProductName,
                    result => {
                        if (
                            testDataSet === 'DESKTOP' ||
                            testDataSet === 'DESKTOP-ROI' ||
                            testDataSet === 'UK' ||
                            testDataSet === 'TABLET'
                        ) {
                            productNameTemp = productName.split('-')
                            myBagProductName = productNameTemp[1]
                                .toUpperCase()
                                .trim()
                        } else if (
                            testDataSet === 'ROI' ||
                            testDataSet === 'TABLET-ROI' ||
                            testDataSet === 'DESKTOP-ROI'
                        ) {
                            myBagProductName = productName.toUpperCase().trim()
                        }

                        saveForLaterProductNameTemp = result.value
                            .trim()
                            .split('-')
                        saveForLaterProductName = saveForLaterProductNameTemp[1]
                            .toUpperCase()
                            .trim()
                    }
                )
                await client.assert.equal(
                    myBagProductName,
                    saveForLaterProductName
                )
            } else if (validation === 'Close') {
                await waitElementPresent(
                    'removePopUpSaveLaterButton',
                    'myBagPage'
                )
                await client.click(
                    cssSelectorsList.pageObjects.myBagPage.selectors
                        .removePopUpClose
                )
                await client.pause(testData.implicitTimeOut)
                await client.expect
                    .element(
                        `.pw-list > article:nth-child(1) .dbh-product-title`
                    )
                    .text.to.equal(productName)
            }
        }
    )

    When(
        /^I select save for later for first product then I validate bag on myBagPage$/,
        async () => {
            let productName
            let i = 0
            let j = 1
            let currentSubTotal
            let currentSubtotalTemp
            let updatedSubTotal
            let updatedSubtotalTemp
            let isSubTotalValuePresent
            let saveForLaterProductNameTemp
            let saveForLaterProductName
            let productNameTemp
            let myBagProductName
            await waitElementPresent('firstProductName', 'myBagPage')
            await client.getText(
                cssSelectorsList.pageObjects.myBagPage.selectors
                    .firstProductName,
                result => {
                    productName = result.value.trim()
                }
            )
            await client.getText(
                cssSelectorsList.pageObjects.myBagPage.selectors.subtotalValue,
                result => {
                    currentSubtotalTemp = result.value
                        .trim()
                        .split(testData.currencySymbol)
                    currentSubTotal = currentSubtotalTemp[1]
                    currentSubTotal = currentSubTotal.replace(/,/g, '')
                    currentSubTotal = Number(currentSubTotal)
                }
            )
            await client.click(
                cssSelectorsList.pageObjects.myBagPage.selectors
                    .firstProductSaveForLater
            )
            await client.pause(testData.implicitTimeOut)
            await client.elements(
                'css selector',
                '.t-cart__product-list .dbh-product-price',
                result => {
                    const els = result.value
                    els.forEach(() => i++)
                }
            )
            for (j = 1; j <= i; j = j + 1) {
                await client.expect
                    .element(`.pw-list :nth-child(${j}) .dbh-product-title`)
                    .text.not.to.equal(productName)
            }
            if (testDataSet === 'UK' || testDataSet === 'ROI') {
                await collapseOpenAccordionLocator(
                    'open',
                    'saveForLaterAccordion',
                    'myBagPage'
                )
            }
            await client.getText(
                cssSelectorsList.pageObjects.myBagPage.selectors
                    .saveForLaterFirstProductName,
                result => {
                    if (
                        testDataSet === 'DESKTOP' ||
                        testDataSet === 'DESKTOP-ROI' ||
                        testDataSet === 'UK' ||
                        testDataSet === 'TABLET'
                    ) {
                        productNameTemp = productName.split('-')
                        myBagProductName = productNameTemp[1]
                            .toUpperCase()
                            .trim()
                    } else if (testDataSet.includes('ROI')) {
                        myBagProductName = productName.toUpperCase().trim()
                    }

                    saveForLaterProductNameTemp = result.value.trim().split('-')
                    saveForLaterProductName = saveForLaterProductNameTemp[1]
                        .toUpperCase()
                        .trim()
                }
            )
            await client.assert.equal(myBagProductName, saveForLaterProductName)

            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects.myBagPage.selectors.subtotalValue,
                result => {
                    isSubTotalValuePresent = result.value
                }
            )

            if (isSubTotalValuePresent.length) {
                await client.getText(
                    cssSelectorsList.pageObjects.myBagPage.selectors
                        .subtotalValue,
                    result => {
                        updatedSubtotalTemp = result.value
                            .trim()
                            .split(testData.currencySymbol)

                        updatedSubTotal = updatedSubtotalTemp[1]
                        updatedSubTotal = updatedSubTotal.replace(/,/g, '')
                        updatedSubTotal = Number(updatedSubTotal)
                    }
                )
            }
            await client.verify.notEqual(updatedSubTotal, currentSubTotal)
        }
    )

    Then(
        /^I validate "(.*?)" as "(.*?)" on mybagPage$/,
        async (locatorValue, discount) => {
            await client.pause(testData.implicitTimeOut)
            if (locatorValue === 'discountValue') {
                await client.getText(
                    cssSelectorsList.pageObjects.myBagPage.selectors
                        .discountValue,
                    result => {
                        client.assert.equal(result.value.trim(), discount)
                    }
                )
            }
        }
    )

    Then(
        /^I should see "(.*?)" product name exist on myBagPage$/,
        async testDataProductName => {
            let i = 0
            let j = 1
            let temp = 'product not found'
            await client.pause(testData.implicitTimeOut)
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
                    `.t-cart__product-main .c-product-item:nth-child(${j}) .dbh-product-title .pw-dangerous-html span`,
                    result => {
                        if (
                            result.value
                                .trim()
                                .includes(testData[testDataProductName])
                        ) {
                            temp = 'product found'
                            productLocation = j
                        }
                    }
                )
            }
            await client.assert.equal(temp, 'product found')
        }
    )

    Then(
        /^I validate "(.*?)" fullfillment option "(.*?)" on myBagPage$/,
        async (option, expectedStatus) => {
            let currentStatus = true
            const standardDeliveryOption = cssSelectorsList.pageObjects.myBagPage.selectors.standardDeliveryOption.replace(
                'elem',
                productLocation
            )
            // const nextDayDeliveryOption = cssSelectorsList.pageObjects.myBagPage.selectors.nextNominatedDayDeliveryOption.replace(
            //     'elem',
            //     productLocation
            // )
            // const nomDayDeliveryOption = cssSelectorsList.pageObjects.myBagPage.selectors.clickAndCollectDeliveryOptionDebenhams.replace(
            //     'elem',
            //     productLocation
            // )
            // const clickAndCollectDeliveryOption = cssSelectorsList.pageObjects.myBagPage.selectors.clickAndCollectDeliveryOptionHermes.replace(
            //     'elem',
            //     productLocation
            // )
            const internationalDeliveryOption = cssSelectorsList.pageObjects.myBagPage.selectors.internationalDeliveryOption.replace(
                'elem',
                productLocation
            )
            const nextNomDayDeliveryOption = cssSelectorsList.pageObjects.myBagPage.selectors.nextNomDayDeliveryOption.replace(
                'elem',
                productLocation
            )
            const clickAndCollectDeliveryOptionDebenhams = cssSelectorsList.pageObjects.myBagPage.selectors.clickAndCollectDeliveryOptionDebenhams.replace(
                'elem',
                productLocation
            )
            const clickAndCollectDeliveryOptionHermes = cssSelectorsList.pageObjects.myBagPage.selectors.clickAndCollectDeliveryOptionHermes.replace(
                'elem',
                productLocation
            )

            if (option === 'Standard') {
                await client.getAttribute(
                    standardDeliveryOption,
                    'class',
                    result => {
                        if (result.value.includes('c-disabled')) {
                            currentStatus = 'disable'
                        } else {
                            currentStatus = 'enable'
                        }
                    }
                )
                await client.assert.equal(currentStatus, expectedStatus)
            } else if (option === 'Next day') {
                await client.getAttribute(
                    nextDayDeliveryOption,
                    'class',
                    result => {
                        if (result.value.includes('c-disabled')) {
                            currentStatus = 'disable'
                        } else {
                            currentStatus = 'enable'
                        }
                    }
                )
                await client.assert.equal(currentStatus, expectedStatus)
            } else if (option === 'Choose day or evening') {
                await client.getAttribute(
                    nomDayDeliveryOption,
                    'class',
                    result => {
                        if (result.value.includes('c-disabled')) {
                            currentStatus = 'disable'
                        } else {
                            currentStatus = 'enable'
                        }
                    }
                )
                await client.assert.equal(currentStatus, expectedStatus)
            } else if (option === 'Next or nominated day') {
                await client.getAttribute(
                    nextNomDayDeliveryOption,
                    'class',
                    result => {
                        if (result.value.includes('c-disabled')) {
                            currentStatus = 'disable'
                        } else {
                            currentStatus = 'enable'
                        }
                    }
                )
                await client.assert.equal(currentStatus, expectedStatus)
            } else if (option === 'Click & Collect') {
                await client.getAttribute(
                    clickAndCollectDeliveryOption,
                    'class',
                    result => {
                        if (result.value.includes('c-disabled')) {
                            currentStatus = 'disable'
                        } else {
                            currentStatus = 'enable'
                        }
                    }
                )
                await client.assert.equal(currentStatus, expectedStatus)
            } else if (option === 'Collect from store') {
                await client.getAttribute(
                    clickAndCollectDeliveryOptionDebenhams,
                    'class',
                    result => {
                        if (result.value.includes('c-disabled')) {
                            currentStatus = 'disable'
                        } else {
                            currentStatus = 'enable'
                        }
                    }
                )
                await client.assert.equal(currentStatus, expectedStatus)
            } else if (option === 'Collect from ParcelShop') {
                await client.getAttribute(
                    clickAndCollectDeliveryOptionHermes,
                    'class',
                    result => {
                        if (result.value.includes('c-disabled')) {
                            currentStatus = 'disable'
                        } else {
                            currentStatus = 'enable'
                        }
                    }
                )
                await client.assert.equal(currentStatus, expectedStatus)
            } else if (option === 'International') {
                await client.getAttribute(
                    internationalDeliveryOption,
                    'class',
                    result => {
                        if (result.value.includes('c-disabled')) {
                            currentStatus = 'disable'
                        } else {
                            currentStatus = 'enable'
                        }
                    }
                )
                await client.assert.equal(currentStatus, expectedStatus)
            }
        }
    )

    When(
        /^I click and validate "(.*?)" fullfillment option text as "(.*?)" on myBagPage$/,
        async (option, expectedText) => {
            let currentMessage
            const standardDeliveryOption = cssSelectorsList.pageObjects.myBagPage.selectors.standardDeliveryOption.replace(
                'elem',
                productLocation
            )
            const nextDayDeliveryOption = cssSelectorsList.pageObjects.myBagPage.selectors.nextDayDeliveryOption.replace(
                'elem',
                productLocation
            )
            const nomDayDeliveryOption = cssSelectorsList.pageObjects.myBagPage.selectors.nomDayDeliveryOption.replace(
                'elem',
                productLocation
            )
            const clickAndCollectDeliveryOption = cssSelectorsList.pageObjects.myBagPage.selectors.clickAndCollectDeliveryOption.replace(
                'elem',
                productLocation
            )
            const internationalDeliveryOption = cssSelectorsList.pageObjects.myBagPage.selectors.internationalDeliveryOption.replace(
                'elem',
                productLocation
            )
            const nextNomDayDeliveryOption = cssSelectorsList.pageObjects.myBagPage.selectors.nextNomDayDeliveryOption.replace(
                'elem',
                productLocation
            )
            const clickAndCollectDeliveryOptionDebenhams = cssSelectorsList.pageObjects.myBagPage.selectors.clickAndCollectDeliveryOptionDebenhams.replace(
                'elem',
                productLocation
            )
            const clickAndCollectDeliveryOptionHermes = cssSelectorsList.pageObjects.myBagPage.selectors.clickAndCollectDeliveryOptionHermes.replace(
                'elem',
                productLocation
            )

            const standardDeliveryOptionTooltipText = cssSelectorsList.pageObjects.myBagPage.selectors.standardDeliveryOptionTooltipText.replace(
                'elem',
                productLocation
            )
            const nextDayDeliveryOptionTooltipText = cssSelectorsList.pageObjects.myBagPage.selectors.nextDayDeliveryOptionTooltipText.replace(
                'elem',
                productLocation
            )
            const nomDayDeliveryOptionTooltipText = cssSelectorsList.pageObjects.myBagPage.selectors.nomDayDeliveryOptionTooltipText.replace(
                'elem',
                productLocation
            )
            const clickAndCollectDeliveryOptionTooltipText = cssSelectorsList.pageObjects.myBagPage.selectors.clickAndCollectDeliveryOptionTooltipText.replace(
                'elem',
                productLocation
            )
            const internationalDeliveryOptionTooltipText = cssSelectorsList.pageObjects.myBagPage.selectors.internationalDeliveryOptionTooltipText.replace(
                'elem',
                productLocation
            )
            const nextNomDayDeliveryOptionTooltipText = cssSelectorsList.pageObjects.myBagPage.selectors.nextNomDayDeliveryOptionTooltipText.replace(
                'elem',
                productLocation
            )
            const clickAndCollectDeliveryOptionDebenhamsTooltipText = cssSelectorsList.pageObjects.myBagPage.selectors.clickAndCollectDeliveryOptionDebenhamsTooltipText.replace(
                'elem',
                productLocation
            )
            const clickAndCollectDeliveryOptionHermesTooltipText = cssSelectorsList.pageObjects.myBagPage.selectors.clickAndCollectDeliveryOptionHermesTooltipText.replace(
                'elem',
                productLocation
            )
            const unavailCCExpressDeliveryOptionHermesTooltipText = cssSelectorsList.pageObjects.myBagPage.selectors.unavailCCExpressDeliveryOptionHermesTooltipText.replace(
                'elem',
                productLocation
            )
            if (option === 'Standard') {
                await client.click(standardDeliveryOption)
                await client.pause(testData.implicitTimeOut)
                await client.getText(
                    standardDeliveryOptionTooltipText,
                    result => {
                        currentMessage = result.value
                            .trim()
                            .replace(/(\r\n|\n|\r)/gm, '')
                    }
                )
            } else if (option === 'Next day') {
                await client.click(nextDayDeliveryOption)
                await client.pause(testData.implicitTimeOut)
                await client.getText(
                    nextDayDeliveryOptionTooltipText,
                    result => {
                        currentMessage = result.value.trim()
                        currentMessage = currentMessage.replace(
                            /(\r\n|\n|\r)/gm,
                            ''
                        )
                    }
                )
            } else if (option === 'Choose day or evening') {
                await client.click(nomDayDeliveryOption)
                await client.pause(testData.implicitTimeOut)
                await client.getText(
                    nomDayDeliveryOptionTooltipText,
                    result => {
                        currentMessage = result.value.trim()
                        currentMessage = currentMessage.replace(
                            /(\r\n|\n|\r)/gm,
                            ''
                        )
                    }
                )
            } else if (option === 'Next or nominated day') {
                await client.click(nextNomDayDeliveryOption)
                await client.pause(testData.implicitTimeOut)
                await client.getText(
                    nextNomDayDeliveryOptionTooltipText,
                    result => {
                        currentMessage = result.value.trim()
                        currentMessage = currentMessage.replace(
                            /(\r\n|\n|\r)/gm,
                            ''
                        )
                    }
                )
            } else if (option === 'Click & Collect') {
                await client.click(clickAndCollectDeliveryOption)
                await client.pause(testData.implicitTimeOut)
                await client.getText(
                    clickAndCollectDeliveryOptionTooltipText,
                    result => {
                        currentMessage = result.value.trim()
                        currentMessage = currentMessage.replace(
                            /(\r\n|\n|\r)/gm,
                            ''
                        )
                    }
                )
            } else if (option === 'Collect from store') {
                await client.click(clickAndCollectDeliveryOptionDebenhams)
                await client.pause(testData.implicitTimeOut)
                await client.getText(
                    clickAndCollectDeliveryOptionDebenhamsTooltipText,
                    result => {
                        currentMessage = result.value.trim()
                        currentMessage = currentMessage.replace(
                            /(\r\n|\n|\r)/gm,
                            ''
                        )
                    }
                )
            } else if (option === 'Collect from ParcelShop') {
                await client.click(clickAndCollectDeliveryOptionHermes)
                await client.pause(testData.implicitTimeOut)
                await client.getText(
                    clickAndCollectDeliveryOptionHermesTooltipText,
                    result => {
                        currentMessage = result.value.trim()
                        currentMessage = currentMessage.replace(
                            /(\r\n|\n|\r)/gm,
                            ''
                        )
                    }
                )
            } else if (option === 'Unavailable Parcel Collection Option') {
                await client.click(clickAndCollectDeliveryOptionHermes)
                await client.pause(testData.implicitTimeOut)
                await client.getText(
                    unavailCCExpressDeliveryOptionHermesTooltipText,
                    result => {
                        currentMessage = result.value.trim()
                        currentMessage = currentMessage.replace(
                            /(\r\n|\n|\r)/gm,
                            ''
                        )
                    }
                )
            } else if (option === 'International') {
                await client.click(internationalDeliveryOption)
                await client.pause(testData.implicitTimeOut)
                await client.getText(
                    internationalDeliveryOptionTooltipText,
                    result => {
                        currentMessage = result.value.trim()
                        currentMessage = currentMessage.replace(
                            /(\r\n|\n|\r)/gm,
                            ''
                        )
                    }
                )
            }
            await client.assert.equal(currentMessage, expectedText)
        }
    )

    Then(/^I navigate to mybag and remove "(.*?)"$/, async productType => {
        let i = 0
        let j
        await profiles(testData.basketCheckoutUrl)
        await explicitPagePause()
        // await client.waitForElementVisible('body', 3000)
        // await client.pause(3000)
        await client.elements(
            'css selector',
            cssSelectorsList.pageObjects.myBagPage.selectors
                .allProductNameElements,
            result => {
                const els = result.value
                els.forEach(() => i++)
            }
        )
        for (j = i; j >= 1; j--) {
            await client.getText(
                `.t-cart__product-list :nth-child(${j}) .dbh-product-title`,
                result => {
                    tempData = result.value.trim()
                }
            )
            if (
                (productType === 'dress' &&
                    tempData === testData.testDressProductName) ||
                (productType === 'perfume' &&
                    tempData === testData.testPerfumeProductName) ||
                (productType === 'furniture' &&
                    tempData === testData.testFurnitureProductName)
            ) {
                await client.click(
                    `.t-cart__product-list :nth-child(${j}) .dbh-remove`
                )
                await waitElementVisible('removePopUpYesButton', 'myBagPage')
                await client.click(
                    cssSelectorsList.pageObjects.myBagPage.selectors
                        .removePopUpYesButton
                )
                await client.pause(testData.implicitTimeOut)
                j = 0
                client.elements(
                    'css selector',
                    cssSelectorsList.pageObjects.myBagPage.selectors
                        .allProductNameElements,
                    result => {
                        const els = result.value
                        els.forEach(() => j++)
                    }
                )
            }
        }
    })

    Then(/^I navigate to mybag and empty the bag$/, async () => {
        let i = 0
        let j
        await profiles('basketCheckoutUrl')
        await client.pause(testData.implicitTimeOut)
        await client.elements(
            'css selector',
            cssSelectorsList.pageObjects.myBagPage.selectors
                .allProductNameElements,
            result => {
                const els = result.value
                els.forEach(() => i++)
            }
        )
        i = String(i)
        if (i === '0') {
            await console.log('No items in bag')
        } else {
            for (j = 1; j <= i; j++) {
                await client.getLocationInView(`.dbh-product-title`, result => {
                    client.click(
                        `.t-cart__product-list :nth-child(1) .dbh-remove`
                    )
                    client.pause(testData.implicitTimeOut)
                    client.click(
                        cssSelectorsList.pageObjects.myBagPage.selectors
                            .removePopUpYesButton
                    )
                    client.pause(testData.implicitTimeOut)
                })
            }
        }
    })

    Then(
        /^I enter quantity as "(.*?)" for product "(.*?)"$/,
        async (value, productNo) => {
            await client.clearValue(
                `.pw-list article:nth-child(${productNo}) .u-flex div:nth-child(3) .pw-grid .pw-grid__inner div:nth-child(2) div.pw-field-row.u-flexbox.u-margin-bottom-lg div div div .dbh-stepper div div .pw-stepper__inner div:nth-child(2) input`
            )
            await client.setValue(
                `.pw-list article:nth-child(${productNo}) .u-flex div:nth-child(3) .pw-grid .pw-grid__inner div:nth-child(2) div.pw-field-row.u-flexbox.u-margin-bottom-lg div div div .dbh-stepper div div .pw-stepper__inner div:nth-child(2) input`,
                value
            )
            await client.pause(testData.implicitTimeOut)
        }
    )

    Then(
        /^I verify the "(.*?)" delivery options are in "(.*?)" colour for product "(.*?)"$/,
        async (state, colour, productNo) => {
            if (state === 'disabled' && colour === 'grey') {
                await client.expect
                    .element(
                        `.pw-list article:nth-child(${productNo}) .u-flex div:nth-child(3) .t-cart__delivery-tabs .pw-tabs div .pw-tabs__strip li a button.pw-button.c-${state} div svg`
                    )
                    .to.have.css('color')
                    .which.equals('rgba(0, 179, 158, 1)')
                await client.pause(testData.implicitTimeOut)
            } else if (state === 'enabled') {
                await client.expect
                    .element(
                        `.pw-list article:nth-child(${productNo}) .u-flex div:nth-child(3) .t-cart__delivery-tabs .pw-tabs div .pw-tabs__strip li a button.pw-button div svg`
                    )
                    .to.have.css('color')
                    .which.equals('rgba(0, 0, 0, 1)')
                await client.pause(testData.implicitTimeOut)
                await client.click(
                    `.pw-list article:nth-child(${productNo}) .u-flex div:nth-child(3) .t-cart__delivery-tabs .pw-tabs div .pw-tabs__strip li a button`
                )
                await client.pause(testData.implicitTimeOut)
            }
        }
    )

    Then(
        /^I select the GiftCard amount and add to bag on my bag page$/,
        async () => {
            await upselldropdownAmountOptionSelect()
            await upsellGCaddToBag()
        }
    )

    // To validate pdp (user need to be on pdp page which require validation) "exist" or "do not exist" on "mybagPage" or "minibagPage"
    Then(
        /^I validate current pdp product "(.*?)" on "(.*?)"$/,
        async (option, page) => {
            let quickShopOverlayExist = 0

            await waitElementVisible('productPrdName', 'pdpPage')
            const pdpProductName = await getText('productPrdName', 'pdpPage')
            if (testDataSet.includes('DESKTOP')) {
                quickShopOverlayExist = await countElements(
                    'pdpPage',
                    'quickShopOverlay'
                )
            }
            if (quickShopOverlayExist === 1) {
                await waitElementNotPresent(
                    'quickShopOverlayTopNotification',
                    'pspPage'
                )
                await waitElementVisible('quickShopCloseButton', 'pspPage')
                await click('quickShopCloseButton', 'pspPage')
                await waitElementNotPresent('quickShopOverlay', 'pspPage')
            }
            await scrollToPositionBySelector('.qa-header__cart')
            await waitElementVisible('miniBagButton', 'pdpPage')
            await clickBySelector('.qa-header__cart')
            await waitElementVisible('headerText', page)
            await client.assert.containsText(
                cssSelectorsList.pageObjects[page].selectors.headerText,
                'My Bag'
            )
            await waitElementVisible('checkoutButton', page)
            const productsPosition = await itemValidationInMyBag(
                'productNameList',
                'myBagPage',
                pdpProductName,
                option
            )
        }
    )
})
