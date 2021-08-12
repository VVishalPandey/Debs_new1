const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        removeAllLink:
            '.t-my-saved-items__container.active div div:nth-child(3) p.t-my-saved-items__action-icons a.dbh-remove',
        allProductNameElements: '.dbh-product-title',
        headerText: '.dbh-my-saved-items-title',
        headerTextNonSignIn:
            '.t-my-saved-items__container .dbh-my-saved-items-first-time-visit',
        signInLinkHeaderText:
            '.t-my-saved-items__container .dbh-my-saved-items-first-time-visit > .pw-feedback > .pw-feedback__content > a:nth-child(2)',
        tab1: '.dbh-tabs li:nth-child(1)',
        tab2: '.dbh-tabs li:nth-child(2)',
        emailAddressFieldSignIn: '.dbh-email [name=logonId]',
        passwordField: '.dbh-password [name=logonPassword]',
        signInButton: '.dbh-signin-button span',
        firstProductChooseOptionButton:
            '.c-saved-items-list article:nth-child(1) .dbh-choose-options',
        secondProductChooseOptionButton:
            '.c-saved-items-list article:nth-child(2) .dbh-choose-options',
        thirdProductChooseOptionButton:
            '.c-saved-items-list article:nth-child(3) .dbh-choose-options',
        removeAllProductsButton: '.t-my-saved-items p>.dbh-remove',
        yesRemoveAllButtonOnPopUp: '.dbh-remove-item-button',
        firstProductOOSMessage:
            '.c-saved-items-list article:nth-child(1) .u-error span',
        secondProductOOSMessage:
            '.c-saved-items-list article:nth-child(2) .u-error span',
        thirdProductOOSMessage:
            '.c-saved-items-list article:nth-child(3) .u-error span',
        savedItemCount: '.dbh-saveforlater-header .t-header__button-icon-count'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        headerText: '.dbh-my-saved-items-title',
        removeLink: '.dbh-remove',
        removeItemButton: '.dbh-remove-item-button',
        addToCartButtonDisplayInitially: '.dbh-mini-bag-icon p',
        addToCartButtonDisplayFinal: '.dbh-mini-bag-icon span',
        allProductNameElements: '.dbh-product-title',
        headerTextNonSignIn:
            '.t-my-saved-items__container .dbh-my-saved-items-first-time-visit',
        signInLinkHeaderText:
            '.t-my-saved-items__container .dbh-my-saved-items-first-time-visit a:nth-child(2)',
        tab1: '.dbh-tabs li:nth-child(1)',
        tab2: '.dbh-tabs li:nth-child(2)',
        emailAddressFieldSignIn: '.dbh-email [name=logonId]',
        passwordField: '.dbh-password [name=logonPassword]',
        signInButton: '.dbh-signin-button span',
        removeAllLink: 'p.t-my-saved-items__action-icons a.dbh-remove',
        addToBagP1:
            '.dbh-items-container .pw-list .c-product-item:nth-child(1) div div:nth-child(3) .dbh-choose-options',
        savedItemCount: '.dbh-saveforlater-header .t-header__button-icon-count',
        removeP1:
            '.dbh-items-container .pw-list .c-product-item:nth-child(1) div div:nth-child(3) a.dbh-remove',
        removeProductWarning: '.dbh-remove-product-warning',
        yesButton: '.dbh-remove-item-button',
        noSavedItemsMesage: '.t-my-saved-items .dbh-items-container h3'
    }
} else {
    selectors = {
        headerText: '.dbh-my-saved-items-title',
        savedItemMessage:
            '.active .t-login__container p.t-my-saved-items__signin-description',
        emailAddressFieldSignIn: '.dbh-email [name=logonId]',
        emailAddressFieldCreateAccount: '.dbh-new-account-email input',
        emailAddressValue: '.dbh-email [name=logonId]',
        passwordField: '.dbh-password [name=logonPassword]',
        passwordFieldType: '.dbh-password input',
        signInButton: '.dbh-signin-button span',
        invalidLoginMessage: '.pw-feedback__content',
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
            '.dbh-tabs > .pw-tabs__strip-container > .pw-tabs__strip > .pw-tabs__tab:nth-child(2)',
        showHideButton: '.dbh-show-hide > button > div',
        errorTextMessage: '.pw-feedback__content',
        createAccountButton: '.dbh-create-account-button > div',
        resetPassword: '.error-message > a',
        allProductNameElements:
            '.t-my-saved-items__products-summary .dbh-product-title',
        signInLinkHeaderText:
            '.t-my-saved-items__container .dbh-my-saved-items-first-time-visit a:nth-child(2)',
        headerTextNonSignIn:
            '.t-my-saved-items__container .dbh-my-saved-items-first-time-visit',
        chooseItemOption: '.dbh-choose-options',
        allSizeElements: '.pw-swatch__items > div',
        addToBagButton: '.dbh-remove-item-button',
        removeLink: '.dbh-remove',
        removeItemButton: '.dbh-remove-item-button',
        addToCartButtonDisplayInitially: '.dbh-mini-bag-icon p',
        addToCartButtonDisplayFinal: '.dbh-mini-bag-icon span',
        newAccountHeaderText: 'h1',
        savedItemCount: '.dbh-saveforlater-header .t-header__button-icon-count',
        removeAllLink:
            '.t-my-saved-items div div:nth-child(3) p.t-my-saved-items__action-icons a.dbh-remove',
        addToBagP1:
            '.dbh-items-container .pw-list .c-product-item:nth-child(1) div div:nth-child(3) .dbh-choose-options',
        removeP1:
            '.dbh-items-container .pw-list .c-product-item:nth-child(1) div div:nth-child(3) a.dbh-remove',
        removeProductWarning: '.dbh-remove-product-warning',
        yesButton: '.dbh-remove-item-button',
        Message: '.c-saved-items-list .u-padding-top-lg .u-text-align-center'
    }
}

const mySavedItems = function() {
    this.selectors = selectors
}

export default mySavedItems
