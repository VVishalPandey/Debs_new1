/* * *  *  * *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  * */
/* Copyright (c) 2017 Mobify Research & Development Inc. All rights reserved. */
/* * *  *  * *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  * */

/* eslint-disable import/no-commonjs */

const testDataSet = process.env.TEST_DATA_SET || 'UK'
let featureFolder

if (testDataSet === 'UK') {
    featureFolder = './tests/system/features-uk'
} else if (testDataSet === 'ROI') {
    featureFolder = './tests/system/features-roi'
} else if (testDataSet === 'INT') {
    featureFolder = './tests/system/features-int'
} else if (testDataSet === 'TABLET') {
    featureFolder = './tests/system/features-tablet-uk'
} else if (testDataSet === 'TABLET-INT') {
    featureFolder = './tests/system/features-tablet-int'
} else if (testDataSet === 'TABLET-ROI') {
    featureFolder = './tests/system/features-tablet-roi'
} else if (testDataSet === 'DESKTOP') {
    featureFolder = './tests/system/features-desktop-uk'
} else if (testDataSet === 'DESKTOP-INT') {
    featureFolder = './tests/system/features-desktop-int'
} else if (testDataSet === 'DESKTOP-ROI') {
    featureFolder = './tests/system/features-desktop-roi'
}

const fs = require('fs')
require('console.table')

const pathToTargetTest = process.argv[2]

const badCoverageThreshold = 60
const acceptableCoverageThreshold = 60

const getColour = percentage => {
    if (percentage < badCoverageThreshold) {
        return 'red'
    } else if (percentage < acceptableCoverageThreshold) {
        return 'yellow'
    } else {
        return 'green'
    }
}

// Quick and dirty way to render the table to add to the report
const writeTable = features => {
    let output = ''

    output += `
        <table>
            <thead>
                <tr>
    `

    // use Object.keys on the first entry to get the headings
    Object.keys(features[0]).forEach(key => {
        output += `<td>${key}</td>`
    })

    output += `
                </tr>
            </thead>
            <tbody>
    `

    features.forEach(feature => {
        output += `<tr>`

        Object.keys(feature).forEach(key => {
            const value = feature[key]

            if (key === '% of automated test cases') {
                output += `<td style="color: ${getColour(value)}">${value}</td>`
            } else {
                output += `<td>${value}</td>`
            }
        })

        output += `</tr>`
    })

    output += `
            </tbody>
        </table>
    `

    fs.writeFileSync('./reports/e2e/coverage.html', output)
    console.log('Report also written to /reports/e2e/coverage.html')
}

const writeTableFolderCount = folders => {
    let output = ''

    output += `
        <table>
            <thead>
                <tr>
    `

    // use Object.keys on the first entry to get the headings
    Object.keys(folders[0]).forEach(key => {
        output += `<td>${key}</td>`
    })

    output += `
                </tr>
            </thead>
            <tbody>
    `

    folders.forEach(folder => {
        output += `<tr>`

        Object.keys(folder).forEach(key => {
            const value = folder[key]
            output += `<td>${value}</td>`
        })

        output += `</tr>`
    })

    output += `
            </tbody>
        </table>
    `
    fs.writeFileSync('./reports/e2e/folderCoverage.html', output)
    console.log('Report also written to /reports/e2e/folderCoverage.html')
}

const getOutputForFeature = feature => {
    const result = {}

    if (feature.name) {
        result.name = feature.name
    }

    const percentageAutomated = feature.percentageAutomated.toFixed(2)
    const percentageNotAutomated = feature.percentageNotAutomated.toFixed(2)
    const percentageManual = feature.percentageManual.toFixed(2)

    Object.assign(result, {
        '# of tests': feature.testCount,
        '# of automated tests': feature.automatedTestCount,
        '# of manual tests': feature.manualTestCount,
        '# of not automated tests': feature.notAutomatedTestCount,
        '% of automated test cases': percentageAutomated,
        '% of manual test cases': percentageManual,
        '% of not automated test cases': percentageNotAutomated
    })

    return result
}

const getCoverageForFeature = (path, name) => {
    const text = fs.readFileSync(path, 'utf-8')

    const lines = text.split('\n')
    const tags = lines.filter(line => /^@/.test(line))
    const manualTags = tags.filter(line => /^@manual/.test(line))
    const notAutomatedTags = tags.filter(line => /^@notAutomated/.test(line))
    const automatedTags = tags.filter(line => /^@automated/.test(line))

    // const testCount = tags.length
    const manualTestCount = manualTags.length
    const notAutomatedTestCount = notAutomatedTags.length
    const automatedTestCount = automatedTags.length
    const testCount = manualTestCount + notAutomatedTestCount + automatedTestCount
    // const automatedTestCount = testCount - manualTestCount - notAutomatedTestCount

    const percentageManual = (manualTestCount / testCount) * 100
    const percentageNotAutomated = (notAutomatedTestCount / testCount) * 100
    const percentageAutomated = (automatedTestCount / testCount) * 100
    // const percentageAutomated = 100 - percentageManual

    return {
        name,
        testCount,
        automatedTestCount,
        notAutomatedTestCount,
        manualTestCount,
        percentageAutomated,
        percentageNotAutomated,
        percentageManual
    }
}

const getTotalCoverage = allFeatures => {
    const automatedTestCount = allFeatures.reduce((acc, currentFeature) => {
        return acc + currentFeature.automatedTestCount
    }, 0)

    const manualTestCount = allFeatures.reduce((acc, currentFeature) => {
        return acc + currentFeature.manualTestCount
    }, 0)

    const notAutomatedTestCount = allFeatures.reduce((acc, currentFeature) => {
        return acc + currentFeature.notAutomatedTestCount
    }, 0)

    const testCount = automatedTestCount + manualTestCount + notAutomatedTestCount

    const percentageAutomated = (automatedTestCount / testCount) * 100
    const percentageManual = (manualTestCount / testCount) * 100
    const percentageNotAutomated = (notAutomatedTestCount / testCount) * 100

    return {
        name: 'total',
        testCount,
        automatedTestCount,
        notAutomatedTestCount,
        manualTestCount,
        percentageAutomated,
        percentageManual,
        percentageNotAutomated
    }
}

if (pathToTargetTest) {
    try {
        const data = getCoverageForFeature(pathToTargetTest)
        console.table(getOutputForFeature(data))
    } catch (e) {
        console.log('Unable to determine coverage for file')
        console.error(e)
        process.exit(1)
    }
} else {
    const featureDirectories = fs.readdirSync(featureFolder)

    let allFeatures = []
    let countPerFolder = []
    let coveragePerFolder = {}
    let totalAuto = 0
    let totalManual = 0
    let totalFolders = 0

    featureDirectories.forEach(featureDirectory => {
        const features = fs.readdirSync(`${featureFolder}/${featureDirectory}`)
        const coveragePerFeature = features.map(feature => {
            return getCoverageForFeature(`${featureFolder}/${featureDirectory}/${feature}`, feature)
        })
        let sumAuto = 0
        let sumManual = 0
        for (let i = 0; i < coveragePerFeature.length; i = i + 1) {
            sumAuto = sumAuto + coveragePerFeature[i].automatedTestCount
            sumManual = sumManual + coveragePerFeature[i].notAutomatedTestCount + coveragePerFeature[i].manualTestCount
        }
        totalAuto = totalAuto + sumAuto
        totalManual = totalManual + sumManual
        totalFolders = totalFolders + coveragePerFeature.length

        coveragePerFolder = {
            folderName: featureDirectory,
            featureFileCount: coveragePerFeature.length,
            automated: sumAuto,
            manual: sumManual,
            total: sumManual + sumAuto
        }
        countPerFolder = countPerFolder.concat(coveragePerFolder)
        allFeatures = allFeatures.concat(coveragePerFeature)
    })

    const totalEntry = getTotalCoverage(allFeatures)
    allFeatures.push(totalEntry)

    const totalEntryFolder = {
        folderName: 'total',
        featureFileCount: totalFolders,
        automated: totalAuto,
        manual: totalManual,
        total: totalManual + totalAuto
    }
    countPerFolder.push(totalEntryFolder)

    const output = allFeatures.map(getOutputForFeature)
    console.table(output)
    console.log('===========================================================================')
    console.table(countPerFolder)

    // Write a table to an HTML file to include in the dashboard
    writeTable(output)

    // Write a table to an HTML file for folder level test scenarios count update
    writeTableFolderCount(countPerFolder)
}
