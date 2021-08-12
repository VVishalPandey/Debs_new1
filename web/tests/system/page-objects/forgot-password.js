const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        headerText: '.t-forget-password h1',
        resetPasswordText: '.t-forget-password__form h2',
        resetPasswordMessage: '.t-forget-password__form p',
        emailAddressField: '.dbh-email input',
        resetPasswordButton: '.dbh-reset-password-button span',
        errorTextMessage: '.pw-feedback .pw-feedback__content',
        emailErrorMessage: '.dbh-email > .pw-field__error'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {}
} else {
    selectors = {
        headerText: '.t-forget-password h1',
        resetPasswordText: '.t-forget-password__form h2',
        resetPasswordMessage: '.t-forget-password__form p',
        emailAddressField: '.dbh-email input',
        resetPasswordButton: '.dbh-reset-password-button span',
        errorTextMessage: '.pw-feedback .pw-feedback__content',
        emailErrorMessage: '.dbh-email > .pw-field__error'
    }
}

const forgotPass = function() {
    this.selectors = selectors
}

export default forgotPass
