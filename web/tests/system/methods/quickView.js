import PageObjects from '../page-objects/page-objects'
import {clickByJQuery} from '../methods/click'
import {elementPresent} from '../methods/elementPresent'
import {waitElementPresent} from '../methods/explicitWait'
import {countElements} from './elements'

const cssSelectorsList = new PageObjects()

export const quickViewValidation = async page => {
    const overlayOpened = await countElements(page, 'quickShopOverlay')
    if (overlayOpened === 0) {
        let youMayAlsoLikeSectionExists = 1
        let defaultFirstProduct = 'firstProductQuickShop'

        if (page === 'pdpPage') {
            youMayAlsoLikeSectionExists = await countElements(
                'pdpPage',
                'firstProductImage'
            )
            if (youMayAlsoLikeSectionExists === 0) {
                defaultFirstProduct =
                    'quickShopFirstProductCustomerBoughtSection'
            }
        }
        await waitElementPresent([defaultFirstProduct], page)
        await elementPresent([defaultFirstProduct], page)
        await clickByJQuery(
            cssSelectorsList.pageObjects[page].selectors[defaultFirstProduct]
        )
        await waitElementPresent('quickShopOverlay', page)
    }
}
