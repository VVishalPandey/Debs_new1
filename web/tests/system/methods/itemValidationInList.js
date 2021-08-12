import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'
import {countElements, countElementsBySelector} from './elements'
import {getTextBySelector} from './getText'
import testData from '../test-data'

const cssSelectorsList = new PageObjects()

export const itemValidationInList = async (parentOption, locator, page) => {
    let numberOfOptions = 0
    let hotSpotFilterCheck = 0
    let eachPosition
    let position = 0
    let selector
    let count = 0

    // Extract the number of menu options
    await client.pause(testData.implicitTimeOut)
    numberOfOptions = await countElements(page, locator)
    // Loop to extract each value and 'comparing with the expected parent option
    for (
        eachPosition = 1;
        eachPosition <= numberOfOptions;
        eachPosition = eachPosition + 1
    ) {
        if (locator.includes('filter')) {
            hotSpotFilterCheck = await countElementsBySelector(
                cssSelectorsList.pageObjects[page].selectors[locator].concat(
                    `:nth-child(${eachPosition}) button`
                )
            )
            if (hotSpotFilterCheck > 0) {
                selector = cssSelectorsList.pageObjects[page].selectors[
                    locator
                ].concat(`:nth-child(${eachPosition}) button`)
            } else {
                selector = cssSelectorsList.pageObjects[page].selectors[
                    locator
                ].concat(`:nth-child(${eachPosition})`)
            }
        } else {
            selector = cssSelectorsList.pageObjects[page].selectors[
                locator
            ].concat(`:nth-child(${eachPosition})`)
        }
        const selectorIsPresent = await countElementsBySelector(selector)
        if (selectorIsPresent) {
            const optionText = await getTextBySelector(selector)
            if (optionText.toUpperCase() === parentOption.toUpperCase()) {
                count++
                position = eachPosition
            }
        } else {
            numberOfOptions++
        }
    }
    // await client.assert.equal(count, '1')
    return [count, position]
}

export const itemValidationInMyBag = async (
    locator,
    page,
    expectedValue,
    option
) => {
    let numberOfOptions = 0
    let actualResult
    let eachPosition
    let position = 0
    let selector
    let count = 0

    // Extract the number of products available
    numberOfOptions = await countElementsBySelector(
        cssSelectorsList.pageObjects[page].selectors[locator]
    )

    // Loop to extract each product value and 'comparing with the expected value
    for (
        eachPosition = 1;
        eachPosition <= numberOfOptions;
        eachPosition = eachPosition + 1
    ) {
        selector = cssSelectorsList.pageObjects[page].selectors[
            locator
        ].replace(
            '.c-product-item',
            `.c-product-item:nth-child(${eachPosition})`
        )
        actualResult = await getTextBySelector(selector)
        if (actualResult.toUpperCase() === expectedValue.toUpperCase()) {
            count++
            position = eachPosition
            break
        }
    }

    // Condition to validate if the product exist or not as per teh requirement of user
    if (option === 'exist') {
        await client.assert.equal(count, '1')
    } else {
        await client.assert.equal(count, '0')
    }

    return position
}
