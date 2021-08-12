import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'
import {waitElementVisible} from './explicitWait'
import {getAttributeValue} from './getAttribute'
import {click} from './click'
import testData from '../test-data'

const cssSelectorsList = new PageObjects()
const testInstance = process.env.INSTANCE || 'chrome'

export const enterValue = async (value, locator, page) => {
    await waitElementVisible(locator, page)
    if (testInstance.toUpperCase().includes('FIREFOX')) {
        let stepperCount = await getAttributeValue(
            cssSelectorsList.pageObjects.pdpPage.selectors.stepperCount,
            'value'
        )
        while (stepperCount !== value) {
            if (stepperCount < value) {
                await click('stepperIncrement', 'pdpPage')
            } else {
                await click('stepperDecrement', 'pdpPage')
            }
            stepperCount = await getAttributeValue(
                cssSelectorsList.pageObjects.pdpPage.selectors.stepperCount,
                'value'
            )
        }
    } else {
        await client.clearValue(
            cssSelectorsList.pageObjects[page].selectors[locator]
        )
        await client.setValue(
            cssSelectorsList.pageObjects[page].selectors[locator],
            value
        )
        await client.pause(testData.implicitTimeOut)
    }
}
