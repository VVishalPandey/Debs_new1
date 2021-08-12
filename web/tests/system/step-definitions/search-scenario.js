import {defineSupportCode} from 'cucumber'
import {autoSearchDepartment, autoSearchProduct} from '../methods/autoSearch'

defineSupportCode(({Then}) => {
    Then(
        /^I select the auto search department as "(.*?)"$/,
        async department => {
            await autoSearchDepartment(department)
            await autoSearchProduct(department)
        }
    )
})
