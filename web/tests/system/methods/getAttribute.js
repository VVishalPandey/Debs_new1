import {client} from 'nightwatch-cucumber'

export const getAttributeValue = async (selector, attributeName) => {
    let attributeValue
    await client.getAttribute(selector, attributeName, result => {
        attributeValue = result.value
    })
    return attributeValue
}
