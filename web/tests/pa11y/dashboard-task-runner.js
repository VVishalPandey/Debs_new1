/* eslint-disable import/no-commonjs */

const async = require('async')
const chalk = require('chalk')
const _ = require('lodash')

const pa11yOptions = require('./options')
const config = require('./config')
const ukTasks = require('./urls-uk')
const roiTasks = require('./urls-roi')
const intTasks = require('./urls-int')

const connector = require('./connector')

let client

// Run one test at a time
const concurrency = 1

const connect = (done) => {
    connector(config, (err, app) => {
        if (err) {
            console.error('')
            console.error(chalk.red(' - Error in connecting to server:'))
            console.error(err.message)
            done(false)

        } else {
            console.log('')
            // console.log(chalk.yellow(` - Connected to server`))

            client = app.client
            done(true, app)
        }
    })
}

const disconnect = (app) => {
    if (app && app.db) {
        app.db.close()
        console.log('')
        // console.log(chalk.yellow(` - Connection closed`))
    }
}

// Get all tasks
const getTasks = (callback) => {
    client.tasks.get({}, (err, tasks) => {
        // tasks  =  array of objects representing tasks, or null if an error occurred
        if (err) {
            console.log('error:', err)
        } else {
            callback(tasks)
        }
    })
}

// Create a task
const addTask = (task, callback) => {
    client.tasks.create({
        name: task.name,
        url: task.url,
        standard: pa11yOptions.standard
    }, (err, task) => {
        // task  =  object representing the new task, or null if an error occurred
        if (err) {
            callback(err)
        } else {
            callback(task)
        }
    })
}

// TODO: Not in use so commented, but can be useful in future
// Update a task by ID
// const updateTask = (taskId, task, callback) => {
//     client.task(taskId).edit(task, (err, task) => {
//         // task  =  object representing the newly updated task, or null if an error occurred
//         if (err) {
//             callback(err)
//         } else {
//             callback(task)
//         }
//     })
// }

// Delete a task by ID
const removeTask = (task, callback) => {

    client.task(task.id).remove((err) => {
        // err  =  null if task was deleted, or an Error object if something went wrong
        if (err) {
            callback(err)
        } else {
            callback('success')
        }
    })
}

// Run a task by ID
const runTask = (task, done) => {
    client.task(task.id).run((err) => {
        // err  =  null if task is running, or an Error object if something went wrong
        if (err) {
            console.log(chalk.red(`  ✗ ${task.name} - [${task.url}]`))
        } else {
            console.log(chalk.green(`  ✓ ${task.name} - [${task.url}]`))
        }
        done()
    })
}

// Get Task ID By Key e.g. 'name' or 'url'
const getTaskIdBy = (key, value, done) => {
    getTasks((tasks) => {
        const task = _.find(tasks, _.matchesProperty(key, value))
        done(task.id)
    })
}

// Add a result
const addResult = (key, value, results, callback) => {
    getTaskIdBy(key, value, (taskId) => {
        client.results.add(taskId, results, (err, task) => {
            // task  =  object representing the new task, or null if an error occurred
            if (err) {
                callback(err)
            } else {
                callback(task)
            }
        })
    })
}

// Add a results
const addResults = (results, websiteLocal, callback) => {
    connect((status, app) => {
        if (status) {
            const resultsQueue = async.queue((result, done) => {
                addResult('name', result.name, result.data, (res) => {
                    if (result.data.length) {
                        console.log(chalk.yellow(` - ${res.name}`))
                    } else {
                        console.log(chalk.red(` - No data available for '${result.name}' task`))
                    }
                    done()
                })
            })

            resultsQueue.drain = function() {
                disconnect(app)
                console.log(chalk.green(` - Sync completed for ${websiteLocal} accessibility results to dashboard`))
                callback()
            }


            // Lastly, push the URLs we wish to test onto the queue
            resultsQueue.push(results)
            console.log(chalk.green(` - Sync started for ${websiteLocal} accessibility results to dashboard`))
        } else {
            console.log(chalk.red(` - Unable to sync accessibility results due to connection error`))
            disconnect(app)
            callback()
        }
    })
}

// Run all tasks
// const runTasks = (queue) => {
//     getTasks((tasks) => {
//         queue.push(tasks)
//     })
// }

// Add Tasks
const addTasks = (tasks, callback) => {

    const tasksQueue = async.queue((task, done) => {
        addTask(task, () => {
            done()
        })
    })

    tasksQueue.drain = function() {
        callback()
    }

    // Lastly, push the URLs we wish to test onto the queue
    tasksQueue.push(tasks)
}

// Remove Tasks
const removeTasks = (tasks, callback) => {
    const tasksQueue = async.queue((task, done) => {
        removeTask(task, () => {
            done()
        })
    })

    tasksQueue.drain = function() {
        callback()
    }

    // Lastly, push the URLs we wish to test onto the queue
    tasksQueue.push(tasks)
}

// TODO: Not in use so commented, but can be useful in future
// Update Tasks
// const updateTasks = (tasks) => {
//     if (tasks.length > 0) {
//         _.forEach(tasks, (task) => {
//             updateTask(task, () => {})
//         })
//     }
// }

// Compare local & dashboard tasks
const compareTasks = (localTasks, websiteLocal) => {

    console.log(chalk.green(` - Sync started for ${websiteLocal} accessibility tasks`))

    connect((status, app) => {
        if (status) {
            getTasks((tasks) => {
                const filteredTasks = _.filter(tasks, (task) => task.name.includes(websiteLocal))

                const tasksToAdd = _.differenceBy(localTasks, filteredTasks, 'name')
                const tasksToRemove = _.differenceBy(filteredTasks, localTasks, 'name')

                if (tasksToAdd.length || tasksToRemove.length) {
                    async.series([
                        (next) => {
                            if (tasksToAdd) {
                                addTasks(tasksToAdd, () => {
                                    console.log(chalk.yellow(` - ${tasksToAdd.length} new task(s) added`))
                                    next()
                                })
                            } else {
                                next()
                            }
                        },
                        (next) => {
                            if (tasksToAdd) {
                                removeTasks(tasksToRemove, () => {
                                    console.log(chalk.yellow(` - ${tasksToRemove.length} old task(s) removed`))
                                    next()
                                })
                            } else {
                                next()
                            }
                        },
                        () => {
                            console.log(chalk.green(` - All tasks synced successfully`))
                            disconnect(app)
                        }
                    ])
                } else {
                    console.log(chalk.yellow(` - Nothing new to sync`))
                    disconnect(app)
                    console.log(chalk.green(` - Sync completed for ${websiteLocal} accessibility tasks`))
                }
            })
        } else {
            console.log(chalk.red(` - Unable to sync ${websiteLocal} tasks due to connection error`))
            disconnect(app)
        }
    })
}

// Fetch tasks
const fetchTasks = (websiteLocal, callback) => {
    connect((status, app) => {
        if (status) {
            getTasks((tasks) => {
                const filteredTasks = _.filter(tasks, (task) => task.name.includes(websiteLocal))
                console.log(chalk.green(` - ${filteredTasks.length} ${websiteLocal} tasks fetched`))
                disconnect(app)
                callback(filteredTasks)
            })
        } else {
            console.log(chalk.red(` - Unable to fetch ${websiteLocal} tasks due to connection error`))
            disconnect(app)
            callback([])
        }
    })
}

// console.log(chalk.cyan.underline('Accessibility checks started\n'))

const queue = async.queue((task, done) => {
    console.log(task)
    runTask(task, done)
}, concurrency)

// Add a function that is triggered when the queue
// drains (it runs out of URLs to process)
queue.drain = () => {
    console.log(chalk.green('\nAccessibility checks completed'))
}

// Initiate compareTasks func, if arguments contains '--syncTasks'
if (process.argv.length > 0 && process.argv.indexOf('--syncTasks') > -1 && process.argv.indexOf('--websiteLocal') > -1) {
    const localIndex = process.argv.indexOf('--websiteLocal') + 1
    let tasks = ukTasks
    const websiteLocal = process.argv[localIndex]

    switch (websiteLocal) {
        case 'ROI' :
            tasks = roiTasks
            break
        case 'INT' :
            tasks = intTasks
            break
    }

    compareTasks(tasks, websiteLocal)
}

module.exports = {
    fetchTasks,
    addResults,
    addResult
}
