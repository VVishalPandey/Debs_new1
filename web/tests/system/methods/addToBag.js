import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'
import {waitElementVisible, waitElementNotPresent} from './explicitWait'
import {click} from './click'
import {getText} from './getText'
import {countElements} from './elements'
import testData from '../test-data'

const cssSelectorsList = new PageObjects()
const testDataSet = process.env.TEST_DATA_SET || 'UK'

export const addToBag = async () => {
    let minibagBeforeCount = 0
    let checkoutMessageFound = 'false'
    const elementFound = await countElements('minibagPage', 'minibagCount')
    if (elementFound === 1) {
        minibagBeforeCount = await getText('minibagCount', 'minibagPage')
    } else if (testDataSet.includes('DESKTOP')) {
        minibagBeforeCount = 'My Bag'
    }
    await waitElementVisible('addToBagButton', 'pdpPage')
    await click('addToBagButton', 'pdpPage')
    await waitElementVisible('addToBagRemainingText', 'pdpPage')
    await client.getText(
        cssSelectorsList.pageObjects.pdpPage.selectors.addToBagRemainingText,
        result => {
            if (
                result.value
                    .trim()
                    .toUpperCase()
                    .includes(
                        testData.addToBagTooltipPartialMessage.toUpperCase()
                    )
            ) {
                checkoutMessageFound = 'true'
            }
        }
    )
    await client.assert.equal(
        checkoutMessageFound,
        'true',
        'Checkout message not found'
    )
    if (!testDataSet.includes('DESKTOP') && !testDataSet.includes('TABLET')) {
        await click('viewBasketCloseButton', 'pdpPage')
        // await client.pause(testData.implicitTimeOut)
    }
    const minibagAfterCount = await getText('minibagCount', 'minibagPage')
    await client.assert.notEqual(
        minibagBeforeCount,
        minibagAfterCount,
        'Minibag count are same'
    )
}

export const addToBagMultipleItems = async quantity => {
    let expectedText
    let minibagBeforeCount = 0
    let checkoutMessageFound = 'false'
    if (quantity === '1') {
        expectedText = quantity.concat(' item added to bag')
    } else {
        expectedText = quantity.concat(' items added to bag')
    }
    const elementFound = await countElements('minibagPage', 'minibagCount')
    if (elementFound === 1) {
        minibagBeforeCount = await getText('minibagCount', 'minibagPage')
    }

    await waitElementVisible('addToBagButton', 'pdpPage')
    await click('addToBagButton', 'pdpPage')
    if (!testDataSet.includes('DESKTOP')) {
        await waitElementVisible('addToBagRemainingText', 'pdpPage')
        await client.getText(
            cssSelectorsList.pageObjects.pdpPage.selectors
                .addToBagRemainingText,
            result => {
                if (
                    result.value
                        .trim()
                        .toUpperCase()
                        .includes(
                            testData.addToBagTooltipPartialMessage.toUpperCase()
                        )
                ) {
                    checkoutMessageFound = 'true'
                }
            }
        )
        await client.assert.equal(
            checkoutMessageFound,
            'true',
            'Checkout message not found'
        )
    } else {
        await client.pause(testData.implicitTimeOut)
        await waitElementVisible('addToBagTooltip', 'pdpPage')
        await client.getText(
            cssSelectorsList.pageObjects.pdpPage.selectors.addToBagTooltip,
            result => {
                client.assert.equal(
                    result.value.trim().toUpperCase(),
                    expectedText.toUpperCase()
                )
            }
        )
    }
    const minibagAfterCount = await getText('minibagCount', 'minibagPage')
    await client.assert.notEqual(
        minibagBeforeCount,
        minibagAfterCount,
        'Minibag count are same'
    )
}

export const addToBagCheckout = async () => {
    let minibagBeforeCount = 0
    let checkoutMessageFound = 'false'
    const elementFound = await countElements('minibagPage', 'minibagCount')
    if (elementFound === 1) {
        minibagBeforeCount = await getText('minibagCount', 'minibagPage')
    } else if (testDataSet.includes('DESKTOP')) {
        minibagBeforeCount = 'My Bag'
    }
    await click('addToBagButton', 'pdpPage')
    await waitElementVisible('addToBagRemainingText', 'pdpPage')
    await client.pause(testData.implicitTimeOut)
    await client.getText(
        cssSelectorsList.pageObjects.pdpPage.selectors.addToBagRemainingText,
        result => {
            if (
                result.value
                    .trim()
                    .toUpperCase()
                    .includes(
                        testData.addToBagTooltipPartialMessage.toUpperCase()
                    )
            ) {
                checkoutMessageFound = 'true'
            }
        }
    )
    await client.pause(testData.implicitTimeOut)
    await client.assert.equal(
        checkoutMessageFound,
        'true',
        'Checkout message not found'
    )
    await click('viewBasketCheckoutButton', 'pdpPage')
    await client.pause(testData.implicitTimeOut)
    await waitElementNotPresent('desktopSkelton', 'commonPage')
    const myBagHeader = await getText('headerText', 'myBagPage')
    await client.assert.equal(myBagHeader, 'My Bag')
    const elementFound1 = await countElements('minibagPage', 'minibagCount')
    if (elementFound1 === 1) {
        const minibagAfterCount = await getText('minibagCount', 'minibagPage')
        await client.assert.notEqual(
            minibagBeforeCount,
            minibagAfterCount,
            'Minibag count are same'
        )
    }
}
// the method is used to add a upsell gift card product and used for monentate test only
export const upsellGCaddToBag = async () => {
    if (!testDataSet.includes('TABLET')) {
        let minibagBeforeCount = 0
        let itemAddedNotifcationFound = 'false'
        const elementFound = await countElements('minibagPage', 'minibagCount')
        if (elementFound === 1) {
            minibagBeforeCount = await getText('minibagCount', 'minibagPage')
        } else if (testDataSet.includes('DESKTOP')) {
            minibagBeforeCount = 'My Bag'
        }
        await click('addtoBagButton', 'myBagPage')
        await waitElementVisible('notificationMessage', 'myBagPage')
        await waitElementVisible('itemAddedNotification', 'myBagPage')
        await client.getText(
            cssSelectorsList.pageObjects.myBagPage.selectors
                .itemAddedNotification,
            result => {
                if (
                    result.value
                        .trim()
                        .toUpperCase()
                        .includes(
                            testData.addToBagTooltipPartialMessage.toUpperCase()
                        )
                ) {
                    itemAddedNotifcationFound = 'true'
                }
            }
        )
        await client.assert.equal(
            itemAddedNotifcationFound,
            'true',
            'Gift Card added successfully'
        )
        const minibagAfterCount = await getText('minibagCount', 'minibagPage')
        await client.assert.notEqual(
            minibagBeforeCount,
            minibagAfterCount,
            'Minibag count are same'
        )
    }
}
