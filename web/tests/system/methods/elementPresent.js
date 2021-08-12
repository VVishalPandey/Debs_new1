import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'

const cssSelectorsList = new PageObjects()

export const elementPresent = async (locator, page) => {
    await client.assert.elementPresent(
        cssSelectorsList.pageObjects[page].selectors[locator]
    )
}

export const clickBySelector = async selector => {
    await client.assert.elementPresent(selector)
}
