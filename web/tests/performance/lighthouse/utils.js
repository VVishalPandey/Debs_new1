const filterResults = (data = {}) => {
    const {categories = {}, audits = {}} = data

    const {metrics = {}} = audits
    const {details = {}} = metrics
    const {items = []} = details
    const metricItems = items[0] || {}

    const report = {}

    for (const categoryName in categories) {
        if (!Object.prototype.hasOwnProperty.call(categories, categoryName)) {
            continue
        }

        const category = categories[categoryName]
        report[`${category.id}-score`] = Math.round(category.score * 100)
    }

    for (const metricItem in metricItems) {
        if (!Object.prototype.hasOwnProperty.call(metricItems, metricItem)) {
            continue
        }

        // For now don't report on any observered metrics
        if (metricItem.indexOf('observed') === -1) {
            const metric = metricItems[metricItem]
            report[metricItem] = metricItems[metricItem]
        }
    }

    const auditData = ['errors-in-console', 'time-to-first-byte', 'interactive', 'redirects']

    auditData.forEach(key => {
        const {rawValue} = audits[key] || {}
        if (rawValue !== undefined) {
            report[key] = rawValue
        }
    })

    return report
}

module.exports = {
    filterResults
}
