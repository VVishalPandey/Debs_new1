import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'

const cssSelectorsList = new PageObjects()

export const getText = async (locator, page) => {
    let textValue
    await client.getText(
        cssSelectorsList.pageObjects[page].selectors[locator],
        result => {
            textValue = result.value.trim()
        }
    )
    return textValue
}

export const getTextAPI = async selector => {
    let textValue
    await client.getText(selector, result => {
        textValue = result.value.trim()
    })
    return textValue
}

export const getTextBySelector = async selector => {
    let textValue
    let i = 2

    while (i > 0) {
        textValue = await getTextAPI(selector)
        if (textValue === '') {
            i--
            await client.pause(2000)
        } else {
            i = 0
        }
    }
    return textValue
}

export const getCharactersFromString = async (string, number) => {
    const textValue = string.substring(string.length - number)
    return textValue
}
