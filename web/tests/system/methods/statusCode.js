import testData from '../test-data'

// eslint-disable-next-line import/no-commonjs
const fetch = require('node-fetch')

export const checkStatusCode = async url => {
    return fetch(testData[url]).then(res => res.status)
}
