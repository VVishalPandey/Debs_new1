import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'

const cssSelectorsList = new PageObjects()

export const clearValue = async (locator, page) => {
    await client.clearValue(
        cssSelectorsList.pageObjects[page].selectors[locator]
    )
    return clearValue
}
