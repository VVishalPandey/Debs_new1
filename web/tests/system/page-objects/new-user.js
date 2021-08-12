const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {}
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        headerText: '.t-register-success h1',
        registerCompleteText: '.t-register-success__content h2',
        registerCompleteMessage: '.t-register-success__content p',
        continueShoppingButton: '.dbh-continue-shopping span'
    }
} else {
    selectors = {
        headerText: '.t-register-success h1',
        registerCompleteText: '.t-register-success__content h2',
        registerCompleteMessage: '.t-register-success__content p',
        continueShoppingButton: '.dbh-continue-shopping span'
    }
}

const user = function() {
    this.selectors = selectors
}

export default user
