import {client} from 'nightwatch-cucumber'
import {defineSupportCode} from 'cucumber'
import PageObjects from '../page-objects/page-objects'
import {expectElementEquals} from '../methods/cssPropertyValidate'
// import cssValues from '../test-data-files/css-data'
import cssData from '../test-data-files/css-data.json'

const cssSelectorsList = new PageObjects()

defineSupportCode(({Then}) => {
    // This step is for css validation for a selector value. It extracts the cssProperty for a selector of a page and validate with the expectedValue.
    Then(
        /^I should verify "(.*?)" of "(.*?)" as "(.*?)" on "(.*?)"$/,
        async (cssProperty, locator, expectedValue, page) => {
            const tempSelector =
                cssSelectorsList.pageObjects[page].selectors[locator]
            await expectElementEquals(
                tempSelector,
                cssProperty,
                cssData[expectedValue]
            )
        }
    )

    Then(
        /^I should verify "(.*?)" "(.*?)" to be highlighted "(.*?)" on "(.*?)"$/,
        async (locator, text, validation, page) => {
            if (validation === 'font-weight') {
                await client.getText(
                    cssSelectorsList.pageObjects[page].selectors[locator],
                    result => {
                        client.assert.equal(
                            result.value.trim().toUpperCase(),
                            text.toUpperCase()
                        )
                    }
                )
                await client.expect
                    .element(
                        cssSelectorsList.pageObjects[page].selectors[locator]
                    )
                    .to.have.css('font-weight')
                    .which.equals('700')
            } else if (validation === 'background-color') {
                await client.expect
                    .element(
                        cssSelectorsList.pageObjects[page].selectors[locator]
                    )
                    .to.have.css('background-color')
                    .which.equals('rgba(0, 179, 158, 1)')
            }
        }
    )

    Then(
        /^I should verify "(.*?)" "(.*?)" as "(.*?)" on "(.*?)"$/,
        async (locator, validation, text, page) => {
            if (validation === 'position') {
                await client.expect
                    .element(
                        cssSelectorsList.pageObjects[page].selectors[locator]
                    )
                    .to.have.css(validation)
                    .which.equals(text)
            }
        }
    )

    Then(
        /^I validate "(.*?)" is editable on "(.*?)"$/,
        async (locator, page) => {
            await client.click(
                cssSelectorsList.pageObjects[page].selectors[locator]
            )
            await client.expect
                .element(cssSelectorsList.pageObjects[page].selectors[locator])
                .to.have.css('border-color')
                .which.equals('rgb(0, 179, 158)')
        }
    )
})
