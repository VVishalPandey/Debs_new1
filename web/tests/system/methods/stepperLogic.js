import {click} from './click'
import {getValue} from './getValue'
import {getText} from './getText'
import {getAttributeValue} from './getAttribute'
import {countElements} from './elements'
import PageObjects from '../page-objects/page-objects'
import {client} from 'nightwatch-cucumber'

const cssSelectorsList = new PageObjects()

export const stepper = async value => {
    let stepperIncrementState
    let stepperDecrementState
    let actualText = 0
    let status = 'Stepper increment/decrement done as requested'
    let stepperValue = parseInt(await getValue('stepperCount', 'pdpPage'))
    const expectedvalue = parseInt(value)
    const oosCheck = await countElements('pdpPage', 'productSizeMessage')
    if (oosCheck > 0) {
        actualText = await getText('productSizeMessage', 'pdpPage')
    }
    if (oosCheck > 0 && actualText.includes('out of stock')) {
        status = 'Stepper cannot be increment/decrement as requested'
    } else {
        while (stepperValue !== expectedvalue) {
            stepperIncrementState = await getAttributeValue(
                cssSelectorsList.pageObjects.pdpPage.selectors.stepperIncrement,
                'disabled'
            )
            stepperDecrementState = await getAttributeValue(
                cssSelectorsList.pageObjects.pdpPage.selectors.stepperDecrement,
                'disabled'
            )
            if (
                stepperValue > expectedvalue &&
                stepperDecrementState !== 'true'
            ) {
                await click('stepperDecrement', 'pdpPage')
            } else if (
                stepperValue < expectedvalue &&
                stepperIncrementState !== 'true'
            ) {
                await click('stepperIncrement', 'pdpPage')
            } else {
                status = 'Stepper cannot be increment/decrement as requested'
                break
            }
            stepperValue = parseInt(await getValue('stepperCount', 'pdpPage'))
        }
    }
    await client.assert.equal(
        status,
        'Stepper increment/decrement done as requested'
    )
}
