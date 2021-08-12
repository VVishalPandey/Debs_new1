import {client} from 'nightwatch-cucumber'
import {waitElementVisible} from './explicitWait'
import {countElements} from './elements'
import testData from '../test-data'
import PageObjects from '../page-objects/page-objects'
import {getAttributeValue} from './getAttribute'

const cssSelectorsList = new PageObjects()

export const selectdayEveNextNominatedOption = async () => {
    let tab

    const isPresent = await countElements(
        'deliveryOptionPage',
        'checkoutNominatedModal'
    )

    await client.getAttribute(
        '.t-checkout-shipping__delivery-slot-list .pw-tabs [role=tablist] > li:nth-child(1)',
        'class',
        result => {
            if (result.value.includes('active')) {
                tab = 1
            } else {
                tab = 2
            }
        }
    )
    await waitElementVisible('daytimeTab', 'deliveryOptionPage')
    if (isPresent) {
        await client.getText(
            cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                .checkoutNominatedMsg,
            result => {
                client.assert.equal(result.value.trim(), '8am - 6pm')
            }
        )
    } else {
        await client.getText(
            cssSelectorsList.pageObjects.deliveryOptionPage.selectors
                .nextNominatedSectionHeaderText,
            result => {
                client.assert.equal(
                    result.value.trim(),
                    'When would you like to receive your delivery?'
                )
            }
        )
    }

    let i = 0
    let j = 1
    let daytimeFirstEnableOption = 0
    await client.click(
        cssSelectorsList.pageObjects.deliveryOptionPage.selectors.daytimeTab
    )
    await waitElementVisible('daytimeOptions', 'deliveryOptionPage')
    await client.elements(
        'css selector',
        cssSelectorsList.pageObjects.deliveryOptionPage.selectors
            .daytimeOptions,
        result => {
            const els = result.value
            els.forEach(() => i++)
        }
    )
    for (j = i; j >= 1; j--) {
        const attributeValue = await getAttributeValue(
            `.dbh-day-time li:nth-of-type(${j}) > button`,
            'class'
        )
        // await client.getAttribute(
        //     `.dbh-day-time li:nth-of-type(${j}) > button`,
        //     'class',
        //     result => {
        if (attributeValue.includes('disabled')) {
            await console.log('Diabled date --', j)
        } else {
            daytimeFirstEnableOption = j
        }
    }
    // )
    // }

    await client.assert.elementPresent(
        cssSelectorsList.pageObjects.deliveryOptionPage.selectors.daytimeTab
    )

    if (tab === 1 && isPresent.length) {
        await client.click(
            `.dbh-day-time li:nth-of-type(${daytimeFirstEnableOption}) > button`
        )
        await client.pause(testData.implicitTimeOut)
        await client.pause(testData.implicitTimeOut)
    } else if (tab === 1) {
        await client.click(
            `.dbh-day-time li:nth-of-type(${daytimeFirstEnableOption}) > button`
        )
    }
    await client.pause(testData.implicitTimeOut)
}
