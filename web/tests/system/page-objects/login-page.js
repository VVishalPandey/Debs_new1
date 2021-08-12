const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        headerText: '.dbh-my-account',
        emailAddressFieldSignIn: '.dbh-email [name=logonId]',
        passwordField: '.dbh-password [name=logonPassword]',
        passwordFieldType: '.dbh-password input',
        signInButton: '.dbh-signin-button span',
        bagLoginOverlay: '.pw-sheet__content',
        bagLoginOverlayHeader: '.t-desktop-checkout-login__modal--heading',
        confirmOrderCopy: '.t-confirm-order-copy',
        continueAsGuestText: '.dbh-guest-option label',
        signInAsText: '.dbh-sign-in-option label',
        forgotPasswordLink: '.dbh-forgot-password',
        cancelButton: '.dbh-cancel-button',
        continueButton: '.dbh-signin-button',
        closeIcon: '.dbh-close-button',
        secureCheckoutIcon: '.t-desktop-checkout-login__modal--heading svg',
        emailErrorMessage: '.dbh-email .pw-field__error',
        errorNotification: '.pw--error',
        continueGuestRadioButton:
            '.t-checkout-login__customer-options > div:nth-child(1) input',
        signinRadioButton:
            '.t-checkout-login__customer-options > div:nth-child(2) input',
        showHideButton: '.dbh-show-hide > button > div',
        continueAsGuestGhostButton: '.continue-guest-button',
        helloTextGhostOverlay: '.t-checkout-form  h1',
        noticedCopyGhost1: '.t-checkout-form>div>div>p:nth-child(2)',
        noticedCopyGhost2: '.t-checkout-form>div>div>p:nth-child(3)',
        noticedCopyGhost3: '.t-checkout-form>div>div>p:nth-child(4)',
        goToYourAccountText: '.t-checkout-ghost-login .u-padding-md h2',
        signInQuickerText: '.t-checkout-ghost-login .u-padding-md p',
        signedInEmail: '.t-checkout-ghost-login .u-text-size-medium',
        signInGhost: '.dbh-quick-register-button',
        errorMessageGhost: '.error-message',
        tab1:
            '.dbh-tabs > .pw-tabs__strip-container > .pw-tabs__strip > .pw-tabs__tab:nth-child(1)',
        tab2:
            '.dbh-tabs > .pw-tabs__strip-container > .pw-tabs__strip > .pw-tabs__tab:nth-child(2)',
        emailAddressType: '.dbh-email input',
        createAccountButton: '.dbh-create-account-button > div',
        newDebenhamsText: '.u-padding-bottom-sm',
        createAccountLink: '.dbh-create-new-account',
        passwordErrorMessage: '.dbh-password .pw-field__error',
        invalidLoginMessage: '.dbh-signin-error .pw-feedback__content',
        invalidPasswordMessage: '.pw-feedback__content .pw-field__error',
        emailErrorMessageCreateAccount:
            '.dbh-new-account-email .pw-field__error',
        secureCheckoutError: '.pw--error > div',
        secureCheckoutError1: '.pw-field__error',
        resetPassword: '#account-locked',
        emailAddressFieldCreateAccount: '.dbh-new-account-email input',
        partialLoginHeader: '.partial-login__welcome-user',
        partialLoginWelcomeMessage: '.partial-login__welcome-message',
        partialLoginContGuestBtn:
            '.dbh-continue-guest-button .pw-button__inner',
        partialLoginGuestForm: '.sign-in-partial',
        partialLoginGuestBackLink: '.dbh-back',
        partialLoginGuestTitle: '.dhh-page-title',
        partialLoginGuestEmailConfCopy: '.t-confirm-order-copy',
        partialLoginGuestEmailError:
            '.sign-in-partial .dbh-email .pw-field__error',
        partialLoginGuestEmailInput:
            '.t-login__partial-cont-guest-form [type="email"]',
        partialLoginGuestContinueBtn:
            '.t-login__partial-cont-guest-form .dbh-signin-button'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        headerText: '.dbh-my-account',
        emailAddressFieldSignIn: '.dbh-email [name=logonId]',
        emailAddressValue: '.dbh-email [name=logonId]',
        passwordField: '.dbh-password [name=logonPassword]',
        passwordFieldType: '.dbh-password input',
        signInButton: '.dbh-signin-button span',
        rememberMe: '.dbh-remember-me input',
        emailErrorMessage: '.dbh-email .pw-field__error',
        emailErrorMessageCreateAccount:
            '.dbh-new-account-email .pw-field__error',
        passwordErrorMessage: '.dbh-password .pw-field__error',
        forgotPasswordLink: '.dbh-forgot-password',
        tab1:
            '.dbh-tabs > .pw-tabs__strip-container > .pw-tabs__strip > .pw-tabs__tab:nth-child(1)',
        tab2:
            '.dbh-tabs > .pw-tabs__strip-container > .pw-tabs__strip > li.pw-tabs__tab:nth-child(2) a[aria-selected="false"]',
        showHideButton: '.dbh-show-hide > button > div',
        resetPassword: '#account-locked',
        errorTextMessage: '.pw-feedback__content',
        createAccountButton: '.dbh-create-account-button > div',
        emailAddressFieldCreateAccount: '.dbh-new-account-email input',
        createAccountLink: '.dbh-create-new-account',
        partialLoginHeader: '.partial-login__welcome-user',
        partialLoginWelcomeMessage: '.partial-login__welcome-message',
        partialLoginContGuestBtn:
            '.dbh-continue-guest-button .pw-button__inner',
        partialLoginGuestForm: '.sign-in-partial',
        partialLoginGuestBackLink: '.dbh-back',
        partialLoginGuestTitle: '.dhh-page-title',
        partialLoginGuestEmailConfCopy: '.t-confirm-order-copy',
        partialLoginGuestEmailError:
            '.sign-in-partial .dbh-email .pw-field__error',
        partialLoginGuestEmailInput:
            '.t-login__partial-cont-guest-form [type="email"]',
        partialLoginGuestContinueBtn:
            '.t-login__partial-cont-guest-form .dbh-signin-button',
        closeIcon: '.dbh-close-button'
    }
} else {
    selectors = {
        headerText: '.dbh-my-account',
        emailAddressFieldSignIn: '.dbh-email [name=logonId]',
        emailAddressFieldCreateAccount: '.dbh-new-account-email input',
        emailAddressValue: '.dbh-email [name=logonId]',
        passwordField: '.dbh-password [name=logonPassword]',
        passwordFieldType: '.dbh-password input',
        signInButton: '.dbh-signin-button span',
        invalidLoginMessage: '.pw-feedback__content .pw-field__error',
        createAccountLink: '.dbh-create-new-account',
        rememberMe: '.dbh-remember-me input',
        emailErrorMessage: '.dbh-email .pw-field__error',
        emailErrorMessageCreateAccount:
            '.dbh-new-account-email .pw-field__error',
        passwordErrorMessage: '.dbh-password .pw-field__error',
        forgotPasswordLink: '.dbh-forgot-password',
        tab1:
            '.dbh-tabs > .pw-tabs__strip-container > .pw-tabs__strip > .pw-tabs__tab:nth-child(1)',
        tab2:
            '.dbh-tabs > .pw-tabs__strip-container > ol.pw-tabs__strip > li.pw-tabs__tab:nth-child(2) a[aria-selected="false"]',
        showHideButton: '.dbh-show-hide > button > div',
        resetPassword: '#account-locked',
        errorTextMessage: '.pw-feedback__content',
        createAccountButton: '.dbh-create-account-button > div',
        partialLoginHeader: '.partial-login__welcome-user',
        partialLoginWelcomeMessage: '.partial-login__welcome-message',
        partialLoginContGuestBtn:
            '.dbh-continue-guest-button .pw-button__inner',
        partialLoginGuestForm: '.sign-in-partial',
        partialLoginGuestBackLink: '.dbh-back',
        partialLoginGuestTitle: '.dhh-page-title',
        partialLoginGuestEmailConfCopy: '.t-confirm-order-copy',
        partialLoginGuestEmailError:
            '.sign-in-partial .dbh-email .pw-field__error',
        partialLoginGuestEmailInput:
            '.t-login__partial-cont-guest-form [type="email"]',
        partialLoginGuestContinueBtn:
            '.t-login__partial-cont-guest-form .dbh-signin-button',
        closeIcon: '.dbh-close-button'
    }
}

const login = function() {
    this.selectors = selectors
}

export default login
