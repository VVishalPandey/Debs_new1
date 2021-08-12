const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        changePasswordContent: '.dbh-tablet-my-account-details p',
        exitingPassSection: '.dbh-old-password',
        newPassSection: '.dbh-password-validator',
        passwordValidator: '.c-password-validator',
        setNewPasswordButton: '.dbh-update-password',
        title: '.dbh-page-title',
        existPassInput: 'input[name="logonPassword_old"]',
        newPassInput: 'input[name="logonPassword_new"]',
        errorMessage: '.c-notification-error__msg',
        showHideButton: '.dbh-show-hide > button > div',
        passwordError: '.dbh-password-validator .pw-field__error',
        charactersValidationError:
            '.c-password-validator ul li.caution:nth-child(1)',
        letterValidationError:
            '.c-password-validator ul li.caution:nth-child(2)',
        numberValidationError:
            '.c-password-validator ul li.caution:nth-child(3)',
        sixCharacterStatus: '.c-password-validator > ul > li:nth-child(1)',
        oneLetterStatus: '.c-password-validator > ul > li:nth-child(2)',
        oneNumberStatus: '.c-password-validator > ul > li:nth-child(3)'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        changePasswordContent: '.dbh-tablet-my-account-details p',
        exitingPassSection: '.dbh-old-password',
        newPassSection: '.dbh-password-validator',
        passwordValidator: '.c-password-validator',
        setNewPasswordButton: '.dbh-update-password',
        title: '.dbh-tablet-my-account-details h2',
        existPassInput: 'input[name="logonPassword_old"]',
        newPassInput: 'input[name="logonPassword_new"]',
        errorMessage: '.dbh-server-error',
        passwordError: '.dbh-password-validator .pw-field__error',
        charactersValidationError:
            '.c-password-validator ul li.caution:nth-child(1)',
        letterValidationError:
            '.c-password-validator ul li.caution:nth-child(2)',
        numberValidationError:
            '.c-password-validator ul li.caution:nth-child(3)',
        sixCharacterStatus: '.c-password-validator > ul > li:nth-child(1)',
        oneLetterStatus: '.c-password-validator > ul > li:nth-child(2)',
        oneNumberStatus: '.c-password-validator > ul > li:nth-child(3)'
    }
} else {
    selectors = {}
}

const managePassword = function() {
    this.selectors = selectors
}

export default managePassword
