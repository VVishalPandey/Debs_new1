/* eslint-disable import/no-commonjs */

const async = require('async')
const chalk = require('chalk')
const ObjectID = require('mongodb').ObjectID
const pa11y = require('pa11y')

const pa11yLog = (message) => {
    console.log(chalk.grey(`  > ${message}`))
}

// Task model
module.exports = (app, callback) => {
    app.db.collection('tasks', (err, collection) => {
        collection.ensureIndex({
            name: 1,
            url: 1,
            standard: 1
        }, {
            w: -1
        })
        const model = {
            collection,

			// Create a task
            create(newTask, callback) {
                newTask.headers = model.sanitizeHeaderInput(newTask.headers)
                collection.insert(newTask, (err, result) => {
                    if (err) {
                        callback(err)
                    } else {
                        callback(null, model.prepareForOutput(result.ops[0]))
                    }
                })
            },

			// Get all tasks
            getAll(callback) {
                collection.find().sort({
                    name: 1,
                    standard: 1,
                    url: 1
                })
                .toArray((err, tasks) => {
                    if (err) {
                        callback(err)
                    } else {
                        callback(null, tasks.map(model.prepareForOutput))
                    }
                })
            },

			// Get a task by ID
            getById(id, callback) {
                try {
                    id = new ObjectID(id)
                } catch (err) {
                    callback(null, null)
                }
                collection.findOne({_id: id}, (err, task) => {
                    if (err) {
                        callback(err)
                    } else {
                        if (task) {
                            task = model.prepareForOutput(task)
                        }
                        callback(null, task)
                    }
                })
            },

			// Edit a task by ID
            editById(id, edits, callback) {
                const idString = id
                try {
                    id = new ObjectID(id)
                } catch (err) {
                    callback(null, 0)
                }
                const now = Date.now()
                const taskEdits = {
                    name: edits.name,
                    timeout: parseInt(edits.timeout, 10),
                    wait: parseInt(edits.wait, 10),
                    actions: edits.actions,
                    username: edits.username,
                    password: edits.password
                }
                if (edits.ignore) {
                    taskEdits.ignore = edits.ignore
                }
                if (edits.hideElements) {
                    taskEdits.hideElements = edits.hideElements
                }
                if (edits.headers) {
                    taskEdits.headers = model.sanitizeHeaderInput(edits.headers)
                }
                collection.update({_id: id}, {$set: taskEdits}, (err, updateCount) => {
                    if (err || updateCount < 1) {
                        callback(err, 0)
                    }
                    const annotation = {
                        type: 'edit',
                        date: now,
                        comment: edits.comment || 'Edited task'
                    }
                    model.addAnnotationById(idString, annotation, (err) => {
                        callback(err, updateCount)
                    })
                })
            },

			// Add an annotation to a task
            addAnnotationById(id, annotation, callback) {
                model.getById(id, (err, task) => {
                    if (err || !task) {
                        callback(err, 0)
                    }
                    id = new ObjectID(id)
                    if (!Array.isArray(task.annotations)) {
                        collection.update({_id: id}, {$set: {annotations: [annotation]}}, callback)
                    } else {
                        collection.update({_id: id}, {$push: {annotations: annotation}}, callback)
                    }
                })
            },

			// Delete a task by ID
            deleteById(id, callback) {
                try {
                    id = new ObjectID(id)
                } catch (err) {
                    callback(null)
                }
                collection.deleteOne({_id: id}, (error, result) => {
                    callback(error, result ? result.deletedCount : null)
                })
            },

			// Run a task by ID
            runById(id, callback) {
                model.getById(id, (err, task) => {
                    if (err) {
                        callback(err)
                    }
                    const pa11yOptions = {
                        standard: task.standard,
                        timeout: (task.timeout || 30000),
                        wait: (task.wait || 0),
                        ignore: task.ignore,
                        actions: task.actions || [],
                        phantom: {},
                        log: {
                            debug: pa11yLog,
                            error: pa11yLog,
                            log: pa11yLog
                        }
                    }
                    if (task.username && task.password) {
                        pa11yOptions.page = {
                            settings: {
                                userName: task.username,
                                password: task.password
                            }
                        }
                    }
                    if (task.headers && typeof task.headers === 'object') {
                        if (pa11yOptions.page) {
                            pa11yOptions.page.headers = task.headers
                        } else {
                            pa11yOptions.page = {
                                headers: task.headers
                            }
                        }
                    }
                    if (task.hideElements) {
                        pa11yOptions.hideElements = task.hideElements
                    }

                    async.waterfall([

                        (next) => {
                            try {
                                const test = pa11y(pa11yOptions)
                                test.run(task.url, next)
                            } catch (error) {
                                next(error)
                            }
                        },

                        (results, next) => {
                            results = app.model.result.convertPa11y2Results(results)
                            results.task = new ObjectID(task.id)
                            results.ignore = task.ignore
                            app.model.result.create(results, next)
                        }

                    ], callback)
                })
            },

			// Prepare a task for output
            prepareForOutput(task) {
                const output = {
                    id: task._id.toString(),
                    name: task.name,
                    url: task.url,
                    timeout: (task.timeout ? parseInt(task.timeout, 10) : 30000),
                    wait: (task.wait ? parseInt(task.wait, 10) : 0),
                    standard: task.standard,
                    ignore: task.ignore || [],
                    actions: task.actions || []
                }
                if (task.annotations) {
                    output.annotations = task.annotations
                }
                if (task.username) {
                    output.username = task.username
                }
                if (task.password) {
                    output.password = task.password
                }
                if (task.hideElements) {
                    output.hideElements = task.hideElements
                }
                if (task.headers) {
                    if (typeof task.headers === 'string') {
                        try {
                            output.headers = JSON.parse(task.headers)
                        } catch (error) {}
                    } else {
                        output.headers = task.headers
                    }
                }
                return output
            },

            sanitizeHeaderInput(headers) {
                if (typeof headers === 'string') {
                    try {
                        return JSON.parse(headers)
                    } catch (error) {
                        console.error('Header input contains invalid JSON:', headers)
                        return undefined
                    }
                }
                return headers
            }

        }
        callback(err, model)
    })
}
