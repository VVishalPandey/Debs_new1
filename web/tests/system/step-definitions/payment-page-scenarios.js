import {client} from 'nightwatch-cucumber'
import {defineSupportCode} from 'cucumber'
import PageObjects from '../page-objects/page-objects'
import {
    explicitPagePause,
    waitElementVisible,
    waitElementNotPresent,
    waitElementNotVisible,
    waitElementPresent
} from '../methods/explicitWait'

import testData from '../test-data'

const cssSelectorsList = new PageObjects()

defineSupportCode(({Then}) => {
    let totalItemsMyBag
    let creditCardPointsMyBag
    let beautyCardPointsMyBag
    let totalItemsValueMyBag
    let productDiscountMyBag
    let discountMyBag
    let subtotalMyBag
    Then(/^I store details from myBag to validate later$/, async () => {
        let i = 0
        let j
        let tempValue
        totalItemsMyBag = 0
        creditCardPointsMyBag = 0
        beautyCardPointsMyBag = 0
        totalItemsValueMyBag = 0
        productDiscountMyBag = 0
        discountMyBag = 0
        subtotalMyBag = 0
        await client.element(
            'css selector',
            cssSelectorsList.pageObjects.myBagPage.selectors.totalItemsRow,
            result => {
                client.getText(
                    cssSelectorsList.pageObjects.myBagPage.selectors
                        .totalItemsCount,
                    result1 => {
                        totalItemsMyBag = result1.value
                        console.log('items count ', totalItemsMyBag)
                    }
                )
                client.getText(
                    cssSelectorsList.pageObjects.myBagPage.selectors
                        .productValue,
                    result1 => {
                        totalItemsValueMyBag = result1.value
                        console.log('product value ', totalItemsValueMyBag)
                    }
                )
            }
        )
        await client.elements(
            'css selector',
            cssSelectorsList.pageObjects.myBagPage.selectors.discountRows,
            result => {
                const els = result.value
                els.forEach(() => i++)
            }
        )
        for (j = 2; j <= i + 1; j++) {
            await client.getText(
                `.pw-ledger tr:nth-child(${j}) .pw-ledger__item`,
                result => {
                    if (result.value.trim() === testData.prodDisTextMyBag) {
                        client.getText(
                            `.pw-ledger tr:nth-child(${j}) .pw-ledger__value`,
                            result1 => {
                                productDiscountMyBag = result1.value
                                console.log(
                                    'prod discount is ',
                                    productDiscountMyBag
                                )
                            }
                        )
                    } else if (result.value.trim() === testData.disTextMyBag) {
                        client.getText(
                            `.pw-ledger tr:nth-child(${j}) .pw-ledger__value`,
                            result1 => {
                                discountMyBag = result1.value
                                console.log('discount is ', discountMyBag)
                            }
                        )
                    }
                }
            )
        }
        await client.element(
            'css selector',
            cssSelectorsList.pageObjects.myBagPage.selectors.subtotalRow,
            result => {
                client.getText(
                    cssSelectorsList.pageObjects.myBagPage.selectors
                        .subtotalValue,
                    result1 => {
                        subtotalMyBag = result1.value
                        console.log('sub total is ', subtotalMyBag)
                    }
                )
            }
        )
        i = 0
        await client.elements(
            'css selector',
            cssSelectorsList.pageObjects.myBagPage.selectors.creditCardInfo,
            result => {
                const els = result.value
                els.forEach(() => i++)
            }
        )
        if (i > 0) {
            await client.getText(
                cssSelectorsList.pageObjects.myBagPage.selectors.creditCardInfo,
                result => {
                    tempValue = result.value.trim().split(' ')
                    creditCardPointsMyBag = tempValue[1]
                    creditCardPointsMyBag = creditCardPointsMyBag.replace(
                        ',',
                        '',
                        -1
                    )
                    console.log('credit card point is ', creditCardPointsMyBag)
                }
            )
        }
        i = 0
        await client.elements(
            'css selector',
            cssSelectorsList.pageObjects.myBagPage.selectors.beautyCardInfo,
            result => {
                const els = result.value
                els.forEach(() => i++)
            }
        )
        if (i > 0) {
            await client.getText(
                cssSelectorsList.pageObjects.myBagPage.selectors.beautyCardInfo,
                result => {
                    tempValue = result.value.trim().split(' ')
                    beautyCardPointsMyBag = tempValue[1]
                    beautyCardPointsMyBag = beautyCardPointsMyBag.replace(
                        ',',
                        '',
                        -1
                    )
                    console.log('beauty card point is ', beautyCardPointsMyBag)
                }
            )
        }
    })
    Then(/^I validate "(.*?)" value from mybag$/, async checkFor => {
        if (checkFor === 'credit card points') {
            await client.assert.containsText(
                cssSelectorsList.pageObjects.paymentPage.selectors
                    .creditCardPointText,
                creditCardPointsMyBag
            )
        } else if (checkFor === 'beauty card points') {
            await client.assert.containsText(
                cssSelectorsList.pageObjects.paymentPage.selectors
                    .beautyClubCardPointText,
                beautyCardPointsMyBag
            )
        }
    })

    Then(
        /^I should validate the "(.*?)" of product "(.*?)" under orderDetails$/,
        async (type, product) => {
            if (type === 'deliveryLeadTime') {
                await client.waitForElementVisible(
                    '.pw-list .t-checkout-payment__item:nth-child(' +
                        product +
                        ') .dbh-delivery-estimation',
                    testData.explicitTimeOut
                )
                await client.assert.elementPresent(
                    '.pw-list .t-checkout-payment__item:nth-child(' +
                        product +
                        ') .dbh-delivery-estimation'
                )
            } else if (type === 'image') {
                await client.waitForElementVisible(
                    '.pw-list .t-checkout-payment__item:nth-child(' +
                        product +
                        ') .dbh-product-image',
                    testData.explicitTimeOut
                )
                await client.assert.elementPresent(
                    '.pw-list .t-checkout-payment__item:nth-child(' +
                        product +
                        ') .dbh-product-image'
                )
            } else if (type === 'title') {
                await client.waitForElementVisible(
                    '.pw-list .t-checkout-payment__item:nth-child(' +
                        product +
                        ') .dbh-product-title',
                    testData.explicitTimeOut
                )
                await client.assert.elementPresent(
                    '.pw-list .t-checkout-payment__item:nth-child(' +
                        product +
                        ') .dbh-product-title'
                )
            } else if (type === 'options') {
                await client.waitForElementVisible(
                    '.pw-list .t-checkout-payment__item:nth-child(' +
                        product +
                        ') .dbh-product-options',
                    testData.explicitTimeOut
                )
                await client.assert.elementPresent(
                    '.pw-list .t-checkout-payment__item:nth-child(' +
                        product +
                        ') .dbh-product-options'
                )
            } else if (type === 'quantity') {
                await client.waitForElementVisible(
                    '.pw-list .t-checkout-payment__item:nth-child(' +
                        product +
                        ') .dbh-product-quantity',
                    testData.explicitTimeOut
                )
                await client.assert.elementPresent(
                    '.pw-list .t-checkout-payment__item:nth-child(' +
                        product +
                        ') .dbh-product-quantity'
                )
            } else if (type === 'price') {
                await client.waitForElementVisible(
                    '.pw-list .t-checkout-payment__item:nth-child(' +
                        product +
                        ') .dbh-product-price',
                    testData.explicitTimeOut
                )
                await client.assert.elementPresent(
                    '.pw-list .t-checkout-payment__item:nth-child(' +
                        product +
                        ') .dbh-product-price'
                )
            }
        }
    )

    Then(/^I validate the order bill details on paymentPage$/, async () => {
        let shippingType
        let shippingCost

        await client.assert.containsText(
            cssSelectorsList.pageObjects.paymentPage.selectors
                .productQuantityPPage,
            totalItemsMyBag
        )
        await client.assert.containsText(
            cssSelectorsList.pageObjects.paymentPage.selectors.productCostPPage,
            subtotalMyBag
        )
        await client.getText(
            cssSelectorsList.pageObjects.paymentPage.selectors.shippingType,
            result => {
                shippingType = result.value.trim()
            }
        )
        await client.getText(
            cssSelectorsList.pageObjects.paymentPage.selectors.shippingCost,
            result => {
                shippingCost = result.value.trim()
            }
        )
        if (
            shippingType === 'Standard Delivery' &&
            (subtotalMyBag => '£1,000.00')
        ) {
            await client.assert.equal(shippingCost, 'FREE')
        }
    })
})
