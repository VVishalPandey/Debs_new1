import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'
import {countElements} from './elements'
import {click} from './click'

const cssSelectorsList = new PageObjects()

export const getCookie = async (name, value) => {
    await client.getCookie(name, result => {
        value = result.value
        return value
    })
}

export const cookieBannerClose = async () => {
    let cookieVisible = true
    const tempData = await countElements('commonPage', 'cookiesClose')
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
