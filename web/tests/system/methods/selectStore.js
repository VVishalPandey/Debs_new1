import {client} from 'nightwatch-cucumber'
import pageObjects from '../page-objects/page-objects'
import testData from '../test-data'
import {countElementsBySelector} from './elements'
import {clickBySelector, click} from './click'
import {getTextAPI} from './getText'

const cssSelectorsList = new pageObjects()
const testDataSet = process.env.TEST_DATA_SET || 'UK'

export const selectStore = async (action, storename, miles, page) => {
    let i = 1
    let j = 0
    let countOfStores = 0
    let storeName
    let storeMiles
    let temp
    await client.pause(testData.implicitTimeOut)
    const store = storename.toUpperCase()
    // Count the Store in the List View
    countOfStores = await countElementsBySelector(
        cssSelectorsList.pageObjects.locateStorePage.selectors.listViewOptions
    )
    // Condition for actions like "add", "Remove" and "SFL" on My bag apge
    if (page === 'locateStorePage') {
        // Condition for actions "add" on My bag page
        if (action === 'select') {
            if (!testDataSet.includes('DESKTOP') && countOfStores > 5) {
                await click('showMoreShopLink', 'locateStorePage')
                await client.pause(testData.implicitTimeOut)
            }
            for (i = 1; i <= countOfStores; i++) {
                storeName = cssSelectorsList.pageObjects.locateStorePage.selectors.listViewOptions.concat(
                    `:nth-child(${i}) .c-click-collect-list-item__store-name`
                )
                // Get Product Name and compare with expected
                temp = await getTextAPI(storeName)
                temp = temp.toUpperCase()
                if (temp.includes(store)) {
                    storeMiles = cssSelectorsList.pageObjects.locateStorePage.selectors.listViewOptions.concat(
                        `:nth-child(${i}) .c-click-collect-list-item__store-distance`
                    )
                    temp = await getTextAPI(storeMiles)
                    if (temp.trim() === miles) {
                        await clickBySelector(storeName)
                    }
                    j = j + 1

                    break
                }
            }
            await client.assert.equal(j, '1')
        }
    }
}
