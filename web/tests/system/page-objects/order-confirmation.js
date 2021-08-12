const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        webLoyaltyPopUp: '#WLbanner_1475488343',
        webLoyaltySection: '#WLS_desktopBanner',
        // webLoyaltyPopUpCloseIcon: '#WLbanner_1475488343 a',
        orderNumber: '.dbh-order-number',
        orderConfirmationTitle: '.t-checkout-confirmation__splash-title',
        orderConfirmationStoreName: '.c-confirmation-collection-details__name',
        orderConfirmationStoreAdd:
            '.c-confirmation-collection-details__address',
        orderConfirmationStoreCollectionLocation:
            '.c-confirmation-collection-details__contact',
        orderConfirmationStoreOpeningHours: '.dbh-store-opening-hours-toggle',
        orderConfirmationMapView: '.c-click-collect-store-map',
        orderConfirmationMapViewDebsLogo:
            '.c-click-collect-map-view__store-map img[src*="/gm-deb-icon.svg?f6afcd5f"]',
        orderConfirmationMapViewHermesLogo:
            '.c-click-collect-map-view__store-map img[src*="/gm-hermes-icon.svg?0a2ae399"]',
        orderConfirmationMapViewCollectionMsg:
            '.c-confirmation-collection-details__map .dbh-collection-additional-info',
        orderConfirmationDeliveryType:
            '.t-checkout-confirmation__price-summary .price-rows:nth-child(2) span:nth-child(1)',
        orderConfirmationDeliveryPrice:
            '.t-checkout-confirmation__price-summary .price-rows:nth-child(2) span:nth-child(3)',
        orderConfirmationDeliveryLeadTime: '.dbh-delivery-lead-time',
        webLoyaltyPopUpCloseIcon: '[href="javascript:void(0);"]',
        deliveryTypeText:
            '.t-checkout-confirmation__price-summary div .price-rows:nth-child(2) span:nth-child(1)',
        cardTypeHeaderText: '.t-checkout-confirmation__prices h4',
        cardNumberMasked: '.t-checkout-confirmation__credit p:nth-child(1)'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        webLoyaltyPopUp: '#WLbanner_1475488343',
        webLoyaltySection: '.t-webloyalty-inner',
        // webLoyaltyPopUpCloseIcon: '#WLbanner_1475488343 a',
        orderNumber: '.dbh-order-number',
        orderConfirmationTitle: '.t-checkout-confirmation__splash-title',
        orderConfirmationStoreName: '.c-confirmation-collection-details__name',
        orderConfirmationStoreAdd:
            '.c-confirmation-collection-details__address',
        orderConfirmationStoreCollectionLocation:
            '.c-confirmation-collection-details__contact',
        orderConfirmationStoreOpeningHours: '.dbh-store-opening-hours-toggle',
        orderConfirmationMapView: '.c-click-collect-store-map',
        orderConfirmationMapViewDebsLogo:
            '.c-click-collect-map-view__store-map img[src*="/gm-deb-icon.svg?f6afcd5f"]',
        orderConfirmationMapViewHermesLogo:
            '.c-click-collect-map-view__store-map img[src*="/gm-hermes-icon.svg?0a2ae399"]',
        orderConfirmationMapViewCollectionMsg:
            '.c-confirmation-collection-details__map .dbh-collection-additional-info',
        orderConfirmationDeliveryType:
            '.t-checkout-confirmation__price-summary .price-rows:nth-child(2) span:nth-child(1)',
        orderConfirmationDeliveryPrice:
            '.t-checkout-confirmation__price-summary .price-rows:nth-child(2) span:nth-child(3)',
        orderConfirmationDeliveryLeadTime: '.dbh-delivery-lead-time',
        webLoyaltyPopUpCloseIcon: '[href="javascript:void(0);"]',
        deliveryTypeText:
            '.t-checkout-confirmation__delivery-columns .t-checkout-confirmation__delivery-sub-sections:nth-child(3) p:nth-child(2)',
        cardTypeHeaderText: '.t-checkout-confirmation__prices h4',
        cardNumberMasked: '.t-checkout-confirmation__credit p:nth-child(1)'
    }
} else {
    selectors = {
        webLoyaltyPopUp: '#WLbanner_1475488343',
        webLoyaltySection: '.t-webloyalty-inner',
        // webLoyaltyPopUpCloseIcon: '#WLbanner_1475488343 a',
        orderNumber: '.dbh-order-number',
        orderConfirmationTitle: '.t-checkout-confirmation__splash-title',
        orderConfirmationStoreName: '.c-confirmation-collection-details__name',
        orderConfirmationStoreAdd:
            '.c-confirmation-collection-details__address',
        orderConfirmationStoreCollectionLocation:
            '.c-confirmation-collection-details__contact',
        orderConfirmationStoreOpeningHours: '.dbh-store-opening-hours-toggle',
        orderConfirmationMapView: '.c-click-collect-store-map',
        orderConfirmationMapViewDebsLogo:
            '.c-click-collect-map-view__store-map img[src*="/gm-deb-icon.svg?f6afcd5f"]',
        orderConfirmationMapViewHermesLogo:
            '.c-click-collect-map-view__store-map img[src*="/gm-hermes-icon.svg?0a2ae399"]',
        orderConfirmationMapViewCollectionMsg:
            '.c-confirmation-collection-details__map .dbh-collection-additional-info',
        orderConfirmationDeliveryType:
            '.t-checkout-confirmation__price-summary .price-rows:nth-child(2) span:nth-child(1)',
        orderConfirmationDeliveryPrice:
            '.t-checkout-confirmation__price-summary .price-rows:nth-child(2) span:nth-child(3)',
        orderConfirmationDeliveryLeadTime: '.dbh-delivery-lead-time',
        webLoyaltyPopUpCloseIcon: '[href="javascript:void(0);"]',
        deliveryTypeText:
            '.t-checkout-confirmation__delivery-columns .t-checkout-confirmation__delivery-sub-sections:nth-child(3) p:nth-child(2)',
        cardTypeHeaderText: '.t-checkout-confirmation__prices h4',
        cardNumberMasked: '.t-checkout-confirmation__credit p:nth-child(1)'
    }
}

const orderConfirmation = function() {
    this.selectors = selectors
}

export default orderConfirmation
