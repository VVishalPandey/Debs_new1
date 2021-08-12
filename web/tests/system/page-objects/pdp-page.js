const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        allSizeElements: '.pw-swatch__items >div',
        sizeDropdownOptionElements:
            '.dbh-product-size-dropdown-selector-elem .c-select-menu-wrapper__menu-list > div',
        firstBreadcrumb: '.t-breadcrumb > span > a:nth-child(1)',
        secondBreadcrumb: '.t-breadcrumb > div:nth-child(2) a',
        thirdBreadcrumb: '.t-breadcrumb > div:nth-child(3) a',
        forthBreadcrumb: '.t-breadcrumb > div:nth-child(4) a',
        fifthBreadcrumb: '.t-breadcrumb > div:nth-child(5) a',
        breadcrumbSection: '.t-breadcrumb',
        shopMoreText: '.dbh-shop-more-tags-title',
        shopMoreTag1Text: '.dbh-shop-more-tags-list > li:nth-child(1) > a',
        shopMoreTag2Text: '.dbh-shop-more-tags-list > li:nth-child(2) > a',
        shopMoreTag3Text: '.dbh-shop-more-tags-list > li:nth-child(3) > a',
        productName: '.dbh-product-title',
        productBrandName: '.dbh-brand-name',
        productPrdName: '.dbh-product-title .dbh-product-name',
        productPrice: '.dbh-product-price',
        brandName: '.dbh-product-title span:nth-of-type(1)',
        saveForLaterButton: 'button.dbh-save',
        sizeSwatches: '.dbh-product-size-selector .pw-swatch__item',
        promoPDPLink: '.t-product-details__promo-link',
        nonReturnableeSpot: '.returns-espot',
        nonReturnableeSpotTitle: '.returns-espot .text > h2',
        showmoreColorsButton: '.dbh-show-more-less-options',
        showmoreColorsText: '.t-product-details__scroller-toggle svg',
        eSpotPDP: '.t-product-details__espots--shadow',
        eSpotTitlePDP: '.t-product-details__espots--shadow > h2',
        saveForLaterPopUpCloseButton: 'div.c-remove-item__header > button',
        continueShoppingButton: 'button.dbh-country-select-modal > div',
        creditCardValuePoints: '.dbh-mastercard div:nth-child(2) a',
        beautyClubValuePoints: 'li.dbh-beautyclub > div.u-padding-start-md > a',
        nothingSelectedErrorMessage:
            '.t-product-detail__variation-container .pw-field__error',
        recentlyViewedText: '.dbh-recently-viewed .dbh-heading',
        recentlyViewed: '.dbh-recently-viewed',
        recentlyViewedProduct1: '.t-product-detail__recently-viewed-item',
        recentlyViewedTextRoi:
            '.t-product-detail__recently-viewed legend:nth-child(1)>span',
        recentlyViewedRoi: '.t-product-detail__recently-viewed',
        financeBanner: '.deb-pdp-espots-finance',
        financeBannerApply: '.deb-pdp-espots-finance a',
        pdpBanner: '.dbh-pdp-banner',
        customerPhotosContainer: '.fm-carousel',
        noCustomerPhotosContainer: '.fm-carousel .bv-hidden',
        thumbnailImages: '.dbh-thumb-btn',
        thumbnailDownCarousalArrow: '.dbh-thumb-btn-next',
        thumbnailUpCarousalArrow: '.dbh-thumb-btn-prev',
        mainImageContainer: 'img.dbh-image.pw-loaded',
        zoomImageOnHover: '.c-image-zoom',
        zoomedImagePopUp:
            '.dbh-image-viewer-container .pw-responsive-image.pw-loaded img',
        closeIconOnzoomedImagePopUp: '.dbh-image-viewer-close',
        pddpColourSwatches:
            '.dbh-product-color-selector .pw-swatch__items .pw-swatch__item',
        productDescriptionLink: '.dbh-description-link',
        outOfStockColourSwatch: '.pw-swatch__item--oos',
        addToBagTooltip: '.addtobag-tooltip .dbh-tooltip-message',
        productSizeMessage: '.t-product-detail__item-size-messaging',
        prodDescSection: '.dbh-description .t-product-details__description',
        prodDescHeaderText:
            '.dbh-description .t-product-details__description .t-product-details__description--heading',
        prodDescItemNumber: '.product-item-number .item-number-value',
        prodGuideLink: '.dbh-description .product-guide-link',
        customerWhoAlsoBoughtContainer:
            '.dbh-related-products-bought-together .dbh-baynote',
        customerWhoAlsoBoughtHeader:
            '.dbh-related-products-bought-together .dbh-heading',
        customerWhoAlsoBoughtPrd1:
            '.dbh-related-products-bought-together .pw--active .dbh-baynote-item:nth-child(1)',
        dropdownOption:
            '.dbh-product-size-dropdown .c-select-menu-wrapper__menu-list > div',
        stepperCount: '.pw-stepper__count input',
        stepperDecrement: '.pw--decrement',
        addToBagButton: '.dbh-add-to-bag',
        viewBasketCheckoutButton: '.dbh-tooltip-cta .pw-button__inner',
        swatchSizeSelectorOptions:
            '.dbh-product-size-selector .pw-swatch__items > div',
        dropdownRangePriceOption:
            '.c-select-menu-wrapper__menu-list > div:nth-child(elem) .c-select-menu-wrapper__stock-price',
        dropdownRangePriceOptionCount:
            '.c-select-menu-wrapper__menu-list > div',
        swatchColorSelectorOptions:
            '.dbh-product-color-selector .pw-swatch__items > div',
        deliveryUrgencyDay: '.c-countdown .u-text-weight-bold',
        deliveryUrgencyTime: '.c-countdown div:nth-child(3)',
        nextDayUrgentDelMsg:
            '.dbh-item-delivery .delivery-options .home_delivery .nextday',
        clickCollectUrgencyTime:
            '.dbh-item-delivery .delivery-options .click_collect .click_and_collect',
        deliveryAndReturnsOptions: '.dbh-item-delivery',
        deliveryReturnDetails: '.returns-espot',
        deliveryDetails: '.dbh-item-delivery .delivery-options',
        cCDeliveryMoreInfoLink:
            '.dbh-item-delivery .delivery-options .delivery-option.collect .delivery-option-more-info a',
        returnMessage: '.returns-espot .deb-pdp-espots .deb-vmore',
        itemNo: '.t-product-details-heading span:nth-of-type(1)',
        orderSwatchesLink:
            '.t-product-details__content form div:nth-child(3) button.pw-button.u-margin-top-md',
        selectedFabricColor:
            '.c-furniture-selection:nth-child(1) span:nth-child(1)',
        selectedFeetColor:
            '.c-furniture-selection:nth-child(2) span:nth-child(1)',
        changeSelectedFabric:
            '.c-furniture-selection:nth-child(1) span:nth-child(2)',
        changeSelectedFeet:
            '.c-furniture-selection:nth-child(2) span:nth-child(2)',
        feetColorListFurniture: '.pw-grid__inner > div',
        fabricColorListFurniture:
            '.pw-grid__inner > div:nth-child(1) .pw-grid__inner > div',
        orderSwatchConfirmSection: '.dbh-swatch-confirm',
        activeTab:
            '.t-product-details__tabs-furniture .pw-tabs__tab.pw--is-active',
        fabricTabHeadings: '.t-fabric-heading',
        feetOptions:
            '.t-product-details-feet .t-product-details__furniture-chip',
        orderSwatchConfirmText: '.dbh-swatch-confirm > p:nth-child(2)',
        orderSwatchConfirmDeliveryText: '.dbh-swatch-confirm > p:nth-child(3)',
        orderSwatchConfirmContinueButton: '.dbh-swatch-confirm button',
        colorListHeaderText: '.pw-sheet__header .pw-header-bar__title',
        colorListClose: '.pw-sheet__header button',
        orderSwatchFirstOption:
            '.dbh-tablet-swatch-selection .dbh-swatch-selection-cnt:nth-child(1) .t-product-details__furniture-chip',
        orderSwatchesButton: '.dbh-swatch-form-submit',
        noSwatchSelectedError: '.c-notification-manager > .c-notification',
        orderSwatchFirstName: '[name=firstName]',
        orderSwatchLastName: '[name=lastName]',
        orderSwatchEmail: '[name=email]',
        orderSwatchHouseNo: '[name=houseNo]',
        orderSwatchAddressLine1: '[name=addressLine1]',
        orderSwatchAddressLine2: '[name=addressLine2]',
        orderSwatchCity: '[name=city]',
        orderSwatchPostcode: '[name=zipcode]',
        addToBagRemainingText: '.dbh-tooltip-message',
        deliveryOptionSection: '.dbh-item-delivery',
        homeDeliveryOption:
            '.dbh-item-delivery .delivery-options .home_delivery',
        homeDeliveryOptionHeader: '.home_delivery .standard b',
        homeDeliveryFistSubOption: '.home_delivery .standard b',
        homeDeliverySecondSubOption: '.home_delivery .nextday b',
        disabledHomeDeliverySecondSubOption:
            '.t-delivery-options__disable-option .nextday',
        homeDeliveryThirdSubOption: '.home_delivery .nominatedday b',
        disabledHomeDeliveryThirdSubOption:
            '.t-delivery-options__disable-option .nominatedday',
        homeDeliveryMoreInfoLink: '.home_delivery a',
        clickAndCollectDeliveryOption: '.click_collect .click_and_collect',
        disabledClickAndCollectDeliveryOption:
            '.click_collect .t-delivery-options__disable-option',
        clickAndCollectDeliveryOptionHeader:
            '.click_collect .click_and_collect b',
        clickAndCollectFistSubOption: '.delivery-sub-option.click_and_collect',
        clickAndCollectMoreInfoLink: '.click_collect a',
        internationalDeliveryOption:
            '.international_delivery .international_del',
        disabledInternationalDeliveryOption:
            '.international_delivery .t-delivery-options__disable-option',
        internationalDeliveryOptionHeader:
            '.international_delivery .international_del b',
        internationalDeliveryMoreInfoLink: '.international_delivery a',
        madeToOrderDeliveryOption: '.delivery-option.mto',
        madeToOrderDeliveryOptionHeader: '.mto .header > h3',
        madeToOrderDeliveryMoreInfoLink: '.mto .delivery-option-more-info>a',
        deliveryAndAssemblyDeliveryOption: '.delivery-option.whiteglove',
        deliveryAndAssemblyDeliveryOptionHeader: '.whiteglove .header > h3',
        deliveryAndAssemblyDeliveryMoreInfoLink:
            '.whiteglove .delivery-option-more-info>a',
        noDeliveryOptionsAvailableINT: '.no-avail-delivery-opts>p',
        deliveryOptionInternational: '.delivery-option.international',
        deliveryOptionInternationalFistSubOption:
            '.international .delivery-sub-option:nth-child(4)>.delivery-sub-option-name>b',
        deliveryOptionInternationalSecondSubOption:
            '.international .delivery-sub-option:nth-child(5)>.delivery-sub-option-name>b',
        deliveryOptionInternationalMoreInfoLink:
            '.international .delivery-option-more-info>a',
        returnseSpotINT: '.returns-espot',
        imageCarsoul: '.dbh-thumb-btn-next',
        videoThumbnail:
            '.dbh-video-thumb .t-product-details__video-play-button-text',
        videoViewer: '#vjs_video_3',
        rewardclubPointsRoi: '.dbh-card-points a',
        rewarclubIconRoi: 'ul.dbh-card-points>li>div:nth-child(1)>svg',
        pricePermlRoi: '.u-text-size-small.u-clearfix',
        colourSwatches: '.dbh-product-color-selector .pw-swatch__items',
        nonReturnableEspot: '.returns-espot',
        customerPhoto: '.bv-carousel-theme-social',
        pdpMainImage: '.t-product-details__carousel-container',
        pdpthumbnailVerticalImages: '.t-product-details__thumbs',
        bundleVerticalProductSection:
            '.t-product-details__main-wrapper>div:nth-child(2)',
        sizeSelectorForBundle: '.pw-field.pw--has-select',
        addToBagListFirstProd:
            '.c-bundle-products--bottom>div:nth-of-type(1) .c-bundle-product__stepper-btn',
        addToBagListSecondProd:
            '.c-bundle-products--bottom>div:nth-of-type(2) .c-bundle-product__stepper-btn',
        bundleHorizontalProductSection: '.c-bundle-products--bottom',
        addToBagGridFirstProd:
            '.c-bundle-products--bottom>div:nth-child(1)>div>div:nth-child(2)>button',
        addToBagGridSecondProd:
            '.c-bundle-products--bottom>div:nth-child(2)>div>div:nth-child(2)>button',
        addToBagGridThirdProd:
            '.c-bundle-products--bottom>div:nth-child(3)>div>div:nth-child(2)>button',
        chanelPDPBreadcrumb: '.dbh-breadcrumb-span',
        chanelColourDropDown: '.c-select-menu-wrapper__indicators',
        chanelReturnMessage: '#ad_Standard_Return_Policy',
        lowStockColourSwatch: '.c-select-menu-wrapper__stock-message--low',
        chanelHeader: '.dbh-chanel-header',
        chanelBeautyBreadcrumb: '.t-breadcrumb .dbh-breadcrumb-wrap span a',
        colourDropDown: '.dbh-product-color-dropdown',
        pdpImageSection: '.dbh-carousel',
        chanelReturnEspot: '.t-delivery-options',
        stepperIncrement: '.pw--increment',
        baynoteYMAL:
            '.t-product-detail__related-products--multi-carousels .dbh-baynote .dbh-heading span',
        baynoteYMALProducts:
            '.t-product-detail__related-products--multi-carousels .t-product-detail__fieldset .pw-carousel__item.pw--active .dbh-baynote-item .t-related-products__item-image',
        select1YMALProduct:
            '.t-product-detail__related-products--multi-carousels .t-product-detail__fieldset .pw-carousel__item.pw--active .dbh-baynote-item a:nth-child(1)',
        YMAlNextButton:
            '.t-product-detail__related-products--multi-carousels .pw-carousel__controls .pw-carousel__next button',
        YMAlPreviousButton:
            '.t-product-detail__related-products--multi-carousels .pw-carousel__controls .pw-carousel__previous button',
        roundRobin: '.dbh-round-robin legend span',
        roundRobinCarousal:
            '.dbh-round-robin .dbh-carousel .pw--active .dbh-carousel-item .t-related-products__item-image',
        selectroundRobin1Carousal:
            '.dbh-round-robin .dbh-carousel .pw--active .dbh-carousel-item .t-related-products__item-image:nth-child(1)',
        crossSell: '.dbh-cross-sell legend span',
        crossSellCarousal:
            '.dbh-cross-sell .dbh-carousel .pw--active .dbh-carousel-item .t-related-products__item-image',
        addToBagFromRoundRobinContainer:
            '.t-related-products__carousel-item--round-robin-desktop .t-related-products__item:nth-child(1) .pw-button__inner',
        addToBagFromCrossSellContainer:
            '.dbh-cross-sell .dbh-carousel .pw--active .dbh-carousel-item div:nth-child(1) button',
        addToCartButtonDisplayFinal:
            '.dbh-mini-bag-icon span.t-header__button-icon-count',
        selectTheSizedropDown:
            '.dbh-round-robin .dbh-carousel .pw--active .dbh-carousel-item .t-related-products__item:nth-child(1) select option',
        sizeAsDropdown:
            '.dbh-product-size-dropdown .c-select-menu-wrapper__value-container',
        pdpImageToZoom: '.dbh-carousel .pw--active .dbh-image-viewer-btn',
        pdpZoomedImage: '.dbh-image-viewer-carousel .pw--active img',
        pdpCloseZoom: '.dbh-image-viewer-close',
        sizeGuideLink:
            '.t-product-detail__variation-container .t-product-detail__espot-h',
        deliveryReturnText: '.dbh-item-delivery .delivery-text-header',
        deliveryReturnHomeDelivery:
            '.dbh-item-delivery .delivery-options .home_delivery',
        deliveryReturnClickCollect:
            '.dbh-item-delivery .delivery-options .click_collect',
        deliveryReturnIntDelivery:
            '.dbh-item-delivery .delivery-options .international_delivery',
        saveLaterIcon: '.dbh-save',
        weeeSection: '.dbh-item-espot-g2',
        weeeFullForm: '.dbh-item-espot-g2 .deb-vmore p:nth-child(1)',
        weeeFindOutMoreLink: '.dbh-item-espot-g2 a',
        reviewSection: '.dbh-reviews',
        reviewHeaderText: '.dbh-reviews .review-text-header',
        reviewSorting: '.bv-dropdown-target',
        reviewWrite: '.bv-write-review-container .bv-write-review',
        reviewBeFirstToReview:
            '.bv-content-list-container .bv-write-review-label',
        miniBagButton: '.qa-header__cart',
        selectSizeswatch:
            '.t-product-detail__size .pw-swatch__items .pw-swatch__item',
        roundRobinSection: '.dbh-round-robin',
        roundRobinHeaderText: '.dbh-round-robin .dbh-heading',
        baynoteHeaderText: '.dbh-baynote .dbh-heading',
        baynoteProducts: '.dbh-baynote .pw--active .dbh-carousel-item',
        ratingSummaryInHeader: '.dbh-reviews-link',
        colorScroller: '#color-scroller',
        colorSwatchHeader: '.dbh-product-color-selector .u-text-weight-bold',
        pdpSelectedSwatch:
            '.t-product-details__color-selector .pw-swatch__item.pw--selected .pw-swatch__chip',
        disabledClickCollectUrgencyTime:
            '.dbh-item-delivery .delivery-options .click_collect .t-delivery-options__disable-option',
        homeDeliveryOptionFurniture: '.delivery-option.home',
        furnitureHomeDeliveryFistSubOption: '.home b',
        furnitureHomeDeliveryMoreInfoLink: '.home .delivery-option-more-info a',
        chanelBrandName: '.t-product-details-heading__title--chanel-title',
        pdpMainHeroImage: '.dbh-image img',
        pdbThumbImage: '.dbh-thumb-img img',
        baynoteCWMABSection:
            '.t-product-details__content .t-related-products__carousel .pw-carousel__item.pw--active',
        baynoteYMALFirstImage:
            '.t-product-detail__related-products--multi-carousels .t-product-detail__fieldset .pw-carousel__item.pw--active .dbh-baynote-item:nth-child(1) img',
        baynoteCWMABFirstImage:
            '.t-product-details__content .t-related-products__carousel .pw-carousel__item.pw--active .dbh-baynote-item:nth-child(1) img',
        baynoteSection: '.dbh-product-detail__related-products .dbh-baynote',
        YMAlPips:
            '.dbh-product-detail__related-products .dbh-baynote .pw-carousel__pips',
        firstProductQuickShop:
            '.dbh-product-detail__related-products .pw--active .dbh-baynote-item:nth-child(1) .dbh-quickview-button',
        quickShopOverlay: '.dbh-product-details-quick-shop',
        quickShopThumbnailImages: '.dbh-thumb-btn',
        quickShopThumbnailDownCarousalArrow: '.dbh-thumb-btn-next',
        quickShopThumbnailUpCarousalArrow: '.dbh-thumb-btn-prev',
        quickShopMainImageContainer: 'img.dbh-image.pw-loaded',
        quickShopZoomImageOnHover: '.c-image-zoom',
        quickShopZoomedImagePopUp:
            '.dbh-image-viewer-container .pw-responsive-image.pw-loaded img',
        quickShopAddToBagButton:
            '.dbh-product-details-quick-shop .dbh-add-to-bag',
        quickShopViewProductPageLink: '.dbh-quick-shop div',
        quickShopSizeSwatches: '.dbh-product-size-selector .pw-swatch__item',
        quickShopQuantitySelector: '.dbh-product-quantity-selector',
        quickShopShowmoreColorsButton: '.dbh-show-more-less-options',
        quickShopShowmoreColorsText: '.t-product-details__scroller-toggle svg',
        quickShopSwatchColorSelectorOptions:
            '.dbh-product-details-quick-shop .dbh-product-color-selector .pw-swatch__items > div',
        quickShopColourDropDown: '.dbh-product-color-dropdown',
        quickShopMainImage: '.t-product-details__carousel-container',
        quickShopRatingSummaryInHeader: '.dbh-reviews-link',
        quickShopNothingSelectedErrorMessage:
            '.t-product-detail__variation-container .pw-field__error',
        quickShopCloseButton:
            '.dbh-product-details-quick-view-modal .dbh-close-button',
        quantityExceededMessage:
            '.error .t-product-detail__size-messaging span',
        quickShopOverlayOutsideClick: '.pw--is-visible',
        quickShopPricePerMlMg: '.u-text-size-small.u-clearfix',
        quickShopProductPrice: '.dbh-product-price',
        quickShopColourDropDownElems:
            '.dbh-product-color-dropdown-elem .c-select-menu-wrapper__menu-list > div',
        quickShopOverlayTopNotification:
            '.c-notification-manager .notification-message__span .c-notification-error__msg',
        quickShopSizeDropDown: '.dbh-product-size-dropdown',
        quickShopSaveIcon: '.dbh-product-details-quick-shop .dbh-save',
        quickShopShopMoreText:
            '.dbh-product-details-quick-shop .dbh-shop-more-tags-title',
        quickShopRecentlyViewed:
            '.dbh-product-details-quick-shop .dbh-recently-viewed',
        quickShopProdDescSection:
            '.dbh-product-details-quick-shop .dbh-description .t-product-details__description',
        quickShopDeliveryUrgencyDay:
            '.dbh-product-details-quick-shop .c-countdown span:nth-of-type(1)',
        quickShopBeautyClubValuePoints:
            '.dbh-product-details-quick-shop li.dbh-beautyclub > div.u-padding-start-md > a',
        firstProductImage:
            '.t-product-detail__related-products--multi-carousels .t-product-detail__fieldset .pw-carousel__item.pw--active .dbh-baynote-item:nth-child(1) img',
        firstProductCustomerBoughtImage:
            '.dbh-related-products-bought-together .pw--active .dbh-baynote-item:nth-child(1) img',
        quickShopProductTitle:
            '.dbh-product-details-quick-shop .dbh-product-title',
        quickShopSizeAsDropDown:
            '.dbh-product-details-quick-shop .dbh-product-size-dropdown .dbh-product-size-dropdown-selector-elem',
        quickShopSwatchSizeSelectorOptions:
            '.dbh-product-details-quick-shop .dbh-product-size-selector .pw-swatch__items > div',
        quickShopDropdownRangePriceOption:
            '.dbh-product-details-quick-shop .c-select-menu-wrapper__menu-list > div:nth-child(elem) .c-select-menu-wrapper__stock-price',
        quickShopDropdownRangePriceOptionCount:
            '.dbh-product-details-quick-shop .c-select-menu-wrapper__menu-list > div',
        quickShopDropdownOption:
            '.dbh-product-details-quick-shop .dbh-product-size-dropdown .c-select-menu-wrapper__menu-list > div',
        quickShopFirstProductCustomerBoughtSection:
            '.dbh-related-products-bought-together .pw--active .dbh-baynote-item:nth-child(1) .dbh-quickview-button',
        videoComponent: '.dbh-carousel video',
        seeMoreInfoLinkROI: '.deb-vmore :nth-child(2)',
        seeMoreInfoLink:
            '.t-delivery-options__returns .t-delivery-option__view-more',
        returnsSectionFAQ: '#questions h1',
        sizeGudeCloseWindow: '#size_guide a[title="Close Window"]',
        brandAtoZlist: '.letter-group ul li',
        chanelPdpTitle:
            '.t-product-details--chanel .t-product-details-heading__title--chanel-title',
        chanelAddToBagCta: '.pw-button.t-product-details__add-to-cart',
        chanelSflButton: '.c--save-for-later.chanel.saved .pw-button__inner',
        saveForLaterButtonChanel: 'button.dbh-save.chanel',
        pudoClickAndCollectOption: '.click_collect',
        pudoClickAndCollectOptionHeading: '.click_collect h4',
        pudoClickAndCollectDebsOption:
            '.click_collect .delivery-sub-option.cc_debs .t-delivery-options-info',
        pudoClickAndCollectDebsOptionPrice:
            '.click_collect .delivery-sub-option.cc_debs .t-delivery-options-price',
        pudoClickAndCollectDebsOptionDisabled:
            '.click_collect .cc_debs.t-delivery-options__disable-option',
        pudoClickAndCollectStandardParcelOption:
            '.click_collect .delivery-sub-option.cc_parcel_standard .t-delivery-options-info',
        pudoClickAndCollectStandardParcelOptionDisabled:
            '.click_collect .cc_parcel_standard.t-delivery-options__disable-option',
        pudoClickAndCollectStandardParcelOptionPrice:
            '.click_collect .delivery-sub-option.cc_parcel_standard .t-delivery-options-price',
        pudoClickAndCollectExpressParcelOption:
            '.click_collect .delivery-sub-option.cc_parcel_express .t-delivery-options-info',
        pudoClickAndCollectExpressParcelOptionDisabled:
            '.click_collect .cc_parcel_express.t-delivery-options__disable-option',
        pudoClickAndCollectExpressParcelOptionPrice:
            '.click_collect .delivery-sub-option.cc_parcel_express .t-delivery-options-price',
        pudoMoreInfoClickAndCollectLink:
            '.click_collect .t-delivery-option__view-more',
        pudoNonReturnMessaging: '.espot-container.t-delivery-options__returns',
        pudoMadeToOrderDeliveryOption: '.made_to_order',
        pudoMadeToOrderDeliveryOptionHeader: '.made_to_order h4',
        pudoMadeToOrderDeliveryMoreInfoLink:
            '.made_to_order .t-delivery-option__view-more',
        pudoDeliveryAndAssemblyDeliveryOption:
            '.t-delivery-option__returns--other-info',
        pudoDeliveryAndAssemblyDeliveryOptionHeader:
            '.t-delivery-option__returns--other-info h4',
        pudoDeliveryAndAssemblyDeliveryMoreInfoLink:
            '.t-delivery-option__returns--other-info .t-delivery-option__view-more',
        nternationalDeliveryMoreInfoLink: '.international_delivery a'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        shopMoreText: '.dbh-shop-more-tags-title',
        shopMoreTag1Text: '.dbh-shop-more-tags-list > li:nth-child(1) > a',
        shopMoreTag2Text: '.dbh-shop-more-tags-list > li:nth-child(2) > a',
        shopMoreTag3Text: '.dbh-shop-more-tags-list > li:nth-child(3) > a',
        productName: '.dbh-product-title',
        productPrice: '.dbh-product-price',
        addToBagButton: '.dbh-add-to-bag',
        viewBasketCheckoutButton: '.dbh-tooltip-cta',
        addToBagProductName: '.pw-sheet__header h3',
        addToBagRemainingText: '.dbh-tooltip-message',
        recentlyViewedText:
            '.dbh-recently-viewed-section .dbh-recently-viewed-title',
        recentlyViewed: '.dbh-recently-viewed-section',
        recentlyViewedProduct1: '.t-product-detail__recently-viewed-item',
        ratingSummaryInHeader: '.dbh-reviews-link',
        reviewSection: '.dbh-reviews',
        reviewHeaderText: '.dbh-reviews .review-text-header',
        reviewSorting: '.bv-dropdown-target',
        reviewWrite: '.bv-write-review-container .bv-write-review',
        productDescriptionLink: '.dbh-description-link',
        pdpImageSection: '.dbh-carousel',
        pdpImageToZoom: '.dbh-carousel .pw--active .dbh-image-viewer-btn',
        pdpZoomedImage: '.dbh-image-viewer-carousel .pw--active img',
        pdpCloseZoom: '.dbh-image-viewer-close',
        financeBanner: '.deb-pdp-espots-finance',
        financeBannerApply: '.deb-pdp-espots-finance a',
        pddpColourSwatches:
            '.dbh-product-color-selector .pw-swatch__items .pw-swatch__item',
        selectColourSwatch:
            '.dbh-product-color-selector .pw-swatch__items .pw-swatch__item button',
        selectSizeswatch: '.pw-swatch__items',
        sizeGuideLink:
            '.t-product-detail__variation-container .t-product-detail__espot-h',
        sizeGuideHref:
            'div.pw-dangerous-html > div.t-product-detail__espot-h > a',
        baynoteSection: '.dbh-baynote',
        roundRobinSection: '.dbh-round-robin',
        roundRobinHeaderText: '.dbh-round-robin .dbh-heading',
        baynoteHeaderText: '.dbh-baynote .dbh-heading',
        baynoteProducts: '.dbh-baynote-item',
        addToBagFromRoundRobinContainer:
            '.dbh-round-robin-scroller .pw-scroller__content > div:nth-child(1) button',
        allSizeElements: '.pw-swatch__items > div',
        sizeSwatches: '.dbh-product-size-selector .pw-swatch__item',
        outOfStockColourSwatch: '.pw-swatch__item--oos',
        saveForLaterButton: 'button.dbh-save',
        saveForLaterButtonRoi: 'button.t-product-detail__save-button.chanel',
        saveForLaterPopUpCloseButton: 'div.c-remove-item__header > button',
        continueShoppingButton: 'button.dbh-country-select-modal > div',
        creditCardValuePoints: '.dbh-mastercard div:nth-child(2) a',
        beautyClubValuePoints: 'li.dbh-beautyclub > div.u-padding-start-md > a',
        nothingSelectedErrorMessage:
            '.t-product-detail__variation-container .pw-field__error',
        sizeDropDown: 'div.pw-field-row > div > div > div.pw-field__input',
        beautyColourSwatches: '.dbh-color-swatch',
        // beautyClubMessage: 'li.dbh-beautyclub > div.u-padding-start-md > a',
        pricePerml: 'span.u-text-size-small',
        deliveryAndReturnsOptions: '.dbh-item-delivery',
        deliveryReturnDetails: '.returns-espot',
        deliveryDetails: '.dbh-item-delivery .delivery-options',
        homeDeliveryMoreInfoLink: '.home_delivery a',
        cCDeliveryMoreInfoLink: '.click_collect a',
        returnMessage: '.returns-espot .deb-pdp-espots .deb-vmore',
        seeMoreInfoLink: '.deb-vmore a',
        sizeDropdownOptionElements:
            '.t-product-details__size-dropdown select option',
        colourDropDown: '.dbh-product-color-dropdown-elem',
        errorNotification: '.c-notification-manager .c-notification div',
        reviewSortHighestRating:
            '.BVRRSortSelectWidget select.BVRRSelect option#rating-desc',
        reviewSortNewestRating:
            '.BVDI_QTFilterSummary .BVRRSortAndSearch .BVRRDisplayContentSort .BVRRSortSelectWidget select',
        miniBagButton: '.qa-header__cart',
        giftBadgeLink: '.dbh-product-promo .pw-button',
        freeGiftSection: '.dbh-accordion-item-espot-g1',
        stepperCount: '.pw-stepper__count input',
        stepperIncrement: '.pw--increment',
        stepperDecrement: '.pw--decrement',
        buyGuideEspot: '.dbh-espot-l1',
        buyGuideText:
            '.dbh-espot-l1 .espotContentContainer .deb-pdp-espots .text a',
        applyNowButton: '.deb-pdp-espots-finance a',
        productSizeMessage: '.t-product-detail__size-messaging',
        firstBreadcrumb: '.t-breadcrumb__home-btn',
        secondBreadcrumb: '.t-breadcrumb > div:nth-child(2)',
        thirdBreadcrumb: '.t-breadcrumb > div:nth-child(3)',
        breadcrumbSection: '.t-breadcrumb',
        deliveryReturnText: '.dbh-item-delivery .delivery-text-header',
        deliveryReturnHomeDelivery:
            '.dbh-item-delivery .delivery-options .home_delivery',
        deliveryReturnClickCollect:
            '.dbh-item-delivery .delivery-options .click_collect',
        deliveryReturnIntDelivery:
            '.dbh-item-delivery .delivery-options .international_delivery',
        saveLaterIcon: '.dbh-save',
        weeeSection: '.dbh-item-espot-g2',
        weeeFullForm: '.dbh-item-espot-g2 .deb-vmore p:nth-child(1)',
        weeeFindOutMoreLink: '.dbh-item-espot-g2 a',
        deliveryReturnTextTablet: '.dbh-item-delivery .delivery-text-header',
        deliveryReturnIntDeliveryTablet:
            '.dbh-item-delivery .delivery-option.international',
        sizeSelector:
            '.t-product-details__size-dropdown>div>div:nth-child(2)>select',
        colourSwatch: '.dbh-color-swatch',
        rewardPointsLink:
            '.dbh-card-points a[href="/content/about-your-rewards-card"]',
        colourSwatches: '.dbh-product-color-selector .pw-swatch__items',
        deliveryUrgencyDay: '.c-countdown .u-text-weight-bold',
        deliveryUrgencyTime: '.c-countdown div:nth-child(3)',
        countDownTimer: '.c-countdown .u-text-weight-bold',
        alsoInRangeOption: '.dbh-round-robin',
        viewBasketCloseButton:
            '.pw-button.pw--icon-only.pw--outline-icon.u-text-weight-bold',
        prodDescSection: '.dbh-description .t-product-details__description',
        prodDescHeaderText: '.t-product-details__description--heading',
        prodDescItemNumber: '.product-item-number .item-number-value',
        zoomNextButton: '.dbh-image-viewer-container .pw-carousel__next button',
        zoomImageTitle:
            '..dbh-image-viewer-container .pw-carousel__next button svg title',
        baynoteKidsImage:
            '.dbh-baynote-item a[href="http://www.debenhams.com/webapp/wcs/stores/servlet/prod_10701_10001_225020343233_-1"]',
        financeBannerContainer: '.deb-pdp-espots-finance',
        applyNowLink:
            '.deb-pdp-espots-finance a[href="https://finance.debenhams.com/credit-card/?sourcecode=3001194AADEBDAG00750"]',
        baynoteWomenImage:
            '.dbh-baynote-item a[href="https://www.debenhams.com/webapp/wcs/stores/servlet/prod_10701_10001_36194+090392001_-1"]',
        chanelSlimBanner: '.dbh-chanel-header',
        chanelAddToBagBuuton:
            '.t-product-details--chanel .pw-button.t-product-details__add-to-cart',
        addToCartButtonDisplayFinal:
            '.dbh-mini-bag-icon span.t-header__button-icon-count',
        nonReturnMsg: '.deb-pdp-espots h2',
        maxQuantityError: '.error span',
        bundleProductDescTitles:
            '.dbh-accordion-item-description .pw-dangerous-html div span',
        furnitureDimenH: '.pdp-item-dimensions-h',
        furnitureDimenW: '.pdp-item-dimensions-w',
        furnitureDimenD: '.pdp-item-dimensions-d',
        deliveryOptionMto: '.delivery-option.mto',
        orderSwatchesLink: '.dbh-order-swatches',
        selectedFabricColor:
            '.c-furniture-selection:nth-child(1) span:nth-child(1)',
        selectedFeetColor:
            '.c-furniture-selection:nth-child(2) span:nth-child(1)',
        changeSelectedFabric:
            '.c-furniture-selection:nth-child(1) span:nth-child(2)',
        changeSelectedFeet:
            '.c-furniture-selection:nth-child(2) span:nth-child(2)',
        feetOptions:
            '.t-product-details-feet .t-product-details__furniture-chip',
        feetColorListFurniture: '.pw-grid__inner > div',
        fabricColorListFurniture:
            '.pw-grid__inner > div:nth-child(1) .pw-grid__inner > div',
        orderSwatchConfirmSection: '.dbh-swatch-confirm',
        orderSwatchConfirmText: '.dbh-swatch-confirm > p:nth-child(2)',
        orderSwatchConfirmDeliveryText: '.dbh-swatch-confirm > p:nth-child(3)',
        orderSwatchConfirmContinueButton: '.dbh-swatch-confirm button',
        colorListHeaderText: '.pw-sheet__header .pw-header-bar__title',
        colorListClose: '.pw-sheet__header button',
        orderSwatchFirstOption:
            '.dbh-swatch-selection-cnt:nth-child(1) .pw-grid__inner div:nth-child(1) .t-product-details__furniture-chip',
        orderSwatchesButton: '.dbh-swatch-form-submit',
        noSwatchSelectedError:
            '.c-notification-manager > .c-notification >.notification-message__note',
        orderSwatchFirstName: '[name=firstName]',
        orderSwatchLastName: '[name=lastName]',
        orderSwatchEmail: '[name=email]',
        orderSwatchHouseNo: '[name=houseNo]',
        orderSwatchAddressLine1: '[name=addressLine1]',
        orderSwatchAddressLine2: '[name=addressLine2]',
        orderSwatchCity: '[name=city]',
        orderSwatchPostcode: '[name=zipcode]',
        selectTheSizedropDown:
            '.dbh-round-robin .dbh-carousel .pw--active .dbh-carousel-item .t-related-products__item:nth-child(1) select option',
        sizeAsDropdown: '.t-product-details__size-dropdown select option',
        dropdownOption: '.dbh-product-size-dropdown-selector select option',
        swatchColorSelectorOptions:
            '.dbh-product-color-selector .pw-swatch__items > div',
        swatchSizeSelectorOptions:
            '.dbh-product-size-selector .pw-swatch__items > div',
        dropdownRangePriceOption:
            '.c-select-menu-wrapper__menu-list > div:nth-child(elem) .c-select-menu-wrapper__stock-price',
        dropdownRangePriceOptionCount:
            '.c-select-menu-wrapper__menu-list > div',
        roundRobinImageTablet:
            '.dbh-round-robin .dbh-carousel .pw-carousel__item.pw--active .dbh-carousel-item .dbh-item-image:nth-child(1)',
        pdpSelectedSwatch:
            '.t-product-details__color-selector .pw-swatch__item.pw--selected .pw-swatch__chip',
        productPrdName: '.dbh-product-title .dbh-product-name',
        pdpMainHeroImage: '.dbh-image img',
        pdbThumbImage: '.dbh-thumb-img img',
        videoThumbnail:
            '.dbh-video-thumb .t-product-details__video-play-button-text',
        videoComponent: '.dbh-carousel video',
        pudoClickAndCollectOption: '.click_collect',
        pudoClickAndCollectOptionHeading: '.click_collect h4',
        pudoClickAndCollectDebsOption:
            '.click_collect .delivery-sub-option.cc_debs .t-delivery-options-info',
        pudoClickAndCollectDebsOptionPrice:
            '.click_collect .delivery-sub-option.cc_debs .t-delivery-options-price',
        pudoClickAndCollectDebsOptionDisabled:
            '.click_collect .cc_debs.t-delivery-options__disable-option',
        pudoClickAndCollectStandardParcelOption:
            '.click_collect .delivery-sub-option.cc_parcel_standard .t-delivery-options-info',
        pudoClickAndCollectStandardParcelOptionDisabled:
            '.click_collect .cc_parcel_standard.t-delivery-options__disable-option',
        pudoClickAndCollectStandardParcelOptionPrice:
            '.click_collect .delivery-sub-option.cc_parcel_standard .t-delivery-options-price',
        pudoClickAndCollectExpressParcelOption:
            '.click_collect .delivery-sub-option.cc_parcel_express .t-delivery-options-info',
        pudoClickAndCollectExpressParcelOptionDisabled:
            '.click_collect .cc_parcel_express.t-delivery-options__disable-option',
        pudoClickAndCollectExpressParcelOptionPrice:
            '.click_collect .delivery-sub-option.cc_parcel_express .t-delivery-options-price',
        pudoMoreInfoClickAndCollectLink:
            '.click_collect .t-delivery-option__view-more',
        pudoNonReturnMessaging: '.espot-container.t-delivery-options__returns',
        pudoMadeToOrderDeliveryOption: '.made_to_order',
        pudoMadeToOrderDeliveryOptionHeader: '.made_to_order h4',
        pudoMadeToOrderDeliveryMoreInfoLink:
            '.made_to_order .t-delivery-option__view-more',
        pudoDeliveryAndAssemblyDeliveryOption:
            '.t-delivery-option__returns--other-info',
        pudoDeliveryAndAssemblyDeliveryOptionHeader:
            '.t-delivery-option__returns--other-info h4',
        pudoDeliveryAndAssemblyDeliveryMoreInfoLink:
            '.t-delivery-option__returns--other-info .t-delivery-option__view-more',
        internationalDeliveryMoreInfoLink: '.international_delivery a'
    }
} else {
    selectors = {
        sortOptionDefault:
            '#sort option[value="*product_availability,-units_sold,-total_review_count"]',
        addToBagButton: '.dbh-add-to-bag> div.pw-button__inner',
        viewBasketCheckoutButton: '.dbh-modal-cta',
        addToBagProductName: '.pw-sheet__header h3',
        addToBagRemainingText: '.pw-sheet__header h3',
        productName: '.dbh-product-title',
        productsize: '.pw-field__input>select>option:nth-child(2)',
        selectedSize:
            '.u-padding-top-md.u-padding-bottom-sm.u-text-height-small > span:nth-child(2)',
        productPrice: '.dbh-product-price',
        shopMoreText: '.dbh-shop-more-tags-title',
        shopMoreTag1Text: '.dbh-shop-more-tags-list > li:nth-child(1) > a',
        shopMoreTag2Text: '.dbh-shop-more-tags-list > li:nth-child(2) > a',
        shopMoreTag3Text: '.dbh-shop-more-tags-list > li:nth-child(3) > a',
        allSizeElements: '.pw-swatch__items > div',
        productSizeMessage: '.t-product-detail__item-size-messaging',
        prodDescAccordion: '.t-product-details__info .pw-accordion__title',
        deliveryReturnAccordion: '.t-product-details__delivery > button',
        deliveryReturnText: '.t-product-details__delivery .pw-accordion__title',
        deliveryReturnHomeDelivery:
            '.dbh-item-delivery .delivery-options .home_delivery',
        deliveryReturnClickCollect:
            '.dbh-item-delivery .delivery-options .click_collect',
        deliveryReturnIntDelivery:
            '.dbh-item-delivery .delivery-options .international_delivery',
        sizeDropdownOptionElements:
            '.t-product-details__size-dropdown select option',
        sizeGuideLink:
            '.t-product-detail__variation-container .t-product-detail__espot-h',
        sizedropdown1: '.pw-field__input > select:nth-child(1)',
        sizeswatch: '.pw-swatch__items',
        selectedSizeSwatch: '.pw-swatch__button.pw--active>div',
        selectoptiontext:
            '.pw-field__input > select:nth-child(1)>option:nth-child(1)',
        financeBanner: '.deb-pdp-espots-finance',
        stepperCount: '.pw-stepper__count input',
        stepperIncrement: '.pw--increment',
        stepperDecrement: '.pw--decrement',
        saveLaterIcon: '.dbh-save',
        pdpImageToZoom: '.dbh-image-viewer-btn',
        pdpCloseZoom: '.dbh-image-viewer-close',
        weeeAccordion: '.dbh-accordion-item-espot-g2 button',
        weeeFullForm: '.dbh-accordion-item-espot-g2 .deb-vmore p:nth-child(1)',
        findOutMoreLink: '.dbh-accordion-item-espot-g2 a',
        reviewsAccordion:
            '.dbh-accordion-item-reviews button.pw-accordion__header',
        reviewsDescriptionArea: '#BVRRContainer',
        alsoLikeText:
            '#app-main > div > div:nth-child(4) > div > h2.h2__sub-heading',
        sizeDropDown: 'div.pw-field-row > div > div > div.pw-field__input',
        colourSwatches: '.dbh-product-color-selector .pw-swatch__items',
        beautyColourSwatches: '.dbh-color-swatch',
        beautyClubMessage: 'li.dbh-beautyclub > div.u-padding-start-md > a',
        pricePerml: 'span.u-text-size-small',
        deliveryAndReturnsOptions:
            '.dbh-accordion-item-delivery button[data-analytics-content="Delivery / Returns"]',
        deliveryDetailsButton:
            '.dbh-accordion-item-delivery button[data-analytics-content="Delivery / Returns"]',
        deliveryReturnDetails: '.delivery-details-text-container',
        deliveryDetails:
            '.delivery-details-text-container .delivery-options .delivery-option .header h3',
        returnMessage: 'div.espot-container > div.returns-espot',
        seeMoreInfoLink: '.deb-vmore a',
        sizeGuideHref:
            'div.pw-dangerous-html > div.t-product-detail__espot-h > a',
        alsoInRangeOption: '#app-main > div > div:nth-child(4) > div',
        addToBagFromAlsoInRangeContainer:
            '.pw-scroller__content div:nth-child(1) button.pw-button.c--tertiary.u-width-full.false',
        sortReviewButton: '#BVRRDisplayContentSelectBVFrameID',
        urgentDeliveryMessage: 'div.c-countdown',
        ProductDescription: '#accordion__header-0',
        productDescriptionDetails:
            '#accordion__content-0 .pw-accordion__content-wrapper .pw-accordion__content',
        recentlyViewedText:
            '#app-main > div > div:nth-child(6) > .h2__sub-heading',
        recentlyViewed: '#app-main > div > div:nth-child(6)',
        recentlyViewedProduct1:
            '#app-main > div > div:nth-child(6) > div.pw-scroller > div > div.pw-scroller__content > div:nth-child(1)',
        productDescriptionLink: '.dbh-description-link',
        productDescAccordion: '.dbh-accordion-item-description',
        buyGuideEspot: '.dbh-espot-l1',
        buyGuideText:
            '.dbh-espot-l1 .espotContentContainer .deb-pdp-espots .text a',
        applyNowButton: '.deb-pdp-espots-finance a',
        creditCardValuePoints: '.dbh-mastercard div:nth-child(2) a',
        saveForLaterButton: 'button.dbh-save',
        saveForLaterPopUpCloseButton: 'div.c-remove-item__header > button',
        continueShoppingButton: 'button.dbh-country-select-modal > div',
        selectColourSwatch:
            '.dbh-product-color-selector .pw-swatch__items .pw-swatch__item button',
        selectSizeswatch:
            '.t-product-detail__size .pw-swatch__items .pw-swatch__item',
        colourDropDown: '.dbh-product-color-dropdown-elem',
        errorNotification: '.c-notification-manager .c-notification div',
        reviewSortHighestRating:
            '.BVRRSortSelectWidget select.BVRRSelect option#rating-desc',
        reviewSortNewestRating:
            '.BVDI_QTFilterSummary .BVRRSortAndSearch .BVRRDisplayContentSort .BVRRSortSelectWidget select',
        miniBagButton: '.qa-header__cart',
        rewardPointsLink:
            '.dbh-card-points a[href="/content/about-your-rewards-card"]',
        rewarclubIcon: '.dbh-card-points svg',
        wasPrice:
            '.t-product-details__sale-price-original.dbh-product-original',
        nowPrice: '.t-product-details__sale-price-now.dbh-product-price',
        reviewsSection: '.t-product-details__description-reviews',
        sizeLink:
            '.t-product-details__size-dropdown div.pw-field__inner>div:nth-child(1)>label',
        giftBadgeLink: '.dbh-product-promo .pw-button',
        freeGiftSection: '.dbh-accordion-item-espot-g1',
        productDimensions:
            '.t-product-details-heading .u-flexbox .pw-dangerous-html',
        selectedFabricSection: 'div.c-furniture-selection:nth-child(1)',
        selectedFeetSection: 'div.c-furniture-selection:nth-child(2)',
        roundRobinPrd1:
            '.pw-scroller__item:nth-child(1) .t-related-products__item .u-margin-bottom-md:nth-child(2) > a',
        roundRobinPrd2:
            '.pw-scroller__item:nth-child(2) .t-related-products__item .u-margin-bottom-md:nth-child(2) > a',
        productBrandName: '.dbh-product-title > span',
        roundRobinSection: '.dbh-round-robin-scroller',
        roundRobinHeaderText: '.dbh-round-robin-title',
        baynoteSection:
            '.t-product-detail__related-products .dbh-baynote-section .dbh-baynote-scroller',
        baynoteHeaderText:
            '.t-product-detail__related-products .dbh-baynote-section .dbh-baynote-title',
        baynoteProducts:
            '.t-product-detail__related-products .dbh-baynote-section .dbh-baynote-scroller .dbh-baynote-item',
        baynoteImage:
            '.t-product-detail__related-products .dbh-baynote-section .dbh-baynote-scroller .dbh-baynote-item:nth-of-type(1)',
        roundRobinProducts:
            '.pw-scroller__item .t-related-products__item .u-margin-bottom-md:nth-child(2) > a',
        crossSellSection: '.dbh-round-robin-scroller',
        crossSellHeaderText: '.dbh-round-robin-title',
        crossSellPrd1:
            '.pw-scroller__item:nth-child(1) .t-related-products__item .u-margin-bottom-md:nth-child(2) > a',
        colourSwatch: '.dbh-color-swatch',
        urgentDeliveryDay: '.c-countdown div:nth-child(2)',
        countDownTimer: '.c-countdown div:nth-child(3)',
        viewBasketCloseButton:
            '.pw-button.pw--icon-only.pw--outline-icon.u-text-weight-bold',
        prodDescSection:
            '.dbh-accordion-item-description button[data-analytics-content="Product description"]',
        prodDescHeaderText:
            '.dbh-accordion-item-description .description-text-header h2',
        prodDescItemNumber: '.product-item-number .item-number-value',
        zoomNextButton: '.dbh-image-viewer-container .pw-carousel__next button',
        zoomImageTitle:
            '..dbh-image-viewer-container .pw-carousel__next button svg title',
        baynoteKidsImage:
            '.dbh-baynote-item a[href="http://www.debenhams.com/webapp/wcs/stores/servlet/prod_10701_10001_225020343233_-1"]',
        financeBannerContainer: '.deb-pdp-espots-finance',
        applyNowLink:
            '.deb-pdp-espots-finance a[href="https://finance.debenhams.com/credit-card/?sourcecode=3001194AADEBDAG00750"]',
        baynoteWomenImage:
            '.dbh-baynote-item a[href="https://www.debenhams.com/webapp/wcs/stores/servlet/prod_10701_10001_36194+090392001_-1"]',
        chanelSlimBanner: '.dbh-chanel-header',
        chanelAddToBagBuuton:
            '.t-product-details--chanel .pw-button.t-product-details__add-to-cart',
        addToCartButtonDisplayFinal:
            '.dbh-mini-bag-icon span.t-header__button-icon-count',
        nonReturnMsg: '.deb-pdp-espots h2',
        maxQuantityError: '.error span',
        bundleProductDescTitles:
            '.dbh-accordion-item-description .pw-dangerous-html div span',
        furnitureDimenH: '.pdp-item-dimensions-h',
        furnitureDimenW: '.pdp-item-dimensions-w',
        furnitureDimenD: '.pdp-item-dimensions-d',
        deliveryOptionMto: '.delivery-option.mto',
        orderSwatchesLink: '.dbh-order-swatches',
        selectedFabricColor:
            '.c-furniture-selection:nth-child(1) span:nth-child(1)',
        selectedFeetColor:
            '.c-furniture-selection:nth-child(2) span:nth-child(1)',
        changeSelectedFabric:
            '.c-furniture-selection:nth-child(1) span:nth-child(2)',
        changeSelectedFeet:
            '.c-furniture-selection:nth-child(2) span:nth-child(2)',
        feetOptions:
            '.t-product-details-feet .t-product-details__furniture-chip',
        feetColorListFurniture: '.pw-grid__inner > div',
        fabricColorListFurniture:
            '.pw-grid__inner > div:nth-child(1) .pw-grid__inner > div',
        orderSwatchConfirmSection: '.dbh-swatch-confirm',
        orderSwatchConfirmText: '.dbh-swatch-confirm > p:nth-child(2)',
        orderSwatchConfirmDeliveryText: '.dbh-swatch-confirm > p:nth-child(3)',
        orderSwatchConfirmContinueButton: '.dbh-swatch-confirm button',
        colorListHeaderText: '.pw-sheet__header .pw-header-bar__title',
        colorListClose: '.pw-sheet__header button',
        orderSwatchFirstOption:
            '.dbh-swatch-selection-cnt:nth-child(1) .pw-grid__inner div:nth-child(1) .t-product-details__furniture-chip',
        orderSwatchesButton: '.dbh-swatch-form-submit',
        noSwatchSelectedError: '.c-notification-manager > .c-notification',
        orderSwatchFirstName: '[name=firstName]',
        orderSwatchLastName: '[name=lastName]',
        orderSwatchEmail: '[name=email]',
        orderSwatchHouseNo: '[name=houseNo]',
        orderSwatchAddressLine1: '[name=addressLine1]',
        orderSwatchAddressLine2: '[name=addressLine2]',
        orderSwatchCity: '[name=city]',
        orderSwatchPostcode: '[name=zipcode]',
        selectTheSizedropDown:
            '.dbh-round-robin-section .dbh-round-robin-scroller .pw-scroller__content .pw-scroller__item:nth-child(1) .t-related-products__select select option',
        sizeAsDropdown: '.t-product-details__size-dropdown select option',
        dropdownOption: '.t-product-details__size-dropdown select option',
        swatchColorSelectorOptions:
            '.dbh-product-color-selector .pw-swatch__items > div',
        swatchSizeSelectorOptions:
            '.dbh-product-size-selector .pw-swatch__items > div',
        dropdownRangePriceOption:
            '.c-select-menu-wrapper__menu-list > div:nth-child(elem) .c-select-menu-wrapper__stock-price',
        dropdownRangePriceOptionCount:
            '.c-select-menu-wrapper__menu-list > div',
        addToBagFromRoundRobinContainer:
            '.dbh-round-robin .dbh-carousel .pw--active .dbh-carousel-item div:nth-child(1) button',
        dropdownOptionAlsoInTheRangeOption:
            '.dbh-round-robin .dbh-carousel .pw--active .dbh-carousel-item .t-related-products__item:nth-child(1) .t-related-products__select',
        roundRobinImageMobile:
            '.dbh-round-robin-scroller .pw-scroller__content .pw-scroller__item:nth-child(1) .dbh-item-image',
        pdpSelectedSwatch:
            '.t-product-details__color-selector .pw-swatch__item.pw--selected .pw-swatch__chip',
        productPrdName: '.dbh-product-title .dbh-product-name',
        pdpMainHeroImage: '.dbh-image img',
        pdbThumbImage: '.dbh-thumb-img img',
        videoThumbnail: '.dbh-carousel .t-product-details__video-play-button',
        videoPlayIcon: '.dbh-video-thumb',
        videoComponent: '.dbh-carousel video',
        pddpColourSwatches:
            '.dbh-product-color-selector .pw-swatch__items .pw-swatch__item',
        outOfStockColourSwatch: '.pw-swatch__item--oos',
        sizeSwatches: '.dbh-product-size-selector .pw-swatch__item',
        nothingSelectedErrorMessage:
            '.t-product-detail__variation-container .pw-field__error',
        pudoClickAndCollectOption: '.click_collect',
        pudoClickAndCollectOptionHeading: '.click_collect h4',
        pudoClickAndCollectDebsOption:
            '.click_collect .delivery-sub-option.cc_debs .t-delivery-options-info',
        pudoClickAndCollectDebsOptionPrice:
            '.click_collect .delivery-sub-option.cc_debs .t-delivery-options-price',
        pudoClickAndCollectDebsOptionDisabled:
            '.click_collect .cc_debs.t-delivery-options__disable-option',
        pudoClickAndCollectStandardParcelOption:
            '.click_collect .delivery-sub-option.cc_parcel_standard .t-delivery-options-info',
        pudoClickAndCollectStandardParcelOptionDisabled:
            '.click_collect .cc_parcel_standard.t-delivery-options__disable-option',
        pudoClickAndCollectStandardParcelOptionPrice:
            '.click_collect .delivery-sub-option.cc_parcel_standard .t-delivery-options-price',
        pudoClickAndCollectExpressParcelOption:
            '.click_collect .delivery-sub-option.cc_parcel_express .t-delivery-options-info',
        pudoClickAndCollectExpressParcelOptionDisabled:
            '.click_collect .cc_parcel_express.t-delivery-options__disable-option',
        pudoClickAndCollectExpressParcelOptionPrice:
            '.click_collect .delivery-sub-option.cc_parcel_express .t-delivery-options-price',
        pudoMoreInfoClickAndCollectLink:
            '.click_collect .t-delivery-option__view-more',
        pudoNonReturnMessaging: '.espot-container.t-delivery-options__returns',
        pudoMadeToOrderDeliveryOption: '.made_to_order',
        pudoMadeToOrderDeliveryOptionHeader: '.made_to_order h4',
        pudoMadeToOrderDeliveryMoreInfoLink:
            '.made_to_order .t-delivery-option__view-more',
        pudoDeliveryAndAssemblyDeliveryOption:
            '.t-delivery-option__returns--other-info',
        pudoDeliveryAndAssemblyDeliveryOptionHeader:
            '.t-delivery-option__returns--other-info h4',
        pudoDeliveryAndAssemblyDeliveryMoreInfoLink:
            '.t-delivery-option__returns--other-info .t-delivery-option__view-more',
        nternationalDeliveryMoreInfoLink: '.international_delivery a'
    }
}

const pdp = function() {
    this.selectors = selectors
}

export default pdp
