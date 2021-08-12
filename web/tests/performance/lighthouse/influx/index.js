const influx = require('./influx')
const logger = require('../logger')

/**
 * Bootstrap the database
 */
const init = async env => {
    logger.info(`Environment for which we are running Lighthouse tests: ${env}`)
    const database = env === 'production' ? 'lighthouse_prod' : 'lighthouse_dev'

    try {
        const names = await influx.getDatabaseNames()
        if (names.indexOf(database) === -1) {
            logger.info(`InfluxDB: ${database} database does not exist. Creating database`)
            return influx.createDatabase(database).then(() => {
                logger.info(`InfluxDB: ${database} database created`)
                return Promise.resolve()
            })
        }
        logger.info('InfluxDB', `${database} database already exists. Skipping creation.`)
        return Promise.resolve()
    } catch (err) {
        logger.error(`Failed to initialize influx`)
        return Promise.reject(err)
    }
}

/**
 * Insert all key value pairs into the DB
 * @param {String} url - Url from the performance data to save
 * @param {*} data - Data to save
 */
const saveData = async (url, data) => {
    try {
        const points = Object.keys(data).reduce((points, key) => {
            if (data[key]) {
                points.push({
                    measurement: key,
                    tags: {url},
                    fields: {value: data[key]}
                })
            }
            return points
        }, [])

        const result = await influx.writePoints(points)
        logger.info(`Successfully saved lighthouse data for ${url}`)
        return Promise.resolve(result)
    } catch (err) {
        logger.error(`Failed to save lighthouse data for ${url}`)
        return Promise.reject(err)
    }
}

module.exports = {
    influx,
    init,
    saveData
}
