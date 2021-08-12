const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        checkoutButton: '.t-cart__product-list .dbh-secure-checkout',
        checkoutButton2: '.t-cart__summary-wrapper .dbh-secure-checkout',
        headerText: '.dbh-welcome',
        forgotPasswordLink: '.dbh-forgot-password',
        continueButton: '.dbh-signin-button',
        backSection: '.t-checkout-login__back div',
        returningCustomerRadioButton: '.dbh-existing-customer',
        newCustomerRadioButton:
            'input[type="radio"][name="customer"][value="new"]',
        emailErrorMessage: '.dbh-email .pw-field__error',
        passwordErrorMessage: '.dbh-password .pw-field__error',
        invalidLoginMessage: '.pw-feedback__content',
        passwordFieldType: '.dbh-show-hide input',
        showHideButton: '.dbh-show-hide div',
        checkoutDelivery: '.dbh-delivery-options h1',
        checkoutDefaultTab: '.dbh-tabs li:nth-child(1)',
        checkoutClickCollectTab: '.dbh-tabs li:nth-child(2)',
        checkoutdeliveryAddressheaderText: '.dbh-address-container h2',
        checkoutdeliveryAddressDetails: '.dbh-address-container p',
        checkoutdeliveryChangeAddressLink: '.dbh-change-address',
        checkoutClickCollectHeaderText:
            '.dbh-click-collect-tab p.u-margin-top-md',
        returningCustomerLogin: '.dbh-sign-in-option',
        checkoutHeader: '.t-desktop-checkout-login__modal--heading',
        checkoutHeader1: '.u-display-flex-left h3',
        returningCustomerLoginText: '.sign-in-v2-copy p',
        guestHeaderText: '.dhh-page-title',
        ghostSignInButton: '.dbh-quick-register-button',
        continueAsGuestButton: '.dbh-continue-guest-button',
        emailAddressGhost: 'p.u-text-size-medium',
        quickerSignText:
            'p.u-text-align-center.u-text-style-italic.u-text-size-small',
        goToAccountText: '.t-checkout-ghost-login h2.u-text-align-center',
        secureCheckoutLoginPage: '.pw-sheet__content',
        guestLogin: '.dbh-guest-option',
        emailAddressField: '.dbh-email [name=logonId]',
        guestLoginContinueButton: '.dbh-signin-button',
        signInButton: '.dbh-signin-button span',
        passwordField: '.dbh-password [name=logonPassword]',
        continueGuestRadioButton:
            '.t-checkout-login__customer-options > div:nth-child(1) input',
        signinRadioButton:
            '.t-checkout-login__customer-options > div:nth-child(2) input',
        closeButton: '.dbh-close-button'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        checkoutButton: '.t-cart__product-list .dbh-secure-checkout',
        checkoutButton2: '.t-cart__summary-wrapper .dbh-secure-checkout',
        headerText: '.dbh-welcome',
        emailAddressField: '.dbh-email input',
        passwordField: '.dbh-password input',
        forgotPasswordLink: '.dbh-forgot-password',
        continueButton: '.dbh-checkout-login-button span',
        backSection: '.t-checkout-login__back div',
        returningCustomerRadioButton: '.dbh-existing-customer',
        newCustomerRadioButton:
            'input[type="radio"][name="customer"][value="new"]',
        emailErrorMessage: '.dbh-email .pw-field__error',
        passwordErrorMessage: '.dbh-password .pw-field__error',
        invalidLoginMessage: '.pw-feedback__content',
        passwordFieldType: '.dbh-show-hide input',
        showHideButton: '.dbh-show-hide div',
        signInButton: '.dbh-signin-button span',
        checkoutDelivery: '.dbh-delivery-options h1',
        checkoutDefaultTab: '.dbh-tabs li:nth-child(1)',
        checkoutClickCollectTab: '.dbh-tabs li:nth-child(2)',
        checkoutdeliveryAddressheaderText: '.dbh-address-container h2',
        checkoutdeliveryAddressDetails: '.dbh-address-container p',
        checkoutdeliveryChangeAddressLink: '.dbh-change-address',
        checkoutClickCollectHeaderText:
            '.dbh-click-collect-tab p.u-margin-top-md',
        secureCheckoutLoginPage:
            '.dbh-options .t-checkout-shipping__delivery-option',
        guestLogin: '.dbh-guest-option',
        guestLoginContinueButton: '.dbh-signin-button',
        returningCustomerLogin: '.dbh-sign-in-option',
        checkoutHeader: '.u-display-flex-left h3',
        guestHeaderText: '.dhh-page-title',
        ghostSignInButton: '.dbh-quick-register-button',
        continueAsGuestButton: '.dbh-continue-guest-button',
        emailAddressGhost: 'p.u-text-size-medium',
        quickerSignText:
            'p.u-text-align-center.u-text-style-italic.u-text-size-small',
        goToAccountText: '.t-checkout-ghost-login h2.u-text-align-center'
    }
} else {
    selectors = {
        checkoutButton: '.t-cart__product-list .dbh-secure-checkout',
        checkoutButton2: '.t-cart__summary-wrapper .dbh-secure-checkout',
        headerText:
            '.u-padding-bottom-lg .t-checkout-form .u-text-align-center',
        emailAddressField: '.dbh-email input',
        passwordField: '.dbh-password input',
        forgotPasswordLink: '.dbh-forgot-password',
        continueButton: '.dbh-signin-button',
        backSection: '.t-checkout-login__back div',
        returningCustomerRadioButton: '.dbh-existing-customer',
        newCustomerRadioButton: '.dbh-guest-option',
        emailErrorMessage: '.dbh-email .pw-field__error',
        passwordErrorMessage: '.dbh-password .pw-field__error',
        invalidLoginMessage: '.pw-feedback__content',
        passwordFieldType: '.dbh-show-hide input',
        showHideButton: '.dbh-show-hide div',
        guestTab:
            '.dbh-tabs .pw-tabs__strip-container [role=tablist] li:nth-child(2) a',
        maxEmailAddressField: '.dbh-create-account-tab .dbh-email input',
        maxContinueButton: '.dbh-create-account-tab .dbh-signin-button span',
        closeButton: '.dbh-close-button',
        loginGuest:
            '.t-checkout-form .skeleton-column-medium-width div:nth-child(1)',
        loginExisting:
            '.t-checkout-form .skeleton-column-medium-width div:nth-child(2)',
        signInButton: '.dbh-signin-button span',
        errorTextMessage: '.dbh-error .pw-feedback__content',
        checkoutDelivery: '.dbh-delivery-options h1',
        checkoutDefaultTab: '.dbh-tabs li:nth-child(1)',
        checkoutClickCollectTab: '.dbh-tabs li:nth-child(2)',
        checkoutdeliveryAddressheaderText: '.dbh-address-container h2',
        checkoutdeliveryAddressDetails: '.dbh-address-container p',
        checkoutdeliveryChangeAddressLink: '.dbh-change-address',
        checkoutClickCollectHeaderText:
            '.dbh-click-collect-tab p.u-margin-top-md',
        secureCheckoutLoginPage:
            '.dbh-options .t-checkout-shipping__delivery-option',
        guestLogin: '.dbh-guest-option',
        guestLoginContinueButton: '.dbh-signin-button',
        returningCustomerLogin: '.dbh-sign-in-option',
        checkoutHeader: '.u-display-flex-left h3',
        guestHeaderText: '.dhh-page-title',
        ghostSignInButton: '.dbh-quick-register-button',
        continueAsGuestButton: '.dbh-continue-guest-button',
        emailAddressGhost: 'p.u-text-size-medium',
        quickerSignText:
            'p.u-text-align-center.u-text-style-italic.u-text-size-small',
        goToAccountText: '.t-checkout-ghost-login h2.u-text-align-center'
    }
}

const basketCheckout = function() {
    this.selectors = selectors
}

export default basketCheckout
