/* eslint-disable import/no-commonjs */

const async = require('async')
const pa11y = require('pa11y')
const dashboardTaskRunner = require('./dashboard-task-runner')
const options = require('./options')
const chalk = require('chalk')


// Run one test at a time
const concurrency = 1

const resultList = []

let websiteLocal = ''

// TODO: Initial code for testing, need to be updated
// Initial Issues Count
const issues = {
    error: 0,
    warning: 0,
    notice: 0
}

// Update Issues Count
const updateIssuesCount = (results) => {
    results.forEach((result) => {
        issues[result.type] += 1
    })
}

// Pa11y Started
console.log(chalk.cyan.underline('Accessibility tests started'))

const queue = async.queue((page, done) => {
    pa11y(page.url, options)
    .then((results) => {
        // console.log(`results -- ${JSON.stringify(results)}`)
        console.log(chalk.yellow(` - ${page.name}`))
        updateIssuesCount(results.issues)
        resultList.push({name: page.name, data: results.issues})
        done()
    })
    .catch((error) => {
        console.error(error.message)
        done()
    })
}, concurrency)

queue.drain = function() {
    console.log(chalk.green(' - Accessibility checks completed'))
    dashboardTaskRunner.addResults(resultList, websiteLocal, () => {
        console.log('')
        if (issues.error > 0) {
            console.log(chalk.bgRed.bold(' -- CHECKS FAILED -- '))
            console.log('')
        } else {
            console.log(chalk.bgGreen.bold(' -- CHECKS PASSED -- '))
            console.log('')
        }
        console.log(chalk.cyan.underline('Accessibility checks completed'))
        console.log('')
    })
}

// Lastly, push the URLs we wish to test onto the queue
if (process.argv.length > 0 && process.argv.indexOf('--websiteLocal') > -1) {
    const localIndex = process.argv.indexOf('--websiteLocal') + 1
    websiteLocal = process.argv[localIndex]

    dashboardTaskRunner.fetchTasks(websiteLocal, (taskList) => {

        if (taskList.length) {
            queue.push(taskList)
            console.log(chalk.green(` - Accessibility checks started for `))
        } else {
            console.log(chalk.red(` - No ${websiteLocal} tasks run to accessibility checks`))
        }
    })
}
