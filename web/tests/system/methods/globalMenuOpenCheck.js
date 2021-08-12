import {client} from 'nightwatch-cucumber'
import testData from '../test-data'
import {click} from './click'
import {countElements} from './elements'

export const globalMenuCloseValidtaion = async () => {
    const elementFound = await countElements('commonPage', 'globalNavMenuOpen')

    if (elementFound > 0) {
        await client.pause(testData.implicitTimeOut)
        await click('searchIcon', 'commonPage')
    }
}
