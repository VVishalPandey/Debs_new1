#!/usr/bin/env node
/* * *  *  * *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  * */
/* Copyright (c) 2018 Mobify Research & Development Inc. All rights reserved. */
/* * *  *  * *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  * */

/* eslint-disable import/no-commonjs */
const fs = require('fs')

const {init, saveData} = require('./influx')
const {filterResults} = require('./utils')
const logger = require('./logger')

/* eslint-disable no-undef */

/**
 * Sync the Lighthouse score to InfluxDB
 */

const syncLighthouseScore = async (results, environment) => {
    logger.info(`Lighthouse data sync started`)

    await init(environment)
        .then(async res => {
            const tempURL = results.requestedUrl
            const url = tempURL.indexOf(`#`) === -1 ? tempURL : tempURL.substring(0, tempURL.indexOf(`#`))
            const filteredData = await filterResults(results)

            saveData(url, filteredData)
                .then(() => {
                    logger.info(`Lighthouse data synced successfully`)
                })
                .catch(err => {
                    logger.error(`Unable to sync Lighthouse data due to ${err}`)
                })
        })
        .catch(err => {
            logger.error(`Unable to connect InfluxDB ${err}`)
        })
}

try {
    const reportsDir = process.argv[2]
    const environment = process.argv[3] || 'development'
    const jsonResults = JSON.parse(fs.readFileSync(`${reportsDir}`, 'utf8'))
    syncLighthouseScore(jsonResults, environment)
} catch (e) {
    if (e.code === 'ENOENT') {
        console.log(`Lighthouse json not found. Please specify lighthouse path 'npm run test:sync-lighthouse-score <path_of_report_json>'`)
    } else {
        console.log(e)
    }
}
