import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'

const cssSelectorsList = new PageObjects()
export const checkoutLoginPresent = async () => {
    let isLoginVariant = 'variant1'
    let checkoutLoginPage
    let variant

    await client.elements(
        'css selector',
        cssSelectorsList.pageObjects.basketCheckoutPage.selectors
            .secureCheckoutLoginPage,
        result => {
            checkoutLoginPage = result.value
        }
    )
    if (checkoutLoginPage.length) {
        await client.elements(
            'css selector',
            cssSelectorsList.pageObjects.basketCheckoutPage.selectors
                .emailAddressField,
            result => {
                variant = result.value
            }
        )
        if (variant.lenght) {
            isLoginVariant = 'variant1'
        } else {
            isLoginVariant = 'variant2'
        }
    }
    return isLoginVariant
}
