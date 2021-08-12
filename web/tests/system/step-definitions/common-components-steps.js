import {client} from 'nightwatch-cucumber'
import {defineSupportCode, clearSupportCodeFns} from 'cucumber'
import PageObjects from '../page-objects/page-objects'
import {menuValidation} from '../methods/menuSubMenuValidateAndClick'
import {
    explicitPagePause,
    waitElementVisible,
    waitElementNotPresent,
    waitElementPresent
} from '../methods/explicitWait'
import {profiles} from '../site-ssr'
import {collapseOpenAccordionLocator} from '../methods/collapseOpenAccordion'
import {clearText} from '../methods/clearText'
import {
    getText,
    getTextBySelector,
    getCharactersFromString
} from '../methods/getText'
import {clickByJQuery, click} from '../methods/click'
import {stepper} from '../methods/stepperLogic'
import {goBack} from '../methods/navigateBack'
import {scrollToWithinSelector, scrollToPosition} from '../methods/scrollTo'
import {
    moveToElementByLocation,
    moveToElementAndClickByLocation,
    moveToElementByLocator
} from '../methods/moveToElement'
import {removeProducts, addRemoveProduct} from '../methods/removeProducts'
import testData from '../test-data'
import {countElements} from '../methods/elements'
import {pageRefresh} from '../methods/refresh'
import {getCookie, cookieBannerClose} from '../methods/cookies'
import {clearValue} from '../methods/clearValue'
import {checkStatusCode} from '../methods/statusCode'

const testDataSet = process.env.TEST_DATA_SET || 'UK'

const cssSelectorsList = new PageObjects()

defineSupportCode(({Given, Then, When}) => {
    let currentMessage
    let filterButtonCheck
    let tempData

    Given(/^I navigate to "(.*?)"$/, async url => {
        await profiles(url)
        // await client.url(testData[url])
        await cookieBannerClose()
    })

    Then(
        /^I should see "(.*?)" as "(.*?)" on "(.*?)"$/,
        async (locator, text, page) => {
            await client.pause(testData.implicitTimeOut)

            if (locator === 'titleOfPage') {
                await client.assert.title(text)
            } else if (text.includes('TestText')) {
                await client.waitForElementVisible(
                    cssSelectorsList.pageObjects[page].selectors[locator],
                    20000
                )
                await client.getText(
                    cssSelectorsList.pageObjects[page].selectors[locator],
                    result => {
                        client.assert.equal(
                            result.value.trim().toUpperCase(),
                            testData[text].toUpperCase()
                        )
                    }
                )
            } else {
                await scrollToPosition(page, locator)
                await client.waitForElementPresent(
                    cssSelectorsList.pageObjects[page].selectors[locator],
                    10000
                )
                await client.getText(
                    cssSelectorsList.pageObjects[page].selectors[locator],
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
        /^I should see value of "(.*?)" as "(.*?)" on "(.*?)"$/,
        async (locator, text, page) => {
            await client.pause(testData.implicitTimeOut)
            await scrollToPosition(page, locator)
            await waitElementVisible(locator, page)
            // await client.waitForElementVisible(cssSelectorsList.pageObjects[page].selectors[locator], 10000)
            await client.getValue(
                cssSelectorsList.pageObjects[page].selectors[locator],
                result => {
                    client.assert.equal(result.value, text)
                }
            )
        }
    )

    Then(/^I should see "(.*?)" exist on "(.*?)"$/, async (locator, page) => {
        await client.pause(testData.implicitTimeOut)
        await scrollToPosition(page, locator)
        await waitElementPresent(locator, page)
        // await client.waitForElementVisible(cssSelectorsList.pageObjects[page].selectors[locator], 10000)
        await client.assert.elementPresent(
            cssSelectorsList.pageObjects[page].selectors[locator]
        )
        if (locator === 'orderNumber') {
            const webLoyaltyPopUpExist = await countElements(
                'orderConfirmationPage',
                'webLoyaltyPopUpCloseIcon'
            )
            if (webLoyaltyPopUpExist) {
                await click('webLoyaltyPopUpCloseIcon', 'orderConfirmationPage')
            }
            const orderNumber = await getText(
                'orderNumber',
                'orderConfirmationPage'
            )
            console.log('orderNumber===>', orderNumber)
        }
    })

    When(/^I clear "(.*?)" on "(.*?)"$/, async (locator, page) => {
        let string
        let j
        await waitElementVisible(locator, page)
        await client.getValue(
            cssSelectorsList.pageObjects[page].selectors[locator],
            result => {
                string = result.value
            }
        )
        const length = string.length
        for (j = 1; j <= length; j++) {
            await client.setValue(
                cssSelectorsList.pageObjects[page].selectors[locator],
                '\u0008'
            )
        }
        await client.pause(testData.implicitTimeOut)
    })

    When(
        /^I enter "(.*?)" in "(.*?)" on "(.*?)"$/,
        async (value, locator, page) => {
            await waitElementVisible(locator, page)
            // await client.waitForElementVisible(cssSelectorsList.pageObjects[page].selectors[locator], 10000)
            // await client.clearValue(cssSelectorsList.pageObjects[page].selectors[locator])
            if (locator === 'stepperCount') {
                await stepper(value)
            } else {
                await clearText(locator, page)
                await client.pause(testData.implicitTimeOut)
                if (value.includes('TestText')) {
                    await client.setValue(
                        cssSelectorsList.pageObjects[page].selectors[locator],
                        testData[value]
                    )
                } else {
                    await client.setValue(
                        cssSelectorsList.pageObjects[page].selectors[locator],
                        value
                    )
                }
            }
            await client.pause(testData.implicitTimeOut)
            if (
                locator === 'creditCardIDField' &&
                !testDataSet.includes('DESKTOP')
            ) {
                await click('creditCardIcons', 'paymentPage')
            }
        }
    )

    When(/^I click on "(.*?)" on "(.*?)"$/, async (locator, page) => {
        if (
            locator === 'filterButton' &&
            page === 'pspPage' &&
            testDataSet.includes('DESKTOP')
        ) {
            await client.pause(testData.implicitTimeOut)
            await waitElementVisible('firstProductImage', page)
            // await client.waitForElementVisible(cssSelectorsList.pageObjects[page].selectors.firstProductImage, 10000)
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects[page].selectors[locator],
                result => {
                    filterButtonCheck = result.value
                }
            )
            if (filterButtonCheck.length) {
                await client.pause(testData.implicitTimeOut)
                await waitElementVisible(locator, page)
                // await client.waitForElementVisible(cssSelectorsList.pageObjects[page].selectors[locator], 10000)
                await client.click(
                    cssSelectorsList.pageObjects[page].selectors[locator]
                )
            }
            await waitElementNotPresent('loader', 'commonPage')
        }
        //  this cndition has been incrporated untill next/nominated option is not yet decided to be removed or kept
        else if (
            locator === 'standardOption' &&
            page === 'deliveryOptionPage'
        ) {
            const nextNominatedOption = await countElements(
                'deliveryOptionPage',
                'standardOption'
            )
            if (nextNominatedOption === 0) {
                await click('nextNominatedOption', 'deliveryOptionPage')
            } else {
                await click('standardOption', 'deliveryOptionPage')
            }
        }
        // This condition has been specifically to put the check the generic error message on payment for order placements
        else if (locator === 'placeOrderButton' && page === 'paymentPage') {
            await click(locator, page)
            await client.pause(testData.implicitTimeOut)
            await waitElementNotPresent('loader', 'commonPage')
            await waitElementNotPresent('skeletonBlock', 'commonPage')
            await explicitPagePause()
            const paymentErrorExists = await countElements(
                'paymentPage',
                'genericNotAuthError'
            )
            if (paymentErrorExists) {
                await click(locator, page)
                await client.pause(testData.implicitTimeOut)
            }
        } else {
            await client.pause(testData.implicitTimeOut)
            await waitElementPresent(locator, page)
            // await scrollToPosition(page, locator)
            // await client.waitForElementVisible(cssSelectorsList.pageObjects[page].selectors[locator], 10000)
            // await client.click(
            //     cssSelectorsList.pageObjects[page].selectors[locator]
            // )
            await click(locator, page)
            await client.pause(testData.implicitTimeOut)
        }
        await explicitPagePause()
        // await waitElementNotPresent('skeletonBlock', 'commonPage')
        await waitElementNotPresent('loader', 'commonPage')
        // await client.pause(3000)
        // await client.waitForElementVisible('body', 3000)
    })

    When(
        /^I click using JQuery on "(.*?)" on "(.*?)"$/,
        async (locator, page) => {
            await clickByJQuery(
                cssSelectorsList.pageObjects[page].selectors[locator]
            )
        }
    )

    Then(
        /^I wait for "(.*?)" element to be visible on "(.*?)"$/,
        async (locator, page) => {
            await waitElementVisible(locator, page)
            // await client.waitForElementVisible(cssSelectorsList.pageObjects[page].selectors[locator], 15000)
        }
    )

    Then(/^I should not see "(.*?)" on "(.*?)"$/, async (locator, page) => {
        await waitElementNotPresent(locator, page)
        await client.assert.elementNotPresent(
            cssSelectorsList.pageObjects[page].selectors[locator]
        )
    })

    Then(/^I should see "(.*?)" contains "(.*?)"$/, async (type, text) => {
        await client.pause(testData.implicitTimeOut)
        if (type === 'url') {
            let counter = 2
            let currentUrl
            while (counter > 1) {
                await client.url(result => {
                    currentUrl = result.value
                })
                if (currentUrl.includes(text)) {
                    break
                } else {
                    await client.pause(testData.implicitTimeOut)
                    counter--
                }
            }
            if (!text.includes('/') && text.includes('urlPartOf')) {
                await client.assert.urlContains(testData[text])
            } else if (!text.includes('/') && text.includes('TestText')) {
                await client.assert.urlContains(testData[text])
            } else {
                await client.assert.urlContains(text)
            }
        } else {
            await waitElementVisible(type, 'pspPage')
            // await client.waitForElementVisible(cssSelectorsList.pageObjects.pspPage.selectors[type], 10000)
            await client.assert.containsText(
                cssSelectorsList.pageObjects.pspPage.selectors[type],
                text
            )
        }
    })

    Then(
        /^I should see "(.*?)" containing "(.*?)" on "(.*?)"$/,
        async (type, text, page) => {
            await waitElementVisible(type, page)
            await client.pause(testData.implicitTimeOut)
            if (type === 'cardNumberMasked') {
                const cardNumberWholeText = await getText(type, page)
                console.log(cardNumberWholeText)
                const cardNumberLast4Digit = await getCharactersFromString(
                    cardNumberWholeText,
                    4
                )
                console.log(cardNumberLast4Digit)
                await client.assert.containsText(
                    cssSelectorsList.pageObjects[page].selectors[type],
                    cardNumberLast4Digit
                )
            } else {
                await client.assert.containsText(
                    cssSelectorsList.pageObjects[page].selectors[type],
                    text
                )
            }
            // await client.waitForElementVisible(cssSelectorsList.pageObjects[page].selectors[type], 10000)
        }
    )

    Then(
        /^I validate "(.*?)" of "(.*?)" as "(.*?)" on "(.*?)"$/,
        async (attributeName, locator, type, page) => {
            await waitElementVisible(locator, page)
            // await client.waitForElementVisible(cssSelectorsList.pageObjects[page].selectors[locator], 10000)
            await client.assert.attributeEquals(
                cssSelectorsList.pageObjects[page].selectors[locator],
                attributeName,
                type
            )
        }
    )

    Then(
        /^I verify "(.*?)" of "(.*?)" as "(.*?)" on "(.*?)"$/,
        async (attributeName, locator, url, page) => {
            await client.pause(testData.implicitTimeOut)
            await waitElementVisible(locator, page)
            // await client.waitForElementVisible(cssSelectorsList.pageObjects[page].selectors[locator], 10000)
            await client.assert.attributeContains(
                cssSelectorsList.pageObjects[page].selectors[locator],
                attributeName,
                testData[url]
            )
        }
    )

    Then(
        /^I should see "(.*?)" "(.*?)" on "(.*?)"$/,
        async (locator, state, page) => {
            if (page === 'pspPage') {
                await client.pause(testData.implicitTimeOut)
                await waitElementNotPresent('loader', 'commonPage')
            }
            if (state === 'disabled') {
                await client.getAttribute(
                    cssSelectorsList.pageObjects[page].selectors[locator],
                    'disabled',
                    result => {
                        client.assert.equal(result.value, 'true')
                    }
                )
            } else if (state === 'enabled') {
                await scrollToPosition(page, locator)
                await waitElementPresent(locator, page)
                // await client.waitForElementVisible(cssSelectorsList.pageObjects[page].selectors[locator], 10000)
                await client.getAttribute(
                    cssSelectorsList.pageObjects[page].selectors[locator],
                    'disabled',
                    result => {
                        client.assert.equal(result.value, null)
                    }
                )
            }
        }
    )

    When(/^I wait for "(.*?)" milliseconds$/, async time => {
        await client.pause(time)
    })

    When(
        /^I "(.*?)" "(.*?)" accordion on "(.*?)"$/,
        async (action, locator, page) => {
            await waitElementVisible(locator, page)
            await collapseOpenAccordionLocator(action, locator, page)
        }
    )

    When(/^I am in view of "(.*?)" on "(.*?)"$/, async (locator, page) => {
        let posX
        let posY

        await scrollToPosition(page, locator)
        await waitElementVisible(locator, page)

        await client.getLocation(
            cssSelectorsList.pageObjects[page].selectors[locator],
            result => {
                posX = result.value.x
                posY = result.value.y - 60
            }
        )
        await client.execute(`scrollTo(${posX},${posY})`)
    })

    When(
        /^I count number of "(.*?)" to be "(.*?)" on "(.*?)"$/,
        async (locator, count, page) => {
            let i = 0
            await waitElementVisible(locator, page)
            // await client.waitForElementVisible(cssSelectorsList.pageObjects[page].selectors[locator], 10000)
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects[page].selectors[locator],
                result => {
                    const els = result.value
                    els.forEach(() => i++)
                }
            )
            await waitElementNotPresent('loader', 'commonPage')
            await client.assert.equal(i, count)
        }
    )

    Then(/^I go back to previous page$/, async () => {
        let currentUrl
        let newUrl
        await client.url(result => {
            currentUrl = result.value
        })
        // await client.back()
        goBack()
        await client.pause(testData.implicitTimeOut)
        await client.url(result => {
            newUrl = result.value
        })
        await client.assert.notEqual(currentUrl, newUrl, 'Url are different')
        let isCountrySelectorPresent
        await client.elements(
            'css selector',
            cssSelectorsList.pageObjects.commonPage.selectors
                .countrySelectorpopupclose,
            result => {
                isCountrySelectorPresent = result.value
            }
        )
        if (isCountrySelectorPresent.length) {
            await client.click(
                cssSelectorsList.pageObjects.commonPage.selectors
                    .countrySelectorpopupclose
            )
            await waitElementNotPresent(
                'countrySelectorpopupclose',
                'commonPage'
            )
        }
    })

    Then(
        /^I should see the value of "(.*?)" in following "(.*?)" on "(.*?)"$/,
        async (locator, menuOptions, page) => {
            await client.getText(
                cssSelectorsList.pageObjects[page].selectors[locator],
                result => {
                    client.assert.equal(
                        result.value.trim(),
                        testData[menuOptions]
                    )
                }
            )
        }
    )

    Then(
        /^I "(.*?)" option is available in "(.*?)" as "(.*?)" on "(.*?)"$/,
        async (option, locator2, parentText, page) => {
            await menuValidation(option, locator2, parentText, page)
        }
    )

    Then(
        /^I "(.*?)" option from "(.*?)" of "(.*?)"  as "(.*?)" as "(.*?)" on "(.*?)"$/,
        async (option, locator2, parentText, locator3, childText, page) => {
            let i = 0
            let j
            let count = 0
            let found
            let res
            let finalres
            let options
            let sub
            let subMenuOption
            let startValue = 1
            let numb

            await waitElementPresent(locator2, page)
            // For footer menu list
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects[page].selectors[locator2],
                result => {
                    const els = result.value
                    els.forEach(() => i++)
                }
            )
            if (
                locator2 === 'scatfilterMenuList' ||
                locator2 === 'tcatfilterMenuList'
            ) {
                for (j = 1; j <= i; j++) {
                    options = locator2.replace('List', 'Option')
                    res = cssSelectorsList.pageObjects[page].selectors[
                        options
                    ].replace(/[0-9]/g, `${j}`)
                    await client.getText(res, result => {
                        if (result.value.trim() === parentText) {
                            found = j
                            finalres = res
                            count++
                        }
                    })
                }
                if (option === 'validate') {
                    client.assert.equal(count, '1')
                } else if (option === 'validate & click') {
                    await client.assert.equal(count, '1')
                    numb = 0
                    numb = res.match(/\d/g)
                    numb = numb.join('')
                    finalres = res.replace(numb, `${found}`)
                    await client.getLocationInView(finalres)
                }
            } else {
                for (j = 1; j <= i; j++) {
                    options = locator2.replace('List', 'Option')
                    numb = cssSelectorsList.pageObjects[page].selectors[
                        options
                    ].match(/\d/g)
                    numb = numb.join('')
                    res = cssSelectorsList.pageObjects[page].selectors[
                        options
                    ].replace(numb, `${j}`)
                    await client.getText(res, result => {
                        if (result.value.trim() === parentText) {
                            found = j
                            count++
                        }
                    })
                }
                if (option === 'validate') {
                    await client.assert.equal(count, '1')
                } else if (option === 'validate & click') {
                    await client.assert.equal(count, '1')
                    numb = 0
                    numb = res.match(/\d/g)
                    numb = numb.join('')
                    finalres = res.replace(numb, `${found}`)
                    await client.getLocationInView(finalres)
                }
            }
            // sub filter options
            count = 0
            i = 0
            const updatefound = cssSelectorsList.pageObjects[page].selectors[
                locator3
            ].replace('found', `${found}`)
            await client.elements('css selector', updatefound, result => {
                const els = result.value
                els.forEach(() => i++)
            })
            if (
                parentText === 'Categories' ||
                parentText === 'Price' ||
                parentText === 'Discount'
            ) {
                for (j = 1; j <= i; j++) {
                    options = locator3.replace('List', 'Option')
                    sub = cssSelectorsList.pageObjects[page].selectors[options]
                        .replace('found', `${found}`)
                        .replace('sonOf', `${j}`)
                    await client.getText(sub, result => {
                        if (result.value.trim().startsWith(childText)) {
                            subMenuOption = sub
                            count++
                        }
                    })
                }
                if (option === 'validate') {
                    await client.assert.equal(count, '1')
                } else if (option === 'validate & click') {
                    await client.assert.equal(count, '1')
                    await client.getLocationInView(subMenuOption, function(
                        result
                    ) {
                        client.click(subMenuOption)
                        client.pause(3000)
                    })
                }
            } else if (childText === 'View') {
                for (j = 1; j <= i; j++) {
                    options = locator3.replace('List', 'Option')
                    sub = cssSelectorsList.pageObjects[page].selectors[options]
                        .replace('found', `${found}`)
                        .replace('sonOf', `${j}`)
                    await client.getText(sub, result => {
                        if (result.value.trim().startsWith(childText)) {
                            subMenuOption = sub
                            count++
                        }
                    })
                }
                if (option === 'validate') {
                    await client.assert.equal(count, '1')
                } else if (option === 'validate & click') {
                    await client.assert.equal(count, '1')
                    numb = 0
                    numb = res.match(/\d/g)
                    numb = numb.join('')
                    finalres = res.replace(numb, `${found + 2}`)
                    await client.getLocationInView(finalres)
                    await client.click(subMenuOption)
                    await client.pause(3000)
                }
            } else if (
                locator2 === 'filterMenuList' ||
                locator2 === 'scatfilterMenuList' ||
                locator2 === 'tcatfilterMenuList'
            ) {
                for (j = 1; j <= i; j++) {
                    options = locator3.replace('List', 'Option')
                    sub = cssSelectorsList.pageObjects[page].selectors[options]
                        .replace('found', `${found}`)
                        .replace('sonOf', `${j}`)
                    const filterSubMenuText = await getTextBySelector(sub)
                    if (filterSubMenuText.trim().startsWith(childText)) {
                        subMenuOption = sub
                        count++
                        break
                    }
                }
                if (option === 'validate') {
                    await client.assert.equal(count, '1')
                } else if (option === 'validate & click') {
                    await client.assert.equal(count, '1')
                    await client.getLocationInView(subMenuOption)

                    let filterSubMenuInputSelect = subMenuOption.replace(
                        'label',
                        'input'
                    )
                    if (locator3 === 'filterSubMenuViewCheckboxList') {
                        filterSubMenuInputSelect = cssSelectorsList.pageObjects[
                            page
                        ].selectors.filterSubMenuBrandSearchResult
                            .replace('found', `${found}`)
                            .replace('sonOf', `${j}`)
                    }
                    await scrollToWithinSelector(filterSubMenuInputSelect)
                    await client.click(filterSubMenuInputSelect)
                    await client.pause(3000)
                }
            } else if (locator2 === 'footerMenuList') {
                if (
                    testDataSet.includes('TABLET') ||
                    testDataSet.includes('DESKTOP')
                ) {
                    startValue = 2
                    i++
                }
                for (j = startValue; j <= i; j++) {
                    options = locator3.replace('List', 'Option')
                    sub = cssSelectorsList.pageObjects[page].selectors[options]
                        .replace('found', `${found}`)
                        .replace('sonOf', `${j}`)
                    await client.getText(sub, result => {
                        if (result.value.trim() === childText) {
                            subMenuOption = sub
                            count++
                        }
                    })
                }
                if (option === 'validate') {
                    await client.assert.equal(count, '1')
                    await client.getLocationInView(subMenuOption, function(
                        result
                    ) {
                        const url = childText.replace(/\s+/g, '').concat('Href')
                        client.assert.attributeContains(
                            subMenuOption,
                            'href',
                            testData[`${url}`]
                        )
                    })
                } else if (option === 'validate & click') {
                    await client.assert.equal(count, '1')
                    await client.getLocationInView(subMenuOption, function(
                        result
                    ) {
                        const url = childText.replace(/\s+/g, '').concat('Href')
                        client.assert.attributeContains(
                            subMenuOption,
                            'href',
                            testData[`${url}`]
                        )
                    })
                    await client.click(subMenuOption)
                }
            }
        }
    )

    Then(/^I remove all the items in my bag$/, async () => {
        let i = 0
        let len
        await client.elements(
            'css selector',
            cssSelectorsList.pageObjects.minibagPage.selectors
                .secureCheckoutButton,
            result => {
                len = result.value
                if (result.value.length) {
                    client.click(
                        cssSelectorsList.pageObjects.minibagPage.selectors
                            .secureCheckoutButton
                    )
                    client.pause(testData.implicitTimeOut)
                }
            }
        )
        if (len.length) {
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects.myBagPage.selectors
                    .firstProductRemove,
                result => {
                    const els = result.value
                    els.forEach(() => i++)
                }
            )
            while (i > 0) {
                await client.click(
                    cssSelectorsList.pageObjects.myBagPage.selectors
                        .firstProductRemove
                )
                await client.pause(testData.implicitTimeOut)
                await client.click(
                    cssSelectorsList.pageObjects.myBagPage.selectors
                        .removePopUpYesButton
                )
                await client.pause(testData.implicitTimeOut)
                i = 0
                await client.elements(
                    'css selector',
                    cssSelectorsList.pageObjects.myBagPage.selectors
                        .firstProductRemove,
                    result => {
                        const els = result.value
                        els.forEach(() => i++)
                    }
                )
            }
        }
    })
    Then(
        /^I "(.*?)" country as "(.*?)" from "(.*?)" on "(.*?)"$/,
        async (option, country, locator, page) => {
            let i = 0
            let j
            let count = 0
            let found
            let res
            let options
            let posX
            let posY
            let selectedCountry

            await cookieBannerClose()
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects.commonPage.selectors
                    .countrySelectorLinkMenuClose,
                result => {
                    tempData = result.value
                }
            )
            if (tempData.length) {
                await clickByJQuery(
                    cssSelectorsList.pageObjects.commonPage.selectors
                        .countrySelectorLinkMenuClose
                )
                await waitElementNotPresent('closeIcon', 'commonPage')
            }
            await client.pause(2000)
            if (!testDataSet.includes('DESKTOP')) {
                await click('menuIcon', 'commonPage')
                await scrollToPosition('commonPage', 'selectedCountryName')
                await client.pause(testData.implicitTimeOut)
            }
            await client.getLocation(
                cssSelectorsList.pageObjects[page].selectors
                    .countrySelectorLink,
                result => {
                    posX = result.value.x
                    posY = result.value.y - 40
                }
            )
            await client.execute(`scrollTo(${posX},${posY})`)
            await client.getText(
                cssSelectorsList.pageObjects.commonPage.selectors
                    .selectedCountryName,
                result => {
                    selectedCountry = result.value.trim()
                }
            )
            if (selectedCountry !== country) {
                await waitElementVisible('countrySelectorLink', 'commonPage')
                await click('countrySelectorLink', 'commonPage')
                await client.elements(
                    'css selector',
                    cssSelectorsList.pageObjects[page].selectors[locator],
                    result => {
                        const els = result.value
                        els.forEach(() => i++)
                    }
                )
                for (j = 1; j <= i; j++) {
                    options = locator.replace('Options', 'List')
                    await client.pause(testData.implicitTimeOut)
                    res = cssSelectorsList.pageObjects[page].selectors[
                        options
                    ].replace(/[0-9]/g, `${j}`)
                    await client.getText(res, result => {
                        if (result.value.trim() === country) {
                            found = res
                            count++
                        }
                    })
                }
                if (option === 'validate') {
                    await client.assert.equal(count, '1')
                } else if (option === 'validate & click') {
                    await client.assert.equal(count, '1')
                    await client.getLocationInView(found, result => {
                        client.click(found)
                        client.pause(testData.implicitTimeOut)
                    })
                }
                await client.pause(testData.implicitTimeOut)
                await waitElementPresent('selectedCountryName', 'commonPage')
                await cookieBannerClose()

                if (!testDataSet.includes('DESKTOP')) {
                    await click('menuIcon', 'commonPage')
                    await scrollToPosition('commonPage', 'selectedCountryName')
                    await client.pause(testData.implicitTimeOut)
                    await client.getText(
                        cssSelectorsList.pageObjects.commonPage.selectors
                            .selectedCountryName,
                        result => {
                            selectedCountry = result.value.trim()
                        }
                    )
                    await clickByJQuery(
                        cssSelectorsList.pageObjects.commonPage.selectors
                            .closeIcon
                    )
                    await waitElementNotPresent('closeIcon', 'commonPage')
                } else {
                    await client.getText(
                        cssSelectorsList.pageObjects.commonPage.selectors
                            .selectedCountryName,
                        result => {
                            selectedCountry = result.value.trim()
                        }
                    )
                }
                await client.pause(testData.implicitTimeOut)
                await client.assert.equal(selectedCountry, country)
            }
            await cookieBannerClose()
        }
    )

    // Created by Vadri
    // Given(/^I validate the analytics request for "(.*?)"$/ , async (url) => {
    //     console.log("started")
    //     var request = require('request')
    //     //var debug = require('request-debug')
    //     //debug(request)

    //     request(testData[url], function (request, response, body) {
    //     console.log('requestpayload', request && request.header)
    //     console.log('statusCode:', response && response.statusCode); // Print the response status code if a response was received
    //    // console.log('body:', body); // Print the HTML for the Google homepage.
    //     })
    // })

    // Created by Vishal
    // Given(/^I validate the analytics request for "(.*?)"$/, async (url) => {
    //     // Hit URL & Capture Response
    //     const HttpClient = function() {
    //         this.get = function(aUrl, aCallback) {
    //             const XMLHttpRequest = require('xhr2')
    //             const anHttpRequest = new XMLHttpRequest()
    //             anHttpRequest.onreadystatechange = function() {
    //                 if (anHttpRequest.readyState === 4 && anHttpRequest.status === 200) { aCallback(anHttpRequest.responseText) }
    //             }
    //             anHttpRequest.open('GET', aUrl, true)
    //             anHttpRequest.send(null)
    //         }
    //     }
    //     const client1 = new HttpClient()
    //     await client1.get('http://www.debenhams.com/', (response) => {
    //         // do something with response
    //         console.log('response ', response)
    //     })
    // })

    Then(
        /^I validate that the address is removed after clicking "(.*?)" on "(.*?)"$/,
        async (locator, page) => {
            let existAddress
            let newAddress

            await client.getText(
                cssSelectorsList.pageObjects[page].selectors
                    .existingAddressDetails,
                result => {
                    existAddress = result.value.trim()
                }
            )
            await client.click(
                cssSelectorsList.pageObjects[page].selectors[locator]
            )
            await client.pause(2000)
            await client.getText(
                cssSelectorsList.pageObjects[page].selectors
                    .existingAddressDetails,
                result => {
                    newAddress = result.value.trim()
                }
            )
            await client.assert.notEqual(newAddress, existAddress)
        }
    )

    Then(
        /^I verify "(.*?)" of "(.*?)" containing "(.*?)" on "(.*?)"$/,
        async (attributeName, locator, url, page) => {
            await client.waitForElementVisible(
                cssSelectorsList.pageObjects[page].selectors[locator],
                10000
            )
            await client.assert.attributeContains(
                cssSelectorsList.pageObjects[page].selectors[locator],
                attributeName,
                testData[url]
            )
        }
    )

    Then(
        /^I store the "(.*?)" displayed on "(.*?)"$/,
        async (locator, page) => {
            await client.getText(
                cssSelectorsList.pageObjects[page].selectors[locator],
                result => {
                    currentMessage = result.value.trim()
                }
            )
        }
    )

    Then(
        /^I verify that "(.*?)" is updated on "(.*?)"$/,
        async (locator, page) => {
            let updatedMesssage
            await client.getText(
                cssSelectorsList.pageObjects[page].selectors[locator],
                result => {
                    updatedMesssage = result.value.trim()
                }
            )
            await client.assert.notEqual(updatedMesssage, currentMessage)
        }
    )

    Then(/^I close the browser$/, async () => {
        await client.end()
    })

    Then(/^I should scroll to "(.*?)" on "(.*?)"$/, async (locator, page) => {
        let posX
        let posY
        let y

        if (locator === 'subscribeButton') {
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
            await client.pause(testData.implicitTimeOut)
        }

        await client.getLocation(
            cssSelectorsList.pageObjects[page].selectors[locator],
            result => {
                posX = result.value.x
                posY = result.value.y - 150
            }
        )
        for (y = 40; y <= posY; y = y + 40) {
            await client.execute(`scrollTo(${posX},${y})`)
        }
    })

    Then(/^I move to "(.*?)" on "(.*?)"$/, async (locator, page) => {
        await moveToElementByLocator(locator, page)
    })

    Given(
        /^I navigate to "(.*?)" and validate that the mobify tag is present$/,
        async url => {
            await profiles(url)
            await client.pause(testData.implicitTimeOut)
            await client.source(result => {
                tempData = result.value
            })
            const contains = tempData.includes(testData.mobifyTag)
            await client.assert.notEqual(contains, false)
            let isCountrySelectorPresent
            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects.commonPage.selectors
                    .countrySelectorpopupclose,
                result => {
                    isCountrySelectorPresent = result.value
                }
            )
            if (isCountrySelectorPresent.length) {
                await client.click(
                    cssSelectorsList.pageObjects.commonPage.selectors
                        .countrySelectorpopupclose
                )
                await waitElementNotPresent(
                    'countrySelectorpopupclose',
                    'commonPage'
                )
            }
        }
    )

    Then(/^I should verify the country flag for "(.*?)"$/, async country => {
        tempData = cssSelectorsList.pageObjects.commonPage.selectors.countrySelectorFlag.replace(
            'gb',
            country
        )
        // await waitElementVisible(tempData, 'commonPage')
        const time = Number(testData.explicitTimeOut)
        await client.waitForElementVisible(tempData, time)
        await client.assert.elementPresent(tempData)
    })

    Then(
        /^I should verify "(.*?)" is "(.*?)" on "(.*?)"$/,
        async (locator, validation, page) => {
            let strings
            let i = 0
            let lowerCount = 0
            let upperCount = 0
            let character = ''
            await client.getText(
                cssSelectorsList.pageObjects[page].selectors[locator],
                result => {
                    // client.assert.equal(result.value.trim(), text)
                    strings = result.value.trim()
                }
            )
            while (i <= strings.length) {
                character = strings.charAt(i)
                if (character == character.toUpperCase()) {
                    upperCount++
                } else if (character == character.toLowerCase()) {
                    lowerCount++
                }
                i++
            }
            if (validation === 'uppercase') {
                await client.assert.equal(lowerCount, '0')
            } else if (validation === 'lowercase') {
                await client.assert.equal(upperCount, '0')
            }
        }
    )

    Then(/^I close the push notification if present$/, async () => {
        await client.elements(
            'css selector',
            cssSelectorsList.pageObjects.commonPage.selectors.pushCloseButton,
            result => {
                tempData = result.value
            }
        )
        if (tempData.length) {
            await client.click(
                cssSelectorsList.pageObjects.commonPage.selectors
                    .pushCloseButton
            )
            await client.pause(testData.implicitTimeOut)
        }
    })

    Then(/^I hover and click on "(.*?)" on "(.*?)"$/, async (locator, page) => {
        let posX
        let posY
        await waitElementVisible(locator, page)

        await client.getLocation(
            cssSelectorsList.pageObjects[page].selectors[locator],
            result => {
                posX = result.value.x + 50
                posY = result.value.y + 50
            }
        )
        await moveToElementAndClickByLocation(locator, posX, posY, page)
    })

    Then(
        /^I hover on "(.*?)" at position "(.*?)" and "(.*?)" on "(.*?)"$/,
        async (locator, xcord, ycord, page) => {
            await waitElementVisible(locator, page)
            await moveToElementByLocation(locator, xcord, ycord, page)
        }
    )

    When(/^I mouse hover on "(.*?)" on "(.*?)"$/, async (locator, page) => {
        await waitElementVisible(locator, page)
        await moveToElementByLocator(locator, page)
    })

    // Removes number of products from miniBag/myBag/SFL or adds to SFL from My Bag
    Given(
        /^I "(.*?)" "(.*?)" products from "(.*?)"$/,
        async (action, count, page) => {
            await client.pause(testData.implicitTimeOut)
            const myBagHeaderExists = await countElements(
                'myBagPage',
                'headerText'
            )
            if (myBagHeaderExists === 1) {
                const myBagHeader = await getText('headerText', 'myBagPage')
                await client.assert.equal(myBagHeader, 'My Bag')
            } else {
                await profiles('basketCheckoutUrl')
            }
            await removeProducts(action, count, page)
        }
    )

    Given(
        /^I "(.*?)" product "(.*?)" from "(.*?)"$/,
        async (action, product, page) => {
            await client.pause(testData.implicitTimeOut)
            const myBagHeaderExists = await countElements(
                'myBagPage',
                'headerText'
            )
            if (myBagHeaderExists === 1) {
                const myBagHeader = await getText('headerText', 'myBagPage')
                await client.assert.equal(myBagHeader, 'My Bag')
            } else {
                await profiles('basketCheckoutUrl')
            }
            // const product = testData[productName].toUpperCase()
            await addRemoveProduct(action, product, page)
        }
    )

    Then(
        /^I do a vertical scroll to "(.*?)" on "(.*?)"$/,
        async (locator, page) => {
            await scrollToWithinSelector(
                cssSelectorsList.pageObjects[page].selectors[locator]
            )
        }
    )
    Then(
        /^I should see "(.*?)" in the "(.*?)" on "(.*?)"$/,
        async (locator1, locator2, page) => {
            await client.assert.elementPresent(
                cssSelectorsList.pageObjects[page].selectors[locator1]
            )
        }
    )

    // This method will validate if the url or element not contains a specific text on a page given by user. user to provide locator key, text to be verified and the page
    Then(
        /^I should see "(.*?)" not contains "(.*?)" on "(.*?)"$/,
        async (locator, text, page) => {
            await client.pause(testData.implicitTimeOut)
            let currentValue
            let a = 'value is included'
            if (locator === 'url') {
                let counter = 2
                while (counter > 1) {
                    await client.url(result => {
                        currentValue = result.value
                    })
                    if (currentValue.includes(text)) {
                        await client.pause(testData.implicitTimeOut)
                        counter--
                    } else {
                        break
                    }
                }
            } else {
                await waitElementVisible(locator, 'pspPage')
                currentValue = await getText(locator, page)
            }
            if (!currentValue.includes(text)) {
                a = 'value is no included'
            }
            await client.assert.equal(a, 'value is no included')
        }
    )

    Then(
        /^I select "(.*?)" from "(.*?)" on "(.*?)"$/,
        async (option, dropdownElement, page) => {
            let i = 0
            let j
            let optionTextElementLocator
            let optionLocation = 0
            let selectedOptionElementLocator

            await client.pause(testData.implicitTimeOut)

            await waitElementVisible(dropdownElement, page)

            let optionElementLocator = cssSelectorsList.pageObjects[
                page
            ].selectors[dropdownElement].concat(' option')
            await client.elements(
                'css selector',
                optionElementLocator,
                result => {
                    const els = result.value
                    els.forEach(() => i++)
                }
            )
            for (j = i; j > 1; j--) {
                optionTextElementLocator = optionElementLocator.concat(
                    ':nth-child(',
                    `${j}`,
                    ')'
                )
                await client.getText(optionTextElementLocator, result => {
                    if (result.value.trim().includes(option)) {
                        optionLocation = j
                    }
                })
            }
            selectedOptionElementLocator = optionElementLocator.concat(
                ':nth-child(',
                `${optionLocation}`,
                ')'
            )
            await client.click(selectedOptionElementLocator)
            await client.pause(testData.implicitTimeOut)
        }
    )

    Then(
        /^I select first available value from "(.*?)" on "(.*?)"$/,
        async (dropdownElement, page) => {
            let i = 0
            let j
            let optionTextElementLocator
            let optionLocation = 0
            let selectedOptionElementLocator

            await client.pause(testData.implicitTimeOut)

            await waitElementVisible(dropdownElement, page)

            let optionElementLocator = cssSelectorsList.pageObjects[
                page
            ].selectors[dropdownElement].concat(' option')
            await client.elements(
                'css selector',
                optionElementLocator,
                result => {
                    const els = result.value
                    els.forEach(() => i++)
                }
            )
            for (j = 1; j <= i; j++) {
                optionTextElementLocator = optionElementLocator.concat(
                    ':nth-child(',
                    `${j}`,
                    ')'
                )
                await client.getAttribute(
                    optionTextElementLocator,
                    'disabled',
                    result => {
                        if (result.value === null) {
                            optionLocation = j
                        }
                    }
                )
            }
            selectedOptionElementLocator = optionElementLocator.concat(
                ':nth-child(',
                `${optionLocation}`,
                ')'
            )
            await client.click(selectedOptionElementLocator)
            await client.pause(testData.implicitTimeOut)
        }
    )

    Then(/^I set mobify cookie$/, async () => {
        await client.setCookie({name: 'mobify', value: '99'})
        await getCookie('mobify')
    })

    Then(/^I should not see "(.*?)" contains "(.*?)"$/, async (type, text) => {
        await client.pause(testData.implicitTimeOut)
        await cookieBannerClose()
        let currentUrl
        let counter = 2

        if (type === 'url') {
            while (counter > 1) {
                await client.url(result => {
                    currentUrl = result.value
                })
                if (currentUrl.includes(text)) {
                    await client.pause(testData.implicitTimeOut)
                    counter--
                } else {
                    break
                }
            }
        }
        await client.assert.equal(counter, 2)
    })

    Then(
        /^I set mvt test for "(.*?)" as "(.*?)"$/,
        async (debenhamsMVTVariable, debenhamsMVTValue) => {
            if (testDataSet.includes('DESKTOP')) {
                await client.execute(
                    `window.setMVT({desktop: {${debenhamsMVTVariable}: '${debenhamsMVTValue}'}})`
                )
            } else if (testDataSet.includes('TABLET')) {
                await client.execute(
                    `window.setMVT({tablet: {${debenhamsMVTVariable}: '${debenhamsMVTValue}'}})`
                )
            } else {
                await client.execute(
                    `window.setMVT({mobile: {${debenhamsMVTVariable}: '${debenhamsMVTValue}'}})`
                )
            }
        }
    )

    When(
        /^I click on "(.*?)" using jquery on "(.*?)"$/,
        async (locator, page) => {
            await clickByJQuery(
                cssSelectorsList.pageObjects[page].selectors[locator]
            )
        }
    )

    Then(/^I refresh the page$/, async () => {
        await pageRefresh()
        await getCookie('WC_USERTYPE')
    })

    Then(/^I validate the zero result PSP page$/, async () => {
        const filterPresent = await countElements(
            'pspPage',
            'totalCountOfProducts'
        )
        if (filterPresent) {
            const contentPresent = await getText(
                'totalCountOfProducts',
                'pspPage'
            )
            const zeroResult = await countElements(
                'pspPage',
                'noResultsearchtext1'
            )
            if (contentPresent === '0 products') {
                await client.assert.equal(zeroResult, 1)
            }
        }
    })

    Then(/^I validate email address change for DSC user$/, async () => {
        if (testDataSet.includes('CCC-DESKTOP')) {
            let storeEmailAddress

            await waitElementPresent('cccshopOnBehalfBanner', 'cccLoginPage')
            await client.getText(
                cssSelectorsList.pageObjects.cccLoginPage.selectors
                    .cccshopOnBehalfBanner,
                result => {
                    client.assert.equal(
                        result.value.trim(),
                        testData.shoponBehalfOfRegisteredCustomerBannerText
                    )
                }
            )
            await client.getText(
                cssSelectorsList.pageObjects.cccCustomerSearchPage.selectors
                    .emailAddressMyAccount,
                result => {
                    storeEmailAddress = result.value.trim()
                }
            )
            await click('editEmailAddressMyAccount', 'cccCustomerSearchPage')
            await waitElementPresent(
                'emailAddressInputBox',
                'cccCustomerSearchPage'
            )
            await clearValue('emailAddressInputBox', 'cccCustomerSearchPage')
            await client.setValue(
                cssSelectorsList.pageObjects.cccCustomerSearchPage.selectors
                    .emailAddressInputBox,
                'test11@test.com'
            )
            await click('saveDetailsMyAccount', 'cccCustomerSearchPage')
            await click('editEmailAddressMyAccount', 'cccCustomerSearchPage')
            await waitElementPresent(
                'emailAddressInputBox',
                'cccCustomerSearchPage'
            )
            await clearValue('emailAddressInputBox', 'cccCustomerSearchPage')
            await client.setValue(
                cssSelectorsList.pageObjects.cccCustomerSearchPage.selectors
                    .emailAddressInputBox,
                storeEmailAddress
            )
            await click('saveDetailsMyAccount', 'cccCustomerSearchPage')
            await waitElementPresent(
                'emailAddressMyAccount',
                'cccCustomerSearchPage'
            )
            await client.getText(
                cssSelectorsList.pageObjects.cccCustomerSearchPage.selectors
                    .emailAddressMyAccount,
                result => {
                    client.assert.equal(result.value.trim(), storeEmailAddress)
                }
            )
        }
    })
    Given(
        /^I validate cookie value of "(.*?)" as "(.*?)"$/,
        async (cookieName, cookieValue) => {
            await getCookie(cookieName, cookieValue)
        }
    )

    Given(
        /^I validate status code of "(.*?)" as "(.*?)"$/,
        async (url, expectedStatusCode) => {
            const actualStatusCode = await checkStatusCode(url)
            await client.assert.equal(actualStatusCode, expectedStatusCode)
        }
    )
})
