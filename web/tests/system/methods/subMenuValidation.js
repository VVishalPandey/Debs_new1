import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'
import {countElements, countElementsBySelector} from './elements'

const cssSelectorsList = new PageObjects()

export const subMenuValidationBigScreen = async childOption => {
    let numberOfColumns = 0
    let eachColumnPosition
    let selector
    let columnSelector
    let subMenuHeader
    let numberOfSubMenuHeaders = 0
    let numberOfColumnValues = 0
    let subMenuOption
    let subMenuSelector
    let count = 0

    // Extract the number of columns within the parent option
    numberOfColumns = await countElements(
        'commonPage',
        'globalNavSubMenuColumns'
    )

    // Going through value of each row and finding the expected value
    for (
        eachColumnPosition = 1;
        eachColumnPosition <= numberOfColumns;
        eachColumnPosition = eachColumnPosition + 1
    ) {
        numberOfColumnValues = 0

        // Extract individual column values and compare with expected value
        columnSelector = cssSelectorsList.pageObjects.commonPage.selectors.globalNavSubMenuColumOptions.replace(
            'parentPos',
            `${eachColumnPosition}`
        )
        subMenuHeader = cssSelectorsList.pageObjects.commonPage.selectors.globalNavSubMenuHeaders.replace(
            'parentPos',
            `${eachColumnPosition}`
        )
        numberOfColumnValues = await countElementsBySelector(columnSelector)
        numberOfSubMenuHeaders = await countElementsBySelector(subMenuHeader)
        let counter = 1
        for (
            subMenuOption = 1;
            subMenuOption <= numberOfColumnValues + numberOfSubMenuHeaders;
            subMenuOption = subMenuOption + 1
        ) {
            subMenuSelector = columnSelector.concat(`:nth-child(${counter})`)
            await client.elements('css selector', subMenuSelector, result => {
                if (result.value.length) {
                    client.getText(subMenuSelector, result1 => {
                        if (
                            result1.value.toUpperCase().trim() ===
                            childOption.toUpperCase()
                        ) {
                            count++
                            selector = subMenuSelector
                        }
                    })
                }
            })
            if (count === 0 || counter <= numberOfColumnValues + 1) {
                counter++
            }
        }
    }
    await client.assert.equal(count, '1')
    return selector
}
