import {client} from 'nightwatch-cucumber'

let newWindow
let existingWindow

export const switchWindow = async windowType => {
    if (windowType === 'newWindow') {
        await client.windowHandles(result => {
            newWindow = result.value[1]
            return 'newWindow'
        })
        await client.switchWindow(newWindow)
    } else if (windowType === 'existingWindow') {
        await client.windowHandles(result => {
            existingWindow = result.value[0]
            return 'existingWindow'
        })
        await client.switchWindow(existingWindow)
    }
}
