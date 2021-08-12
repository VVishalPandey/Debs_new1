
/* eslint-disable import/no-commonjs */

const ObjectID = require('mongodb').ObjectID

// Result model
module.exports = (app, callback) => {
    app.db.collection('results', (err, collection) => {
        collection.ensureIndex({
            date: 1
        }, {
            w: -1
        })

        const model = {

            collection,

			// Create a result
            create(newResult, callback) {
                if (!newResult.date) {
                    newResult.date = Date.now()
                }
                if (newResult.task && !(newResult.task instanceof ObjectID)) {
                    newResult.task = new ObjectID(newResult.task)
                }
                collection.insert(newResult, (err, result) => {
                    if (err) {
                        callback(err)
                    } else {
                        callback(null, model.prepareForOutput(result.ops[0]))
                    }
                })
            },

			// Default filter options
            _defaultFilterOpts(opts) {
                const now = Date.now()
                const thirtyDaysAgo = now - (1000 * 60 * 60 * 24 * 30)

                return {
                    from: (new Date(opts.from || thirtyDaysAgo)).getTime(),
                    to: (new Date(opts.to || now)).getTime(),
                    full: !!opts.full,
                    task: opts.task
                }
            },

			// Get results
            _getFiltered(opts, callback) {
                opts = model._defaultFilterOpts(opts)
                const filter = {
                    date: {
                        $lt: opts.to,
                        $gt: opts.from
                    }
                }
                if (opts.task) {
                    filter.task = new ObjectID(opts.task)
                }
                collection.find(filter).sort({date: -1})
                            .limit(opts.limit || 0)
                            .toArray((err, results) => {
                                if (err) {
                                    callback(err)
                                } else {
                                    callback(null, results.map(opts.full ? model.prepareForFullOutput : model.prepareForOutput))
                                }
                            })
            },

			// Get results for all tasks
            getAll(opts, callback) {
                delete opts.task
                model._getFiltered(opts, callback)
            },

			// Get a result by ID
            getById(id, full, callback) {
                const prepare = (full ? model.prepareForFullOutput : model.prepareForOutput)
                try {
                    id = new ObjectID(id)
                } catch (err) {
                    callback(null, null)
                }
                collection.findOne({_id: id}, (err, result) => {
                    if (err) {
                        callback(err)
                    } else {
                        if (result) {
                            result = prepare(result)
                        }
                        callback(null, result)
                    }
                })
            },

			// Get results for a single task
            getByTaskId(id, opts, callback) {
                opts.task = id
                model._getFiltered(opts, callback)
            },

			// Delete results for a single task
            deleteByTaskId(id, callback) {
                try {
                    id = new ObjectID(id)
                } catch (err) {
                    callback(null)
                }
                collection.deleteMany({task: id}, callback)
            },

			// Get a result by ID and task ID
            getByIdAndTaskId(id, task, opts, callback) {
                const prepare = (opts.full ? model.prepareForFullOutput : model.prepareForOutput)
                try {
                    id = new ObjectID(id)
                    task = new ObjectID(task)
                } catch (err) {
                    callback(null, null)
                }
                collection.findOne({
                    _id: id,
                    task
                }, (err, result) => {
                    if (err) {
                        callback(err)
                    } else {
                        if (result) {
                            result = prepare(result)
                        }
                        callback(null, result)
                    }
                })
            },

			// Prepare a result for output
            prepareForOutput(result) {
                result = model.prepareForFullOutput(result)
                delete result.results
                return result
            },
            prepareForFullOutput(result) {
                return {
                    id: result._id.toString(),
                    task: result.task.toString(),
                    date: new Date(result.date).toISOString(),
                    count: result.count,
                    ignore: result.ignore || [],
                    results: result.results || []
                }
            },
            convertPa11y2Results(results) {
                const resultObject = {
                    count: {
                        total: results.length,
                        error: results.filter((result) => {
                            return (result.type === 'error')
                        }).length,
                        warning: results.filter((result) => {
                            return (result.type === 'warning')
                        }).length,
                        notice: results.filter((result) => {
                            return (result.type === 'notice')
                        }).length
                    },
                    results
                }
                return resultObject
            }

        }
        callback(err, model)
    })
}
