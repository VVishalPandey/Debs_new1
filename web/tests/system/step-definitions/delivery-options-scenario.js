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
import {selectStore} from '../methods/selectStore'
import {countElements} from '../methods/elements'
import testData from '../test-data'

const cssSelectorsList = new PageObjects()

const testDataSet = process.env.TEST_DATA_SET || 'UK'

defineSupportCode(({Then}) => {
    let daytimeFirstEnableOption
    let daytimeFirstDisableOption
    let tempData
    Then(/^I validate all options under daytime$/, async () => {
        let i = 0
        let j = 1
        daytimeFirstEnableOption = 0
        daytimeFirstDisableOption = 0
        await client.click(
            cssSelectorsList.pageObjects.deliveryOptionPage.selectors.daytimeTab
        )
        //await client.pause(1000)
        await waitElementVisible('daytimeOptions', 'deliveryOptionPage')
        await client.elements(
            'css selector',
            cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                .daytimeOptions,
            result => {
                const els = result.value
                els.forEach(() => i++)
            }
        )
        for (j = i; j >= 1; j--) {
            await client.getAttribute(
                `.dbh-day-time li:nth-of-type(${j}) > button`,
                'class',
                result => {
                    if (result.value.includes('disabled')) {
                        daytimeFirstDisableOption = j
                    } else {
                        daytimeFirstEnableOption = j
                    }
                }
            )
        }
    })

    Then(/^I validate all options under evening time$/, async () => {
        let i = 0
        let j = 1
        daytimeFirstEnableOption = 0
        daytimeFirstDisableOption = 0
        await client.click(
            cssSelectorsList.pageObjects.deliveryOptionPage.selectors.eveningTab
        )
        //await client.pause(1000)
        await waitElementVisible('eveningOptions', 'deliveryOptionPage')
        await client.elements(
            'css selector',
            cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                .eveningOptions,
            result => {
                const els = result.value
                els.forEach(() => i++)
            }
        )
        for (j = i; j >= 1; j--) {
            await client.getAttribute(
                `.dbh-evening-time li:nth-of-type(${j}) > button`,
                'class',
                result => {
                    if (result.value.includes('disabled')) {
                        daytimeFirstDisableOption = j
                    } else {
                        daytimeFirstEnableOption = j
                    }
                }
            )
        }
    })

    Then(
        /^I validate first evening and daytime option navigation$/,
        async () => {
            let tab
            let isPresent

            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                    .checkoutNominatedModal,
                result => {
                    isPresent = result.value
                }
            )
            await client.getAttribute(
                '.t-checkout-shipping__delivery-slot-list .pw-tabs [role=tablist] > li:nth-child(1)',
                'class',
                result => {
                    if (result.value.includes('active')) {
                        tab = 1
                    } else {
                        tab = 2
                    }
                }
            )
            if (tab === 1 && daytimeFirstDisableOption > 0) {
                await client.click(
                    `.dbh-day-time li:nth-of-type(${daytimeFirstDisableOption}) > button`
                )
            } else if (tab === 2 && daytimeFirstDisableOption > 0) {
                await client.click(
                    `.dbh-evening-time li:nth-of-type(${daytimeFirstDisableOption}) > button`
                )
            }
            await waitElementVisible('daytimeTab', 'deliveryOptionPage')
            if (
                (!testDataSet.includes('TABLET-ROI') &&
                    testDataSet.includes('TABLET')) ||
                testDataSet.includes('DESKTOP')
            ) {
                await client.getText(
                    cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                        .nextNominatedSectionHeaderText,
                    result => {
                        client.assert.equal(
                            result.value.trim(),
                            'When would you like to receive your delivery?'
                        )
                    }
                )
            } else if (isPresent.length) {
                await client.getText(
                    cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                        .checkoutNominatedMsg,
                    result => {
                        client.assert.equal(result.value.trim(), '8am - 6pm')
                    }
                )
            } else {
                await client.getText(
                    cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                        .deliveryMessage,
                    result => {
                        client.assert.equal(
                            result.value.trim(),
                            'When would you like to receive your delivery?'
                        )
                    }
                )
            }
            await client.assert.elementPresent(
                cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                    .daytimeTab
            )
            await client.assert.elementPresent(
                cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                    .eveningTab
            )
            if (tab === 1 && isPresent.length) {
                await client.click(
                    `.dbh-day-time li:nth-of-type(${daytimeFirstEnableOption}) > button`
                )
                await client.pause(testData.implicitTimeOut)
                // await client.click(
                //     cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                //         .checkoutConfirmDeliveryDateButton
                // )
                await client.pause(testData.implicitTimeOut)
            } else if (tab === 1) {
                await client.click(
                    `.dbh-day-time li:nth-of-type(${daytimeFirstEnableOption}) > button`
                )
            } else if (tab === 2 && isPresent.length) {
                await client.click(
                    `.dbh-evening-time li:nth-of-type(${daytimeFirstEnableOption}) > button`
                )
                await client.pause(testData.implicitTimeOut)
                // await client.click(
                //     cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                //         .checkoutConfirmDeliveryDateButton
                // )
                await client.pause(testData.implicitTimeOut)
            } else if (tab === 2) {
                await client.click(
                    `.dbh-evening-time li:nth-of-type(${daytimeFirstEnableOption}) > button`
                )
                await client.pause(testData.implicitTimeOut)
            }
        }
    )

    Then(
        /^I "(.*?)" "(.*?)" store "(.*?)" from "(.*?)"$/,
        async (action, storeName, miles, page) => {
            await client.pause(testData.implicitTimeOut)
            const storeListExists = await countElements(
                'locateStorePage',
                'pudoStoreSearchResultText'
            )
            if (storeListExists === 1) {
                // const storeListCount = await getText('pudoStoreSearchResultText', 'locateStorePage')
                await client.assert.containsText(
                    cssSelectorsList.pageObjects.locateStorePage.selectors
                        .pudoStoreSearchResultText,
                    'results for'
                )
            }
            const store = storeName.toUpperCase()
            await selectStore(action, store, miles, page)
        }
    )

    Then(
        /^I verify default selected delivery option is "(.*?)"$/,
        async deliveryOption => {
            let temp
            await client.execute(
                function() {
                    temp = $('input[name="shipModId"]:checked').val()
                    return temp
                },
                function(result) {
                    temp = result.value
                }
            )
            console.log(temp)
            if (deliveryOption === 'StandardPudo') {
                await client.assert.equal(temp, '19505')
            } else if (deliveryOption === 'ExpressPudo') {
                await client.assert.equal(temp, '19504')
            }
        }
    )
})
