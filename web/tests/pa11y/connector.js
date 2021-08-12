/* eslint-disable import/no-commonjs */

const async = require('async')
const MongoClient = require('mongodb').MongoClient

const connect = (config, callback) => {

    const app = module.exports = {
        database: null,
        model: {}
    }

    async.series([

        (next) => {
            MongoClient.connect(config.database, {server: {auto_reconnect: false}}, (err, db) => {
                app.db = db
                next(err)
            })
        },

        (next) => {
            require('./model/result')(app, (err, model) => {
                app.model.result = model
                next(err)
            })
        },

        (next) => {
            require('./model/task')(app, (err, model) => {
                app.model.task = model
                next(err)
            })
        },

        (next) => {
            require('./client')(app, (data) => {
                app.client = data
            })
            next()
        }

    ], (err) => {
        callback(err, app)
    })
}

module.exports = connect
