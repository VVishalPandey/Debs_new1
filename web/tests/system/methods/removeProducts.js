import {client} from 'nightwatch-cucumber'
import pageObjects from '../page-objects/page-objects'
import testData from '../test-data'
import {waitElementPresent, waitElementNotPresent} from './explicitWait'
import {scrollToPosition} from '../methods/scrollTo'
import {countElementsBySelector, countElements} from './elements'
import {clickBySelector, click} from './click'
import {getText, getTextAPI} from './getText'
import {swatchSizeAvailableOptionsSfl} from './pdpSizeColorSelector'
import {profiles} from '../site-ssr'

const cssSelectorsList = new pageObjects()
const testDataSet = process.env.TEST_DATA_SET || 'UK'

export const removeProducts = async (action, count, page) => {
    let i = 0
    let j = 1
    let countOfRemoveIcon = 0

    if (page === 'miniBag') {
        await client.pause(testData.implicitTimeOut)
        await client.elements(
            'css selector',
            cssSelectorsList.pageObjects.myBagPage.selectors
                .allProductNameElements,
            result => {
                const els = result.value
                els.forEach(() => i++)
            }
        )
        if (count === 'all') {
            for (j = 1; j <= i; j++) {
                await client.click(
                    cssSelectorsList.pageObjects.minibagPage.selectors
                        .firstProductRemove
                )
                await client.pause(testData.implicitTimeOut)
            }
        } else {
            for (j = 1; j <= count; j++) {
                await client.click(
                    cssSelectorsList.pageObjects.minibagPage.selectors
                        .firstProductRemove
                )
                await client.pause(testData.implicitTimeOut)
            }
        }
        await client.click(
            cssSelectorsList.pageObjects.minibagPage.selectors.closeButton
        )
    } else if (page === 'myBagPage') {
        await client.pause(testData.implicitTimeOut)
        await waitElementPresent('footerMenuSection', 'commonPage')
        await waitElementNotPresent('desktopSkelton', 'commonPage')
        await client.elements(
            'css selector',
            cssSelectorsList.pageObjects.myBagPage.selectors
                .allProductNameElements,
            result => {
                const els = result.value
                els.forEach(() => i++)
            }
        )
        if (i > 0) {
            countOfRemoveIcon = await countElementsBySelector(
                cssSelectorsList.pageObjects.myBagPage.selectors
                    .removeTrashIconsMyBag
            )
        }
        if (count === 'all') {
            while (j <= i && countOfRemoveIcon > 0) {
                await client.pause(testData.implicitTimeOut)
                // await scrollToWithinSelector(cssSelectorsList.pageObjects.myBagPage.selectors.removeTrashIconsMyBag)
                await client.click(
                    cssSelectorsList.pageObjects.myBagPage.selectors
                        .removeTrashIconsMyBag
                )
                await client.pause(testData.implicitTimeOut)
                if (action === 'Remove') {
                    await client.click(
                        cssSelectorsList.pageObjects.myBagPage.selectors
                            .removePopUpYesButton
                    )
                } else if (action === 'SFL') {
                    await client.click(
                        cssSelectorsList.pageObjects.myBagPage.selectors
                            .addToSFLFromMyBag
                    )
                }
                await client.pause(testData.implicitTimeOut)
                await waitElementNotPresent('loader', 'commonPage')
                countOfRemoveIcon = await countElementsBySelector(
                    cssSelectorsList.pageObjects.myBagPage.selectors
                        .removeTrashIconsMyBag
                )
                j++
            }
            await waitElementPresent('emptyBagMessage', 'myBagPage')
        } else {
            while (j <= count && countOfRemoveIcon > count) {
                await client.click(
                    cssSelectorsList.pageObjects.myBagPage.selectors
                        .removeTrashIconsMyBag
                )
                await client.pause(testData.implicitTimeOut)
                if (action === 'Remove') {
                    await client.click(
                        cssSelectorsList.pageObjects.myBagPage.selectors
                            .removePopUpYesButton
                    )
                    await client.pause(testData.implicitTimeOut)
                } else if (action === 'SFL') {
                    await client.click(
                        cssSelectorsList.pageObjects.myBagPage.selectors
                            .removePopUpSaveLaterButton
                    )
                }
                await client.pause(testData.implicitTimeOut)
                await waitElementNotPresent('loader', 'commonPage')
                countOfRemoveIcon = await countElementsBySelector(
                    cssSelectorsList.pageObjects.myBagPage.selectors
                        .removeTrashIconsMyBag
                )
                j++
            }
        }
    } else if (page === 'mySavedItems') {
        let sflCount = 0
        await waitElementPresent('footerMenuSection', 'commonPage')
        await waitElementNotPresent('desktopSkelton', 'commonPage')
        await client.pause(testData.implicitTimeOut)
        await client.getText(
            cssSelectorsList.pageObjects.commonPage.selectors.saveForLaterCount,
            result => {
                sflCount = result.value.trim()
            }
        )
        if (sflCount > 0) {
            await waitElementPresent('mySavedItemsProductList', 'myBagPage')
            await scrollToPosition('myBagPage', 'footerPaymentIcons')

            await client.elements(
                'css selector',
                cssSelectorsList.pageObjects.myBagPage.selectors
                    .mySavedItemsProductNameList,
                result => {
                    const els = result.value
                    els.forEach(() => i++)
                }
            )
            countOfRemoveIcon = await countElementsBySelector(
                cssSelectorsList.pageObjects.myBagPage.selectors
                    .mySavedItemsProductNameList
            )
            if (count === 'all') {
                while (j <= i && countOfRemoveIcon > 0) {
                    await client.pause(testData.implicitTimeOut)
                    await client.click(
                        cssSelectorsList.pageObjects.myBagPage.selectors
                            .firstSFLProductRemove
                    )
                    await client.pause(testData.implicitTimeOut)
                    await client.click(
                        cssSelectorsList.pageObjects.myBagPage.selectors
                            .removePopUpYesButton
                    )
                    await client.pause(testData.implicitTimeOut)
                    await waitElementNotPresent('loader', 'commonPage')
                    countOfRemoveIcon = await countElementsBySelector(
                        cssSelectorsList.pageObjects.myBagPage.selectors
                            .removeTrashIconsSFL
                    )
                    j++
                }
                await waitElementNotPresent('savedItemCarousal', 'myBagPage')
            } else {
                while (j <= count && countOfRemoveIcon > count) {
                    await client.pause(testData.implicitTimeOut)
                    await client.click(
                        cssSelectorsList.pageObjects.myBagPage.selectors
                            .firstSFLProductRemove
                    )
                    await client.pause(testData.implicitTimeOut)
                    await client.click(
                        cssSelectorsList.pageObjects.myBagPage.selectors
                            .removePopUpYesButton
                    )
                    await waitElementNotPresent('loader', 'commonPage')
                    countOfRemoveIcon = await countElementsBySelector(
                        cssSelectorsList.pageObjects.myBagPage.selectors
                            .removeTrashIconsSFL
                    )
                    j++
                }
            }
        }
    }
}

export const removeAddresses = async () => {
    let j = 3
    let countOfRemoveIcon = 0
    await client.pause(testData.implicitTimeOut)
    countOfRemoveIcon = await countElementsBySelector(
        `.t-my-account__address-book--addressbox .dbh-remove`
    )
    console.log(countOfRemoveIcon)
    if (countOfRemoveIcon > 2) {
        for (j = 3; j <= countOfRemoveIcon - 2; j++) {
            await client.pause(1500)
            await clickBySelector(
                `.t-my-account__address-book--addressbox:nth-child(${j}) .dbh-remove`
            )
            await client.pause(600)
            // await waitElementPresent('removePopUpMessage', 'addressBookPage')
            await click('removeYesLabel', 'addressBookPage')
            await client.pause(4000)
        }
    }
}

/*  eslint max-depth: [2, 10]*/
export const addRemoveProduct = async (action, productName, page) => {
    let i = 1
    let j = 1
    let countOfBagProducts = 0
    let countOfSFLProducts = 0
    let locate
    let temp
    let minibagBeforeCount = 0
    let product
    let newCountOfBagProducts
    await client.pause(testData.implicitTimeOut)
    await waitElementPresent('footerMenuSection', 'commonPage')
    await waitElementNotPresent('desktopSkelton', 'commonPage')
    // Count the products added to bag
    if (!productName === 'All') {
        product = testData[productName].toUpperCase()
    }
    countOfBagProducts = await countElementsBySelector(
        cssSelectorsList.pageObjects.myBagPage.selectors.bagProductList
    )
    // Count the products added to SFL
    countOfSFLProducts = await countElementsBySelector(
        cssSelectorsList.pageObjects.myBagPage.selectors
            .mySavedItemsProductNameList
    )

    if (countOfBagProducts === 0 && action === 'Remove') {
        await console.log('Bag is empty')
    } else {
        // Copy the Mini bag count
        const elementFound = await countElements('minibagPage', 'minibagCount')
        if (elementFound === 1) {
            minibagBeforeCount = await getText('minibagCount', 'minibagPage')
        } else if (testDataSet.includes('DESKTOP')) {
            minibagBeforeCount = 'My Bag'
        }
        // Condition for actions like "add", "Remove" and "SFL" on My bag apge
        if (page === 'myBagPage') {
            // Condition for actions "add" on My bag page
            if (action === 'add') {
                while (j <= countOfSFLProducts) {
                    for (i = 1; i <= countOfSFLProducts; i++) {
                        locate = cssSelectorsList.pageObjects.myBagPage.selectors.mySavedItemsProductName.replace(
                            /[0-9]/g,
                            `${i}`
                        )
                        // Get Product Name and compare with expected
                        temp = await getTextAPI(locate)
                        temp = temp.toUpperCase()
                        if (temp.includes(product)) {
                            locate = cssSelectorsList.pageObjects.myBagPage.selectors.mySavedItemsChooseOptionButtonList.replace(
                                /[0-9]/g,
                                `${i}`
                            )
                            temp = await getTextAPI(locate)
                            if (temp.trim() === 'Move to bag') {
                                await clickBySelector(locate)
                            } else {
                                await clickBySelector(locate)
                                await swatchSizeAvailableOptionsSfl()
                                await click(
                                    'mySavedItemsChooseOptionPopUpAddToBagButton',
                                    'myBagPage'
                                )
                                // j = countOfSFLProducts
                            }
                            j = countOfSFLProducts + 1

                            break
                        } else if (
                            testDataSet.includes('DESKTOP') &&
                            i === 4 &&
                            countOfSFLProducts > 4
                        ) {
                            // then click on crosel arrow
                            await click(
                                'mySavedItemsChooseOptionNextButton',
                                'myBagPage'
                            )
                            await client.pause(testData.implicitTimeOut)
                            i = 0
                        }
                        j++
                    }
                }

                // Condition for actions "Remove" an "SFL" on My bag page
            } else if (action === 'Remove' || action === 'SFL') {
                if (countOfBagProducts > 0) {
                    for (i = 1; i <= countOfBagProducts; i++) {
                        if (productName === 'All') {
                            // locate = cssSelectorsList.pageObjects.myBagPage.selectors.bagProductTrash
                            await client.pause(testData.implicitTimeOut)
                            await click('bagProductTrash', 'myBagPage')
                            await client.pause(testData.implicitTimeOut)
                            if (action === 'Remove') {
                                await click('removePopUpYesButton', 'myBagPage')
                                await client.pause(testData.implicitTimeOut)
                                await waitElementNotPresent(
                                    'loader',
                                    'commonPage'
                                )
                            }
                            newCountOfBagProducts = await countElementsBySelector(
                                cssSelectorsList.pageObjects.myBagPage.selectors
                                    .bagProductList
                            )
                            if (newCountOfBagProducts === 0) {
                                await console.log('Bag is empty now')
                                break
                            }
                        } else if (!productName === 'All') {
                            locate = cssSelectorsList.pageObjects.myBagPage.selectors.bagProductTitle.replace(
                                /[0-9]/g,
                                `${i}`
                            )
                            // Get Product name and compare with expected product
                            temp = await getTextAPI(locate)
                            temp = temp.toUpperCase()
                            if (temp.includes(product)) {
                                locate = cssSelectorsList.pageObjects.myBagPage.selectors.bagProductTrash.replace(
                                    /[0-9]/g,
                                    `${i}`
                                )
                                await clickBySelector(locate)
                                await client.pause(testData.implicitTimeOut)
                                if (action === 'Remove') {
                                    await click(
                                        'removePopUpYesButton',
                                        'myBagPage'
                                    )
                                    await client.pause(testData.implicitTimeOut)
                                    await waitElementNotPresent(
                                        'loader',
                                        'commonPage'
                                    )
                                } else if (action === 'SFL') {
                                    await click(
                                        'removePopUpSaveLaterButton',
                                        'myBagPage'
                                    )
                                    await client.pause(testData.implicitTimeOut)
                                    await waitElementNotPresent(
                                        'loader',
                                        'commonPage'
                                    )
                                }
                                break
                            }
                        }
                    }
                }
            }
            await client.pause(testData.implicitTimeOut)
            await waitElementNotPresent('loader', 'commonPage')
            await client.pause(testData.implicitTimeOut)
            await client.pause(testData.implicitTimeOut)
            let minibagAfterCount
            if (newCountOfBagProducts === 0) {
                minibagAfterCount = 0
            } else {
                console.log('Reached')
                minibagAfterCount = await getText('minibagCount', 'minibagPage')
            }
            await client.assert.notEqual(
                minibagBeforeCount,
                minibagAfterCount,
                'Minibag count are same'
            )
        }
        if (!productName === 'All') {
            await profiles('basketCheckoutUrl')
            await waitElementPresent('headerText', 'myBagPage')
            await client.pause(testData.implicitTimeOut)
        }
    }
}
