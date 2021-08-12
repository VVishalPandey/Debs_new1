import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'
import {
    explicitPagePause,
    waitElementNotVisible,
    waitElementNotPresent
} from '../methods/explicitWait'
import {countElements} from './elements'
import {click} from './click'
import {scrollToPosition} from './scrollTo'

const cssSelectorsList = new PageObjects()
const testDataSet = process.env.TEST_DATA_SET || 'UK'

// This method is deprecated as this is no longer in use because of DEBD-25 (RELEASE 5.43.0) where international country changes has been shut down
export const countrySelectorClose = async () => {
    let tempData
    let cookieVisible = true

    await explicitPagePause()
    // Timeout 5 seconds has been added in order to validate the new changes as part of DEBD-3003
    await client.pause(5000)

    if (testDataSet.includes('DESKTOP')) {
        tempData = await countElements('commonPage', 'blackFridaypopUpClose')
        if (tempData) {
            await click('blackFridaypopUpClose', 'commonPage')
            await waitElementNotVisible('blackFridaypopUpClose', 'commonPage')
        }
    }
    tempData = await countElements('commonPage', 'popUpClose')
    if (tempData) {
        await click('popUpClose', 'commonPage')
        await waitElementNotVisible('popUpClose', 'commonPage')
    }

    tempData = await countElements('commonPage', 'countrySelectorpopupclose')
    if (tempData) {
        await click('countrySelectorpopupclose', 'commonPage')
        await waitElementNotPresent('countrySelectorpopupclose', 'commonPage')
    }
    if (await countElements('commonPage', 'logoDebenhams')) {
        await scrollToPosition('commonPage', 'logoDebenhams')
    }
    tempData = await countElements('commonPage', 'cookiesClose')
    if (tempData) {
        await client.getAttribute(
            cssSelectorsList.pageObjects.commonPage.selectors.cookieBanner,
            'class',
            result => {
                if (result.value.includes('hidden')) {
                    cookieVisible = false
                }
            }
        )
        if (String(tempData).length && cookieVisible === true) {
            await click('cookiesClose', 'commonPage')
        }
    }
}
