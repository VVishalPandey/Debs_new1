const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        collectFromheaderText: '.t-checkout-shipping__cc h1',
        findtStoreText: '.dbh-find-address-form p',
        locateStoreField: '.dbh-store-search',
        locateStoreButton: '.dbh-store-search-btn',
        findSoreErrorMessage: '.dbh-find-address-form .pw-field__error',
        notificationErrorMessage: '.u-error-notification__content',
        locateStoreEnteredText: '.dbh-search-result-header em',
        firstStoreDetails:
            '.dbh-search-result-section > .dbh-store-block-tablet:nth-child(1) > .dbh-address button',
        firstStoreChoose:
            '.c-click-collect-map-view__choose-store-cta .dbh-store-search-btn',
        storeDetailCloseIcon: '.t-checkout-shipping__store-name a',
        storeDetailName: '.t-checkout-shipping__store-name',
        searchedStoreInfoElements: '.dbh-store-block-tablet',
        selectedStoreName: '.t-checkout-shipping__store-name',
        changeStoreLink: '.t-checkout-shipping__store-name a',
        useCurrentLocation: '.t-checkout-shipping__location',
        pudoStoreSearchResultText:
            '.c-click-collect-search-results__store-count',
        listViewOptions:
            '.c-click-collect-list-view__container button.c-click-collect-list-item-wrapper',
        mapView: '.c-click-collect-map-view__store-map',
        firstDebsStoreListView:
            '.c-click-collect-list-view__container button:nth-child(1) .c-click-collect-list-item__store-logo--debenhams',
        firstDebsStoreNameListView:
            '.c-click-collect-list-view__container button:nth-child(1) .c-click-collect-list-item__store-name',
        firstDebsStoreAddListView:
            '.c-click-collect-list-view__container button:nth-child(1) .c-click-collect-list-item__store-address',
        firstDebsStoreMilesListView:
            '.c-click-collect-list-view__container button:nth-child(1) .c-click-collect-list-item__store-distance',
        storeNameMapView: '.c-click-collect-map-view__store-name',
        storeAddMapView: '.c-click-collect-map-view__store-address',
        storeOpeningMapView:
            '.c-opening-hours__store-timings .dbh-store-opening-hours-toggle',
        storeCollectionMapView:
            '.c-click-collect-map-view__store-detail p.u-text-weight-bold',
        storePriceMapView: '.c-click-collect-map-view__collection-price',
        selectStoreButton:
            '.c-click-collect-map-view__choose-store-cta .dbh-store-search-btn',
        hermesParcelShopListView:
            '.c-click-collect-list-item__store-logo--hermes',
        selectedStoreSelectButton:
            '.c-click-collect-map-view__choose-store-cta .dbh-store-search-btn'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        collectFromheaderText: '.t-checkout-shipping__cc h1',
        findtStoreText: '.dbh-find-address-form p',
        locateStoreField: '.dbh-store-search',
        locateStoreButton: '.dbh-store-search-btn',
        findSoreErrorMessage: '.dbh-find-address-form .pw-field__error',
        notificationErrorMessage: '.u-error-notification__content',
        locateStoreEnteredText: '.dbh-search-txt em',
        firstStoreDetails:
            '.dbh-search-result-section > .dbh-store-block-tablet:nth-child(1) > .dbh-address button',
        firstStoreChoose:
            '.c-click-collect-list-view__container button:nth-child(1) .pw-button--select-store',
        storeDetailCloseIcon:
            '.dbh-store-header .t-checkout-shipping__cc-close-btn',
        storeDetailName: '.dbh-store-header h2',
        searchedStoreInfoElements: '.dbh-store-block-tablet',
        selectedStoreName: '.t-checkout-shipping__store-name',
        changeStoreLink:
            '.dbh-delivery-confirmation .t-checkout-shipping__delivery-status-button',
        useCurrentLocation: '.t-checkout-shipping__location',
        pudoStoreSearchResultText:
            '.c-click-collect-search-results__store-count',
        listView:
            '.c-click-collect-search-results__container li:nth-child(1) a',
        mapView: '.c-click-collect-search-results__container li:nth-child(2) a',
        listViewOptions:
            '.c-click-collect-list-view__container button.c-click-collect-list-item-wrapper',
        firstDebsStoreListView:
            '.c-click-collect-list-view__container button:nth-child(1) .c-click-collect-list-item__store-logo--debenhams',
        firstDebsStoreNameListView:
            '.c-click-collect-list-view__container button:nth-child(1) .c-click-collect-list-item__store-name',
        firstDebsStoreDelTimeListView:
            '.c-click-collect-list-view__container button:nth-child(1) .c-click-collect-list-item__collection-info-wrapper',
        firstDebsStoreMilesListView:
            '.c-click-collect-list-view__container button:nth-child(1) .c-click-collect-list-item__store-distance',
        firstDebsStorePriceListView:
            '.c-click-collect-list-view__container button:nth-child(1) .c-click-collect-list-item__collection-price',
        firstDebsStoreStoreOpeningListView:
            '.c-click-collect-list-view__container button:nth-child(1) .c-click-collect-list-item__cta .pw-link--map-opening-hours',
        firstDebsStoreSelectStoreButtonListView:
            '.c-click-collect-list-view__container button:nth-child(1) .pw-button--select-store',
        storeNameMapView: '.c-click-collect-map-view__store-name',
        storeAddMapView: '.c-click-collect-map-view__store-address',
        storeOpeningMapView: '.dbh-show-more-less-options',
        storeCollectionMapView:
            '.c-click-collect-map-view__store-detail p.u-text-weight-bold',
        storePriceMapView: '.c-click-collect-map-view__collection-price',
        selectStoreButtonMapView: '.dbh-store-search-btn',
        hermesParcelShopListView:
            '.c-click-collect-list-item__store-logo--hermes',
        showMoreShopLink:
            '.c-click-collect-list-view__show-more-less-options.dbh-show-more-less-options',
        collapsedListView: '.c-click-collect-list-view--collapsed',
        expandedListView: '.c-click-collect-list-view',
        selectStoreButton:
            '.c-click-collect-map-view__choose-store-cta .dbh-store-search-btn',
        selectedStoreSelectButton:
            '.c-click-collect-list-view__container button .c-click-collect-list-item--active .pw-button--select-store'
    }
} else {
    selectors = {
        headerText: '.t-checkout-shipping__cc h1',
        findtStoreText: '.t-checkout-shipping__cc--pudo p',
        locateStoreField: '.dbh-store-search',
        locateStoreButton: '.dbh-store-search-btn',
        locateStoreFieldError: '.pw-field__error',
        errorMessage: '.u-error-notification__content',
        closeErrorNotification: '.c-notification button',
        locateStoreEnteredText: '.dbh-search-txt em',
        searchedStoreInfoElements: '.dbh-store-block',
        firstStoreDetails:
            '.dbh-store-block:nth-child(1) .t-checkout-shipping__cc-store-res-left button',
        firstStoreChoose:
            '.c-click-collect-list-view__container button:nth-child(1) .pw-button--select-store',
        storeDetailCloseIcon: '.t-checkout-shipping__cc-close-btn',
        storeDetailName: 'h2',
        useCurrentLocation: '.t-checkout-shipping__location',
        pudoStoreSearchResultText:
            '.c-click-collect-search-results__store-count',
        listView:
            '.c-click-collect-search-results__container li:nth-child(1) a',
        listViewOptions:
            '.c-click-collect-list-view__container button.c-click-collect-list-item-wrapper',
        mapView: '.c-click-collect-search-results__container li:nth-child(2) a',
        firstDebsStoreListView:
            '.c-click-collect-list-view__container button:nth-child(1) .c-click-collect-list-item__store-logo--debenhams',
        firstDebsStoreNameListView:
            '.c-click-collect-list-view__container button:nth-child(1) .c-click-collect-list-item__store-name',
        firstDebsStoreDelTimeListView:
            '.c-click-collect-list-view__container button:nth-child(1) .c-click-collect-list-item__collection-info-wrapper',
        firstDebsStoreMilesListView:
            '.c-click-collect-list-view__container button:nth-child(1) .c-click-collect-list-item__store-distance',
        firstDebsStorePriceListView:
            '.c-click-collect-list-view__container button:nth-child(1) .c-click-collect-list-item__collection-price',
        firstDebsStoreStoreOpeningListView:
            '.c-click-collect-list-view__container button:nth-child(1) .c-click-collect-list-item__cta .pw-link--map-opening-hours',
        firstDebsStoreSelectStoreButtonListView:
            '.c-click-collect-list-view__container button:nth-child(1) .pw-button--select-store',
        storeNameMapView: '.c-click-collect-map-view__store-name',
        storeAddMapView: '.c-click-collect-map-view__store-address',
        storeOpeningMapView: '.dbh-show-more-less-options',
        storeCollectionMapView:
            '.c-click-collect-map-view__store-detail p.u-text-weight-bold',
        storePriceMapView: '.c-click-collect-map-view__collection-price',
        selectStoreButtonMapView: '.dbh-store-search-btn',
        hermesParcelShopListView:
            '.c-click-collect-list-item__store-logo--hermes',
        showMoreShopLink:
            '.c-click-collect-list-view__show-more-less-options.dbh-show-more-less-options',
        collapsedListView: '.c-click-collect-list-view--collapsed',
        expandedListView: '.c-click-collect-list-view',
        selectStoreButton:
            '.c-click-collect-map-view__choose-store-cta .dbh-store-search-btn',
        collectFromheaderText: '.t-checkout-shipping__cc h1',
        selectedStoreSelectButton:
            '.c-click-collect-list-view__container button .c-click-collect-list-item--active .pw-button--select-store'
    }
}

const locate = function() {
    this.selectors = selectors
}

export default locate
