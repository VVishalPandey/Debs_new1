const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {}
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        errorTextMessage: '.pw-feedback__content',
        signInButton: '.dbh-checkout-login-button span',
        continueAsGuestButton: '.dbh-continue-guest-button span',
        backSection: '.t-checkout-login__back .pw-button__inner'
    }
} else {
    selectors = {
        errorTextMessage:
            '.t-checkout-form .u-text-align-center .u-padding-top-md',
        signInButton: '.dbh-quick-register-button',
        continueAsGuestButton: '.dbh-continue-guest-button span',
        backSection: '.dbh-close-button'
    }
}

const ghost = function() {
    this.selectors = selectors
}

export default ghost
