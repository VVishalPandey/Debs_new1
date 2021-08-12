import {client} from 'nightwatch-cucumber'
import {defineSupportCode} from 'cucumber'
import {getOrientation, setOrientation} from '../methods/deviceOrientation'

defineSupportCode(({Then, When}) => {
    // This scenario is to change the device orientation as per the paramenter passed in the step which can we Portrait or Landscape
    When(/^I change device orientation to "(.*?)"$/, async orientation => {
        await setOrientation(orientation)
    })

    // This scenario is to validate what the current device orientation is and matches the value with the expectedOrientation passed in step
    Then(
        /^I validate device orientation is "(.*?)"$/,
        async expectedOrientation => {
            const actualOrientation = await getOrientation()
            await client.assert.equal(
                actualOrientation,
                expectedOrientation.toUpperCase()
            )
        }
    )
})
