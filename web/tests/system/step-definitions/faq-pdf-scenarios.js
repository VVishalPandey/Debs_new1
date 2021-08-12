import {client} from 'nightwatch-cucumber'
import {defineSupportCode} from 'cucumber'
import {waitElementVisible, waitElementPresent} from '../methods/explicitWait'
import {switchWindow} from '../methods/switchWindow'
import {validatePdf} from '../methods/pdfValidation'
import testData from '../test-data'

const testDataSet = process.env.TEST_DATA_SET || 'UK'

defineSupportCode(({Then}) => {
    Then(
        /^I switch to the new window for "(.*?)" validation and verify the title as "(.*?)"$/,
        async (page, title) => {
            if (testDataSet.includes('DESKTOP')) {
                await switchWindow('newWindow')

                if (page.includes('FAQ')) {
                    await client.assert.title(testData[title])
                    await waitElementVisible('returnsSectionFAQ', 'pdpPage')
                } else if (page.includes('SIZEGUIDE')) {
                    await client.assert.title(testData[title])
                    await client.assert.urlContains('size-guide')
                    await waitElementVisible('sizeGudeCloseWindow', 'pdpPage')
                } else if (page.includes('PDF')) {
                    await validatePdf(testData[title])
                }
                await client.closeWindow('newWindow')
                await switchWindow('existingWindow')
                await waitElementPresent('productName', 'pdpPage')
            }
        }
    )
})
