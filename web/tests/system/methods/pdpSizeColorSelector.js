import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'
import {countElements} from '../methods/elements'
import {getAttributeValue} from '../methods/getAttribute'
import {clickBySelector, click} from '../methods/click'
import {getTextBySelector} from '../methods/getText'
import {waitElementVisible} from '../methods/explicitWait'
import testData from '../test-data'

const cssSelectorsList = new PageObjects()

const testDataSet = process.env.TEST_DATA_SET || 'UK'

export const swatchColorAvailableOption = async () => {
    let attributeValue
    let availableSizeSelector
    let i
    i = 0

    const numberOfSizeOptions = await countElements(
        'pdpPage',
        'swatchColorSelectorOptions'
    )

    if (numberOfSizeOptions) {
        for (i = 1; i <= numberOfSizeOptions; i++) {
            attributeValue = await getAttributeValue(
                cssSelectorsList.pageObjects.pdpPage.selectors.swatchColorSelectorOptions.concat(
                    `:nth-child(${i})`
                ),
                'class'
            )
            if (!attributeValue.includes('-oos')) {
                availableSizeSelector = cssSelectorsList.pageObjects.pdpPage.selectors.swatchColorSelectorOptions.concat(
                    `:nth-child(${i})`
                )
                break
            }
        }
        await clickBySelector(availableSizeSelector)
        await client.pause(testData.implicitTimeOut)
    }
}

export const swatchSizeAvailableOptions = async () => {
    let attributeValue
    let availableSizeSelector
    let i
    i = 0

    const numberOfSizeOptions = await countElements(
        'pdpPage',
        'swatchSizeSelectorOptions'
    )
    if (numberOfSizeOptions) {
        for (i = 1; i <= numberOfSizeOptions; i++) {
            attributeValue = await getAttributeValue(
                cssSelectorsList.pageObjects.pdpPage.selectors.swatchSizeSelectorOptions.concat(
                    `:nth-child(${i})`
                ),
                'class'
            )
            if (!attributeValue.includes('nostock')) {
                availableSizeSelector = cssSelectorsList.pageObjects.pdpPage.selectors.swatchSizeSelectorOptions.concat(
                    `:nth-child(${i})`
                )
                break
            }
        }
        await clickBySelector(availableSizeSelector)
        await client.pause(testData.implicitTimeOut)
    }
}

export const swatchSizeAvailableOptionsSfl = async () => {
    let attributeValue
    let availableSizeSelector
    let i
    i = 0

    const numberOfSizeOptions = await countElements(
        'myBagPage',
        'swatchSizeSelectorOptionsSfl'
    )
    if (numberOfSizeOptions) {
        for (i = 1; i <= numberOfSizeOptions; i++) {
            attributeValue = await getAttributeValue(
                cssSelectorsList.pageObjects.myBagPage.selectors.swatchSizeSelectorOptionsSfl.concat(
                    `:nth-child(${i})`
                ),
                'class'
            )
            if (!attributeValue.includes('nostock')) {
                availableSizeSelector = cssSelectorsList.pageObjects.myBagPage.selectors.swatchSizeSelectorOptionsSfl.concat(
                    `:nth-child(${i})`
                )
                break
            }
        }
        await clickBySelector(availableSizeSelector)
        await client.pause(testData.implicitTimeOut)
    }
}

export const dropdownRangePriceAvailableOption = async () => {
    let attributeValue
    let availableSizeSelector
    let i

    i = await countElements('pdpPage', 'dropdownRangePriceOptionCount')

    if (i > 0) {
        await click('dropdownRangePriceOptionCount', 'pdpPage')
    }

    const numberOfSizeOptions = await countElements(
        'pdpPage',
        'dropdownRangePriceOptionCount'
    )
    if (numberOfSizeOptions) {
        for (i = 2; i <= numberOfSizeOptions; i++) {
            attributeValue = await getAttributeValue(
                cssSelectorsList.pageObjects.pdpPage.selectors.dropdownRangePriceOption.replace(
                    'elem',
                    i
                ),
                'class'
            )
            if (!attributeValue.includes('stock-price--out')) {
                availableSizeSelector = cssSelectorsList.pageObjects.pdpPage.selectors.dropdownRangePriceOption.replace(
                    'elem',
                    i
                )

                break
            }
        }
        await clickBySelector(availableSizeSelector)
    }
}

export const upselldropdownAmountOptionSelect = async () => {
    let attributeValue
    let availableAmountSelector
    let i

    await click('giftCardGcDropdown', 'myBagPage')
    i = await countElements(
        'myBagPage',
        'giftCardGcAmountDropdownOptionElements'
    )
    if (i > 0) {
        await click('giftCardGcAmountDropdownOptionElements', 'myBagPage')
    }

    const numberOfSizeOptions = await countElements(
        'myBagPage',
        'giftCardGcAmountDropdownOptionElements'
    )
    if (numberOfSizeOptions) {
        for (i = 2; i <= numberOfSizeOptions; i++) {
            attributeValue = await getAttributeValue(
                cssSelectorsList.pageObjects.myBagPage.selectors.dropdownAmountOption.replace(
                    'amt',
                    i
                ),
                'class'
            )
            if (!attributeValue.includes('stock-price--out')) {
                availableAmountSelector = cssSelectorsList.pageObjects.pdpPage.selectors.dropdownRangePriceOption.replace(
                    'amt',
                    i
                )

                break
            }
        }
        await clickBySelector(availableAmountSelector)
    }
}

export const dropdownAvailableOption = async () => {
    let attributeValue
    let availableSizeSelector
    let i
    let startPoint = 1
    let quickShopExist = 0

    if (testDataSet.includes('DESKTOP')) {
        quickShopExist = await countElements('pdpPage', 'quickShopOverlay')
    }
    if (quickShopExist === 1) {
        i = await countElements('pdpPage', 'quickShopSizeAsDropDown')

        if (i > 0) {
            await click('quickShopSizeAsDropDown', 'pdpPage')
            await waitElementVisible('quickShopDropdownOption', 'pdpPage')
        }

        const numberOfSizeOptions = await countElements(
            'pdpPage',
            'quickShopDropdownOption'
        )
        if (numberOfSizeOptions) {
            for (i = startPoint; i <= numberOfSizeOptions; i++) {
                attributeValue = await getTextBySelector(
                    cssSelectorsList.pageObjects.pdpPage.selectors.quickShopDropdownOption.concat(
                        `:nth-child(${i})`
                    )
                )
                if (!attributeValue.includes('Out of Stock')) {
                    availableSizeSelector = cssSelectorsList.pageObjects.pdpPage.selectors.quickShopDropdownOption.concat(
                        `:nth-child(${i})`
                    )
                    break
                }
            }
            await clickBySelector(availableSizeSelector)
        }
    } else {
        i = await countElements('pdpPage', 'sizeAsDropdown')

        if (i > 0) {
            await click('sizeAsDropdown', 'pdpPage')
            await waitElementVisible('dropdownOption', 'pdpPage')
        }

        const numberOfSizeOptions = await countElements(
            'pdpPage',
            'dropdownOption'
        )

        if (!testDataSet.includes('DESKTOP')) {
            startPoint = 2
        }
        if (numberOfSizeOptions) {
            for (i = startPoint; i <= numberOfSizeOptions; i++) {
                attributeValue = await getTextBySelector(
                    cssSelectorsList.pageObjects.pdpPage.selectors.dropdownOption.concat(
                        `:nth-child(${i})`
                    )
                )
                if (!attributeValue.includes('Out of Stock')) {
                    availableSizeSelector = cssSelectorsList.pageObjects.pdpPage.selectors.dropdownOption.concat(
                        `:nth-child(${i})`
                    )
                    break
                }
            }
            await clickBySelector(availableSizeSelector)
        }
    }
}
