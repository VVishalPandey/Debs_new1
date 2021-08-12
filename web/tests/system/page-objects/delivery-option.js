const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        deliveryOptionheaderText:
            '.t-checkout-shipping__steps > .dbh-delivery-options:nth-child(1) h1',
        homeDeliveryOption: '.dbh-delivery-option-home-delivery',
        clickCollectOption:
            '.t-checkout-shipping__steps > .dbh-delivery-options:nth-child(1) .dbh-options > li:nth-child(2) > .dbh-option',
        homeDeliveryHeaderText:
            '.dbh-delivery-option-home-delivery .dbh-info-header',
        clickCollectHeaderText:
            '.t-checkout-shipping__steps > .dbh-delivery-options:nth-child(1) .dbh-options > li:nth-child(2) .dbh-info-header',
        homeDeliveryText: '.dbh-delivery-option-home-delivery .dbh-info-desc',
        clickCollectText1:
            '.t-checkout-shipping__steps > .dbh-delivery-options:nth-child(1) .dbh-options > li:nth-child(2) .dbh-option-info > div:nth-child(2) .dbh-info-desc',
        clickCollectText2:
            '.t-checkout-shipping__steps > .dbh-delivery-options:nth-child(1) .dbh-options > li:nth-child(2) .dbh-option-info > div:nth-child(3) .dbh-info-desc',
        deliveryTypeheaderText:
            '.t-checkout-shipping__steps > .dbh-delivery-options:nth-child(3) h1',
        nextNominatedOptionUk: '.dbh-delivery-option-delivery-day-evening',
        nextNominatedOption: '.dbh-delivery-option-delivery-fast',
        standardOption: '.dbh-delivery-option-delivery-standard',
        nextNominatedOptionHeaderTextUk:
            '.dbh-delivery-option-delivery-day-evening .dbh-info-header',
        nextNominatedOptionTextUk:
            '.dbh-delivery-option-delivery-day-evening .dbh-info-desc',
        nextNominatedOptionHeaderText:
            '.dbh-delivery-option-delivery-fast .dbh-info-header',
        nextNominatedOptionText:
            '.dbh-delivery-option-delivery-fast .dbh-info-desc',
        standardOptionHeaderText:
            '.dbh-delivery-option-delivery-standard .delivery-option__info h3',
        standardOptionText:
            '.dbh-delivery-option-delivery-standard .delivery-option__info div:nth-child(2)',
        nextNominatedSectionHeaderText:
            '.t-checkout-shipping__delivery-slot-list .dbh-title',
        daytimeTab: '.pw-tabs__strip li:nth-child(1)',
        eveningTab: '.pw-tabs__strip li:nth-child(2)',
        daytimeTabText: '.dbh-day-tab .t-checkout-shipping__tab-title',
        eveningTabText: '.pw-tabs__strip li:nth-child(2) p:nth-child(1)',
        daytimeOptions: '.dbh-day-time li',
        eveningOptions: '.dbh-evening-time li',
        deliveryMessage: '.dbh-delivery-confirmation .dbh-title',
        proceedPaymentButton: '.dbh-proceed-to-payment span',
        newaddressLink: '.dbh-newAddressRadio',
        logoDebenhamsDeliveryPage: '.t-checkout-header__bar button',
        internationalDeliveryHeader: '.dbh-shipping-form h1',
        headerText: '.t-checkout-shipping__title h1',
        deliveryTypeheaderTextInt: '.dbh-delivery-options h1',
        clickCollectOptionDisabled:
            '.dbh-delivery-option-click-collect.disabled',
        collectionConfirmationTitle:
            '.c-click-collect-delivery-confirmation__store-details-header',
        collectionConfirmationMap:
            '.c-click-collect-delivery-confirmation__store-map .c-click-collect-store-map',
        collectionConfirmationMapHermesIcon:
            '.c-click-collect-map-view__store-map img[src*="/gm-hermes-icon.svg?0a2ae399"]',
        collectionConfirmationStoreName:
            '.c-click-collect-delivery-confirmation__store-name',
        collectionConfirmationStoreMiles:
            '.c-click-collect-delivery-confirmation__store-distance',
        collectionConfirmationStoreAddress:
            '.c-click-collect-delivery-confirmation__store-address',
        collectionConfirmationStoreTelephone:
            '.c-click-collect-delivery-confirmation__store-telephone',
        collectionConfirmationStoreOpeningHours:
            '.dbh-store-opening-hours-toggle',
        collectionConfirmationStoreChangeStoreCTA:
            '.c-click-collect-delivery-confirmation__change-store-cta',
        collectionConfirmationStoreCollectionLocation:
            '.c-click-collect-delivery-confirmation__collection-location',
        collectionConfirmationMapDebsIcon:
            '.c-click-collect-map-view__store-map img[src*="/gm-deb-icon.svg?f6afcd5f"]',
        pudoCollectionConfirmationOptionsTitle:
            '.c-delivery-confirmation__collection-info-title',
        pudoStandardRadioButton:
            '.c-delivery-confirmation__collection-details-container input[value="19505"]',
        pudoExpressRadioButton:
            '.c-delivery-confirmation__collection-details-container input[value="19504"]',
        pudoDeliveryConfirmationMsg:
            '.c-delivery-confirmation__delivery-confirmation-html--parcel-shop',
        disclaimerMsg: '.dbh-disclaimer',
        debsDeliveryConfirmationMsg:
            '.c-delivery-confirmation__delivery-confirmation-html',
        savedAddressOption:
            '.c-address-selector .t-billing-address-form-container',
        checkoutNominatedModal: '.evening-tab__disabled',
        checkoutNominatedMsg: '.t-checkout-shipping__tab-sub-title',
        dayTimeButton: '.dbh-button'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        deliveryOptionheaderText:
            '.t-checkout-shipping__steps > .dbh-delivery-options:nth-child(1) h1',
        deliveryTypeheaderText:
            '.t-checkout-shipping__steps > .dbh-delivery-options:nth-child(3) h1',
        nextNominatedSectionHeaderText:
            '.t-checkout-shipping__delivery-slot-list .dbh-title',
        homeDeliveryOption: '.dbh-delivery-option-home-delivery',
        clickCollectOption:
            '.t-checkout-shipping__steps > .dbh-delivery-options:nth-child(1) .dbh-options > li:nth-child(2) > .dbh-option',
        homeDeliveryHeaderText:
            '.dbh-delivery-option-home-delivery .dbh-info-header',
        clickCollectHeaderText:
            '.t-checkout-shipping__steps > .dbh-delivery-options:nth-child(1) .dbh-options > li:nth-child(2) .dbh-info-header',
        homeDeliveryText: '.dbh-delivery-option-home-delivery .dbh-info-desc',
        clickCollectText1:
            '.t-checkout-shipping__steps > .dbh-delivery-options:nth-child(1) .dbh-options > li:nth-child(2) .dbh-option-info > div:nth-child(2) .dbh-info-desc',
        clickCollectText2:
            '.t-checkout-shipping__steps > .dbh-delivery-options:nth-child(1) .dbh-options > li:nth-child(2) .dbh-option-info > div:nth-child(3) .dbh-info-desc',
        nextNominatedOptionUk: '.dbh-delivery-option-delivery-day-evening',
        nextNominatedOption: '.dbh-delivery-option-delivery-fast',
        standardOption: '.dbh-delivery-option-delivery-standard',
        nextNominatedOptionHeaderTextUk:
            '.dbh-delivery-option-delivery-day-evening .dbh-info-header',
        nextNominatedOptionTextUk:
            '.dbh-delivery-option-delivery-day-evening .dbh-info-desc',
        nextNominatedOptionHeaderText:
            '.dbh-delivery-option-delivery-fast .dbh-info-header',
        nextNominatedOptionText:
            '.dbh-delivery-option-delivery-fast .dbh-info-desc',
        standardOptionHeaderText:
            '.dbh-delivery-option-delivery-standard .delivery-option__info h3',
        standardOptionText:
            '.dbh-delivery-option-delivery-standard .delivery-option__info div:nth-child(2)',
        daytimeTab: '.pw-tabs__strip li:nth-child(1)',
        eveningTab: '.pw-tabs__strip li:nth-child(2)',
        daytimeTabText: '.pw-tabs__strip li:nth-child(1) p:nth-child(1)',
        eveningTabText: '.pw-tabs__strip li:nth-child(2) p:nth-child(1)',
        daytimeOptions: '.dbh-day-time li',
        eveningOptions: '.dbh-evening-time li',
        deliveryMessage: '.dbh-delivery-confirmation .dbh-title',
        proceedPaymentButton: '.dbh-proceed-to-payment span',
        headerText: '.t-checkout-shipping__title h1',
        useThisAddressButton: '.dbh-use-address',
        internationalOption:
            '.t-checkout-shipping__delivery-options li:nth-child(1)',
        internationalOptionText:
            '.t-checkout-shipping__delivery-options li:nth-child(1) .delivery-option__info div:nth-child(2)',
        internationalOptionHeaderText:
            '.t-checkout-shipping__delivery-options li:nth-child(1) .delivery-option__info h3',
        deliveryTypeheaderTextInt: '.dbh-delivery-options h1',
        changeDeliveryMethodLink:
            '.t-checkout-shipping__steps .dbh-delivery-options:nth-child(1) li:nth-child(2)',
        selectedDeliveryMethod:
            '.t-checkout-shipping__steps .dbh-delivery-options:nth-child(1) li:nth-child(1) .dbh-option-info h3',
        disabledDeliveryType:
            '.t-checkout-shipping__steps div:nth-child(1) .c-disabled h3',
        disabledDeliveryOption:
            '.t-checkout-shipping__steps div:nth-child(3) .c-disabled h3',
        clickCollectOptionDisabled:
            '.dbh-delivery-option-click-collect.disabled',
        collectionConfirmationTitle:
            '.c-click-collect-delivery-confirmation__store-details-header',
        collectionConfirmationMap:
            '.c-click-collect-delivery-confirmation__store-map .c-click-collect-store-map',
        collectionConfirmationMapHermesIcon:
            '.c-click-collect-map-view__store-map img[src*="/gm-hermes-icon.svg?0a2ae399"]',
        collectionConfirmationStoreName:
            '.c-click-collect-delivery-confirmation__store-name',
        collectionConfirmationStoreMiles:
            '.c-click-collect-delivery-confirmation__store-distance',
        collectionConfirmationStoreAddress:
            '.c-click-collect-delivery-confirmation__store-address',
        collectionConfirmationStoreTelephone:
            '.c-click-collect-delivery-confirmation__store-telephone',
        collectionConfirmationStoreOpeningHours:
            '.dbh-store-opening-hours-toggle',
        collectionConfirmationStoreChangeStoreCTA:
            '.c-click-collect-delivery-confirmation__change-store-cta',
        collectionConfirmationStoreCollectionLocation:
            '.c-click-collect-delivery-confirmation__collection-location',
        collectionConfirmationMapDebsIcon:
            '.c-click-collect-map-view__store-map img[src*="/gm-deb-icon.svg?f6afcd5f"]',
        pudoCollectionConfirmationOptionsTitle:
            '.c-delivery-confirmation__collection-info-title',
        pudoStandardRadioButton:
            '.c-delivery-confirmation__collection-details-container input[value="19505"]',
        pudoExpressRadioButton:
            '.c-delivery-confirmation__collection-details-container input[value="19504"]',
        pudoDeliveryConfirmationMsg:
            '.c-delivery-confirmation__delivery-confirmation-html--parcel-shop',
        disclaimerMsg: '.dbh-disclaimer',
        debsDeliveryConfirmationMsg:
            '.c-delivery-confirmation__delivery-confirmation-html',
        savedAddressOption:
            '.c-address-selector .t-billing-address-form__selector',
        logoDebenhamsDeliveryPage: '.t-checkout-header__bar button',
        newaddressLink: '.dbh-newAddressRadio',
        checkoutNominatedModal: '.evening-tab__disabled',
        checkoutNominatedMsg: '.t-checkout-shipping__tab-sub-title',
        dayTimeButton: '.dbh-button'
    }
} else {
    selectors = {
        headerText: '.t-checkout-shipping__title h1',
        homeDeliveryOption: '.dbh-delivery-option-home-delivery',
        clickCollectOption: 'button.dbh-delivery-option-click-collect',
        homeDeliveryText: '.dbh-delivery-option-home-delivery .dbh-info-desc',
        clickCollectText1:
            '.u-padding-start-lg li:nth-child(2) div div.delivery-option__info div:nth-child(2) p',
        clickCollectText2:
            '.u-padding-start-lg li:nth-child(2) div div.delivery-option__info div:nth-child(3) p',
        homeDeliveryCTA: '.dbh-delivery-option-home-delivery .dbh-info-header',
        clickCollectCTA: '.dbh-delivery-option-click-collect .dbh-info-header',
        returnShoppingBag:
            '.t-checkout-shipping__delivery-options li:nth-child(2) p:nth-child(2) a',
        returnShoppingBag4mNominatedDay:
            '.t-checkout-shipping__delivery-options li:nth-child(1) .delivery-option__info div:nth-child(2) a',
        nextNominatedOptionUk: '.dbh-delivery-option-delivery-day-evening',
        nextNominatedOption: '.dbh-delivery-option-delivery-fast',
        standardOption: '.dbh-delivery-option-delivery-standard',
        internationalOption:
            '.t-checkout-shipping__delivery-options li:nth-child(1) button',
        nextNominatedOptionTextUk:
            '.dbh-delivery-option-delivery-day-evening .dbh-info-desc',
        nextNominatedOptionText:
            '.dbh-delivery-option-delivery-fast .dbh-info-desc',
        standardOptionText:
            '.dbh-delivery-option-delivery-standard .delivery-option__info div:nth-child(2)',
        internationalOptionText:
            '.t-checkout-shipping__delivery-options li:nth-child(1) .delivery-option__info div:nth-child(2)',
        nextNominatedOptionHeaderText:
            '.dbh-delivery-option-delivery-fast .dbh-info-header',
        standardOptionHeaderText:
            '.dbh-delivery-option-delivery-standard .delivery-option__info h3',
        internationalOptionHeaderText:
            '.t-checkout-shipping__delivery-options li:nth-child(1) .delivery-option__info h3',
        daytimeTab:
            '.t-checkout-shipping__delivery-slot-list .pw-tabs__strip li:nth-child(1)',
        eveningTab:
            '.t-checkout-shipping__delivery-slot-list .pw-tabs__strip li:nth-child(2)',
        daytimeTabText: '.pw-tabs__strip li:nth-child(1) p:nth-child(1)',
        eveningTabText: '.pw-tabs__strip li:nth-child(2) p:nth-child(1)',
        daytimeOptions: '.dbh-day-time li',
        eveningOptions: '.dbh-evening-time li',
        deliveryMessage: '.dbh-title',
        proceedPaymentButton: '.dbh-proceed-to-payment span',
        useThisAddressButton: '.dbh-use-address',
        deliveryTypeheaderTextInt: '.dbh-delivery-options h1',
        headerTextUk: '.dbh-delivery-options h1',
        checkoutDeliveryStandardOption:
            '.dbh-home-delivery-tab .dbh-options li:nth-child(2)',
        checkoutDeliveryNominatedOption:
            '.dbh-home-delivery-tab .dbh-options li:nth-child(1)',
        checkoutNominatedModal: '.evening-tab__disabled',
        checkoutNominatedMsg: '.t-checkout-shipping__tab-sub-title',
        checkoutConfirmDeliveryDateButton: '.dbh-store-search-btn',
        changeDeliveryMethodLink:
            '.t-checkout-shipping__delivery-status li:nth-child(1) .dbh-change button',
        selectedDeliveryMethod:
            '.t-checkout-shipping__delivery-status li:nth-child(1) .dbh-description',
        changeDeliveryOptionLink:
            '.t-checkout-shipping__delivery-status li:nth-child(3) .dbh-change button',
        disabledOption: '.c-disabled h3',
        deliveryOptionheaderText: '.dbh-delivery-options .pw-grid__span h1',
        logoDebenhamsDeliveryPage: '.t-checkout-header__bar button',
        clickCollectOptionDisabled:
            '.dbh-delivery-option-click-collect.disabled',
        collectionConfirmationTitle:
            '.c-click-collect-delivery-confirmation__store-details-header',
        collectionConfirmationMap: '.c-click-collect-map-view__store-map',
        collectionConfirmationMapHermesIcon:
            '.c-click-collect-map-view__store-map img[src*="/gm-hermes-icon.svg?0a2ae399"]',
        collectionConfirmationStoreName:
            '.c-click-collect-delivery-confirmation__store-name',
        collectionConfirmationStoreMiles:
            '.c-click-collect-delivery-confirmation__store-distance',
        collectionConfirmationStoreAddress:
            '.c-click-collect-delivery-confirmation__store-address',
        collectionConfirmationStoreTelephone:
            '.c-click-collect-store-details__store-telephone',
        collectionConfirmationStoreMapOpeningHoursCTA:
            '.c-click-collect-delivery-confirmation__map-opening-hours-cta',
        collectionConfirmationStoreMapOpeningHoursCloseCTA:
            '.c-click-collect-store-details__cc-close-btn',
        collectionConfirmationStoreOpeningHours:
            '.dbh-store-opening-hours-toggle',
        collectionConfirmationStoreChangeStoreCTA:
            '.c-click-collect-delivery-confirmation__change-store-cta',
        collectionConfirmationStoreCollectionLocation:
            '.c-click-collect-store-details__collection-location',
        collectionConfirmationMapDebsIcon:
            '.c-click-collect-map-view__store-map img[src*="/gm-deb-icon.svg?f6afcd5f"]',
        pudoCollectionConfirmationOptionsTitle:
            '.c-delivery-confirmation__collection-info-title',
        pudoStandardRadioButton:
            '.c-delivery-confirmation__collection-details-container input[value="19505"]',
        pudoExpressRadioButton:
            '.c-delivery-confirmation__collection-details-container input[value="19504"]',
        pudoDeliveryConfirmationMsg:
            '.c-delivery-confirmation__delivery-confirmation-html--parcel-shop',
        disclaimerMsg: '.dbh-disclaimer',
        debsDeliveryConfirmationMsg:
            '.c-delivery-confirmation__delivery-confirmation-html',
        savedAddressOption:
            '.c-address-selector .t-billing-address-form__selector',
        newaddressLink: '.dbh-newAddressRadio',
        dayTimeButton: '.dbh-button',
        nextNominatedSectionHeaderText:
            '.t-checkout-shipping__delivery-slot-list .dbh-title'
    }
}

const deliveryOption = function() {
    this.selectors = selectors
}

export default deliveryOption
