import {client} from 'nightwatch-cucumber'
import testData from '../test-data'
import PageObjects from '../page-objects/page-objects'

const cssSelectorsList = new PageObjects()

const tempData = Number(testData.explicitTimeOut)

export const explicitPagePause = async () => {
    await client.waitForElementVisible('body', tempData)
}

// Waits a given time in milliseconds for an element to be visible in the page before performing any other commands or assertions
export const waitElementVisible = async (locator, page) => {
    await client.waitForElementVisible(
        cssSelectorsList.pageObjects[page].selectors[locator],
        tempData
    )
}

// Waits a given time in milliseconds for an element to be not present (i.e. removed)
export const waitElementNotPresent = async (locator, page) => {
    await client.waitForElementNotPresent(
        cssSelectorsList.pageObjects[page].selectors[locator],
        tempData
    )
}

// Waits a given time in milliseconds for an element to be not visible (i.e. hidden but existing)
export const waitElementNotVisible = async (locator, page) => {
    await client.waitForElementNotVisible(
        cssSelectorsList.pageObjects[page].selectors[locator],
        tempData
    )
}

// Waits a given time in milliseconds for an element to be present in the page before performing any other commands or assertions
export const waitElementPresent = async (locator, page) => {
    await client.waitForElementPresent(
        cssSelectorsList.pageObjects[page].selectors[locator],
        tempData
    )
}

// Waits a given time in milliseconds for an element to be visible in the page before performing any other commands or assertions
export const waitElementVisibleBySelector = async selector => {
    await client.waitForElementVisible(selector, tempData)
}

// Waits a given time in milliseconds for an element to be not present (i.e. removed)
export const waitElementNotPresentBySelector = async selector => {
    await client.waitForElementNotPresent(selector, tempData)
}

// Waits a given time in milliseconds for an element to be not visible (i.e. hidden but existing)
export const waitElementNotVisibleBySelector = async selector => {
    await client.waitForElementNotVisible(selector, tempData)
}

// Waits a given time in milliseconds for an element to be present in the page before performing any other commands or assertions
export const waitElementPresentBySelector = async selector => {
    await client.waitForElementPresent(selector, tempData)
}
// window.mm_events = {
//     trigger: function(param) {
//         if (param === 'PAGE_LOADED') {

//         }
//     }
// }
