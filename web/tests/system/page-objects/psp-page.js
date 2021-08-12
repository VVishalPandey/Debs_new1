const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        filterOptions: '.c-product-side-filters__container > div > div',
        filterSubMenuOption:
            '.c-product-side-filters__titles:nth-child(parentPos) .t-product-list__filter-modal-items > div ',
        filterFromPrice:
            '.t-product-listing__price-range-form-desktop .t-product-listing__price-range-form-from-text-field input',
        filterToPrice:
            '.t-product-listing__price-range-form-desktop .t-product-listing__price-range-form-to-text-field input',
        filterPriceError:
            '.t-product-listing__price-range-form-desktop .pw-field__error',
        filterPriceGo: '.t-product-listing__price-range-submit',
        filteredByOptions:
            '.c-product-applied-filters__filter-block > .t-category-list',
        tcatHeaderText: 'h1.t-top-category__title',
        clearAllFiltersLink: '.c-product-applied-filters__btn-clear',
        searchPanel: '.t-product-list__filter-modal-text-filter input',
        headerText: '.dbh-psp-header h1',
        pspHeaderText: '.t-top-category__title',
        searchText: '.dbh-psp-header .u-text-align-center p:nth-child(1)',
        filterText: '.dbh-psp-header .psp-header__heading p:nth-of-type(1)',
        searchTextOnSearchPSP: '.t-search-header__search-term',
        searchSuggestText: '#app-main .t-search-header__search-suggest',
        firstProductImage: '.pw-grid__inner > .dbh-product:nth-child(1) img',
        firstProductBrand:
            '.pw-grid__inner > .dbh-product:nth-child(1) .dbh-brand-name',
        firstProductName:
            '.pw-grid__inner > .dbh-product:nth-child(1) .dbh-product-name',
        firstProductPriceNow:
            '.pw-grid__inner > .dbh-product:nth-child(1) .dbh-now',
        firstProductPrice:
            '.pw-grid__inner > .dbh-product:nth-child(1) .dbh-price',
        firstProductSaveIcon:
            '.pw-grid__inner > .dbh-product:nth-child(1) .c--save-for-later svg',
        pspBanner: '.dcf-adspot',
        tcatAdSpot1: '.dcf-adspot',
        appliedFilters: '.c-product-applied-filters__selected-item',
        firstBreadcrumb: '.t-breadcrumb__home-btn',
        secondBreadcrumb: '.t-breadcrumb > .dbh-breadcrumb-wrap:nth-child(2)',
        thirdBreadcrumb: '.t-breadcrumb > .dbh-breadcrumb-wrap:nth-child(3)',
        paginationSectionHeader: '.dbh-pagination-top',
        paginationSectionFooter: '.dbh-pagination-bottom',
        sortDropdown: '.dbh-sort',
        sortOptionNewest: '#sort option[value*="*newness"]',
        sortOptionPriceLowHigh: '#sort option[value*="*price"]',
        sortOptionPriceHighLow: '#sort option[value*="-price"]',
        sortOptionPriceDiscount:
            '#sort option[value*="-discounted_percentage"]',
        sortOptionName: '#sort option[value*="*name"]',
        sortOptionBestSelling: '#sort option[value*="product_availability"]',
        sortOptionDefault:
            '#sort option[value*="-product_availability,-units_sold,-total_review_count"]',
        sortOptionRelevanceDefault: '#sort option[value*="*Newest"]',
        sortOptionPriceLowHighAus:
            '#sort option[value*="*min_price_australia"]',
        sortOptionPriceHighLowAus:
            '#sort option[value*="-min_price_australia"]',
        sortOptionPriceHighLowIE: '#sort option[value*="-min_price"]',
        sortOptionPriceLowHighIE: '#sort option[value*="*min_price"]',
        nextButton: '.dbh-pagination-top .dbh-next',
        pageNumberText: '.dbh-pagination-top .pw-pagination__pages > button',
        totalCountOfProducts:
            '.c-product-applied-filters__product-count > span',
        previousButtonState: '.dbh-pagination-top > .dbh-previous',
        nextButtonState: '.dbh-pagination-top > .dbh-next',
        imagesOnScreen: '.dbh-product-list .dbh-image .dbh-image',
        totalBrandCount: '.dbh-product-list .dbh-brand-name',
        totalProductCount: '.dbh-product-list .dbh-product-name',
        totalSaveIconCount: '.dbh-product-list .c--save-for-later',
        productViewPerPageLink: '.dbh-product-view-per-page-link',
        filterSection: '.dbh-num-results',
        noResultsearchtext1: '.dbh-product-list p:nth-child(1)',
        noResultsearchtext2: '.dbh-product-list p:nth-child(2)',
        noResultsearchtext3: '.dbh-product-list p:nth-child(3)',
        noResultsearchtext4: '.dbh-product-list p:nth-child(4)',
        products: '.dbh-product-list .dbh-product-name',
        filterMenuList:
            '.c-product-filters [role=tablist] div:nth-child(1) div.pw-accordion__title',
        breadcrumbSection: '.t-breadcrumb',
        sortBy: '.dbh-sort',
        pagination: 'c-product-control-bar__pagination-wrapper',
        filteredBy: '.dbh-num-results .c-product-applied-filters__content',
        noResultsearchField: '.t-no-results-list__search .dbh-search-input',
        noResultsearchApply:
            '.t-no-results-list__search .pw-search__button-submit button',
        seoContent: '.dbh-seo-content',
        merchSetSection: '.dbh-featured-product-list',
        merchSetProducts: '.dbh-featured-product-list .dbh-product-tile',
        saveForLaterButton: '.dbh-product-list button.dbh-save',
        saveItemSignInPageCloseIcon: '.dbh-close-button',
        saveForLaterPopUpCloseButton: 'div.c-remove-item__header > button',
        saveItemContinueShoppingButton:
            '.dbh-country-select-modal:nth-child(2)',
        saveItemSignInRegisterButton: '.dbh-country-select-modal:nth-child(1)',
        productPriceNew: 'div.dbh-price',
        productShortDescription: 'span.dbh-product-name',
        noFilterText: '.c-product-applied-filters__filter-block',
        pspSlimbanner: '.t-product-list__slim-banner',
        pspSlimbannerLink: '.t-product-list__slim-banner>.pw-link',
        productNumber: '.u-text-quiet',
        chanelPspBanner: '.t-product-list__image-banner',
        homeBanner: 't-home__container--desktop',
        chanelContent: '.dcf-adspot',
        pspNthProductName:
            '.dbh-product-list .pw-grid__inner > div:nth-child(productNumber) .dbh-product-name',
        pspNthProductSavedElement:
            '.dbh-product-list .pw-grid__inner > div:nth-child(productNumber) button',
        pspNthProductSavedElementButton:
            '.dbh-product-list .pw-grid__inner > div:nth-child(productNumber) .c-product-item__save-button',
        saveLaterIcon: '.dbh-save',
        productName: '.dbh-product-title .dbh-product-name',
        pspHeader: '.dbh-psp-header span',
        filterTitle: '.dbh-filter-title span',
        filterMenuOption:
            '.c-product-filters [role=tablist] div:nth-child(1) div.pw-accordion__title',
        firstProductQuickShop:
            '.pw-grid__inner > .dbh-product:nth-child(1) .dbh-quickview-button',
        quickShopOverlay: '.dbh-product-details-quick-shop',
        quickShopThumbnailImages: '.dbh-thumb-btn',
        quickShopThumbnailDownCarousalArrow: '.dbh-thumb-btn-next',
        quickShopThumbnailUpCarousalArrow: '.dbh-thumb-btn-prev',
        quickShopMainImageContainer: 'img.dbh-image.pw-loaded',
        quickShopZoomImageOnHover: '.c-image-zoom',
        quickShopZoomedImagePopUp:
            '.dbh-image-viewer-container .pw-responsive-image.pw-loaded img',
        quickShopAddToBagButton: '.dbh-add-to-bag',
        quickShopViewProductPageLink: '.dbh-quick-shop div',
        quickShopSizeSwatches: '.dbh-product-size-selector .pw-swatch__item',
        quickShopQuantitySelector: '.dbh-product-quantity-selector',
        quickShopShowmoreColorsButton: '.dbh-show-more-less-options',
        quickShopShowmoreColorsText: '.t-product-details__scroller-toggle svg',
        quickShopSwatchColorSelectorOptions:
            '.dbh-product-color-selector .pw-swatch__items > div',
        quickShopColourDropDown: '.dbh-product-color-dropdown',
        quickShopMainImage: '.t-product-details__carousel-container',
        quickShopRatingSummaryInHeader: '.dbh-reviews-link',
        quickShopNothingSelectedErrorMessage:
            '.t-product-detail__variation-container .pw-field__error',
        quickShopCloseButton:
            '.dbh-product-details-quick-view-modal .dbh-close-button',
        quantityExceededMessage:
            '.error .t-product-detail__size-messaging span',
        viewBasketCheckoutButton: '.dbh-tooltip-cta .pw-button__inner',
        addToBagRemainingText: '.dbh-tooltip-message',
        stepperCount: '.pw-stepper__count input',
        stepperIncrement: '.pw--increment',
        quickShopOverlayOutsideClick: '.pw--is-visible',
        quickShopPricePerMlMg: '.u-text-size-small.u-clearfix',
        quickShopProductPrice: '.dbh-product-price',
        quickShopColourDropDownElems:
            '.dbh-product-color-dropdown-elem .c-select-menu-wrapper__menu-list > div',
        quickShopOverlayTopNotification:
            '.c-notification-manager .notification-message__span .c-notification-error__msg',
        quickShopSizeDropDown: '.dbh-product-size-dropdown',
        quickShopDeliveryCountdownTimer:
            '.dbh-product-details-quick-shop .c-countdown',
        priceFilter:
            '.c-product-filters [role=tablist] button[data-analytics-content=Price] div.pw-accordion__title',
        adspot: '.dcf-mobify-adspot a',
        saleText: 'h1 strong',
        heroBanner: '.hero-scale',
        styleDebriefHeader: '.se-head span',
        styleDebriefFilter: '.se-cat-nav',
        styleDebriefAdspotText:
            '.se-col-2_no-pad .se-col-12:nth-child(1) span.post-title',
        styleDebriefAdspotLink: '.se-col-2_no-pad .se-col-12:nth-child(1) a',
        header2: 'h2',
        articleHead: '.article-head',
        articleHeadPlpLink: '.article-head a'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        headerText: '.dbh-psp-header h1',
        chanelSeachText: '.dbh-psp-header span',
        searchText: '.dbh-psp-header .u-text-align-center p:nth-child(1)',
        filterText: '.dbh-psp-header .psp-header__heading p:nth-of-type(1)',
        firstProductImage: '.pw-grid__inner > div:nth-child(1) img',
        firstProductBrand: '.pw-grid__inner > div:nth-child(1) .dbh-brand-name',
        firstProductName:
            '.pw-grid__inner > div:nth-child(1) .dbh-product-name',
        firstProductPriceNow: '.pw-grid__inner > div:nth-child(1) .dbh-now',
        firstProductPrice: '.pw-grid__inner > div:nth-child(1) .dbh-price',
        firstProductSaveIcon:
            '.pw-grid__inner > div:nth-child(1) .c--save-for-later svg',
        filterButton: '.dbh-filter .pw-field__input',
        sortDropdown: '.dbh-sort',
        nextButton: '.dbh-next',
        pageNumberText: '.pw-pagination__pages > button',
        totalCountOfProducts: '.dbh-count',
        previousButtonState: '.pw-pagination > .pw-button:nth-child(1)',
        nextButtonState: '.pw-pagination > .pw-button:nth-child(3)',
        imagesOnScreen: '.dbh-product-list .dbh-image .dbh-image',
        totalBrandCount: '.dbh-product-list .dbh-brand-name',
        totalProductCount: '.dbh-product-list .dbh-product-name',
        totalSaveIconCount: '.dbh-product-list .c--save-for-later',
        products: '.dbh-product-name',
        totalMoreColourOptionsCount: '.c-product-item__color-badge',
        sortOptionNewest: '#sort option[value*="*newness"]',
        sortOptionPriceLowHigh: '#sort option[value*="*price"]',
        sortOptionPriceHighLow: '#sort option[value*="-price"]',
        sortOptionPriceDiscount:
            '#sort option[value*="-discounted_percentage"]',
        sortOptionName: '#sort option[value*="*name"]',
        sortOptionBestSelling: '#sort option[value*="product_availability"]',
        sortOptionDefault:
            '#sort option[value*="-product_availability,-units_sold,-total_review_count"]',
        sortOptionRelevanceDefault: '#sort option[value*="*Newest"]',
        sortOptionPriceLowHighRoi: '#sort option[value*="*min_price"]',
        sortOptionPriceHighLowRoi: '#sort option[value*="-min_price"]',
        firstBreadcrumb: '.t-breadcrumb > span:nth-child(1)',
        secondBreadcrumb: '.t-breadcrumb > .dbh-breadcrumb-wrap:nth-child(2)',
        thirdBreadcrumb: '.t-breadcrumb > .dbh-breadcrumb-wrap:nth-child(3)',
        breadcrumbSection: '.t-breadcrumb',
        closeIcon: '.pw-header-bar__actions .pw-icon-label',
        closeButton: '.pw-sheet__footer button div',
        filterTitle: '.dbh-filter-title span',
        clearAllFilter: '.dbh-clear-all div',
        filteredByText: '.t-product-list__selection > div:nth-child(1)',
        viewLesslink:
            '#accordion__content-12 > div > div > div > div:nth-child(2) > div:nth-child(389) > a',
        filterMenuList:
            '.c-product-filters [role=tablist] div:nth-child(1) div.pw-accordion__title',
        filterMenuOption:
            '.c-product-filters [role=tablist] div:nth-child(1) div.pw-accordion__title',
        filterSubMenuLinkList:
            '.c-product-filters > [role=tablist] > div:nth-child(found) a',
        filterSubMenuLinkOption:
            '.c-product-filters > [role=tablist] > div:nth-child(found) p:nth-child(sonOf) a',
        filterSubMenuViewList:
            '.c-product-filters > [role=tablist] > div:nth-child(found) .t-product-list__filter-modal-items div a',
        filterSubMenuViewListBrand:
            '.c-product-filters > [role=tablist] > div:nth-child(found) .t-product-list__filter-modal-items div a',
        filterSubMenuViewCheckboxList:
            '.c-product-filters > [role=tablist] > div:nth-child(found) .t-product-list__filter-modal-items div a',
        filterSubMenuViewOption:
            '.c-product-filters > [role=tablist] > div:nth-child(found) .t-product-list__filter-modal-items > div p:nth-child(sonOf) a',
        filterSubMenuViewOptionBrand:
            '.c-product-filters > [role=tablist] > div:nth-child(found) .t-product-list__filter-modal-items > div div:nth-child(sonOf) a',
        filterSubMenuViewCheckboxOption:
            '.c-product-filters > [role=tablist] > div:nth-child(found) .t-product-list__filter-modal-items > div div:nth-child(sonOf) a',
        filterSubMenuBrandSearchResult:
            '.c-product-filters > [role=tablist] > div:nth-child(found) .t-product-list__filter-modal-items > div div:nth-child(sonOf) .pw-field__input .dbh-brand-search',
        filterSubMenuInputList:
            '.c-product-filters > [role=tablist] > div:nth-child(found) .t-product-list__filter-modal-items > div label',
        filterSubMenuInputOption:
            '.c-product-filters > [role=tablist] > div:nth-child(found) .t-product-list__filter-modal-items > div > div:nth-child(sonOf) label',
        removeDressfilterBy: '.t-product-list__selection div:nth-child(2)',
        removeCasualfilterBy: '.t-product-list__selection div:nth-child(3)',
        searchPanel:
            '.c-product-filters > [role=tablist] div .t-product-list__filter-modal-items > div [type=text]',
        productShortDescription: 'span.dbh-product-name',
        productPrice: '.dbh-product-list div.dbh-now',
        productPriceNew: '.dbh-now span',
        saveForLaterButton: '.dbh-product-list button.dbh-save',
        saveItemSignInPageCloseIcon: '.c-save-for-later-modal .pw-button__icon',
        saveItemContinueShoppingButton:
            '.dbh-country-select-modal:nth-child(2)',
        seoContent: '.dbh-seo-content',
        merchSetSection: '.dbh-featured-product-list',
        merchSetProducts: '.dbh-featured-product-list .dbh-product-tile',
        pspNthProductName:
            '.dbh-product-list .pw-grid__inner > div:nth-child(productNumber) .dbh-product-name',
        pspNthProductSavedElement:
            '.dbh-product-list .pw-grid__inner > div:nth-child(productNumber) button',
        pspNthProductSavedElementButton:
            '.dbh-product-list .pw-grid__inner > div:nth-child(productNumber) .c-product-item__save-button',
        sortOptionPriceHighLowAus:
            '#sort option[value*="-min_price_australia"]',
        sortOptionPriceLowHighAus:
            '#sort option[value*="*min_price_australia"]',
        moreColourOptionBadging: '.dbh-color',
        // furnitureStoreLocator: '.dcf-del-banner.dcf-nodesktop a[href="/content/furniture-store-locator?jump=1"]',
        pspBadging: '.dbh-badge-text',
        plpPageImage: '.dcf.dcf-container div:nth-child(4) a',
        brandRoomHeroImage: '.dbh-brandroom a.pw-link',
        brandRoomFilterConatiner:
            '.dbh-brandroom .dbh-product-filters-container div .c-product-filters',
        brandRoomCategoryFilter:
            '.c-product-filters div[role="tablist"] #accordion__item-5 button',
        brandRoomMakeUpSelection:
            '#accordion__item-5 .t-product-list__filter-modal-items div p:nth-child(2) a',
        furnitureContentPageHeading: '.dcf-heading.dcf-nodesktop',
        furnitureStoreLocator:
            'a[href="/content/furniture-store-locator?jump=1"]',
        furnitureAdspotLink:
            'a[href="/sale/furniture/sofas-chairs#intcmp=sofas_scat_shop_our_styles"]',
        pspHeader: '.dbh-psp-header h1 span',
        tcatHeroImage: '.t-top-category__hero a',
        tcatImages: '.t-top-category__hero a img',
        tcatShopMoreLink: '.t-top-category__hero a',
        tcatAdspot: '.dcf-t-hero-links a:nth-child(1)',
        tcatfilterMenuList:
            '.t-product-list__filter-modal-wrapper .c-product-filters [role=tablist] div:nth-child(1) div.pw-accordion__title',
        tcatfilterMenuOption:
            '.t-product-list__filter-modal-wrapper .c-product-filters [role=tablist] div:nth-child(1) div.pw-accordion__title',
        filterSubMenuPrice1020Option:
            '.t-product-list__filter-modal-wrapper .c-product-filters > [role=tablist] .dbh-4  .t-product-list__filter-modal-items p:nth-child(3) a',
        galleryHeroImage:
            '.dbh-brandroom a[href="/plp/mnsp-rtywr#intcmp=mens_suits_all_partywear"]',
        galleryFilterMenu: '.dbh-product-filters-container',
        bundleCategoryFilter:
            '.t-product-list__filter-modal .c-product-filters > [role=tablist] > div:nth-child(1) .pw-accordion__title',
        bundleSuitFilterOption:
            '.t-product-list__filter-modal .c-product-filters > [role=tablist] > div:nth-child(1) p:nth-child(1) a',
        saveForLaterPopUpCloseButton: 'div.c-remove-item__header > button',
        backtoTopButton: '.t-footer-scrolltop-btn',
        tcatHeaderText: 'h1.t-top-category__title',
        categoryFilter:
            '.t-product-list__filter-modal .c-product-filters > [role=tablist] > div:nth-child(1) .pw-accordion__title',
        newArrivalsFilter:
            '.c-product-filters [role="tablist"] .t-product-list__filter-modal-item-link',
        categoriesFilter: '.dbh-2 button',
        brandFilter: '.dbh-3 button',
        priceFilter: '.dbh-4 button',
        discountFilter: '.dbh-5 button',
        headerSubText: '#app-main p',
        IRpriceFilter: '.dbh-8',
        scatfilterMenuList:
            '.pw-sheet__content .c-product-filters [role=tablist] div:nth-child(1) div.pw-accordion__title',
        scatfilterMenuOption:
            '.pw-sheet__content .c-product-filters [role=tablist] div:nth-child(1) div.pw-accordion__title',
        makeUpFilterOption:
            '.t-product-list__filter-modal .c-product-filters > [role=tablist] > div:nth-child(1) p:nth-child(1) a',
        filterSubMenuPrice2030Option:
            '.dbh-4 .t-product-list__filter-modal-items p:nth-child(3) a',
        debutFilterOption:
            '.dbh-1 [role="tabpanel"] .t-product-list__filter-modal-items div div:nth-child(3) .c-product-filter-checkbox-link',
        brandRoomFilterMenuList:
            '.pw-sheet__content .c-product-filters div[role="tablist"] .c-product-filters__titles .pw-accordion__title',
        brandRoomFilterMenuOption:
            '.pw-sheet__content .c-product-filters [role="tablist"] .c-product-filters__titles:nth-child(1) .pw-accordion__title',
        brandRoomFilterSubMenuLinkList:
            '.pw-sheet__content .c-product-filters [role="tablist"] .c-product-filters__titles:nth-child(found) a',
        brandRoomFilterSubMenuLinkOption:
            '.pw-sheet__content .c-product-filters [role="tablist"] .c-product-filters__titles:nth-child(found) p:nth-child(sonOf) a',
        productNumber: '.u-text-quiet',
        filteredByOptions:
            '.c-product-applied-filters__filter-block > .t-category-list',
        pspHeaderText: '.t-top-category__title'
    }
} else {
    selectors = {
        sortOptionDefault:
            '#sort option[value="*product_availability,-units_sold,-total_review_count"]',
        sortOptionNewest: '#sort option[value*="*newness"]',
        sortOptionPriceLowHigh: '#sort option[value*="*price"]',
        sortOptionPriceLowHighAus:
            '#sort option[value*="*min_price_australia"]',
        sortOptionPriceHighLow: '#sort option[value*="-price"]',
        sortOptionPriceHighLowAus:
            '#sort option[value*="-min_price_australia"]',
        sortOptionPriceDiscount:
            '#sort option[value*="-discounted_percentage"]',
        sortOptionName: '#sort option[value*="*name"]',
        sortOptionBestSelling: '#sort option[value*="product_availability"]',
        sortOptionRelevanceDefault: '#sort option[value*="*Newest"]',
        sortOptionPriceLowHighRoi: '#sort option[value*="*min_price"]',
        sortOptionPriceHighLowRoi: '#sort option[value*="-min_price"]',
        headerText: '.dbh-psp-header h1',
        searchText: '.dbh-psp-header .u-text-align-center p:nth-child(1)',
        filterText: '.dbh-psp-header .psp-header__heading span',
        chanelSeachText: '.dbh-psp-header span',
        sortDropdown: '#sort',
        imagesOnScreen: '.dbh-image .dbh-image',
        totalBrandCount: '.dbh-brand-name',
        totalProductCount: '.dbh-product-name',
        totalSaveIconCount: '.c--save-for-later',
        totalMoreColourOptionsCount: '.c-product-item__color-badge',
        products: '.dbh-product-name',
        pageNumberText: '.pw-pagination__page-count',
        nextButton: '.dbh-next',
        previousButton: '.dbh-previous',
        totalCountOfProducts: '.dbh-count',
        previousButtonState: '.pw-pagination > .pw-button:nth-child(1)',
        nextButtonState: '.pw-pagination > .pw-button:nth-child(3)',
        filterButton: '#filterButton',
        closeIcon: '.pw-header-bar__actions .pw-icon-label',
        closeButton: '.pw-sheet__footer button div',
        filterTitle: '.dbh-filter-title span',
        clearAllFilter: '.dbh-clear-all div',
        filteredByText: '.t-product-list__selection > div:nth-child(1)',
        firstProductImage: '.pw-grid__inner > div:nth-child(1) img',
        firstProductBrand: '.pw-grid__inner > div:nth-child(1) .dbh-brand-name',
        firstProductName:
            '.pw-grid__inner > div:nth-child(1) .dbh-product-name',
        firstProductPriceNow: '.pw-grid__inner > div:nth-child(1) .dbh-now',
        firstProductPrice: '.pw-grid__inner > div:nth-child(1) .dbh-price',
        firstProductSaveIcon:
            '.pw-grid__inner > div:nth-child(1) .c--save-for-later svg',
        searchPanel:
            '.c-product-filters > [role=tablist] div .t-product-list__filter-modal-items > div [type=text]',
        columnGridViewButton:
            '.t-product-list__view-toggle button:nth-child(2)',
        headerFilterText: '.dbh-count',
        saveItemSignInPageCloseIcon: '.c-save-for-later-modal .pw-button__icon',
        saveItemContinueShoppingButton:
            '.dbh-country-select-modal:nth-child(2)',
        firstFilter: '.dbh-0',
        newsletterTitle: '.t-footer__newsletter-title',
        pspBanner: 'div.u-text-align-center > div > div > h1',
        backtoTopButton: '.t-footer-scrolltop-btn',
        productShortDescription: 'span.dbh-product-name',
        productPrice: 'div.dbh-now',
        productPriceNew: 'div.dbh-price',
        saveForLaterButton: 'button.dbh-save',
        saveForLaterPopUpCloseButton: 'div.c-remove-item__header > button',
        continueShoppingButton: 'button.dbh-country-select-modal > div',
        moreColourOptionBadging: '.dbh-color',
        doneButton: '.t-product-list__filter-modal-footer .pw-button',
        viewLesslink:
            '#accordion__content-12 > div > div > div > div:nth-child(2) > div:nth-child(389) > a',
        filterMenuList:
            '.c-product-filters [role=tablist] div:nth-child(1) div.pw-accordion__title',
        filterMenuOption:
            '.c-product-filters [role=tablist] div:nth-child(1) div.pw-accordion__title',
        filterSubMenuLinkList:
            '.c-product-filters > [role=tablist] > div:nth-child(found) a',
        filterSubMenuLinkOption:
            '.c-product-filters > [role=tablist] > div:nth-child(found) p:nth-child(sonOf) a',
        filterSubMenuViewList:
            '.c-product-filters > [role=tablist] > div:nth-child(found) .t-product-list__filter-modal-items div a',
        filterSubMenuViewOption:
            '.c-product-filters > [role=tablist] > div:nth-child(found) .t-product-list__filter-modal-items > div p:nth-child(sonOf) a',
        filterSubMenuViewCheckboxList:
            '.c-product-filters > [role=tablist] > div:nth-child(found) .t-product-list__filter-modal-items div a',
        filterSubMenuViewCheckboxOption:
            '.c-product-filters > [role=tablist] > div:nth-child(found) .t-product-list__filter-modal-items > div div:nth-child(sonOf) a',
        filterSubMenuBrandSearchResult:
            '.c-product-filters > [role=tablist] > div:nth-child(found) .t-product-list__filter-modal-items > div div:nth-child(sonOf) .pw-field__input .dbh-brand-search',
        filterSubMenuInputList:
            '.c-product-filters > [role=tablist] > div:nth-child(found) .t-product-list__filter-modal-items > div label',
        filterSubMenuInputOption:
            '.c-product-filters > [role=tablist] > div:nth-child(found) .t-product-list__filter-modal-items > div > div:nth-child(sonOf) label',
        freeGiftBadge: '.productBadgeText',
        newArrivalsFilter:
            '.c-product-filters [role="tablist"] .t-product-list__filter-modal-item-link',
        categoriesFilter: '.dbh-2',
        brandFilter: '.dbh-3',
        priceFilter: '.dbh-4 button',
        discountFilter: '.dbh-5',
        headerSubText: '.dbh-psp-header span',
        IRpriceFilter: '.dbh-8',
        scatfilterMenuList:
            '.pw-sheet__content .c-product-filters [role=tablist] div:nth-child(1) div.pw-accordion__title',
        scatfilterMenuOption:
            '.pw-sheet__content .c-product-filters [role=tablist] div:nth-child(1) div.pw-accordion__title',
        tcatfilterMenuList:
            '.c-product-filters [role=tablist] div:nth-child(1) div.pw-accordion__title',
        tcatfilterMenuOption:
            '.c-product-filters [role=tablist] div:nth-child(1) div.pw-accordion__title',
        removeDressfilterBy: '.t-product-list__selection div:nth-child(2)',
        removeCasualfilterBy: '.t-product-list__selection div:nth-child(3)',
        seoContent: '.dbh-seo-content',
        seoPspLinks: '.dbh-seo-content .psp-links',
        seoPspLink1: '.dbh-seo-content .psp-links a:nth-child(1)',
        seoPspLink2: '.dbh-seo-content .psp-links a:nth-child(2)',
        seoPspLink3: '.dbh-seo-content .psp-links a:nth-child(3)',
        pspNthProductName:
            '.pw-grid__inner > div:nth-child(productNumber) .dbh-product-name',
        pspNthProductSavedElement:
            '.pw-grid__inner > div:nth-child(productNumber) button',
        pspNthProductSavedElementButton:
            '.pw-grid__inner > div:nth-child(productNumber) .c-product-item__save-button',
        categoryFilter:
            '.t-product-list__filter-modal .c-product-filters > [role=tablist] > div:nth-child(1) button',
        makeUpFilterOption:
            '.t-product-list__filter-modal .c-product-filters > [role=tablist] > div:nth-child(1) p:nth-child(1) a',
        pspBadging: '.dbh-badge-text',
        plpPageImage: '.dcf.dcf-container div:nth-child(4) a',
        brandRoomHeroImage: '.dbh-brandroom a.pw-link',
        brandRoomFilterConatiner:
            '.dbh-brandroom .dbh-product-filters-container div .c-product-filters',
        brandRoomCategoryFilter:
            '.c-product-filters div[role="tablist"] #accordion__item-5 button',
        brandRoomMakeUpSelection:
            '#accordion__item-5 .t-product-list__filter-modal-items div p:nth-child(2) a',
        furnitureContentPageHeading: '.dcf-heading.dcf-nodesktop',
        furnitureStoreLocator:
            'a[href="/content/furniture-store-locator?jump=1"]',
        furnitureAdspotLink:
            'a[href="/sale/furniture/sofas-chairs#intcmp=sofas_scat_shop_our_styles"]',
        pspHeader: '.dbh-psp-header h1 span',
        searchTextOnSearchPSP: '.t-search-header__search-term',
        tcatImages: '.t-top-category__category-entry',
        tcatHeroImage: '.t-top-category__hero a',
        tcatShopMoreLink: '.t-top-category__hero a.pw-link',
        tcatAdspot:
            '.t-top-category__category-entry .pw-grid .pw-grid__inner .pw-grid__span:nth-of-type(1) a.t-top-category__adspot',
        galleryHeroImage:
            '.dbh-brandroom a[href="/plp/newin-suits#intcmp=suits_new_in"]',
        galleryFilterMenu: '.dbh-product-filters-container',
        bundleCategoryFilter:
            '.t-product-list__filter-modal .c-product-filters > [role=tablist] > div:nth-child(1) .pw-accordion__title',
        bundleSuitFilterOption:
            '.t-product-list__filter-modal .c-product-filters > [role=tablist] > div:nth-child(1) p:nth-child(1) a',
        tcatHeaderText: '.t-top-category h1',
        filterSubMenuPrice2030Option:
            '.dbh-4 .t-product-list__filter-modal-items p:nth-child(3) a',
        debutFilterOption:
            '.dbh-1 [role="tabpanel"] .t-product-list__filter-modal-items div div:nth-child(3) .c-product-filter-checkbox-link',
        brandRoomFilterMenuList:
            '.pw-sheet__content .c-product-filters div[role="tablist"] .c-product-filters__titles .pw-accordion__title',
        brandRoomFilterMenuOption:
            '.pw-sheet__content .c-product-filters [role="tablist"] .c-product-filters__titles:nth-child(1) .pw-accordion__title',
        brandRoomFilterSubMenuLinkList:
            '.pw-sheet__content .c-product-filters [role="tablist"] .c-product-filters__titles:nth-child(found) a',
        brandRoomFilterSubMenuLinkOption:
            '.pw-sheet__content .c-product-filters [role="tablist"] .c-product-filters__titles:nth-child(found) p:nth-child(sonOf) a',
        productNumber: '.u-text-quiet',
        merchSetProducts: '.dbh-featured-product-list .dbh-product-tile',
        filteredByOptions:
            '.c-product-applied-filters__filter-block > .t-category-list',
        pspHeaderText: '.t-top-category__title'
    }
}

const psp = function() {
    this.selectors = selectors
}

export default psp
