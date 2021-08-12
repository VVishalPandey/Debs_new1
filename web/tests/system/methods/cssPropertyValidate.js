import {client} from 'nightwatch-cucumber'

export const expectElementEquals = async (
    selector,
    cssProperty,
    expectedValue
) => {
    await client.expect
        .element(selector)
        .to.have.css(cssProperty)
        .which.equals(expectedValue)
}

export const expectElementContains = async (
    selector,
    cssProperty,
    expectedValue
) => {
    await client.expect
        .element(selector)
        .to.have.css(cssProperty)
        .which.contains(expectedValue)
}

export const expectElementMatches = async (
    selector,
    cssProperty,
    expectedValue
) => {
    await client.expect
        .element(selector)
        .to.have.css(cssProperty)
        .which.matches(expectedValue)
}

export const expectElement = async (selector, cssProperty) => {
    await client.expect.element(selector).to.have.css(cssProperty)
}
