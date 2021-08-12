const Influx = require('influx')

const host = process.env.NODE_ENV === 'test' ? 'localhost' : '10.133.80.4'
const _username = process.env.NODE_ENV === 'test' ? 'admin' : 'admin'
const _pass = process.env.NODE_ENV === 'test' ? 'admin' : 'lklw5erJqwqnsdE12s'

module.exports = new Influx.InfluxDB({
    host,
    database: 'lighthouse_prod',
    username: _username,
    password: _pass
})
