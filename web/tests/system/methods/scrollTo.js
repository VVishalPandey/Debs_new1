import {client} from 'nightwatch-cucumber'
import PageObjects from '../page-objects/page-objects'
import {globalMenuCloseValidtaion} from './globalMenuOpenCheck'

const cssSelectorsList = new PageObjects()
const testDataSet = process.env.TEST_DATA_SET || 'UK'

export const scrollToPosition = async (page, locator) => {
    let posX
    let posY
    let y
    await client.getLocation(
        cssSelectorsList.pageObjects[page].selectors[locator],
        result => {
            posX = result.value.x
            posY = result.value.y - 180
        }
    )
    if (posY < 40) {
        await client.execute(`scrollTo(${posX},${posY})`)
    } else {
        for (y = 40; y <= posY; y = y + 40) {
            await client.execute(`scrollTo(${posX},${y})`)
            if (testDataSet.includes('DESKTOP')) {
                await globalMenuCloseValidtaion()
            }
        }
    }
}

export const scrollToPositionBySelector = async selector => {
    let posX
    let posY
    let y
    await client.getLocation(selector, result => {
        posX = result.value.x
        posY = result.value.y - 150
    })
    for (y = 40; y <= posY; y = y + 40) {
        await client.execute(`scrollTo(${posX},${y})`)
        if (testDataSet.includes('DESKTOP')) {
            await globalMenuCloseValidtaion()
        }
    }
}

export const scrollToWithinSelector = async parentSelector => {
    await client.execute(`$('${parentSelector}')[0].scrollIntoView()`)
}
