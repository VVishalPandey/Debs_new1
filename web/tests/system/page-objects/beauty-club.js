const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        headerTitleText: '.t-my-beauty-club__header .t-my-beauty-club__title',
        headerSubTitleText:
            '.t-my-beauty-club__header .t-my-beauty-club__subtitle',
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
        dashboardTab1:
            '.dbh-dashboard .t-my-beauty-club__dashboard-column:nth-child(1) h2',
        dashboardTab2:
            '.dbh-dashboard .t-my-beauty-club__dashboard-column:nth-child(2) .t-my-beauty-club__dashboard-block:nth-child(1) h2',
        showHideButton: '.dbh-show-hide > button > div',
        resetPassword: '#account-locked',
        errorTextMessage: '.pw-feedback__content',
        createAccountButton: '.dbh-create-account-button > div',
        beautyPoints: '.dbh-points',
        noCardLinkedHeaderText: '.t-my-beauty-club__no-card h3',
        noCardLinkedText: '.t-my-beauty-club__no-card > div',
        linkCardButton: '.t-my-beauty-club__setup .pw-button__inner',
        manageAccountLink: '.pw-accordion__title div .pw-link',
        beautyClubcardDashBoardLink:
            '.pw-button.u-secondary-link--underlined:nth-child(1) > .pw-button__inner',
        myDetailsLink: '.pw-accordion__content div:nth-child(3) > a.pw-link',
        marketingPreferencesLink:
            '.pw-accordion__content div:nth-child(4) > a.pw-link',
        transactionHistorylink:
            '.pw-accordion__content div:nth-child(2) > a.pw-link',
        balancExpiryDatesLink:
            '.pw-accordion__content div:nth-child(5) div:nth-child(3) > a.pw-link',
        reportLostCardLink:
            '.pw-accordion__content div:nth-child(5) > a.pw-link',
        removeCardLink:
            'button.pw-button.u-secondary-link--underlined:nth-child(6) > div.pw-button__inner',
        removeCardPopup: '.pw-sheet__inner',
        removedCardMessage: '.pw-sheet__inner h1',
        removedCardWarning: '.pw-sheet__inner p',
        removeCardButton: '.pw-sheet__inner span:nth-child(1)',
        cancelButton: '.pw-sheet__inner .c--secondary',
        closeButton: '.pw-sheet__header .pw-button__inner',
        myBalanceExpiryDate: '.pw-tabs__strip-container li:nth-child(2)',
        myTransactionHistory: '.pw-tabs__strip-container li:nth-child(1)',
        backButton: '.t-my-beauty-club__back-button',
        currentBalance:
            '.t-my-beauty-club__transaction-history h3:nth-child(1)',
        totalBalance: '.pw-tabs__panels h3:nth-child(1)',
        pointsNotification:
            '.t-my-beauty-club__transaction-history  p:nth-child(2)',
        transactionDropdown: '.dbh-transaction-dropdown',
        balanceTransaction:
            '.dbh-transaction-dropdown [value*="balanceTransactionHistory"]',
        lostStolenTab: '.pw-tabs li:nth-child(1) a',
        leaveClubTab: '.pw-tabs li:nth-child(2) a',
        cardCancelText:
            '.t-my-beauty-club__report-lost-card-options .grouped-fieldset:nth-child(1) .pw--end > label',
        notHavingCardLink: '.t-my-beauty-club__tool-tip-btn:nth-child(2) > div',
        beautyCardimage: '.u-padding-bottom-sm:nth-child(4) >div .pw-image',
        leaveBeautyClubText: '.t-my-beauty-club__leave div div:nth-child(1)',
        leaveClubWarning: '.pw-feedback',
        beautyLandingHeroImage: '.beauty-club-hero-banner__content',
        beautyClbBannerRegisterBtn:
            '.beauty-club-hero-banner__container .c-register-button',
        beautyClbBannerSignInBtn:
            '.beauty-club-hero-banner__container .c-sign-button',
        beautyClubBenefitTab:
            '.beauty-club-tab-panel .pw-tabs__tab:nth-child(1) .pw-tabs__link',
        beautyClbHowToJoinTab:
            '.beauty-club-tab-panel .pw-tabs__tab:nth-child(2) .pw-tabs__link',
        beautyClbTabPanelTabs: '.beauty-club-tab-panel .pw-tabs__link',
        joinBeautyClubRegisterBtn: '.join-beauty-club-today .c-register-button',
        faqLink: '.beauty-club-link-more .pw-link',
        howTojoinRegLink: '.join-club-regsiter-sign h4:nth-child(2) .pw-link',
        howTojoinSignInLink:
            '.join-club-regsiter-sign h4:nth-child(1) .pw-link',
        beautyClubSetUpCardOptions: '.t-my-beauty-club__setup-card-options',
        beautyClubSetUpCardDob: '.t-my-beauty-club__setup-card-dob'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        headerTitleText: '.t-my-beauty-club__header .t-my-beauty-club__title',
        headerSubTitleText:
            '.t-my-beauty-club__header .t-my-beauty-club__subtitle',
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
        dashboardTab1:
            '.dbh-dashboard .t-my-beauty-club__dashboard-column:nth-child(1) h2',
        dashboardTab2:
            '.dbh-dashboard .t-my-beauty-club__dashboard-column:nth-child(2) .t-my-beauty-club__dashboard-block:nth-child(1) h2',
        showHideButton: '.dbh-show-hide > button > div',
        resetPassword: '#account-locked',
        errorTextMessage: '.pw-feedback__content',
        createAccountButton: '.dbh-create-account-button > div',
        beautyPoints: '.dbh-points',
        noCardLinkedHeaderText: '.t-my-beauty-club__no-card h3',
        noCardLinkedText: '.t-my-beauty-club__no-card p',
        linkCardButton: '.t-my-beauty-club__setup .pw-button__inner',
        addNewBeautyCardLink:
            'a[href="/webapp/wcs/stores/servlet/BeautyClubSetupCustomer?catalogId=10001&langId=-1&storeId=10701#nocard"]',
        dontHaveBeautyClubCardRadio:
            '.t-my-beauty-club__setup-card-options div:nth-child(2) input[checked]',
        dOBInputfield: 'input[name="dob"]',
        manageAccountLink: '.pw-accordion__title div .pw-link',
        beautyClubcardDashBoardLink:
            '.pw-button.u-secondary-link--underlined:nth-child(1) > .pw-button__inner',
        myDetailsLink: '.pw-accordion__content div:nth-child(3) > a.pw-link',
        marketingPreferencesLink:
            '.pw-accordion__content div:nth-child(4) > a.pw-link',
        transactionHistorylink:
            '.pw-accordion__content div:nth-child(2) > a.pw-link',
        balancExpiryDatesLink:
            '.pw-accordion__content div:nth-child(5) div:nth-child(3) > a.pw-link',
        reportLostCardLink:
            '.pw-accordion__content div:nth-child(5) > a.pw-link',
        removeCardLink:
            'button.pw-button.u-secondary-link--underlined:nth-child(6) > div.pw-button__inner',
        removeCardPopup: '.pw-sheet__inner',
        removedCardMessage: '.pw-sheet__inner h1',
        removedCardWarning: '.pw-sheet__inner p',
        removeCardButton: '.pw-sheet__inner span:nth-child(1)',
        cancelButton: '.pw-sheet__inner .c--secondary',
        closeButton: '.pw-sheet__header .pw-button__inner',
        myBalanceExpiryDate: '.pw-tabs__strip-container li:nth-child(2)',
        myTransactionHistory: '.pw-tabs__strip-container li:nth-child(1)',
        backButton: '.t-my-beauty-club__back-button',
        currentBalance:
            '.t-my-beauty-club__transaction-history h3:nth-child(1)',
        totalBalance: '.pw-tabs__panels h3:nth-child(1)',
        pointsNotification:
            '.t-my-beauty-club__transaction-history  p:nth-child(2)',
        transactionDropdown: '.dbh-transaction-dropdown',
        balanceTransaction:
            '.dbh-transaction-dropdown [value*="balanceTransactionHistory"]',
        lostStolenTab: '.pw-tabs li:nth-child(1) a',
        leaveClubTab: '.pw-tabs li:nth-child(2) a',
        cardCancelText:
            '.t-my-beauty-club__report-lost-card-options .grouped-fieldset:nth-child(1) .pw--end > label',
        notHavingCardLink: '.t-my-beauty-club__tool-tip-btn:nth-child(2) > div',
        beautyCardimage: '.u-padding-bottom-sm:nth-child(4) >div .pw-image',
        leaveBeautyClubText: '.t-my-beauty-club__leave div div:nth-child(1)',
        leaveClubWarning: '.pw-feedback',
        beautyLandingHeroImage: '.beauty-club-hero-banner__content',
        beautyClbBannerRegisterBtn:
            '.beauty-club-hero-banner__container .c-register-button',
        beautyClbBannerSignInBtn:
            '.beauty-club-hero-banner__container .c-sign-button',
        beautyClubBenefitTab:
            '.beauty-club-tab-panel .pw-tabs__tab:nth-child(1) .pw-tabs__link',
        beautyClbHowToJoinTab:
            '.beauty-club-tab-panel .pw-tabs__tab:nth-child(2) .pw-tabs__link',
        beautyClbTabPanelTabs: '.beauty-club-tab-panel .pw-tabs__link',
        joinBeautyClubRegisterBtn: '.join-beauty-club-today .c-register-button',
        faqLink: '.beauty-club-link-more .pw-link',
        howTojoinRegLink: '.join-club-regsiter-sign h4:nth-child(2) .pw-link',
        howTojoinSignInLink:
            '.join-club-regsiter-sign h4:nth-child(1) .pw-link',
        beautyClubSetUpCardOptions: '.t-my-beauty-club__setup-card-options',
        beautyClubSetUpCardDob: '.t-my-beauty-club__setup-card-dob'
    }
} else {
    selectors = {
        headerTitleText: '.t-my-beauty-club__header .t-my-beauty-club__title',
        headerSubTitleText:
            '.t-my-beauty-club__header .t-my-beauty-club__subtitle',
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
        dashboardTab1: '.dbh-dashboard .pw-tabs__strip li:nth-child(1) a',
        dashboardTab2: '.dbh-dashboard .pw-tabs__strip li:nth-child(2) a',
        showHideButton: '.dbh-show-hide > button > div',
        resetPassword: '#account-locked',
        errorTextMessage: '.pw-feedback__content',
        createAccountButton: '.dbh-create-account-button > div',
        beautyPoints: '.dbh-points',
        noCardLinkedHeaderText: '.t-my-beauty-club__no-card h3',
        noCardLinkedText: '.t-my-beauty-club__no-card p',
        linkCardButton: '.t-my-beauty-club__setup .pw-button__inner',
        addNewBeautyCardLink:
            'a[href="/webapp/wcs/stores/servlet/BeautyClubSetupCustomer?catalogId=10001&langId=-1&storeId=10701#nocard"]',
        dontHaveBeautyClubCardRadio:
            '.t-my-beauty-club__setup-card-options div:nth-child(2) input[checked]',
        dOBInputfield: 'input[name="dob"]',
        manageAccountLink: '.pw-accordion__title div .pw-link',
        beautyClubcardDashBoardLink:
            '.pw-button.u-secondary-link--underlined:nth-child(1) > .pw-button__inner',
        myDetailsLink: '.pw-accordion__content div:nth-child(3) > a.pw-link',
        marketingPreferencesLink:
            '.pw-accordion__content div:nth-child(4) > a.pw-link',
        transactionHistorylink:
            '.pw-accordion__content div:nth-child(2) > a.pw-link',
        balancExpiryDatesLink:
            '.pw-accordion__content div:nth-child(5) div:nth-child(3) > a.pw-link',
        reportLostCardLink:
            '.pw-accordion__content div:nth-child(5) > a.pw-link',
        removeCardLink:
            'button.pw-button.u-secondary-link--underlined:nth-child(6) > div.pw-button__inner',
        removeCardPopup: '.pw-sheet__inner',
        removedCardMessage: '.pw-sheet__inner h1',
        removedCardWarning: '.pw-sheet__inner p',
        removeCardButton: '.pw-sheet__inner span:nth-child(1)',
        cancelButton: '.pw-sheet__inner .c--secondary',
        closeButton: '.pw-sheet__header .pw-button__inner',
        myBalanceExpiryDate: '.pw-tabs__strip-container li:nth-child(2)',
        myTransactionHistory: '.pw-tabs__strip-container li:nth-child(1)',
        backButton: '.t-my-beauty-club__header a',
        currentBalance:
            '.t-my-beauty-club__transaction-history h3:nth-child(1)',
        totalBalance: '.pw-tabs__panels h3:nth-child(1)',
        pointsNotification:
            '.t-my-beauty-club__transaction-history  p:nth-child(2)',
        transactionDropdown: '.dbh-transaction-dropdown',
        balanceTransaction:
            '.dbh-transaction-dropdown [value*="balanceTransactionHistory"]',
        lostStolenTab: '.pw-tabs li:nth-child(1) a',
        leaveClubTab: '.pw-tabs li:nth-child(2) a',
        cardCancelText:
            '.t-my-beauty-club__report-lost-card-options .grouped-fieldset:nth-child(1) .pw--end > label',
        notHavingCardLink: '.t-my-beauty-club__tool-tip-btn:nth-child(2) > div',
        beautyCardimage: '.u-padding-bottom-sm:nth-child(4) >div .pw-image',
        leaveBeautyClubText: '.t-my-beauty-club__leave div div:nth-child(1)',
        leaveClubWarning: '.pw-feedback',
        beautyLandingHeroImage: '.beauty-club-hero-banner__content',
        beautyClbBannerRegisterBtn:
            '.beauty-club-hero-banner__container .c-register-button',
        beautyClbBannerSignInBtn:
            '.beauty-club-hero-banner__container .c-sign-button',
        beautyClubBenefitTab:
            '.beauty-club-tab-panel .pw-tabs__tab:nth-child(1) .pw-tabs__link',
        beautyClbHowToJoinTab:
            '.beauty-club-tab-panel .pw-tabs__tab:nth-child(2) .pw-tabs__link',
        beautyClbTabPanelTabs: '.beauty-club-tab-panel .pw-tabs__link',
        joinBeautyClubRegisterBtn: '.join-beauty-club-today .c-register-button',
        faqLink: '.beauty-club-link-more .pw-link',
        howTojoinRegLink: '.join-club-regsiter-sign h4:nth-child(2) .pw-link',
        howTojoinSignInLink:
            '.join-club-regsiter-sign h4:nth-child(1) .pw-link',
        beautyClubSetUpCardOptions: '.t-my-beauty-club__setup-card-options',
        beautyClubSetUpCardDob: '.t-my-beauty-club__setup-card-dob'
    }
}

const beautyClub = function() {
    this.selectors = selectors
}

export default beautyClub
