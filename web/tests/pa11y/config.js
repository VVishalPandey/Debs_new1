/* eslint-disable import/no-commonjs */

const ENV = process.env.NODE_ENV || 'development'
const connection = ENV === 'production' ? 'mongodb://10.133.80.4:27017/dbh-accessibility-reports' : 'mongodb://127.0.0.1/pa11y-webservice'

const env = (name, defaultValue) => {
    const value = process.env[name]
    return (typeof value === 'string' ? value : defaultValue)
}

module.exports = {
    database: env('DATABASE', connection),
    cron: env('CRON', false)
}
