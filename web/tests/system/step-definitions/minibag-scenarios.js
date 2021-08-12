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
import {clickByJQuery, click} from '../methods/click'
import testData from '../test-data'

const testDataSet = process.env.TEST_DATA_SET || 'UK'

const cssSelectorsList = new PageObjects()

defineSupportCode(({Then}) => {
    let minibagCount = 0
    let minibagCountNew = 0

    Then(/^I should validate minibag count "(.*?)"$/, async action => {
        let i = 0
        let tempDifference
        let difference
        await client.elements(
            'css selector',
            cssSelectorsList.pageObjects.minibagPage.selectors.minibagCount,
            result => {
                const els = result.value
                els.forEach(() => i++)
            }
        )
        i = String(i)
        if (i === '0' && action === 'before') {
            minibagCount = 0
        } else if (i === '1' && action === 'after') {
            await client.getText(
                cssSelectorsList.pageObjects.minibagPage.selectors.minibagCount,
                result => {
                    minibagCountNew = result.value.trim()
                }
            )
        } else if (i === '1' && action === 'before') {
            await client.getText(
                cssSelectorsList.pageObjects.minibagPage.selectors.minibagCount,
                result => {
                    minibagCount = result.value.trim()
                }
            )
        } else {
            tempDifference = action.split(' ')
            difference = tempDifference[2]
            await client.assert.equal(
                minibagCountNew - minibagCount,
                difference
            )
        }
    })

    Then(
        /^I should validate name of product "(.*?)" as "(.*?)" on minibag page$/,
        async (productNo, productName) => {
            let displayName
            await client.getText(
                '.t-mini-cart__content .t-mini-cart__product-list .pw-list div:nth-child(' +
                    productNo +
                    ') div:nth-child(2) h2',
                result => {
                    displayName = result.value.trim()
                }
            )
            await client.assert.equal(productName, displayName)
        }
    )

    Then(
        /^I should "(.*?)" product "(.*?)" from minibag page$/,
        async (validate, productNo) => {
            let currentSubTotal
            if (validate === 'validate subtotal & remove') {
                await client.getText('.t-mini-cart__subtotal div', result => {
                    currentSubTotal = result.value.trim()
                })
                await client.click(
                    '.t-mini-cart__content .t-mini-cart__product-list .pw-list div:nth-child(' +
                        productNo +
                        ') div:nth-child(3) button'
                )
                await client.pause(testData.implicitTimeOut)
                await client.expect
                    .element(`.t-mini-cart__subtotal div`)
                    .text.not.to.equal(currentSubTotal)
            } else {
                await client.click(
                    '.t-mini-cart__content .t-mini-cart__product-list .pw-list div:nth-child(' +
                        productNo +
                        ') div:nth-child(3) button'
                )
                await client.pause(testData.implicitTimeOut)
            }
        }
    )

    Then(/^I empty mini bag$/, async () => {
        let i = 0
        let j
        let productName
        let isSecondPresent = 0
        await waitElementNotPresent('skeletonBlock', 'commonPage')
        await waitElementNotPresent('loader', 'commonPage')
        await waitElementVisible('miniBagButton', 'pdpPage')
        await client.click(
            cssSelectorsList.pageObjects.pdpPage.selectors.miniBagButton
        )
        await client.pause(testData.implicitTimeOut)
        await waitElementNotPresent('loader', 'commonPage')
        await waitElementNotPresent('skeletonBlock', 'commonPage')
        await client.elements(
            'css selector',
            cssSelectorsList.pageObjects.minibagPage.selectors
                .totalRemoveProductIcon,
            result => {
                const els = result.value
                els.forEach(() => i++)
            }
        )
        while (i !== 0) {
            await waitElementNotPresent('loader', 'commonPage')
            await waitElementNotPresent('removeConfirm', 'minibagPage')
            await waitElementPresent('firstProductTitle', 'minibagPage')
            await client.getText(
                cssSelectorsList.pageObjects.minibagPage.selectors
                    .firstProductTitle,
                result => {
                    productName = result.value.trim()
                }
            )
            if (productName.includes('Gift')) {
                isSecondPresent = 0
                await waitElementPresent('secondProductRemove', 'minibagPage')
                await client.elements(
                    'css selector',
                    cssSelectorsList.pageObjects.minibagPage.selectors
                        .secondProductRemove,
                    result => {
                        const els = result.value
                        els.forEach(() => isSecondPresent++)
                    }
                )
                if (isSecondPresent === 1) {
                    await client.click(
                        cssSelectorsList.pageObjects.minibagPage.selectors
                            .secondProductRemove
                    )
                    await client.pause(testData.implicitTimeOut)
                    if (
                        !testDataSet.includes('DESKTOP') &&
                        !testDataSet.includes('TABLET')
                    ) {
                        await click('removeConfirmButton', 'minibagPage')
                        await client.pause(testData.implicitTimeOut)
                    }
                }
            } else {
                await waitElementPresent('removeProductIcon', 'minibagPage')
                await clickByJQuery(
                    cssSelectorsList.pageObjects.minibagPage.selectors
                        .removeProductIcon
                )
                await client.pause(testData.implicitTimeOut)
                if (
                    !testDataSet.includes('DESKTOP') &&
                    !testDataSet.includes('TABLET')
                ) {
                    await click('removeConfirmButton', 'minibagPage')
                    await client.pause(testData.implicitTimeOut)
                }
            }
            await waitElementNotPresent('loader', 'commonPage')
            i = 0
            await client.pause(testData.implicitTimeOut)
            await waitElementNotPresent('removeConfirm', 'minibagPage')
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects.minibagPage.selectors
                    .totalRemoveProductIcon,
                result => {
                    const els = result.value
                    els.forEach(() => i++)
                }
            )
        }
        await waitElementPresent('emptyBagMessage', 'minibagPage')
        await clickByJQuery(
            cssSelectorsList.pageObjects.minibagPage.selectors.closeButton
        )
    })
})
