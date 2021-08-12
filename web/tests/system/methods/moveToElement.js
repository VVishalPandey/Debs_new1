import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'
import {waitElementVisible} from './explicitWait'
import testData from '../test-data'

const cssSelectorsList = new PageObjects()

export const moveToElementByLocator = async (locator, page) => {
    await waitElementVisible(locator, page)
    await client.moveToElement(
        cssSelectorsList.pageObjects[page].selectors[locator],
        0,
        0
    )
}

export const moveToElementBySelector = async selector => {
    await client.waitForElementVisible(selector, testData.timeout)
    await client.moveToElement(selector, 0, 0)
}

export const moveToElementAndClickByLocation = async (
    locator,
    xcord,
    ycord,
    page
) => {
    await waitElementVisible(locator, page)
    await client
        .moveToElement(
            cssSelectorsList.pageObjects[page].selectors[locator],
            xcord,
            ycord
        )
        .mouseButtonClick(0)
}

export const moveToElementByLocation = async (locator, xcord, ycord, page) => {
    await waitElementVisible(locator, page)
    await client.moveToElement(
        cssSelectorsList.pageObjects[page].selectors[locator],
        xcord,
        ycord
    )
}

export const moveToElementByJQuery = async (functionality, position) => {
    if (functionality === 'global nav') {
        await client.execute(
            `$('.t-desktop-nav__panels > div:nth-child(${position})').addClass('active').closest('.t-desktop-nav__panel-container').removeClass('u-visually-hidden').closest('.dbh-desktop-nav > .t-desktop-nav__sheet > .t-desktop-nav__wrapper > .t-desktop-nav__tab-panel > a:nth-child(${position})').addClass('active')`
        )
    } else if (functionality === 'pdp image hover') {
        await console.log('test')
    }
}

export const moveToElementByJQueryRevertChange = async (
    functionality,
    position
) => {
    if (functionality === 'global nav') {
        await client.execute(
            `$('.t-desktop-nav__panels > div:nth-child(${position})').removeClass('active').closest('.t-desktop-nav__panel-container').addClass('u-visually-hidden').closest('.dbh-desktop-nav > .t-desktop-nav__sheet > .t-desktop-nav__wrapper > .t-desktop-nav__tab-panel > a:nth-child(${position})').removeClass('active')`
        )
    } else if (functionality === 'pdp image hover') {
        await console.log('test')
    }
}
