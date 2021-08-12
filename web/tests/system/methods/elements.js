import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'

const cssSelectorsList = new PageObjects()

export const countElements = async (page, locator) => {
    let count = 0
    await client.elements(
        'css selector',
        cssSelectorsList.pageObjects[page].selectors[locator],
        result => {
            const els = result.value
            els.forEach(() => count++)
        }
    )
    return count
}

export const countElementsBySelector = async selector => {
    let count = 0
    await client.elements('css selector', selector, result => {
        const els = result.value
        els.forEach(() => count++)
    })
    return count
}

export const getElements = async locator => {
    const array = []
    await client.elements('css selector', locator, elements => {
        elements.value.forEach(element => {
            array.push(element.ELEMENT)
        })
    })
    return array
}

export const getElementIdEnabled = async elements => {
    const array = []
    for (const element of elements) {
        await client.elementIdEnabled(element, result => {
            array.push(result.value)
        })
    }
    return array
}
