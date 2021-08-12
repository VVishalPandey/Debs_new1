const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        headerText: '.t-register h1',
        titlefield: '.dbh-title select',
        firstNameField: '.dbh-first-name input',
        lastNamefield: '.dbh-last-name input',
        emailAddressField: '.dbh-new-account-email input',
        passwordField: '.dbh-password input',
        passwordFieldType: '.dbh-password input',
        showHideButton: '.dbh-show-hide div',
        createAccountButton: '.dbh-register-button div',
        receiveEmailCheckbox: '.dbh-receive-email input',
        errorTextMessage: '.pw-feedback__content',
        firstNameErrorTextMessage: '.dbh-first-name .pw-field__error',
        lastNameErrorTextMessage: '.dbh-last-name .pw-field__error',
        emailErrorTextMessage: '.dbh-new-account-email .pw-field__error',
        passwordErrorTextMessage: '.dbh-password .pw-field__error',
        sixCharacterStatus: '.c-password-validator > ul > li:nth-child(1)',
        oneLetterStatus: '.c-password-validator > ul > li:nth-child(2)',
        oneNumberStatus: '.c-password-validator > ul > li:nth-child(3)',
        passwordRequirementsText: '.c-password-validator',
        subscribeOption: '.dbh-receive-email-text',
        thankyouMessage1: '.t-register-success h2',
        thankyouMessage2: '.t-register-success p',
        emailErrorCreateAccount: '.pw--error div',
        emailCreateAccountForm: '.dbh-email .pw-field__error',
        emailExistError: '.dbh-signin-error > div',
        registrationSuccess: '.t-register-success h1',
        emailErrorNotification: '.dbh-signin-error'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        headerText: '.t-register h1',
        titlefield: '.dbh-title select',
        firstNameField: '.dbh-first-name input',
        lastNamefield: '.dbh-last-name input',
        emailAddressField: '.dbh-email input',
        passwordField: '.dbh-password input',
        passwordFieldType: '.dbh-password input',
        showHideButton: '.dbh-show-hide div',
        createAccountButton: '.dbh-register-button',
        receiveEmailCheckbox: '.dbh-receive-email input',
        errorTextMessage: '.pw-feedback__content',
        firstNameErrorTextMessage: '.dbh-first-name .pw-field__error',
        lastNameErrorTextMessage: '.dbh-last-name .pw-field__error',
        emailErrorTextMessage: '.dbh-email .pw-field__error',
        passwordErrorTextMessage: '.dbh-password .pw-field__error',
        sixCharacterStatus: '.c-password-validator > ul > li:nth-child(1)',
        oneLetterStatus: '.c-password-validator > ul > li:nth-child(2)',
        oneNumberStatus: '.c-password-validator > ul > li:nth-child(3)'
    }
} else {
    selectors = {
        headerText: '.t-register h1',
        titlefield: '.dbh-title select',
        firstNameField: '.dbh-first-name input',
        lastNamefield: '.dbh-last-name input',
        emailAddressField: '.dbh-email input',
        passwordField: '.dbh-password input',
        passwordFieldType: '.dbh-password input',
        showHideButton: '.dbh-show-hide div',
        createAccountButton: '.dbh-register-button span',
        receiveEmailCheckbox: '.dbh-receive-email input',
        errorTextMessage: '.pw-feedback__content',
        firstNameErrorTextMessage: '.dbh-first-name .pw-field__error',
        lastNameErrorTextMessage: '.dbh-last-name .pw-field__error',
        emailErrorTextMessage: '.dbh-email .pw-field__error',
        passwordErrorTextMessage: '.dbh-password .pw-field__error',
        sixCharacterStatus: '.c-password-validator > ul > li:nth-child(1)',
        oneLetterStatus: '.c-password-validator > ul > li:nth-child(2)',
        oneNumberStatus: '.c-password-validator > ul > li:nth-child(3)'
    }
}

const login = function() {
    this.selectors = selectors
}

export default login
