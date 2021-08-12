import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'
import {waitElementVisible} from '../methods/explicitWait'
import testData from '../test-data'

const cssSelectorsList = new PageObjects()

export const clearText = async (locator, page) => {
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
}
