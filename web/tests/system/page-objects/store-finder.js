const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        headerText: '.t-store-finder__title',
        storeFinderField: '.dbh-store-search',
        storeFinderButton: '.dbh-store-search-btn div',
        storeFinderFieldError: '.pw-field__error',
        errorMessage: '.pw-field__error',
        invalidPostcode: '.u-display-inline .c-notification-error__msg',
        closeErrorNotification: '.c-notification button',
        storeFindtext: '.dbh-search-txt .u-text-weight-bold',
        storeFinderEnteredText: '.dbh-search-txt em',
        searchedStoreInfoElements: '.dbh-store-block',
        firstStoreDetails:
            '.dbh-store-block:nth-child(1) .t-store-finder__store-res-left span:nth-child(1)',
        firstStoreChoose: '.dbh-store-block:nth-child(1) > button',
        storeDetailName: 'h2',
        mapImage: '#map-canvas',
        furnitureSLDescription: '.dbh-description',
        backButton: '.t-store-finder__back-button',
        tab1:
            '.dbh-tabs > .pw-tabs__strip-container > .pw-tabs__strip > .pw-tabs__tab:nth-child(1)',
        tab2:
            '.dbh-tabs > .pw-tabs__strip-container > .pw-tabs__strip > .pw-tabs__tab:nth-child(2)'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        headerText: '.t-store-finder__title',
        storeFinderField: '.dbh-store-search',
        storeFinderButton: '.dbh-store-search-btn div',
        storeFinderFieldError: '.pw-field__error',
        errorMessage: '.u-error-notification__content',
        closeErrorNotification: '.c-notification button',
        storeFinderEnteredText: '.dbh-search-txt em',
        searchedStoreInfoElements: '.dbh-store-block',
        firstStoreDetails:
            '.dbh-store-block:nth-child(1) .t-store-finder__store-res-left span:nth-child(1)',
        firstStoreChoose: '.dbh-store-block:nth-child(1) > button',
        storeDetailName: 'h2',
        mapImage: '#map-canvas',
        storeMenuList:
            '.t-store-finder__accordion div button.pw-accordion__header',
        storeMenuOption:
            '.t-store-finder__accordion div:nth-child(1) button.pw-accordion__header'
    }
} else {
    selectors = {
        headerText: '.t-store-finder__title',
        storeFinderField: '.dbh-store-search',
        storeFinderButton: '.dbh-store-search-btn div',
        storeFinderFieldError: '.pw-field__error',
        errorMessage: '.u-error-notification__content',
        closeErrorNotification: '.c-notification button',
        storeFinderEnteredText: '.dbh-search-txt em',
        searchedStoreInfoElements: '.dbh-store-block',
        firstStoreDetails:
            '.dbh-store-block:nth-child(1) .t-store-finder__store-res-left span:nth-child(1)',
        firstStoreChoose: '.dbh-store-block:nth-child(1) > button',
        storeDetailName: 'h2',
        mapImage: '#map-canvas',
        backResultLink: '',
        getDirectionLink: '',
        storeMenuList:
            '.t-store-finder__accordion div button.pw-accordion__header',
        storeMenuOption:
            '.t-store-finder__accordion div:nth-child(1) button.pw-accordion__header'
    }
}

const storeFinder = function() {
    this.selectors = selectors
}

export default storeFinder
