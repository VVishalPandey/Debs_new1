/* eslint-disable import/no-commonjs */

const _ = require('lodash')
const chalk = require('chalk')

module.exports = (app, callback) => {
    const model = app.model

    const client = {
        tasks: {
            // Create a task
            create: (payload, done) => {
                model.task.create(payload, (err, task) => {
                    if (err || !task) {
                        done(err)
                    }
                    done(null, task)
                })
            },

            // Get all tasks
            get: (query, done) => {
                model.task.getAll((err, tasks) => {
                    if (err || !tasks) {
                        done(err)
                    }

                    if (query.lastres) {
                        model.result.getAll({}, (err, results) => {
                            if (err || !results) {
                                done(err)
                            }
                            const resultsByTask = _.groupBy(results, 'task')
                            tasks = tasks.map((task) => {
                                if (resultsByTask[task.id] && resultsByTask[task.id].length) {
                                    task.last_result = resultsByTask[task.id][0]
                                } else {
                                    task.last_result = null
                                }
                                return task
                            })
                            done(null, tasks)
                        })
                    } else {
                        done(null, tasks)
                    }
                })
            },

            // Get results for all tasks
            results: (query, done) => {
                model.result.getAll(query, (err, results) => {
                    if (err || !results) {
                        done(err)
                    }
                    done(null, results)
                })
            }

        },

        task: (id) => {
            return {
                // Get a task
                get: (query, done) => {
                    model.task.getById(id, (err, task) => {
                        if (err) {
                            done(err)
                        }
                        if (!task) {
                            done({
                                code: 404,
                                error: 'Not Found'
                            })
                        }
                        if (query.lastres) {
                            model.result.getByTaskId(id, {
                                limit: 1,
                                full: true
                            }, (err, results) => {
                                if (err || !results) {
                                    done(err)
                                }
                                task.last_result = null
                                if (results && results.length) {
                                    task.last_result = results[0]
                                }
                                done(null, task)
                            })
                        } else {
                            done(null, task)
                        }
                    })
                },

                // Edit a task
                edit: (payload, done) => {
                    model.task.getById(id, (err, task) => {
                        if (err) {
                            done(err)
                        }
                        if (!task) {
                            done({
                                code: 404,
                                error: 'Not Found'
                            })
                        }
                        model.task.editById(id, payload, (err, updateCount) => {
                            if (err || updateCount < 1) {
                                done(err)
                            }
                            model.task.getById(id, (err, task) => {
                                if (err) {
                                    done(err)
                                }
                                done(null, task)
                            })
                        })
                    })
                },

                // Remove a task
                remove: (done) => {
                    model.task.deleteById(id, (err, task) => {
                        if (err) {
                            done(err)
                        }
                        if (!task) {
                            done({
                                code: 404,
                                error: 'Not Found'
                            })
                        }
                        model.result.deleteByTaskId(id, (err) => {
                            if (err) {
                                done(err)
                            }
                            done(null, id)
                        })
                    })
                },

                // Run a task
                run: (done) => {
                    model.task.getById(id, (err, task) => {
                        if (err) {
                            done(err)
                        }
                        if (!task) {
                            done({
                                code: 404,
                                error: 'Not Found'
                            })
                        }
                        if (process.env.NODE_ENV !== 'test') {
                            console.log('')
                            console.log(chalk.grey('Starting to run one-off task @ %s'), new Date())
                            console.log('Starting task %s', task.id)
                            model.task.runById(id, (err) => {
                                if (err) {
                                    console.log(
                                        chalk.red('Failed to finish task %s: %s'),
                                        task.id,
                                        err.message
                                    )
                                } else {
                                    console.log(chalk.green('Finished task %s'), task.id)
                                }
                                console.log(
                                    chalk.grey('Finished running one-off task @ %s'),
                                    new Date()
                                )
                            })
                        }
                        done(null, 'success')
                    })
                },

                // Get results for a task
                results: (query, done) => {
                    model.task.getById(id, (err, task) => {
                        if (err) {
                            done(err)
                        }
                        if (!task) {
                            done({
                                code: 404,
                                error: 'Not Found'
                            })
                        }
                        model.result.getByTaskId(id, query, (err, results) => {
                            if (err || !results) {
                                done(err)
                            }
                            done(null, results)
                        })
                    })
                },

                result: (rid) => {
                    return {
                        // Get a result
                        get: (query, done) => {
                            model.result.getByIdAndTaskId(rid, id, query, (err, result) => {
                                if (err) {
                                    done(err)
                                }
                                if (!result) {
                                    done({
                                        code: 404,
                                        error: 'Not Found'
                                    })
                                }
                                done(null, result)
                            })
                        }

                    }
                }

            }
        },

        results: {
            // Add results for a task
            add: (id, data, done) => {
                model.task.getById(id, (err, task) => {
                    if (err) {
                        done(err)
                    }
                    if (!task) {
                        done({
                            code: 404,
                            error: 'Not Found'
                        })
                    }

                    if (data && data.length) {
                        const results = model.result.convertPa11y2Results(data)
                        results.task = task.id
                        results.ignore = task.ignore
                        model.result.create(results, () => {
                            if (err) {
                                done(err)
                            }
                            done(null, task)
                        })
                    } else {
                        done('Results are not specified.')
                    }
                })
            }
        }
    }
    callback(client)
}
