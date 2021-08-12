import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'

const cssSelectorsList = new PageObjects()

export const collapseOpenAccordionLocator = async (action, locator, page) => {
    let attributeValue
    await client.getAttribute(cssSelectorsList.pageObjects[page].selectors[locator], 'aria-expanded', result => {
        attributeValue = result.value
    })
    if ((attributeValue === 'true' && action === 'collapse') || (attributeValue === 'false' && action === 'open')) {
        await client.click(cssSelectorsList.pageObjects[page].selectors[locator])
        await client.pause(2000)
    }
}

export const collapseOpenAccordionSelector = async (action, selector) => {
    let attributeValue
    await client.getAttribute(selector, 'aria-expanded', result => {
        attributeValue = result.value
    })
    if ((attributeValue === 'true' && action === 'collapse') || (attributeValue === 'false' && action === 'open')) {
        await client.click(selector)
        await client.pause(2000)
    }
}
