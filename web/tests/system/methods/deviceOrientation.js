import {client} from 'nightwatch-cucumber'

// This method uses getOrientation api of Nightwatch to extract current device orientation
export const getOrientation = async () => {
    let orientation = ''
    await client.getOrientation(result => {
        orientation = result.value
    })
    return orientation
}

// This method sets the device orientation using setOrientation api
export const setOrientation = orientation => {
    client.setOrientation(orientation.toUpperCase())
}
