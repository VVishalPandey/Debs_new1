import {client} from 'nightwatch-cucumber'
import {waitElementNotPresent} from './explicitWait'

export const goBack = async () => {
    client.execute(
        () => {
            window.history.back()

            return true
        },
        [],
        null
    )
    await waitElementNotPresent('desktopSkelton', 'commonPage')
}
