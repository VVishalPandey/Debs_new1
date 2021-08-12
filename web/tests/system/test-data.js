import testDataUk from './test-data-files/test-data-prod/test-data-uk.json'
import testDataRoi from './test-data-files/test-data-prod/test-data-roi.json'
import testDataUkPREPROD from './test-data-files/test-data-preprod/test-data-uk.json'
import testDataRoiPREPROD from './test-data-files/test-data-preprod/test-data-roi.json'
import testDataUkALPHA from './test-data-files/test-data-alpha/test-data-uk.json'
import testDataRoiALPHA from './test-data-files/test-data-alpha/test-data-roi.json'
import testDataUkSTAGE from './test-data-files/test-data-staging/test-data-uk.json'
import testDataUkTESTCCC from './test-data-files/test-data-ccc/test-data-ccc-test-uk.json'
import testDataRoiTESTCCC from './test-data-files/test-data-ccc/test-data-ccc-test-roi.json'
import testDataUkCCC from './test-data-files/test-data-ccc/test-data-ccc-uk.json'
import testDataRoiCCC from './test-data-files/test-data-ccc/test-data-ccc-roi.json'

const testData = {
    testDataUk,
    testDataRoi,
    testDataUkPREPROD,
    testDataRoiPREPROD,
    testDataUkALPHA,
    testDataRoiALPHA,
    testDataUkSTAGE,
    testDataUkTESTCCC,
    testDataRoiTESTCCC,
    testDataUkCCC,
    testDataRoiCCC
}

const testDataSet = process.env.TEST_DATA_SET || 'ROI'
let finalDataSet
let testDataSetEnv = testDataSet.split('-')[0]

if (
    !testDataSetEnv.includes('CCC') &&
    !testDataSetEnv.includes('ALPHA') &&
    !testDataSetEnv.includes('PREPROD') &&
    !testDataSetEnv.includes('STAGE') &&
    !testDataSetEnv.includes('TESTCCC')
) {
    testDataSetEnv = ''
}

if (!testDataSet.includes('ROI')) {
    finalDataSet = testData['testDataUk'.concat(testDataSetEnv)]
} else if (testDataSet.includes('ROI')) {
    finalDataSet = testData['testDataRoi'.concat(testDataSetEnv)]
}

let arrayIndexCounter = 0
const finalTestDataObject = {}

while (arrayIndexCounter < finalDataSet.length) {
    const obj = finalDataSet[arrayIndexCounter]
    for (const key in obj) {
        if (obj.hasOwnProperty(key)) {
            finalTestDataObject[key] = obj[key]
        }
    }
    arrayIndexCounter++
}

export default finalTestDataObject
