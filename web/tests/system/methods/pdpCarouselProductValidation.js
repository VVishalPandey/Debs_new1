import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'

const cssSelectorsList = new PageObjects()

export const carouselProductValidation = (locator, page) => {
    let expectedProductBrandName
    // let carouselProductsSelecter
    let productFoundStatus = 'Brandname not Matched'

    const carouselProductsSelector =
        cssSelectorsList.pageObjects[page].selectors.roundRobinProducts
    const check = result => {
        if (
            result.value
                .trim()
                .toLowerCase()
                .includes(expectedProductBrandName.toLowerCase())
        ) {
            productFoundStatus = 'Brandname Matched'
        }
        client.assert.equal(productFoundStatus, 'Brandname Matched')
    }

    const matchProducts = els => {
        for (let i = 1; i <= els.length; i++) {
            client.getText(
                `.pw-scroller__item:nth-child(${i}) .t-related-products__item .u-margin-bottom-md:nth-child(2) > a`,
                result => {
                    check(result)
                }
            )
        }
    }

    client.waitForElementVisible(
        cssSelectorsList.pageObjects[page].selectors.productBrandName,
        10000
    )
    client.getText(
        cssSelectorsList.pageObjects[page].selectors.productBrandName,
        result => {
            expectedProductBrandName = result.value.trim()
        }
    )
    client.waitForElementVisible(carouselProductsSelector, 10000)
    client.elements('css selector', carouselProductsSelector, result => {
        const els = result.value
        matchProducts(els)
    })
}
