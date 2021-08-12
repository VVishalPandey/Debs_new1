import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'
import testData from '../test-data'

const cssSelectorsList = new PageObjects()

export const menuValidation = async (option, locator2, parentText, page) => {
    let i = 0
    let j
    let count = 0
    let res
    let finalres
    let options
    let posX
    let posY
    // For footer menu list
    await client.elements(
        'css selector',
        cssSelectorsList.pageObjects[page].selectors[locator2],
        result => {
            const els = result.value
            els.forEach(() => i++)
        }
    )
    if (
        locator2 === 'mainMenuList' ||
        locator2 === 'footerMenuList' ||
        locator2 === 'filterMenuList' ||
        locator2 === 'storeMenuList' ||
        locator2 === 'brandRoomFilterMenuList'
    ) {
        for (j = 1; j <= i; j++) {
            options = locator2.replace('List', 'Option')
            res = cssSelectorsList.pageObjects[page].selectors[options].replace(
                /[0-9]/g,
                `${j}`
            )
            await client.getText(res, result => {
                if (result.value.trim() === parentText) {
                    finalres = res
                    count++
                }
            })
        }
        if (option === 'validate') {
            await client.assert.equal(count, '1')
        } else if (option === 'validate & click') {
            await client.assert.equal(count, '1')
            await client.getLocation(finalres, result => {
                posX = result.value.x
                posY = result.value.y - 60
            })
            await client.execute(`scrollTo(${posX},${posY})`)
            await client.pause(testData.implicitTimeOut)
            await client.click(finalres)
            await client.pause(testData.implicitTimeOut)
        }
    } else if (
        locator2 === 'subMenuList' &&
        parentText !== 'Shop Departments'
    ) {
        for (j = 2; j <= i; j++) {
            options = locator2.replace('List', 'Option')
            res = cssSelectorsList.pageObjects[page].selectors[options].replace(
                /[0-9]/g,
                `${j}`
            )
            await client.getText(res, result => {
                if (result.value.trim() === parentText) {
                    finalres = res
                    count++
                }
            })
        }
        if (option === 'validate') {
            await client.assert.equal(count, '1')
        } else if (option === 'validate & click') {
            await client.assert.equal(count, '1')
            await client.getLocation(finalres, result => {
                posX = result.value.x
                posY = result.value.y - 60
            })
            await client.execute(`scrollTo(${posX},${posY})`)
            await client.click(finalres)
            await client.pause(testData.implicitTimeOut)
        }
    } else if (locator2 === 'scatfilterMenuList') {
        for (j = 1; j <= i; j++) {
            options = locator2.replace('List', 'Option')
            res = cssSelectorsList.pageObjects[page].selectors[options].replace(
                /[0-9]/g,
                `${j}`
            )
            await client.getText(res, result => {
                if (result.value.trim() === parentText) {
                    finalres = res
                    count++
                }
            })
        }
        if (option === 'validate') {
            await client.assert.equal(count, '1')
        } else if (option === 'validate & click') {
            await client.assert.equal(count, '1')
            await client.getLocation(finalres, result => {
                posX = result.value.x
                posY = result.value.y - 60
            })
            await client.execute(`scrollTo(${posX},${posY})`)
            await client.click(finalres)
            await client.pause(testData.implicitTimeOut)
        }
    } else if (locator2 === 'tcatfilterMenuList') {
        for (j = 2; j <= i + 1; j++) {
            options = locator2.replace('List', 'Option')
            res = cssSelectorsList.pageObjects[page].selectors[options].replace(
                /[0-9]/g,
                `${j}`
            )
            await client.getText(res, result => {
                if (result.value.trim() === parentText) {
                    finalres = res
                    count++
                }
            })
        }
        if (option === 'validate') {
            await client.assert.equal(count, '1')
        } else if (option === 'validate & click') {
            await client.assert.equal(count, '1')
            await client.getLocation(finalres, result => {
                posX = result.value.x
                posY = result.value.y - 60
            })
            await client.execute(`scrollTo(${posX},${posY})`)
            await client.click(finalres)
            await client.pause(testData.implicitTimeOut)
        }
    }
}
