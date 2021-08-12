import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'
import {waitElementVisibleBySelector} from './explicitWait'
import {scrollToPositionBySelector} from './scrollTo'

const cssSelectorsList = new PageObjects()

export const click = async (locator, page) => {
    await waitElementVisibleBySelector(
        cssSelectorsList.pageObjects[page].selectors[locator]
    )
    await scrollToPositionBySelector(
        cssSelectorsList.pageObjects[page].selectors[locator]
    )
    await client.assert.elementPresent(
        cssSelectorsList.pageObjects[page].selectors[locator]
    )
    await client.click(cssSelectorsList.pageObjects[page].selectors[locator])
}

export const clickUsingJS = async selector => {
    await client.execute(`document.querySelector('${selector}').click()`)
}

export const clickBySelector = async selector => {
    await waitElementVisibleBySelector(selector)
    await scrollToPositionBySelector(selector)
    await client.click(selector)
}

export const clickByJQuery = async selector => {
    await client.execute(`$('${selector}').trigger('click')`)
}

export const clickWithoutScroll = async selector => {
    await waitElementVisibleBySelector(selector)
    await client.click(selector)
}
