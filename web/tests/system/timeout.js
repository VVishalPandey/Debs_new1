import {defineSupportCode} from 'cucumber'
import testData from '../../tests/system/test-data'

defineSupportCode(({setDefaultTimeout}) => {
    setDefaultTimeout(30 * testData.timeOut)
})
