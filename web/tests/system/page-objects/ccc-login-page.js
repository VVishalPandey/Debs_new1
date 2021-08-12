const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        cccDebsLogoSignIn: '.t-header__logo--csr',
        cccLoginField: '.dbh-csr-email input',
        cccDebsLogo: '.dbh-csr-svglogo',
        cccPasswordField: '.dbh-csr-password input',
        cccSignInButton: '.dbh-signin-button',
        cccheaderSignIn: '.t-csr h1',
        cccGuestCheckoutPageHeader: '.dbh-logo-text',
        cccLoginlabel: '.dbh-csr-email span',
        invalidLoginMessage: '.pw-field__error',
        showHideButton: '.dbh-show-hide > button > div',
        errorNotification: '.dbh-signin-error',
        shopOnBehalfOfCustomerCTA: '.dbh-csr-enact-guestcustomer',
        cccEmployeeNameLabel: '.dbh-csr-customer-signout h4',
        cccEmployeeName: '.dbh-csr-customer-signout span',
        cccManagePasswordLink: '.dbh-csr-manage-password',
        cccSignOutLink: '.dbh-link-signOut',
        cccChangePasswordTitle: '.t-csr-change-password h1',
        cccshopOnBehalfBanner: '.dbh-csr-header-message',
        cccTenCharPasswordReq:
            '.c-password-validator > span:nth-child(1) ul li',
        cccUpperLowerCaseStatus:
            '.c-password-validator > span:nth-child(3) ul li:nth-child(1)',
        cccOneNumberStatus:
            '.c-password-validator > span:nth-child(3) ul li:nth-child(3)',
        cccSpecialCharStatus:
            '.c-password-validator > span:nth-child(3) ul li:nth-child(3)',
        cccUpdatebutton: '.csr-update-password-submit ',
        cccChangePasswordheader: '.t-csr-change-password p',
        cccExistingPassordInput: '.pw-field:nth-child(1) input',
        cccNewPassordInput: '.pw-field:nth-child(2) input',
        cccConfirmPassordInput: '.pw-field:nth-child(3) input',
        cccPasswordValidator: '.c-password-validator',
        cccUpdateButton: '.csr-update-password-submit',
        cccCancelButton: '.pw--outline',
        cccshowHideButton1:
            '.pw-field:nth-child(1) .dbh-show-hide .pw-button__inner',
        cccshowHideButton2:
            '.pw-field:nth-child(2) .dbh-show-hide .pw-button__inner',
        cccshowHideButton3:
            '.pw-field:nth-child(3) .dbh-show-hide .pw-button__inner',
        cccConfirmPasswordError: '.dbh-csr-confirm-pwd .pw-field__error',
        cccNewPasswordError: '.dbh-csr-new-pwd .pw-field__error',
        cccExistingPasswordError: '.dbh-csr-old-pwd .pw-field__error'
    }
}
const cccLogin = function() {
    this.selectors = selectors
}

export default cccLogin
