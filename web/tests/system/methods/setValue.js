import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'

const cssSelectorsList = new PageObjects()

export const setValue = async (locator, page, value) => {
    let textValue
    await client.setValue(
        cssSelectorsList.pageObjects[page].selectors[locator],
        value
    )
    return textValue
}

export const setValueBySelector = async (selector, value) => {
    let textValue
    await client.setValue(selector, value)
    return textValue
}
