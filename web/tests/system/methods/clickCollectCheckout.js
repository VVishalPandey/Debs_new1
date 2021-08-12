import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'
import {waitElementVisible} from '../methods/explicitWait'
import testData from '../test-data'
import {click} from '../methods/click'

const cssSelectorsList = new PageObjects()

export const clickCollectDeliveryCheckout = async () => {
    await waitElementVisible('homeDeliveryOption', 'deliveryOptionPage')
    await client.assert.elementPresent(
        cssSelectorsList.pageObjects.deliveryOptionPage.selectors
            .homeDeliveryOption
    )
    await waitElementVisible('clickCollectOption', 'deliveryOptionPage')
    await client.assert.elementPresent(
        cssSelectorsList.pageObjects.deliveryOptionPage.selectors
            .clickCollectOption
    )
    await click('clickCollectOption', 'deliveryOptionPage')
    await waitElementVisible('headerText', 'deliveryOptionPage')
    await client.pause(testData.implicitTimeOut)
    await client.getText(
        cssSelectorsList.pageObjects.deliveryOptionPage.selectors.headerText,
        result => {
            client.assert.equal(
                result.value.trim(),
                'Which store would you like to collect from?'
            )
        }
    )
}
