import {defineSupportCode} from 'cucumber'
import {
    waitElementVisible,
    waitElementNotPresent,
    waitElementPresent
} from '../methods/explicitWait'

defineSupportCode(({Given}) => {
    Given(
        /^I should validate "(.*?)" page of "(.*?)"$/,
        async (pageType, country) => {
            if (country === 'UK' && pageType === 'home') {
                await waitElementPresent('personalFinanceLink', 'commonPage')
                await waitElementPresent('myBeautyClubLink', 'commonPage')
                await waitElementVisible('verifiedByAmexIcon', 'commonPage')
                await waitElementPresent('verifiedByVisaIcon', 'commonPage')
                await waitElementPresent(
                    'verifiedByMasterCardIcon',
                    'commonPage'
                )
                await waitElementVisible('heroImageContainer', 'homePage')
                await waitElementVisible('offersComponentHome', 'homePage')
                await waitElementVisible('uberComponentContainer', 'homePage')
            } else if (country === 'IE' && pageType === 'home') {
                await waitElementNotPresent('personalFinanceLink', 'commonPage')
                await waitElementNotPresent('myBeautyClubLink', 'commonPage')
                await waitElementNotPresent('verifiedByAmexIcon', 'commonPage')
                await waitElementPresent('verifiedByVisaIcon', 'commonPage')
                await waitElementPresent(
                    'verifiedByMasterCardIcon',
                    'commonPage'
                )
                await waitElementVisible('heroImageContainer', 'homePage')
                await waitElementVisible('offersComponentHome', 'homePage')
                await waitElementVisible('uberComponentContainer', 'homePage')
            }
        }
    )
})
