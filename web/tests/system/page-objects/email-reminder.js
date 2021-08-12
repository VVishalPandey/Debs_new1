const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        headerText: '.t-email-reminder h1',
        forgotPasswordMessage1:
            '.t-email-reminder__content > div > p:nth-child(1)',
        forgotPasswordMessage2:
            '.t-email-reminder__content > div > p:nth-child(2)',
        forgotPasswordMessage3:
            '.t-email-reminder__content > div > p:nth-child(3)',
        goShoppingButon: '.dbh-continue-shopping span',
        signInButon: '.t-email-reminder__content > div > .c--primary'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {}
} else {
    selectors = {
        headerText: '.t-email-reminder h1',
        forgotPasswordMessage1:
            '.t-email-reminder__content > div > p:nth-child(1)',
        forgotPasswordMessage2:
            '.t-email-reminder__content > div > p:nth-child(2)',
        forgotPasswordMessage3:
            '.t-email-reminder__content > div > p:nth-child(3)',
        goShoppingButon: '.dbh-continue-shopping span',
        signInButon: '.t-email-reminder__content > div > .c--primary'
    }
}

const emailRem = function() {
    this.selectors = selectors
}

export default emailRem
