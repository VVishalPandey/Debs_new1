const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        headerText: '.t-cart__product-list-title .dbh-title',
        itemsInMyBag: '.pw-list .c-product-item',
        productImage: '.dbh-product-image',
        firstProductRemove: '.pw-list > article:nth-child(1) .dbh-remove > div',
        firstSFLProductRemove:
            '.dbh-my-saved-items-carousel .pw--active .dbh-saved-items-carousel-item:nth-child(1) .dbh-remove',
        firstProductSaveForLater:
            '.dbh-product-list article:nth-child(1) .dbh-save-for-later',
        firstProductName: '.pw-list > article:nth-child(1) .dbh-product-title',
        subtotalValue: '.dbh-subtotal .pw-ledger__value',
        removePopUpYesButton: '.dbh-remove-item-button div',
        removeTrashIcon: '.dbh-remove',
        mySavedItemsTitle: '.dbh-my-saved-items-title',
        mySavedItemsProductList:
            '.pw--active .dbh-saved-items-carousel-item .c-saved-product-item',
        mySavedItemsProductNameList:
            '.dbh-saved-items-carousel-item .dbh-product-title',
        mySavedItemsProductName:
            '.pw--active .dbh-saved-items-carousel-item .c-product-item:nth-child(1) .dbh-product-title',
        mySavedItemsProductImageList:
            '.pw--active .dbh-saved-items-carousel-item article img.dbh-image',
        mySavedItemsProductNowPriceList:
            '.pw--active .dbh-saved-items-carousel-item article .dbh-now',
        mySavedItemsProductChooseOptionButtonList:
            '.pw--active .dbh-saved-items-carousel-item article .dbh-choose-options',
        mySavedItemsProductChooseOptionTextList:
            '.pw--active .dbh-saved-items-carousel-item article .dbh-choose-options div',
        mySavedItemsProductRemoveButtonList:
            '.pw--active .c-saved-product-item .dbh-remove',
        mySavedItemsProductPercentageOffList:
            '.pw--active .dbh-saved-items-carousel-item article .dbh-discount',
        mySavedItemsProductWasPriceList:
            '.pw--active .dbh-saved-items-carousel-item article .dbh-was',
        mySavedItemsProductThenPriceList:
            '.dbh-saved-items-carousel-item article .c-product-title__then-price',
        mySavedItemsFirstProductChooseOptionButton:
            '.pw--active .dbh-saved-items-carousel-item article:nth-child(1) .dbh-choose-options',
        mySavedItemsFirstProductChooseOptionButtonText:
            '.pw--active .dbh-saved-items-carousel-item article:nth-child(1) .dbh-choose-options div',
        mySavedItemsSecondProductChooseOptionButtonText:
            '.pw--active .dbh-saved-items-carousel-item article:nth-child(2) .dbh-choose-options div',
        mySavedItemsRemoveConfirmationPopUpHeader:
            '.t-cart__remove-item-confirmation-modal-header',
        mySavedItemsRemoveConfirmationPopUpHeaderText:
            '.t-cart__remove-item-confirmation-modal-header p',
        mySavedItemsRemoveConfirmationPopUpSubHeaderText:
            '.t-cart__remove-item-confirmation-modal-header +div',
        mySavedItemsRemoveConfirmationPopUpKeepSavedItem:
            '.dbh-keep-saved-button',
        mySavedItemsAddToBagButton: '.dbh-remove-item-button',
        mySavedItemsChooseOptionPopUp:
            '.c-saved-product-item__choose-options-popover',
        mySavedItemsChooseOptionPopUpHeading:
            '.c-saved-product-item__choose-options-popover h3',
        mySavedItemsChooseOptionPopUpCloseIcon:
            '.c-saved-product-item__choose-options-popover .dbh-close-button',
        mySavedItemsChooseOptionPopUpSwatchItems:
            '.c-saved-product-item__choose-options-popover .pw-swatch__items',
        mySavedItemsChooseOptionPopUpSwatchItem:
            '.c-saved-product-item__choose-options-popover .pw-swatch__item',
        mySavedItemsChooseOptionPopUpSwatchLabel:
            '.c-saved-product-item__choose-options-popover .pw-swatch__label',
        mySavedItemsChooseOptionPopUpFieldLabel:
            '.c-saved-product-item__choose-options-popover .pw-field__label',
        mySavedItemsChooseOptionPopUpFieldDropdown:
            '.c-saved-product-item__choose-options-popover .pw-field__input select',
        mySavedItemsChooseOptionPopUpFieldOptions:
            '.c-saved-product-item__choose-options-popover .pw-field__input select option',
        mySavedItemsChooseOptionPopUpAddToBagButton:
            '.c-saved-product-item__choose-options-popover .dbh-remove-item-button',
        mySavedItemsFurnitureChooseOptionPopUpColorSelectionLabel:
            '.c-saved-product-item__choose-options-popover .t-product-detail__color-section h3',
        mySavedItemsFurnitureChooseOptionPopUpColorSelection:
            '.c-saved-product-item__choose-options-popover .t-product-detail__color-section select',
        mySavedItemsFurnitureChooseOptionPopUpFeetSelectionLabel:
            '.c-saved-product-item__choose-options-popover .t-product-detail__feet-section h3',
        mySavedItemsFurnitureChooseOptionPopUpFeetSelection:
            '.c-saved-product-item__choose-options-popover .t-product-detail__feet-section select',
        mySavedItemsChooseOptionButtonList:
            '.pw--active .dbh-saved-items-carousel-item .c-product-item:nth-child(1) .dbh-choose-options',
        mySavedItemsChooseOptionNextButton:
            '.pw-carousel__next button.pw-button',
        productNameList: '.dbh-product-list .c-product-item .dbh-product-name',
        mySavedItemsSizeDropdownElements:
            '.t-product-details__size-dropdown select',
        mySavedItemsSizeDropdownOptionElements:
            '.t-product-details__size-dropdown select option',
        swatchSizeSelectorOptionsSfl: '.pw-swatch__items > div button',
        productList: '.dbh-product-list',
        secondProductPrice:
            '.dbh-product-list article:nth-child(2) .dbh-product-price',
        secondProductName:
            '.dbh-product-list article:nth-child(2) .dbh-product-name',
        allProductNameElements:
            '.t-cart__products-summary-desktop .c-product-item-title',
        swatchOption: '.dbh-option',
        savedItemCarousal: '.c-saved-items-list-my-bag',
        myBagPageHeader: '.t-cart__product-main',
        saveForLaterCTA: '.dbh-save-for-later',
        saveForLaterFirstProductName:
            '.dbh-my-saved-items-carousel .pw--active article:nth-child(1) .dbh-product-title',
        emptyBagMessage: '.dbh-empty-text-header',
        emptyBagLogo: '.t-mini-cart__empty-img',
        continueShoppingCTA: '.dbh-continue-shopping',
        numberCountInMiniBag: '.t-header__cart-count',
        removeConfirmationPopUp: '.t-cart__remove-item-confirmation-modal',
        removePopUpSaveLaterButton: '.dbh-save-for-later-button',
        removePopUpClose: '.dbh-close-button div',
        increaseQuantity: '.pw--increment',
        secondProductIncreaseQuantity:
            '.dbh-product-list article:nth-child(2) .pw--increment',
        secondProductDecreaseQuantity:
            '.dbh-product-list article:nth-child(2) .pw--decrement',
        secondProductSaveForLaterCTA:
            '.dbh-product-list article:nth-child(2) .dbh-save-for-later',
        secondProductRemoveButton:
            '.dbh-product-list article:nth-child(2) .dbh-remove',
        decreaseQuantity: '.pw--decrement',
        banner1Content: '.dbh-info .pw-feedback__content',
        deliveryThresholdAmountNotification: '.pw-feedback-info.dbh-info',
        productValue: '.dbh-items .pw-ledger__value',
        productDiscountText: '.pw-ledger tr:nth-child(2) .pw-ledger__item',
        productDiscountValue: '.pw-ledger tr:nth-child(2) .pw-ledger__value',
        discountValue: '.pw-ledger tr:nth-child(2) .pw-ledger__value',
        headerItemsCount: '.t-cart__product-list-title .dbh-items',
        totalItemsCount: '.dbh-items .pw-ledger__item',
        ProductPrice: '.dbh-product-price',
        deliveryOptionSection: '.dbh-delivery-options',
        myBagSummarySection: '.t-cart__summary',
        creditCardInfo: '.dbh-mastercard strong',
        beautyCardInfo: '.dbh-beautyclub strong',
        promoCodeApply: '.dbh-apply-promocode',
        promoCodeField: '.dbh-promocode',
        discountRows: '.dbh-discounts',
        subtotalRow: '.dbh-subtotal',
        excludingDeliveryMessage: '.t-cart__summary p',
        checkoutButton: '.dbh-secure-checkout',
        creditCardAcceptCopy: '.t-cart__summary-icons-description',
        creditCardIcons: '.dbh-card-icons',
        debsCreditCardIcon: '.t-cart__summary-debs-card-icon',
        visaCreditCardIcon: '.t-cart__summary-visa-icon',
        masterCreditCardIcon: '.t-cart__summary-mastercard-icon',
        amexCreditCardIcon: '.t-cart__summary-amex-icon',
        maestroCreditCardIcon: '.t-cart__summary-maestro-icon',
        payPalIcon: '.t-cart__summary-paypal-cart-icon',
        availableDeliveryOption: '.dbh-delivery-options .dbh-check',
        deliveryOptionTooltip: '.dbh-delivery-options > span',
        standardDeliveryOption:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__panels>div:nth-child(1) button',
        nextDayDeliveryOption:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__panels>div:nth-child(2) button',
        nomDayDeliveryOption:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__panels>div:nth-child(3) button',
        nextNomDayDeliveryOption:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__panels>div:nth-child(2) button',
        clickAndCollectDeliveryOption:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__panels>div:nth-child(4) button',
        clickAndCollectDeliveryOptionDebenhams:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__panels>div:nth-child(3) button',
        clickAndCollectDeliveryOptionHermes:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__panels>div:nth-child(4) button',
        internationalDeliveryOption:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__panels>div:nth-child(5) button',
        internationalDeliveryOptionForINT:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__panels>div:nth-child(1) button',
        standardDeliveryOptionTooltipText:
            '.pw-list > div:nth-child(elem) .popover-standard-text p',
        nextDayDeliveryOptionTooltipText:
            '.pw-list > div:nth-child(elem) .popover-delivery-next-day-text p',
        nomDayDeliveryOptionTooltipText:
            ' .pw-list > div:nth-child(elem) .popover-delivery-day-evening-text p',
        clickAndCollectDeliveryOptionTooltipText:
            '.pw-list > div:nth-child(elem) .popover-delivery-click-collect-text p',
        internationalDeliveryOptionTooltipText:
            '.pw-list > div:nth-child(elem) .popover-international-text p',
        nextNomDayDeliveryOptionTooltipText:
            '.pw-list > div:nth-child(elem) .popover-nextOrNominatedDay-text p',
        clickAndCollectDeliveryOptionDebenhamsTooltipText:
            '.pw-list > div:nth-child(elem) .popover-collectFromStore-text p',
        clickAndCollectDeliveryOptionHermesTooltipText:
            '.pw-list > div:nth-child(elem) .popover-collectFromParcelShop-text p',
        unavailCCExpressDeliveryOptionHermesTooltipText:
            '.pw-list > div:nth-child(elem) .popover-collectFromParcelShop-text p .delivery-option-info--unavailable ',
        unavailableDeliveryOption: '.dbh-delivery-options .dbh-close',
        promoCodeErrorMessage: '.c-promo-code-form .pw-field__error',
        promoCodeHeaderErrorMessage: '.pw--error .pw-feedback__content',
        promoCodeAppliedText: '.dbh-applied-promocode .pw-feedback__content',
        promoCodeRemove: '.dbh-applied-promocode .pw-button__inner',
        sizeDropdownOptionElements:
            '.t-product-details__size-dropdown select option',
        footerPaymentIcons: '.dbh-footer-logos',
        footerCopyrightSection: '.dbh-footer-nav-copyright',
        removeTrashIconsMyBag: '.dbh-remove > .pw-button__inner',
        removeTrashIconsSFL:
            '.dbh-my-saved-items-carousel .dbh-saved-items-carousel-item  .dbh-remove',
        financeBanner: '.t-finance-banner__content',
        financeBannerHeader:
            '.t-finance-banner__content .t-fbanner__offer span:nth-child(1)',
        financeBannerAmount:
            '.t-finance-banner__content .t-fbanner__offer span:nth-child(2)',
        viewBasketCheckoutButton: '.dbh-tooltip-cta .pw-button__inner',
        addToBagRemainingText: '.dbh-tooltip-message',
        stepperCount: '.pw-stepper__count input',
        stepperIncrement: '.pw--increment',
        savedItemsCarousal: '.dbh-my-saved-items-carousel',
        deliveryBannerSavedItemsLink:
            '.dbh-info .pw-feedback__content .anchor-link',
        giftCardUpsellMessage: '.t-gift-card-upsell p',
        giftCardLogo: '.t-gift-card-upsell__content img',
        giftCardAmountDropDown: '.t-gift-card-upsell__form fieldset',
        giftCardAddtoBagButton: '.t-gift-card-upsell__add-to-cart',
        giftCardnotificationMessage: '.t-gift-card-upsell__delivery-message',
        giftCardgcAmountDropdownOptionElements:
            '.c-select-menu-wrapper__menu-list >div',
        giftCarddropdownAmountOption:
            '.c-select-menu-wrapper__menu-list > div:nth-child(amt)',
        giftCardgcDropdown: '.t-gift-card-upsell__size-dropdown-elem',
        giftCarditemAddedNotification: '.pw-feedback-out-of-stock div',
        bagProductList: '.dbh-product-list .c-product-item .dbh-product-title',
        bagProductTitle:
            '.dbh-product-list .c-product-item:nth-child(1) .dbh-product-title',
        bagProductTrash:
            '.dbh-product-list .c-product-item:nth-child(1) .dbh-remove',
        myBagDisabled: '.t-header__cart-button-disable',
        progressBar: '.t-checkout-shipping__progress',
        currentSelection:
            '.u-center-piece > div.current.item:nth-child(1) span',
        logoDebenhamsCheckout: '.t-header__logo'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        headerText: '.dbh-title',
        checkoutButton: '.t-cart__button .dbh-secure-checkout',
        checkoutButton2: '.t-cart__button .dbh-secure-checkout',
        allProductNameElements: '.t-cart__product-list .dbh-product-title',
        removePopUpYesButton: '.dbh-remove-item-button',
        headerItemsCount: '.t-cart__product-list-title .dbh-items',
        banner1Content: '.dbh-info .pw-feedback__content',
        creditCardInfo: '.dbh-mastercard strong',
        beautyCardInfo: '.dbh-beautyclub strong',
        totalItemsCount: '.dbh-items .pw-ledger__item',
        productValue: '.dbh-items .pw-ledger__value',
        productDiscountValue: '.pw-ledger tr:nth-child(2) .pw-ledger__value',
        productDiscountText: '.pw-ledger tr:nth-child(2) .pw-ledger__item',
        discountValue: '.pw-ledger tr:nth-child(2) .pw-ledger__value',
        discountValueWithPD: '.pw-ledger tr:nth-child(3) .pw-ledger__value',
        subtotalValue: '.dbh-subtotal .pw-ledger__value',
        firstProductName: '.pw-list :nth-child(1) .dbh-product-title',
        firstProductSaveForLater:
            '.pw-list :nth-child(1) .dbh-save-for-later > div',
        firstProductRemove: '.pw-list :nth-child(1) .dbh-remove > div',
        removepopUpHeaderText: '.dbh-remove-product-warning',
        removePopUpImage: '.dbh-product-image img',
        removePopUpClose: '.dbh-close-button div',
        removePopUpSaveLaterButton: '.dbh-save-for-later-button div',
        promoCodeAccordion: '.dbh-promo-code-label button',
        promoCodeApply: '.dbh-apply-promocode',
        promoCodeField: '.dbh-promocode',
        promoCodeErrorMessage: '.pw-accordion__content .pw-field__error',
        promoCodeHeaderErrorMessage: '.u-error-notification__content',
        promoCodeAppliedText: '.dbh-applied-promocode .pw-feedback__content',
        promoCodeRemove: '.dbh-applied-promocode .pw-button__inner',
        priceSummaryTableContentElements: '.t-cart__summary-wrapper table tr',
        totalItemsRow: '.dbh-items',
        discountRows: '.dbh-discounts',
        subtotalRow: '.dbh-subtotal',
        emptyBagHeaderText: '.t-mini-cart__empty-title',
        emptyBagBodyText: '.t-cart__empty p:nth-child(1)',
        emptyBagContinueButton: '.t-cart__empty button',
        freeDelveryQualifyMessage: '.dbh-info .pw-feedback__content',
        deliveryOptionTooltip: '.pw-tabs__panels',
        ProductPrice: '.dbh-product-price',
        incrementStepper: 'button.pw--increment',
        countInputField: 'input.pw-stepper__input',
        selectedFabricColor: '.dbh-option:nth-child(1)',
        selectedFeetColor: '.dbh-option:nth-child(2)',
        standardDeliveryOption:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__strip li:nth-child(1) button',
        nextDayDeliveryOption:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__strip li:nth-child(2) button',
        nomDayDeliveryOption:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__strip li:nth-child(3) button',
        nextNomDayDeliveryOption:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__strip li:nth-child(2) button',
        clickAndCollectDeliveryOption:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__strip li:nth-child(4) button',
        clickAndCollectDeliveryOptionDebenhams:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__strip li:nth-child(3) button',
        clickAndCollectDeliveryOptionHermes:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__strip li:nth-child(4) button',
        internationalDeliveryOption:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__strip li:nth-child(5) button',
        internationalDeliveryOptionForINT:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__strip li:nth-child(1) button',
        standardDeliveryOptionTooltipText:
            '.pw-list > div:nth-child(elem) .dbh-standard-text p',
        nextDayDeliveryOptionTooltipText:
            '.pw-list > div:nth-child(elem) .dbh-delivery-next-day-text p',
        nomDayDeliveryOptionTooltipText:
            ' .pw-list > div:nth-child(elem) .dbh-delivery-day-evening-text p',
        clickAndCollectDeliveryOptionTooltipText:
            '.pw-list > div:nth-child(elem) .dbh-delivery-click-collect-text p',
        internationalDeliveryOptionTooltipText:
            '.pw-list > div:nth-child(elem) .dbh-international-text p',
        nextNomDayDeliveryOptionTooltipText:
            '.pw-list > div:nth-child(elem) .dbh-nextOrNominatedDay-text p',
        clickAndCollectDeliveryOptionDebenhamsTooltipText:
            '.pw-list > div:nth-child(elem) .dbh-collectFromStore-text p',
        clickAndCollectDeliveryOptionHermesTooltipText:
            '.pw-list > div:nth-child(elem) .dbh-collectFromParcelShop-text p',
        unavailCCExpressDeliveryOptionHermesTooltipText:
            '.pw-list > div:nth-child(elem) .dbh-collectFromParcelShop-text p .delivery-option-info--unavailable',
        unavailableDeliveryOption: '.c-disabled.dbh-close',
        addToBag: '.dbh-choose-options',
        emptyBagMessage: '.dbh-empty-text-header',
        emptyBagLogo: '.t-mini-cart__empty-img',
        continueShoppingCTA: '.dbh-continue-shopping',
        sizeDropdownOptionElements:
            '.t-product-details__size-dropdown select option',
        unavailableDeliveryOptionTooltip: '.pw-tabs__panels .c-disabled',
        availableDeliveryOption: '.dbh-check',
        productImage: '.dbh-product-image',
        sflProducts:
            '.dbh-my-saved-items-scroller .t-my-saved-items__item-details',
        sflProductsImg: '.dbh-my-saved-items-scroller .dbh-product-image',
        sflProductsTitle:
            '.dbh-my-saved-items-scroller .t-my-saved-items__item-description h2',
        sflProduct5:
            '.dbh-my-saved-items-scroller .pw-scroller__item:nth-child(5) .dbh-product-image',
        sflProductRemove: '.dbh-my-saved-items-scroller .dbh-remove',
        sflProduct1:
            '.dbh-my-saved-items-scroller .pw-scroller__item:nth-child(1) .dbh-product-image',
        sflChooseOptionsP1:
            '.dbh-my-saved-items-scroller .pw-scroller__item:nth-child(1) .dbh-choose-options',
        sflAddToBagP1: '.dbh-remove-item-button',
        sflRemoveP1:
            '.dbh-my-saved-items-scroller .pw-scroller__item:nth-child(1) .dbh-remove',
        finanaceBannerApplyLink: '.fb-applynow__link',
        saveForLaterFirstProductName:
            '.dbh-my-saved-items-scroller :nth-child(1) .dbh-product-title',
        removeTrashIconsMyBag: '.pw-list .dbh-remove > div',
        removeTrashIconsSFL:
            '.dbh-my-saved-items-carousel .dbh-saved-items-carousel-item .dbh-remove',
        financeBanner: '.t-finance-banner__content',
        financeBannerHeader:
            '.t-finance-banner__content .t-fbanner__offer span:nth-child(1)',
        financeBannerAmount:
            '.t-finance-banner__content .t-fbanner__offer span:nth-child(2)',
        deliveryOptionSection: '.dbh-delivery-options',
        bagProductList: '.dbh-product-list .c-product-item .dbh-product-title',
        mySavedItemsProductNameList:
            '.dbh-my-saved-items-scroller .dbh-product-title',
        mySavedItemsProductName:
            '.pw-scroller__content .pw-scroller__item:nth-child(1) .c-product-item .dbh-product-title',
        mySavedItemsChooseOptionButtonList:
            '.pw-scroller__content .pw-scroller__item:nth-child(1) .c-product-item .dbh-choose-options',
        mySavedItemsChooseOptionNextButton:
            '.pw-carousel__next button.pw-button',
        mySavedItemsChooseOptionPopUpAddToBagButton:
            '.pw-sheet__content .dbh-remove-item-button',
        swatchSizeSelectorOptionsSfl: '.pw-swatch__items > div button',
        bagProductTitle:
            '.dbh-product-list .c-product-item:nth-child(1) .dbh-product-title',
        bagProductTrash:
            '.dbh-product-list .c-product-item:nth-child(1) .dbh-remove'
    }
} else {
    selectors = {
        checkoutButton: '.t-cart__button .dbh-secure-checkout',
        checkoutButton2: '.t-cart__button .dbh-secure-checkout',
        headerText: '.dbh-title',
        headerItemsCount: '.t-cart__product-list-title .dbh-items',
        banner1Content: '.dbh-info .pw-feedback__content',
        creditCardInfo: '.dbh-mastercard strong',
        beautyCardInfo: '.dbh-beautyclub strong',
        totalItemsCount: '.dbh-items .pw-ledger__item',
        productValue: '.dbh-items .pw-ledger__value',
        productDiscountValue: '.pw-ledger tr:nth-child(2) .pw-ledger__value',
        productDiscountText: '.pw-ledger tr:nth-child(2) .pw-ledger__item',
        discountValue: '.pw-ledger tr:nth-child(2) .pw-ledger__value',
        discountValueWithPD: '.pw-ledger tr:nth-child(3) .pw-ledger__value',
        subtotalValue:
            '.t-cart__product-button-sticky-button-text-wrapper .u-text-weight-bold',
        firstProductName: '.pw-list > article:nth-child(1) .dbh-product-title',
        firstProductSaveForLater:
            '.pw-list > article:nth-child(1) .dbh-save-for-later > div',
        firstProductRemove: '.pw-list > article:nth-child(1) .dbh-remove > div',
        removepopUpHeaderText: '.dbh-remove-product-warning',
        removePopUpImage: '.dbh-product-image img',
        removePopUpClose: '.dbh-close-button div',
        removePopUpYesButton: '.dbh-remove-item-button',
        removePopUpSaveLaterButton: '.dbh-save-for-later-button div',
        promoCodeAccordion: '.pw-accordion__close-icon',
        promoCodeApply: '.dbh-apply-promocode',
        promoCodeField: '.dbh-promocode',
        promoCodeErrorMessage: '.pw-accordion__content .pw-field__error',
        promoCodeHeaderErrorMessage: '.c-notification__content',
        promoCodeAppliedText: '.dbh-applied-promocode .pw-feedback__content',
        promoCodeRemove: '.dbh-applied-promocode .pw-button__inner',
        allProductNameElements: '.t-cart__product-list .dbh-product-title',
        priceSummaryTableContentElements: '.t-cart__summary-wrapper table tr',
        totalItemsRow: '.dbh-items',
        discountRows: '.dbh-discounts',
        subtotalRow: '.dbh-subtotal',
        emptyBagHeaderText: '.t-mini-cart__empty-title',
        emptyBagBodyText: '.t-cart__empty p:nth-child(1)',
        emptyBagContinueButton: '.t-cart__empty button',
        freeDelveryQualifyMessage: '.dbh-info .pw-feedback__content',
        deliveryOptionTooltip: '.pw-tabs__panels',
        ProductPrice: '.dbh-product-price',
        promoCodeAccordionInt: '#accordion__header-3',
        promoCodeHeaderErrorMessageInt:
            '.c-notification.u-error-notification__content.u-flex.u-padding-lg:nth-child(1)',
        promoCodeHeaderErrorMessage1Int:
            '.pw-dangerous-html.pw-feedback__content > div:nth-child(1)',
        incrementStepper: 'button.pw--increment',
        countInputField: 'input.pw-stepper__input',
        selectedFabricColor: '.dbh-option:nth-child(1)',
        selectedFeetColor: '.dbh-option:nth-child(1)',
        saveForLaterAccordion:
            '.t-cart-saved-items__accordion .pw-accordion__header',
        standardDeliveryOption:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__strip li:nth-child(1) button',
        nextDayDeliveryOption:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__strip li:nth-child(2) button',
        nomDayDeliveryOption:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__strip li:nth-child(3) button',
        nextNomDayDeliveryOption:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__strip li:nth-child(2) button',
        clickAndCollectDeliveryOption:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__strip li:nth-child(4) button',
        clickAndCollectDeliveryOptionDebenhams:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__strip li:nth-child(3) button',
        clickAndCollectDeliveryOptionHermes:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__strip li:nth-child(4) button',
        internationalDeliveryOption:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__strip li:nth-child(5) button',
        internationalDeliveryOptionForINT:
            '.pw-list > div:nth-child(elem) .dbh-delivery-options .pw-tabs__strip li:nth-child(1) button',
        standardDeliveryOptionTooltipText:
            '.pw-list > div:nth-child(elem) .dbh-standard-text p',
        nextDayDeliveryOptionTooltipText:
            '.pw-list > div:nth-child(elem) .dbh-delivery-next-day-text p',
        nomDayDeliveryOptionTooltipText:
            ' .pw-list > div:nth-child(elem) .dbh-delivery-day-evening-text p',
        clickAndCollectDeliveryOptionTooltipText:
            '.pw-list > div:nth-child(elem) .dbh-delivery-click-collect-text p',
        internationalDeliveryOptionTooltipText:
            '.pw-list > div:nth-child(elem) .dbh-international-text p',
        nextNomDayDeliveryOptionTooltipText:
            '.pw-list > div:nth-child(elem) .dbh-nextOrNominatedDay-text p',
        clickAndCollectDeliveryOptionDebenhamsTooltipText:
            '.pw-list > div:nth-child(elem) .dbh-collectFromStore-text p',
        clickAndCollectDeliveryOptionHermesTooltipText:
            '.pw-list > div:nth-child(elem) .dbh-collectFromParcelShop-text p',
        unavailCCExpressDeliveryOptionHermesTooltipText:
            '.pw-list > div:nth-child(elem) .dbh-collectFromParcelShop-text p .delivery-option-info--unavailable',
        unavailableDeliveryOption: '.c-disabled.dbh-close',
        unavailableDeliveryOptionTooltip: '.pw-tabs__panels .c-disabled',
        addToBag: '.dbh-choose-options',
        emptyBagMessage: '.dbh-empty-text-header',
        emptyBagLogo: '.t-mini-cart__empty-img',
        continueShoppingCTA: '.dbh-continue-shopping',
        availableDeliveryOption: '.dbh-check',
        productImage: '.dbh-product-image',
        sflProducts:
            '.dbh-my-saved-items-scroller .t-my-saved-items__item-details',
        sflProductsImg: '.dbh-my-saved-items-scroller .dbh-product-image',
        sflProductsTitle:
            '.dbh-my-saved-items-scroller .t-my-saved-items__item-description h2',
        sflProduct5:
            '.dbh-my-saved-items-scroller .pw-scroller__item:nth-child(5) .dbh-product-image',
        sflProductRemove: '.dbh-my-saved-items-scroller .dbh-remove',
        sflProduct1:
            '.dbh-my-saved-items-scroller .pw-scroller__item:nth-child(1) .dbh-product-image',
        sflChooseOptionsP1:
            '.dbh-my-saved-items-scroller .pw-scroller__item:nth-child(1) .dbh-choose-options',
        sflAddToBagP1: '.dbh-remove-item-button',
        sflRemoveP1:
            '.dbh-my-saved-items-scroller .pw-scroller__item:nth-child(1) .dbh-remove',
        finanaceBannerApplyLink: '.fb-applynow__link',
        sizeDropdownOptionElements:
            '.t-product-details__size-dropdown select option',
        saveForLaterFirstProductName:
            '.dbh-my-saved-items-scroller article:nth-child(1) .dbh-product-title',
        removeTrashIconsMyBag: '.pw-list > article .dbh-remove',
        removeTrashIconsSFL:
            '.dbh-my-saved-items-carousel .dbh-saved-items-carousel-item > article .dbh-remove',
        financeBanner: '.t-finance-banner__content',
        financeBannerHeader:
            '.t-finance-banner__content .t-fbanner__offer span:nth-child(1)',
        financeBannerAmount:
            '.t-finance-banner__content .t-fbanner__offer span:nth-child(2)',
        deliveryOptionSection: '.dbh-delivery-options',
        bagProductList: '.dbh-product-list .c-product-item .dbh-product-title',
        mySavedItemsProductNameList:
            '.dbh-my-saved-items-scroller .dbh-product-title',
        mySavedItemsProductName:
            '.pw-scroller__content .pw-scroller__item:nth-child(1) .c-product-item .dbh-product-title',
        mySavedItemsChooseOptionButtonList:
            '.pw-scroller__content .pw-scroller__item:nth-child(1) .c-product-item .dbh-choose-options',
        mySavedItemsChooseOptionNextButton:
            '.pw-carousel__next button.pw-button',
        mySavedItemsChooseOptionPopUpAddToBagButton:
            '.pw-sheet__content .dbh-remove-item-button',
        swatchSizeSelectorOptionsSfl: '.pw-swatch__items > div button',
        bagProductTitle:
            '.dbh-product-list .c-product-item:nth-child(1) .dbh-product-title',
        bagProductTrash:
            '.dbh-product-list .c-product-item:nth-child(1) .dbh-remove'
    }
}

const myBag = function() {
    this.selectors = selectors
}

export default myBag
