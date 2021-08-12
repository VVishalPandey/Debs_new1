const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        cookiesClose: '.t-footer__accept-cookie',
        logoDebenhams: '.dbh-header-logo',
        searchResultHeader: '.psp-header-container p:nth-child(1)',
        searchResultHeaderSearchTerm: '.psp-header-container h1',
        searchIcon: ' .dbh-search-input',
        searchApply: '.dbh-search-submit',
        miniBagIcon: '.dbh-header__cart',
        miniBag: '.t-mini-cart__popover-wrapper',
        numberCountInMiniBag: '.t-header__cart-count',
        flagCountrySelectedFooter:
            '.dbh-footer-country-select-selected span:nth-child(1)',
        countrySelectorCurrency: '.t-country-select__form-currency',
        countrySelectorLinkHeader: '.dbh-country-select-btn',
        flagCountrySelectedHeader:
            '.c-country-select-dropdown__current-country-code',
        countrySelectorCancelButton: '.dbh-country-select-modal',
        productsRemovalMessage:
            '#changeCountryOverlayForm .pw-feedback__content',
        autoSuggestionResult:
            '.pw-search__suggestion-list li span.suggest-category',
        savedItemsButton: '.dbh-saveforlater-header',
        signOutLink: '.dbh-link-signOut',
        myAccountLink: '.dbh-link-myAccount',
        myBagButton: '.dbh-header__cart',
        signInOptionDesktop: '.dbh-link-login',
        personalFinanceLink: '.dbh-link-personalfinance',
        storeFinderLink: '.dbh-link-storeitem',
        createAccountLink: '.dbh-link-login',
        myBeautyClubLink: '.dbh-link-beautycc',
        delieverybanner: '.dbh-delivery-options',
        notYouLink: '.dbh-link-notYou',
        standardDel: '.dbh-delivery-options-wrapper > a:nth-child(1)',
        helloNameLink: '.dbh-userName',
        autoSuggestions: 'ul.pw-search__suggestion-list li',
        globalNavMenuOptions:
            '.dbh-header-bar nav.t-desktop-nav__sheet ul.t-desktop-nav__tab-panel li',
        globalNavMenuOptionsList:
            '.dbh-header-bar nav.t-desktop-nav__sheet ul.t-desktop-nav__tab-panel li:nth-child(1) .dbh-desktop-nav__item',
        globalNavSubMenuColumns: '.t-desktop-nav__panels .active > div',
        globalNavSubMenuColumOptions:
            '.t-desktop-nav__panels .active > div:nth-child(parentPos) .dbh-desktop-nav__sub-item',
        globalNavSubMenuHeaders:
            '.t-desktop-nav__panels .active > div:nth-child(parentPos) .dbh-desktop-nav__sub-header',
        footerMenuSection: '.dbh-footer-listing',
        footerMenuList: '.dbh-footer-listing-title',
        footerMenuOption:
            '.dbh-footer-listing-content:nth-child(1) .dbh-footer-listing-title',
        footerSubMenuList:
            '.dbh-footer-listing > .dbh-footer-listing-content:nth-child(found) .dbh-footer-listing-link',
        footerSubMenuOption:
            '.dbh-footer-listing > .dbh-footer-listing-content:nth-child(found) li:nth-child(sonOf) .dbh-footer-listing-link',
        socialMediaSection: '.dbh-footer-social',
        socialMediaFacebook: '.t-footer__social-link--facebook',
        socialMediaTwitter: '.t-footer__social-link--twitter',
        socialMediaPinterest: '.t-footer__social-link--pinterest',
        socialMediaInstagram: '.t-footer__social-link--instagram',
        socialMediaYoutube: '.t-footer__social-link--youtube',
        subscribeToNewsletter: '.t-footer__newsletter',
        subscribeEmail: '.dbh-newsletter-form-input',
        subscribeButton: '.dbh-newsletter-form-submit',
        subscribeEmailError: '.t-footer__newsletter-field .pw-field__error',
        verifiedByVisaIcon: '.t-footer__logo--visa-secure',
        popUpClose: '.close',
        blackFridaypopUpClose: '.overlay-container > .close-button',
        searchField: '.dbh-search-input',
        currency: '.dbh-country-select-form input[name="currency”]',
        AusFlagImage: '.country-flag country-flag--au',
        rememberMyCountryCheckbox: '.dbh-country-select-form-field-remember',
        countrySelectorLink: '.dbh-country-select-btn',
        chooseyourcountry:
            '.dbh-country-select-form-field-country .pw-field__label',
        countryselectorbtn: '.dbh-country-select-form-submit .pw-button__inner',
        countrySelectorpopupclose:
            ' .pw-button.pw--icon-only.c--tertiary.c--tertiary--with-icon',
        countrySelectorDropDown: '.country-picker-dropdown-container',
        countrySelectorAU:
            '.dbh-product-color-dropdown-elem>option[value="AU"]',
        goButton: '.dbh-country-select-form-submit> div.pw-button__inner',
        cancelButton: '.button[value="Cancel"]',
        countrySelectedInFooter:
            '.dbh-footer-country-select-selected .country-flag country-flag--au',
        countryOptions:
            '.c-country-select-dropdown__country-select-dropdown li',
        countryList:
            '.c-country-select-dropdown__country-select-dropdown li:nth-child(1) .c-country-select-dropdown__country-code',
        // countrySelectorLink: '.dbh-country-select-btn'
        countryAustralia: '.dbh-product-color-dropdown-elem [value="AU"]',
        currencyAustralia: 'p.t-country-select__form-currency',
        flagAustralia: '.country-flag',
        countrySelectedFooter:
            '.dbh-footer-country-select-selected>span:nth-child(1)',
        countrySelectedFooter1:
            '.t-footer__country-select-selected.dbh-footer-country-select-selected > span:nth-child(1)',
        termsConditionSection: 'ul.t-footer__nav-list.dbh-footer-nav-list',
        cookies:
            'li:nth-child(1) > a.pw-link.t-footer__nav-link.dbh-footer-nav-link',
        privacy:
            'li:nth-child(2) > a.pw-link.t-footer__nav-link.dbh-footer-nav-link',
        termsCondition:
            'li:nth-child(3) > a.pw-link.t-footer__nav-link.dbh-footer-nav-link',
        legalDisclaimer:
            'li:nth-child(4) > a.pw-link.t-footer__nav-link.dbh-footer-nav-link',
        copyrightDisclaimerText:
            'p.t-footer__nav-copyright.dbh-footer-nav-copyright.u-margin-top-sm',
        selectedCountryName: '.c-country-select-dropdown__current-country-code',
        totalCountryCountText:
            'p.t-footer__country-select-title.dbh-footer-country-select-title',
        flagUK: 'i.country-flag.country-flag--gb',
        countrySelectorpopupclose1:
            'div.pw-sheet__header button.pw-button.pw--icon-only.pw--outline-icon > div.pw-button__inner',
        popup: 'div.pw-sheet__content',
        welcomeToDebenhams: '[*|href="#pw-welcome"]',
        popUpCancelButton:
            'button.pw-button.c--secondary.u-width-full.t-country-select-modal',
        deliveryOptions: '.dbh-delivery-options-wrapper > .dbh-link',
        headerMenuSection: '#app-header',
        nextDaydel: '.dbh-delivery-options-wrapper > a:nth-child(2)',
        internationalDel: '.dbh-delivery-options-wrapper > a:nth-child(3)',
        internationalDelIcon:
            '.dbh-delivery-options-wrapper a:nth-child(3) div:nth-child(1)',
        paypalOption: '.dbh-delivery-options-wrapper > a:nth-child(2)',
        paypalOptionIcon:
            '.dbh-delivery-options-wrapper a:nth-child(2) div:nth-child(1)',
        clickCollectdel: '.dbh-delivery-options-wrapper > a:nth-child(2)',
        clickCollectdelIcon:
            '.dbh-delivery-options-wrapper a:nth-child(2) div:nth-child(1)',
        deliveryLocationFAQ: '.more-details-link',
        searchBar: '.dbh-search-input',
        clearXCTA: '.search-clear__button',
        deliverybanner: '.dbh-delivery-options-wrapper',
        deliverybannerOption: '.dbh-delivery-options-wrapper > .dbh-link',
        deliveryOptionsRoi: 'a.dbh-link',
        nextDayClick: '.dbh-delivery-options-wrapper > a:nth-child(2)',
        nextDaydelRoi: '.dbh-delivery-options-wrapper > a:nth-child(3)',
        standardDelIcon:
            '.dbh-delivery-options-wrapper a:nth-child(1) div:nth-child(1)',
        nextDayClickIcon:
            '.dbh-delivery-options-wrapper a:nth-child(2) div:nth-child(1)',
        termsExclusionSection: '.t-home__uber-component--slim-banner',
        termsExclusion:
            '.t-home__uber-component--slim-banner  .u-secondary-link--underlined',
        menuOverlay: '.t-desktop-nav__panels',
        loader: '.loader',
        clickOutsideSugeestionBox: '.t-super-header__list',
        footercardlogos: '.dbh-footer-logos',
        miniBagHeader: '.t-header__cart-button',
        homeBanner: '.t-home__container--desktop',
        nextDayDeliveryIcon:
            '.dbh-delivery-options-wrapper a:nth-child(3) div:nth-child(1)',
        cookieBanner: '.t-footer__cookie-disclaimer',
        cookieClickHereLink: '.dbh-cookie-disclaimer-link',
        manageCookieButton: '.t-footer__manage-cookie',
        acceptCookieButton: '.t-footer__accept-cookie',
        desktopSkelton: '.dbh-skeleton',
        saveForLaterCount:
            '.dbh-saveforlater-header .t-header__button-icon-count',
        skeletonBlock: '.pw-skeleton-text',
        globalNavMenuOpen: '.t-desktop-nav__tab-panel .active',
        autoSuggestionOption:
            '.pw-search__suggestion-list li:nth-child(1) span.suggest-category',
        autoSuggestAll:
            '.pw-search__suggestion-list li .t-search__suggestion-item .t-search__suggestion-name',
        autoSuggestSelect:
            '.pw-search__suggestion-list li:nth-child(1) .t-search__suggestion-item .t-search__suggestion-name',
        imagePresent: '.dbh-image',
        verifiedByMasterCardIcon: '.t-footer__logo--mastercard-id',
        verifiedByAmexIcon: '.t-footer__logo--amex-safekey',
        comodoIcon: '.t-footer__logo--comodo-secure',
        flagCountrySelectedMenu:
            '.c-country-select-dropdown__country-select-icon',
        countryDropdown: '.dbh-country-select-btn .dbh-arrow',
        countryDropdownOption1Name:
            '.c-country-select-dropdown__country-select-dropdown li:nth-child(1) .c-country-select-dropdown__country-code',
        countryDropdownOption1Flag:
            '.c-country-select-dropdown__country-select-dropdown li:nth-child(1) .c-country-select-dropdown__country-select-icon',
        countryDropdownOption1Currency:
            '.c-country-select-dropdown__country-select-dropdown li:nth-child(1) .c-country-select-dropdown__country-currency',
        countryDropdownOption2Name:
            '.c-country-select-dropdown__country-select-dropdown li:nth-child(2) .c-country-select-dropdown__country-code',
        countryDropdownOption2Flag:
            '.c-country-select-dropdown__country-select-dropdown li:nth-child(2) .c-country-select-dropdown__country-select-icon',
        countryDropdownOption2Currency:
            '.c-country-select-dropdown__country-select-dropdown li:nth-child(2) .c-country-select-dropdown__country-currency',
        countrySelectorLinkMenuClose:
            '.c-country-select-dropdown__country-select-dropdown--active',
        debenhamsPromo: '.overlay-container .close-button',
        recentSearchList: '.pw-search__suggestion-list',
        recentSearchHeader: '.pw-search__suggestion:nth-child(1) p',
        recentSearchKeywordFirst: '.pw-search__suggestion:nth-child(2) p',
        recentSearchKeywordSecond: '.pw-search__suggestion:nth-child(3) p',
        clearButton: '.pw-search__suggestion:nth-child(1) button'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        footerMenuSection: '.dbh-footer-listing',
        logoDebenhams: '.dbh-header-logo',
        footerMenuList: '.dbh-footer-listing-title',
        footerMenuOption:
            '.dbh-footer-listing-content:nth-child(1) .dbh-footer-listing-title',
        footerSubMenuList:
            '.dbh-footer-listing > .dbh-footer-listing-content:nth-child(found) .dbh-footer-listing-link',
        footerSubMenuOption:
            '.dbh-footer-listing > .dbh-footer-listing-content:nth-child(found) li:nth-child(sonOf) .dbh-footer-listing-link',
        socialMediaSection: '.dbh-footer-social',
        socialMediaFacebook: '.t-footer__social-link--facebook',
        socialMediaTwitter: '.t-footer__social-link--twitter',
        socialMediaPinterest: '.t-footer__social-link--pinterest',
        socialMediaInstagram: '.t-footer__social-link--instagram',
        socialMediaYoutube: '.t-footer__social-link--youtube',
        subscribeToNewsletter: '.t-footer__newsletter',
        subscribeEmail: '.dbh-newsletter-form-input',
        subscribeButton: '.dbh-newsletter-form-submit',
        subscribeEmailError: '.t-footer__newsletter-field .pw-field__error',
        verifiedByVisaIcon: '.t-footer__logo--visa-secure',
        searchIcon: '.pw-button--search',
        clearXCTA: '.search-clear__button',
        searchBar: '.dbh-search-input',
        searchField: '.dbh-search-input',
        searchApply: '.dbh-search-submit',
        popUpClose: '.close',
        cookiesClose: '.t-footer__accept-cookie',
        menuIcon:
            '.pw-header-bar > .pw-header-bar__actions:nth-child(1) button',
        signOutOption: '.pw-nav-menu__panel > .pw-list-tile:nth-child(20)',
        signInOption: '.pw-nav-menu__panel > .pw-list-tile:nth-child(14)',
        closeIcon: '[role="navigation"] button.active',
        // mainMenuOption: '.pw-nav-menu__panel .pw-list-tile:nth-child(1)'
        mainMenuList: '.pw-nav-menu__panel .pw-list-tile.pw--has-child ',
        mainMenuOption: '.pw-nav-menu__panel li:nth-child(1) .pw-list-tile',
        subMenuList: '.pw-nav-menu__panel .pw-list-tile',
        subMenuOption:
            '.pw-nav-menu__panel li:nth-child(1) .pw-list-tile .pw-list-tile__primary',
        currency: '.dbh-country-select-form input[name="currency”]',
        AusFlagImage: '.country-flag country-flag--au',
        rememberMyCountryCheckbox: '.dbh-country-select-form-field-remember',
        countrySelectorLink: '.dbh-country-select-btn > div',
        chooseyourcountry:
            '.dbh-country-select-form-field-country .pw-field__label',
        countryselectorbtn: '.dbh-country-select-form-submit .pw-button__inner',
        countrySelectorpopupclose:
            '.t-country-select__modal .pw-sheet__header .pw-button',
        countrySelectorDropDown: '.country-picker-dropdown-container',
        countrySelectorAU:
            '.dbh-product-color-dropdown-elem>option[value="AU"]',
        goButton: '.dbh-country-select-form-submit> div.pw-button__inner',
        cancelButton: '.button[value="Cancel"]',
        countrySelectedInFooter:
            '.dbh-footer-country-select-selected .country-flag country-flag--au',
        navMenuBack: '.pw-nav-menu__back a[href="javascript:"]',
        countryOptions:
            '.c-country-select-dropdown__country-select-dropdown li',
        countryList:
            '.c-country-select-dropdown__country-select-dropdown li:nth-child(1) .c-country-select-dropdown__country-code',
        // countrySelectorLink: '.dbh-country-select-btn'
        signOutOptionRoi: '.pw-nav-menu__panel > .pw-list-tile:nth-child(18)',
        signInOptionRoi: '.pw-nav-menu__panel > .pw-list-tile:nth-child(14)',
        signInOptionInt: '.pw-nav-menu__panel > .pw-list-tile:nth-child(11)',
        signOutOptionInt: '.pw-nav-menu__panel > .pw-list-tile:nth-child(14)',
        signOutPocOption: '.pw-nav-menu__panel > .pw-list-tile:nth-child(18)',
        signInPocOption: '.pw-nav-menu__panel > .pw-list-tile:nth-child(14)',
        signInOptionUK:
            '.pw-nav-menu__panel > .pw-list-tile:nth-child(14)>a>div:nth-child(2)',
        countryAustralia: '.dbh-product-color-dropdown-elem [value="AU"]',
        currencyAustralia: '.t-country-select__form-currency',
        flagAustralia: '.pw-field__input > i.country-flag.country-flag--au',
        cancelBtn: '.t-country-select-modal.dbh-country-select-modal > div',
        countrySelectedFooter:
            '.dbh-footer-country-select-selected>span:nth-child(1)',
        countrySelectedFooter1:
            '.t-footer__country-select-selected.dbh-footer-country-select-selected > span:nth-child(1)',
        MyAccountInt: '.pw-nav-menu__panel > .pw-list-tile:nth-child(11)>a',
        saveForLaterHeader: '.dbh-saveforlater-header',
        miniBagHeader: '.dbh-header__cart',
        standardDelivery: '.dbh-delivery-options-wrapper a:nth-child(1)',
        nextDayClickCollectDelivery:
            '.dbh-delivery-options-wrapper a:nth-child(2)',
        internationalDelivery: '.dbh-delivery-options-wrapper a:nth-child(3)',
        heroImage: '.hp-hero-banner-a .t-home__featured-image img',
        uberComponentImage: '.pw-image__tag',
        shopNowLink: '.hp-hero-banner-a .t-home__cta-container a',
        slimBanner: '.hp-slim-banner',
        twoHeroSpotImage: '.hp-two-hero-spots',
        offerSaleBanner: '.hp-spotlight-title',
        fourHeroSpotImages: '.hp-four-hero-spots-wrapper',
        beautySpotLightContainer: '.hp-beauty-spotlight',
        financeBannerContainer: '.hp-finance-banner-image',
        termsAndConditionLink: '.hp-ts-and-cs',
        applyNowLink: '.hp-finance-banner-image .btn-round',
        cookieBanner: '.t-footer__cookie-disclaimer',
        cookieClickHereLink: '.dbh-cookie-disclaimer-link',
        manageCookieButton: '.t-footer__manage-cookie',
        acceptCookieButton: '.t-footer__accept-cookie',
        countrySelectorFlag: '.country-flag--gb',
        countryCurrency: '.t-country-select__form-currency',
        countrySelectorCancelBtn: '.dbh-country-select-modal',
        refundReturnForPayPalCustomer:
            '.dbh-delivery-options-wrapper >a:nth-child(2)',
        debenhamsLogo: 'a[title="Debenhams"]',
        deliveryOptions: '.t-home__delivery-options',
        selectedCountryName: '.c-country-select-dropdown__current-country-code',
        autoSuggestions: 'ul.pw-search__suggestion-list li',
        chanelMakeUpAdspot:
            'a[href="/content/chanel/chanel-make-up#intcmp=chanel-br-spot-make-up"]',
        chanelComplexionLink: '.u-padding-end-md ul li:nth-child(1)',
        contentPageShopMoreLink: 'a[href*="#intcmp=weddings-motb-"]',
        theEdit: 'a[href="/plp/motherofbrideedit#intcmp=weddings-motb-edit"]',
        SFLHeaderCount: '.t-header-sfl__count',
        skeletonBlock: '.pw-skeleton-text',
        loader: '.c-preloader-animation',
        flagCountrySelectedFooter:
            '.dbh-footer-country-select-selected span:nth-child(1)',
        globalNavMenuOptions: '.pw-nav-menu__panel > li',
        desktopSkelton: '.dbh-skeleton',
        autoSuggestionResult:
            '.pw-search__suggestion-list li span.suggest-category',
        autoSuggestionOption:
            '.pw-search__suggestion-list li:nth-child(1) span.suggest-category',
        autoSuggestAll:
            '.pw-search__suggestion-list li .t-search__suggestion-item .t-search__suggestion-name',
        autoSuggestSelect:
            '.pw-search__suggestion-list li:nth-child(1) .t-search__suggestion-item .t-search__suggestion-name',
        myAccountLink: '.pw-header-bar div:nth-child(4) span',
        savedItemsButton: '.pw-header-bar div:nth-child(5) span',
        myBagButton: '.dbh-header__cart',
        headerCreateAccountLink: '.pw-button--sign-in',
        totalCountryCountText:
            'p.t-footer__country-select-title.dbh-footer-country-select-title',
        welcomeToDebenhams: '[*|href="#pw-welcome"]',
        popUpCancelButton:
            'button.pw-button.c--secondary.u-width-full.t-country-select-modal',
        countrySelectorCurrency: '.t-country-select__form-currency',
        popup: 'div.pw-sheet__content .t-country-select__modal-title',
        countrySelectorLinkHeader: '.dbh-country-select-btn',
        flagCountrySelectedHeader: '.t-super-header__icon--country-select',
        countrySelectorCancelButton: '.dbh-country-select-modal',
        productsRemovalMessage:
            '#changeCountryOverlayForm .pw-feedback__content',
        searchResultHeader: '.psp-header-container p:nth-child(1)',
        searchResultHeaderSearchTerm: '.psp-header-container h1',
        verifiedByMasterCardIcon: '.t-footer__logo--mastercard-id',
        verifiedByAmexIcon: '.t-footer__logo--amex-safekey',
        comodoIcon: '.t-footer__logo--comodo-secure',
        flagCountrySelectedMenu:
            '.c-country-select-dropdown__country-select-icon',
        countryDropdown: '.dbh-country-select-btn .dbh-arrow',
        countryDropdownOption1Name:
            '.c-country-select-dropdown__country-select-dropdown li:nth-child(1) .c-country-select-dropdown__country-code',
        countryDropdownOption1Flag:
            '.c-country-select-dropdown__country-select-dropdown li:nth-child(1) .c-country-select-dropdown__country-select-icon',
        countryDropdownOption1Currency:
            '.c-country-select-dropdown__country-select-dropdown li:nth-child(1) .c-country-select-dropdown__country-currency',
        countryDropdownOption2Name:
            '.c-country-select-dropdown__country-select-dropdown li:nth-child(2) .c-country-select-dropdown__country-code',
        countryDropdownOption2Flag:
            '.c-country-select-dropdown__country-select-dropdown li:nth-child(2) .c-country-select-dropdown__country-select-icon',
        countryDropdownOption2Currency:
            '.c-country-select-dropdown__country-select-dropdown li:nth-child(2) .c-country-select-dropdown__country-currency',
        countrySelectorLinkMenuClose: '.t-navigation .pw-sheet__wrapper',
        debenhamsPromo: '.overlay-container .close-button'
    }
} else {
    selectors = {
        popUpClose: '.close',
        logoDebenhams: '.t-header__logo',
        cookiesClose: '.t-footer__accept-cookie',
        menuIcon:
            '.pw-header-bar > .pw-header-bar__actions:nth-child(1) button',
        signOutOption: '.pw-nav-menu__panel > .pw-list-tile:nth-child(20)',
        signInOption: '.pw-nav-menu__panel > .pw-list-tile:nth-child(14)',
        closeIcon: '.t-navigation__close',
        searchIcon: '.pw-button--search',
        searchField: '.dbh-search-input',
        searchApply: '.dbh-search-submit',
        searchBar: '.pw-button--search',
        exposedSearchField: '.dbh-exposed-search-box',
        exposedSearchIcon: '.dbh-exposed-search-icon',
        exposedSearchCloseIcon: '.pw-search__button-close',
        menuOptions: '.pw-nav-menu__panel',
        deliveryOptions: '.t-home__delivery-options',
        subscribeToNewsletter: '.t-footer__newsletter',
        subscribeEmail: '#field-0',
        subscribeButton: '.dbh-newsletter-form-submit',
        socialMediaSection: '.dbh-footer-social-links',
        socialMediaFacebook: '.t-footer__social-link--facebook',
        socialMediaTwitter: '.t-footer__social-link--twitter',
        socialMediaPinterest: '.t-footer__social-link--pinterest',
        socialMediaInstagram: '.t-footer__social-link--instagram',
        socialMediaYoutube: '.t-footer__social-link--youtube',
        footerMenuSection: '.dbh-footer-navigation',
        footerMenuCustomerService:
            '.dbh-footer-accordion div[role="tablist"]  div:nth-child(1) button',
        custSerSubMenuTrackOrd:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(1) li:nth-child(1) .dbh-footer-accordion-link',
        custSerSubMenuReturns:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(1) li:nth-child(2) .dbh-footer-accordion-link',
        custSerSubMenuDelivery:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(1) li:nth-child(3) .dbh-footer-accordion-link',
        custSerSubMenuMyOrder:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(1) li:nth-child(4) .dbh-footer-accordion-link',
        custSerSubMenuHelp:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(1) li:nth-child(5) .dbh-footer-accordion-link',
        custSerSubMenuGetInTouch:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(1) li:nth-child(4) .dbh-footer-accordion-link',
        footerMenuShoppingWithUs:
            '.dbh-footer-accordion div[role="tablist"]  div:nth-child(2) button',
        ShoppingWithUsSubMenuStoreFinder:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(2) li:nth-child(1) .dbh-footer-accordion-link',
        ShoppingWithUsSubMenuStoreServices:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(2) li:nth-child(2) .dbh-footer-accordion-link',
        ShoppingWithUsSubMenuBeautyClub:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(2) li:nth-child(3) .dbh-footer-accordion-link',
        ShoppingWithUsSubMenuBuyingGuides:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(2) li:nth-child(4) .dbh-footer-accordion-link',
        ShoppingWithUsSubMenuGiftcards:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(2) li:nth-child(2) .dbh-footer-accordion-link',
        ShoppingWithUsSubMenuShopByProduct:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(2) li:nth-child(6) .dbh-footer-accordion-link',
        ShoppingWithUsSubMenuPersonalShopper:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(2) li:nth-child(3) .dbh-footer-accordion-link',
        ShoppingWithUsSubMenuBookBraFit:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(2) li:nth-child(8) .dbh-footer-accordion-link',
        ShoppingWithUsSubMenuChristmas:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(2) li:nth-child(9) .dbh-footer-accordion-link',
        ShoppingWithUsSubMenuBlackFriday:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(2) li:nth-child(4) .dbh-footer-accordion-link',
        ShoppingWithUsSubMenuCyberMonday:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(2) li:nth-child(11) .dbh-footer-accordion-link',
        footerMenuAboutUs:
            '.dbh-footer-accordion div[role="tablist"]  div:nth-child(3) button',
        AboutUsSubMenuAboutDebenhams:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(3) li:nth-child(1) .dbh-footer-accordion-link',
        AboutUsSubMenuModernSlavery:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(3) li:nth-child(1) .dbh-footer-accordion-link',
        AboutUsSubMenuDebenhamsCorporate:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(3) li:nth-child(2) .dbh-footer-accordion-link',
        AboutUsSubMenuCareers:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(3) li:nth-child(3) .dbh-footer-accordion-link',
        AboutUsSubMenuDebenhamsSupports:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(3) li:nth-child(5) .dbh-footer-accordion-link',
        AboutUsSubMenuDebenhamsPress:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(3) li:nth-child(6) .dbh-footer-accordion-link',
        footerMenuMoreFromDebenhams:
            '.dbh-footer-accordion div[role="tablist"]  div:nth-child(4) button',
        MoreFromDebenhamsSubMenuDebenhamsCards:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(4) li:nth-child(1) .dbh-footer-accordion-link',
        MoreFromDebenhamsSubMenuTravelMoney:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(4) li:nth-child(2) .dbh-footer-accordion-link',
        MoreFromDebenhamsSubMenuDebenhamsInsurance:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(4) li:nth-child(3) .dbh-footer-accordion-link',
        MoreFromDebenhamsSubMenuStyleDebrief:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(4) li:nth-child(4) .dbh-footer-accordion-link',
        MoreFromDebenhamsSubMenuLetsTalk:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(4) li:nth-child(5) .dbh-footer-accordion-link',
        MoreFromDebenhamsSubMenuDebenhamsBlog:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(4) li:nth-child(4) .dbh-footer-accordion-link',
        MoreFromDebenhamsSubMenuBlowLTD:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(4) li:nth-child(7) .dbh-footer-accordion-link',
        autoSuggestions: 'ul.pw-search__suggestion-list li',
        theEdit: 'a[href="/plp/motherofbrideedit#intcmp=weddings-motb-edit"]',
        footerName: '.pw-accordion .dbh-footer-accordion-item:nth-child(1)',
        mainMenuList: 'ul.pw-nav-menu__panel li .pw-list-tile.pw--has-child',
        mainMenuOption: 'ul.pw-nav-menu__panel li:nth-child(1) .pw-list-tile',
        subMenuList: 'ul.pw-nav-menu__panel .pw-list-tile',
        subMenuOption:
            'ul.pw-nav-menu__panel li:nth-child(2) .pw-list-tile .pw-list-tile__primary',
        footerMenuList:
            '.dbh-footer-accordion .pw-accordion div:nth-child(1) div.pw-accordion__title',
        footerMenuOption:
            '.dbh-footer-accordion .pw-accordion div:nth-child(1) div.pw-accordion__title',
        footerSubMenuList:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(found) li .dbh-footer-accordion-link',
        footerSubMenuOption:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(found) li:nth-child(sonOf) .dbh-footer-accordion-link',
        debenhamsLogo: 'a[title="Debenhams"]',
        debLogo: 'a[title="Debenhams"]',
        countrySelectorLink: '.dbh-country-select-btn > div',
        chooseyourcountry:
            '.dbh-country-select-form-field-country .pw-field__label',
        countryJapan: '.dbh-product-color-dropdown-elem option[value="JP"]',
        countryFrance: '.dbh-product-color-dropdown-elem option[value="FR"]',
        countryselectorbtn: '.dbh-country-select-form-submit .pw-button__inner',
        countrySelectorpopupclose:
            '.t-country-select__modal .pw-sheet__header .pw-button',
        countrySelectorDropDown: '.country-picker-dropdown-container',
        countrySelectorUS:
            '.country-picker-dropdown-container>select>option[value="us"]',
        countrySelectorCH:
            '.dbh-product-color-dropdown-elem>option[value="CN"]',
        countrySelectorAU:
            '.dbh-product-color-dropdown-elem>option[value="AU"]',
        countrySelectorNZ:
            '.country-picker-dropdown-container>select>option[value="NZ"]',
        countrySelectorDropDown1:
            '.pw-field__input > select.dbh-product-color-dropdown-elem',
        countrySelectorUS1:
            '.dbh-product-color-dropdown-elem>option[value="US"]',
        goButton: '.dbh-country-select-form-submit> div.pw-button__inner',
        cancelButton: '.button[value="Cancel"]',
        countryAustralia: '.dbh-product-color-dropdown-elem [value="AU"]',
        countryIreland: '.dbh-product-color-dropdown-elem [value="IE"]',
        searchIcon1: '.button[id="mobileSearchRevealBt"]',
        AboutUsSubMenuDebenhamsCorporateInt:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(3) li:nth-child(1) .dbh-footer-accordion-link',
        AboutUsSubMenuCareersInt:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(3) li:nth-child(2) .dbh-footer-accordion-link',
        AboutUsSubMenuDebenhamsPressInt:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(3) li:nth-child(3) .dbh-footer-accordion-link',
        ShoppingWithUsSubMenuShopByProductInt:
            '.pw-accordion .dbh-footer-accordion-item:nth-child(2) li:nth-child(2) .dbh-footer-accordion-link',
        CancelCTA: ' .pw-search__button-close button.pw-button > div',
        countryOptions:
            '.c-country-select-dropdown__country-select-dropdown li',
        countryList:
            '.c-country-select-dropdown__country-select-dropdown li:nth-child(1) .c-country-select-dropdown__country-code',
        signOutOptionRoi: '.pw-nav-menu__panel > .pw-list-tile:nth-child(18)',
        signInOptionRoi: '.pw-nav-menu__panel > .pw-list-tile:nth-child(14)',
        signInOptionInt: '.pw-nav-menu__panel > .pw-list-tile:nth-child(11)',
        signOutOptionInt: '.pw-nav-menu__panel > .pw-list-tile:nth-child(14)',
        navMenuBack: '.pw-nav-menu__back a[href="javascript:"]',
        debTitle: '.t-header__link',
        MyAccountUK:
            '.pw-nav-menu__panel > .pw-list-tile:nth-child(14)>a>div:nth-child(2)',
        signInOptionUK:
            '.pw-nav-menu__panel > .pw-list-tile:nth-child(14)>a>div:nth-child(2)',
        saveForLaterHeader: '.dbh-saveforlater-header',
        miniBagHeader: '.dbh-header__cart',
        standardDelivery: '.t-home__delivery-options a:nth-child(1)',
        nextDayClickCollectDelivery: '.t-home__delivery-options a:nth-child(2)',
        internationalDelivery: '.t-home__delivery-options a:nth-child(3)',
        heroImage: '.hp-hero-banner-a .t-home__featured-image img',
        uberComponentImage: '.pw-image__tag',
        shopNowLink: '.hp-hero-banner-a .t-home__cta-container a',
        slimBanner: '.hp-slim-banner',
        twoHeroSpotImage: '.hp-two-hero-spots',
        offerSaleBanner: '.hp-spotlight-title',
        fourHeroSpotImages: '.hp-four-hero-spots-wrapper',
        beautySpotLightContainer: '.hp-beauty-spotlight',
        financeBannerContainer: '.hp-finance-banner-image',
        termsAndConditionLink: '.hp-ts-and-cs',
        applyNowLink: '.hp-finance-banner-image .btn-round',
        cookieBanner: '.t-footer__cookie-disclaimer',
        cookieClickHereLink: '.dbh-cookie-disclaimer-link',
        manageCookieButton: '.t-footer__manage-cookie',
        acceptCookieButton: '.t-footer__accept-cookie',
        countrySelectorFlag: '.country-flag--gb',
        countryCurrency: '.t-country-select__form-currency',
        countrySelectorCancelBtn: '.dbh-country-select-modal',
        refundReturnForPayPalCustomer:
            '.t-home__delivery-options a:nth-child(2)',
        selectedCountryName: '.c-country-select-dropdown__current-country-code',
        chanelMakeUpAdspot:
            'a[href="/content/chanel/chanel-make-up#intcmp=chanel-br-spot-make-up"]',
        chanelComplexionLink: '.u-padding-end-md ul li:nth-child(1) a',
        contentPageShopMoreLink: 'a[href*="#intcmp=weddings-motb-"]',
        pushCloseButton: '.c-push-messaging__close',
        myBagButton: '.dbh-header__cart',
        desktopSkelton: '.dbh-skeleton',
        skeletonBlock: '.pw-skeleton-text',
        loader: '.c-preloader-animation',
        flagCountrySelectedFooter:
            '.dbh-footer-country-select-selected span:nth-child(1)',
        globalNavMenuOptions: '.pw-nav-menu__panel > li',
        autoSuggestionResult:
            '.pw-search__suggestion-list li span.suggest-category',
        autoSuggestionOption:
            '.pw-search__suggestion-list li:nth-child(1) span.suggest-category',
        autoSuggestAll:
            '.pw-search__suggestion-list li .t-search__suggestion-item .t-search__suggestion-name',
        autoSuggestSelect:
            '.pw-search__suggestion-list li:nth-child(1) .t-search__suggestion-item .t-search__suggestion-name',
        myAccountLink: '.pw-header-bar div:nth-child(4) span',
        savedItemsButton: '.pw-header-bar div:nth-child(5) span',
        headerCreateAccountLink: '.pw-button--sign-in',
        verifiedByVisaIcon: '.t-footer__logo--visa-secure',
        totalCountryCountText:
            'p.t-footer__country-select-title.dbh-footer-country-select-title',
        welcomeToDebenhams: '[*|href="#pw-welcome"]',
        popUpCancelButton:
            'button.pw-button.c--secondary.u-width-full.t-country-select-modal',
        countrySelectorCurrency: '.t-country-select__form-currency',
        popup: 'div.pw-sheet__content .t-country-select__modal-title',
        countrySelectorLinkHeader: '.dbh-country-select-btn',
        flagCountrySelectedHeader: '.t-super-header__icon--country-select',
        countrySelectorCancelButton: '.dbh-country-select-modal',
        productsRemovalMessage:
            '#changeCountryOverlayForm .pw-feedback__content',
        searchResultHeader: '.psp-header-container p:nth-child(1)',
        searchResultHeaderSearchTerm: '.psp-header-container h1',
        popularSearchText: '.t-search__suggestion-item--divider',
        verifiedByMasterCardIcon: '.t-footer__logo--mastercard-id',
        verifiedByAmexIcon: '.t-footer__logo--amex-safekey',
        comodoIcon: '.t-footer__logo--comodo-secure',
        flagCountrySelectedMenu:
            '.c-country-select-dropdown__country-select-icon',
        countryDropdown: '.dbh-country-select-btn .dbh-arrow',
        countryDropdownOption1Name:
            '.c-country-select-dropdown__country-select-dropdown li:nth-child(1) .c-country-select-dropdown__country-code',
        countryDropdownOption1Flag:
            '.c-country-select-dropdown__country-select-dropdown li:nth-child(1) .c-country-select-dropdown__country-select-icon',
        countryDropdownOption1Currency:
            '.c-country-select-dropdown__country-select-dropdown li:nth-child(1) .c-country-select-dropdown__country-currency',
        countryDropdownOption2Name:
            '.c-country-select-dropdown__country-select-dropdown li:nth-child(2) .c-country-select-dropdown__country-code',
        countryDropdownOption2Flag:
            '.c-country-select-dropdown__country-select-dropdown li:nth-child(2) .c-country-select-dropdown__country-select-icon',
        countryDropdownOption2Currency:
            '.c-country-select-dropdown__country-select-dropdown li:nth-child(2) .c-country-select-dropdown__country-currency',
        countrySelectorLinkMenuClose: '.t-navigation__close',
        debenhamsPromo: '.overlay-container .close-button'
    }
}

const common = function() {
    this.selectors = selectors
}

export default common
