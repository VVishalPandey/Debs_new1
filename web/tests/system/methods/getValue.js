import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'

const cssSelectorsList = new PageObjects()

export const getValue = async (locator, page) => {
    let textValue
    await client.getValue(
        cssSelectorsList.pageObjects[page].selectors[locator],
        result => {
            textValue = result.value
        }
    )
    return textValue
}
