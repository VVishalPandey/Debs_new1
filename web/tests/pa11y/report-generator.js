/* eslint-disable import/no-commonjs */

const fs = require('fs')
// const htmlReporter = require('pa11y/reporter/html')

let destPath
let reportType

const pageWiseReport = (item, index) => {
    const path = `${destPath}${index + 1}.${reportType}`

    fs.writeFile(path, JSON.stringify(item.data), (error) => {
        if (error) {
            console.error(`write error: ${error.message}`)
        } else {
            console.log(`Successful Write to ${path}`)
        }
    })
}

const generateReport = (data, path, type) => {
    if (!fs.existsSync(path)) {
        fs.mkdirSync(path)
    }
    destPath = path
    reportType = type

    data.forEach(pageWiseReport)
}

module.exports = {
    process: generateReport
}
