import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'
import {countElementsBySelector} from './elements'
import {getTextBySelector} from './getText'

const cssSelectorsList = new PageObjects()

export const subFilterValidationBigScreen = async (
    parentOption,
    parentPosition,
    childOption
) => {
    let numberOfFilterValues = 0
    let selector
    let subFilterCount
    let subFilterSelector
    let subFilterOption
    let subFiterValue
    let count = 0

    const subFilterCheckboxValidate = await countElementsBySelector(
        cssSelectorsList.pageObjects.pspPage.selectors.filterSubMenuOption
            .replace('parentPos', `${parentPosition}`)
            .concat(`[type=checkbox]`)
    )
    if (subFilterCheckboxValidate > 0) {
        subFilterCount = cssSelectorsList.pageObjects.pspPage.selectors.filterSubMenuOption
            .replace('parentPos', `${parentPosition}`)
            .concat(`> div`)
    } else {
        subFilterCount = cssSelectorsList.pageObjects.pspPage.selectors.filterSubMenuOption
            .replace('parentPos', `${parentPosition}`)
            .concat(`> p`)
    }
    // Extract the number of columns within the parent option
    numberOfFilterValues = await countElementsBySelector(subFilterCount)
    // Going through value of each filter and finding the expected child filter
    for (
        subFilterOption = 1;
        subFilterOption <= numberOfFilterValues;
        subFilterOption = subFilterOption + 1
    ) {
        if (subFilterCheckboxValidate > 0) {
            subFilterSelector = subFilterCount.concat(
                `:nth-child(${subFilterOption})`
            )
        } else {
            subFilterSelector = subFilterCount.concat(
                `:nth-child(${subFilterOption}) a`
            )
        }
        subFiterValue = await getTextBySelector(subFilterSelector)
        subFiterValue = subFiterValue.split('(')[0]
        subFiterValue = subFiterValue.trim()
        if (subFiterValue.toUpperCase() === childOption.toUpperCase()) {
            count++
            selector = subFilterSelector
            break
        }
    }
    if (
        subFilterCheckboxValidate > 0 &&
        subFiterValue.toUpperCase().includes('VIEW ')
    ) {
        selector = selector.concat(` a`)
    }
    await client.assert.equal(count, '1')
    return selector
}
