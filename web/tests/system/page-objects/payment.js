const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        headerText: '.dbh-payment-title',
        creditCardPointText: '.dbh-card-points .pw-feedback__content',
        creditCardPointIcon: '.dbh-card-points svg',
        orderSummaryAccordion: '.dbh-top-summary button',
        deliveryType: '.dbh-top-summary .dbh-delivery-type',
        deliveryIcon: '.dbh-top-summary .dbh-delivery-icon',
        changeDeliveryMethod: '.dbh-top-summary .dbh-change-delivery',
        deliveryAddress: '.dbh-top-summary .dbh-details',
        changeDeliveryAddress:
            '.dbh-top-summary .dbh-details .dbh-change-delivery',
        changeStore: '.dbh-top-summary .dbh-details .dbh-change-delivery',
        deliveryEstimationText: '.dbh-top-summary .dbh-delivery-estimation',
        orderSummaryProductList: '.dbh-top-summary',
        productNameElements: '.dbh-top-summary .dbh-product-title',
        productImageElements: '.dbh-top-summary .dbh-product-image',
        productSwatchElements: '.dbh-top-summary .dbh-options',
        productQuantityElements: '.dbh-top-summary .dbh-product-quantity',
        productPriceElements: '.dbh-top-summary .dbh-product-price',
        editShoppingBagLink: '.dbh-top-summary .dbh-edit-shopping-bag',
        promoCodeAccordion: '.dbh-promo-code button',
        dutyAndTaxNotification: '.pw-tax-info',
        findOutMoreLink: '.pw-tax-info a',
        promoCodeInputField: '.dbh-promo-code .dbh-promocode',
        promoCodeApply: '.dbh-promo-code .dbh-apply-promocode',
        promoCodeAppliedNotification: '.dbh-applied-promocode',
        promoCodeAppliedNotificationMessage:
            '.dbh-applied-promocode .pw-feedback__content>div',
        promoCodeRemoveLink: '.dbh-applied-promocode .remove-button button',
        promoDiscounts: '.dbh-promo-discounts',
        paymentMethodHeaderText: '.t-checkout-payment__title',
        beautyClubCardPointText: '.dbh-earn-beauty-points-message',
        beautyClubCardPointPreID:
            '.dbh-loyalty-card-form .t-checkout-payment__field-earn-bcc-prefix',
        beautyClubCardPointIDField:
            '.dbh-loyalty-card-form .dbh-loyalty-number',
        beautyClubCardPointIDError: '.dbh-loyalty-card-form .pw-field__error',
        beautyClubCardPointApply:
            '.dbh-loyalty-card-form .dbh-loyalty-card-apply-btn',
        beautyClubCardPointContainer: '.dbh-loyalty-card-container',
        beautyClubCardPointContainerText: '.dbh-loyalty-card-container p',
        beautyClubCardPointContainerSpan: '.dbh-loyalty-card-container span',
        beautyClubCardPointIDApplied:
            '.dbh-loyalty-card-container .dbh-loyalty-number',
        beautyClubCardPointRemoveLink:
            '.dbh-loyalty-card-container .dbh-remove-loyalty-card-link',
        beautyClubCardPointError: '.pw-field__error',
        beautyCardAccordion: '.dbh-BeautyCard button',
        beautyCardAccordionTitle:
            '.dbh-BeautyCard .pw-accordion__title .pw-accordion__title',
        beautyCardAccordionInfo:
            '.dbh-beauty-club-card-container .pw-accordion__info',
        beautyCardImages: '.dbh-BeautyCard .t-checkout-payment__form svg',
        beautyCardPreID:
            '.dbh-BeautyCard .dbh-bccCardNumber .t-checkout-payment__field-bcc-prefix',
        beautyCardIDField:
            '.dbh-BeautyCard .dbh-bccCardNumber .t-checkout-payment__field-bcc-card-number',
        beautyCardIDError:
            '.dbh-BeautyCard .dbh-bccCardNumber .pw-field__error',
        beautyCardPinField: '.dbh-BeautyCard .dbh-bccCardPin input',
        beautyCardPinError: '.dbh-BeautyCard .dbh-bccCardPin .pw-field__error',
        beautyCardSaveCheckbox: '.dbh-BeautyCard .dbh-save-details input',
        beautyCardValue:
            '.dbh-BeautyCard .t-checkout-payment__card-balance span',
        beautyCardApplyButton: '.dbh-BeautyCard .dbh-apply-button',
        beautyCardAppliedText:
            '.dbh-BeautyCard .dbh-applied-card .dbh-applied-card-label',
        beautyCardAppliedCard:
            '.dbh-BeautyCard .dbh-applied-card .dbh-applied-card-number',
        beautyCardAppliedValue: '.t-checkout-payment__card-balance span',
        beautyCardAppliedRemoveLink:
            '.dbh-BeautyCard .dbh-applied-card .dbh-applied-card-remove-link',
        giftCardAccordion: '.dbh-GiftCard button',
        giftCardAccordionLabel: '.dbh-GiftCard .pw-accordion__title',
        giftCardHeaderText: '.dbh-GiftCard .dbh-new-card p',
        giftCardIDField: '.dbh-GiftCard .dbh-gcCardNumber input',
        giftCardIDError: '.dbh-GiftCard .dbh-gcCardNumber .pw-field__error',
        giftCardPinField: '.dbh-GiftCard .dbh-gcCardPin input',
        giftCardPinError: '.dbh-GiftCard .dbh-gcCardPin .pw-field__error',
        giftCardValue: '.dbh-GiftCard .t-checkout-payment__card-balance span',
        giftCardApplyButton: '.dbh-GiftCard .dbh-apply-button',
        giftCard1AppliedText:
            '.dbh-GiftCard .pw-accordion__content .dbh-applied-card:nth-child(1) .dbh-applied-card-label',
        giftCard2AppliedText:
            '.dbh-GiftCard .pw-accordion__content .dbh-applied-card:nth-child(1) .dbh-applied-card-label',
        giftCard1AppliedCard:
            '.dbh-GiftCard .pw-accordion__content .dbh-applied-card:nth-child(1) .dbh-applied-card-number',
        giftCard1AppliedCardRow:
            '.dbh-GiftCard .pw-accordion__content .dbh-applied-card',
        giftCard2AppliedCard:
            '.dbh-GiftCard .pw-accordion__content .dbh-applied-card:nth-child(2) .dbh-applied-card-number',
        giftCard1AppliedValue:
            '.dbh-GiftCard > div:nth-child(2) .dbh-applied-card-amount-total',
        giftCard1AppliedRemoveLink:
            '.dbh-GiftCard .pw-accordion__content .dbh-applied-card:nth-child(1) .dbh-applied-card-remove-link',
        giftCard2AppliedRemoveLink:
            '.dbh-GiftCard .pw-accordion__content .dbh-applied-card:nth-child(2) .dbh-applied-card-remove-link',
        giftCardAddAnotherCardLink:
            '.dbh-GiftCard .dbh-add-another-card-link a',
        giftCardAddAnotherText: '.dbh-GiftCard .dbh-new-card h4',
        // creditCardAccordion: '.dbh-CreditDebitCard button',
        creditCardAccordion:
            '.dbh-CreditDebitCard .t-checkout-payment__card-label',
        securePayment: '.t-checkout-payment__form-secure-payment>span',
        padLockIcon: '.t-checkout-payment__form-secure-payment>svg',
        creditCardIcons: '.dbh-CreditDebitCard .dbh-card-icons',
        storeCardIcon: '.dbh-card-icons>li:nth-child(1) use',
        masterCardIcon: '.dbh-card-icons>li:nth-child(2) use',
        visaCardIcon: '.dbh-card-icons>li:nth-child(3) use',
        amexCardIcon: '.dbh-card-icons>li:nth-child(4) use',
        maestroCardIcon: '.dbh-card-icons>li:nth-child(5) use',
        jcbCardIcon: '.dbh-card-icons>li:nth-child(6) use',
        masterCardIconINT: '.dbh-card-icons>li:nth-child(1) use',
        visaCardIconINT: '.dbh-card-icons>li:nth-child(2) use',
        maestroCardIconINT: '.dbh-card-icons>li:nth-child(3) use',
        creditCardIDField: '.dbh-CreditDebitCard .dbh-card-number input',
        creditCardIDError:
            '.dbh-CreditDebitCard .dbh-card-number .pw-field__error',
        creditCardIconOnField: '.dbh-CreditDebitCard .dbh-card-number svg',
        expirtyDate: '.dbh-expiry-month label',
        creditCardExpiryMonth: '.dbh-expiry-month select option:nth-child(1)',
        creditCardExpireMonth: '.dbh-expire-month select option:nth-child(1)',
        creditCardExpiryYear:
            '.dbh-CreditDebitCard .dbh-expiry-year select option:nth-child(1)',
        creditCardDateJanMonth:
            '.dbh-CreditDebitCard .dbh-expiry-month select [value="01"]',
        creditCardDateNextYear:
            '.dbh-CreditDebitCard .dbh-expiry-year select option:nth-child(3)',
        creditCardExpiryDateError:
            '.dbh-CreditDebitCard .dbh-expiry-month .pw-field__error',
        creditCardSecurityNumberLabel: '.dbh-security-number label',
        creditCardSecurityNumberIcon: '.dbh-security-number svg',
        creditCardSecurityNumberHint: '.dbh-digits',
        creditCardSecurityNumber:
            '.dbh-CreditDebitCard .dbh-security-number .dbh-cvv-number input',
        creditCardSecurityNumError:
            '.dbh-CreditDebitCard .dbh-security-number .pw-field__error',
        creditCardDigitsText:
            '.dbh-CreditDebitCard .dbh-security-no-component .dbh-digits',
        billingAddressHeaderText:
            '.dbh-CreditDebitCard .t-checkout-payment__title',
        savedAddressText:
            '.dbh-CreditDebitCard .dbh-savedUserAddressRadio label',
        newAddressText: '.dbh-CreditDebitCard .dbh-newAddressRadio label',
        titleMrs: '.dbh-CreditDebitCard .dbh-title [value="Mrs"]',
        firstNameField: '.dbh-CreditDebitCard .dbh-first-name input',
        firstNameError: '.dbh-CreditDebitCard .dbh-first-name .pw-field__error',
        lastNameField: '.dbh-CreditDebitCard .dbh-last-name input',
        lastNameError: '.dbh-CreditDebitCard .dbh-last-name .pw-field__error',
        phoneNumberField: '.dbh-CreditDebitCard .dbh-phone-number input',
        phoneNumberError:
            '.dbh-CreditDebitCard .dbh-phone-number .pw-field__error',
        countryGB: '.dbh-CreditDebitCard .dbh-country [value="GB"]',
        houseNumberField: '.dbh-CreditDebitCard .dbh-house-number input',
        postcodeField: '.dbh-CreditDebitCard .dbh-postcode input',
        postcodeError: '.dbh-CreditDebitCard .dbh-postcode .pw-field__error',
        findAddressButton: '.dbh-CreditDebitCard .dbh-find-address',
        findAddressButton1: '.dbh-CreditDebitCard .dbh-find-address',
        enterAddressManuallyLink:
            '.dbh-CreditDebitCard .dbh-enter-manually div',
        bfpoLink: '.dbh-CreditDebitCard .dbh-bfpo',
        addressOne:
            '.dbh-CreditDebitCard .dbh-address-list option:nth-child(1)',
        addressTwo:
            '.dbh-CreditDebitCard .dbh-address-list option:nth-child(2)',
        useAddressButton: '.dbh-CreditDebitCard .dbh-submit',
        cantFindAddressLink: '.dbh-CreditDebitCard .dbh-enter-manually div',
        findAnotherAddressLink:
            '.dbh-CreditDebitCard .dbh-find-another-address div',
        searchPostcodeLink: '.dbh-CreditDebitCard .dbh-search-by div',
        bfpoCloseIcon: '.dbh-modal-header .dbh-close-button',
        bfpoCloseButton: '.dbh-modal-footer .dbh-close-button',
        bfpoHeaderText: '.dbh-modal-content h2',
        editAddressLink: '.dbh-CreditDebitCard .dbh-edit-this-address div',
        addNewAddressLink: '.dbh-CreditDebitCard .dbh-add-another-address div',
        placeOrderButton: '.dbh-place-order',
        placeOrderPayPalButton:
            '.t-checkout-payment__place-order-button--paypal',
        payPalSection: 'section[id="login"]',
        payPalLogo: '#login p.paypal-logo-long',
        payPalTagLine: '#emailSubTagLine',
        payPalEmailField: '#email',
        payPalNextBtn: '#btnNext',
        payPalPasswordField: '#password',
        paypalLoginBtn: '#btnLogin',
        payPalBanner: '.PersonalizedBanner_Container_3tR4U span',
        payPalShippingName: '.SingleShippingAddress_name_3siDP',
        payPalShippingAddress: '.SingleShippingAddress_addresses_2ZZjf',
        payPalPayNowBtn: '#payment-submit-btn',
        termsConditionText:
            '.dbh-total-summary-container div:nth-child(4) div:nth-child(2)>div',
        internationaltermsConditionText:
            '.dbh-total-summary-container div:nth-child(4) div:nth-child(3)>div',
        internationaltermsConditionLink:
            '.dbh-total-summary-container div:nth-child(4) div:nth-child(3)>div>a:nth-child(1)',
        dutiesTaxesText:
            '.dbh-total-summary-container div:nth-child(4) div:nth-child(2)>div',
        dutiesTaxesLink:
            '.dbh-total-summary-container div:nth-child(4) div:nth-child(2)>div a',
        termsConditionLink:
            '.dbh-total-summary-container div:nth-child(4) div:nth-child(2)>div>a:nth-child(1)',
        privacyPolicyText: '.dbh-privacy-policy',
        privacyPolicyLinkPaymentPage:
            '.dbh-total-summary-container div:nth-child(4) div:nth-child(2)>div>a~a',
        internationalprivacyPolicyLinkPaymentPage:
            '.dbh-total-summary-container div:nth-child(4) div:nth-child(3)>div>a~a',
        marketingPreferences:
            '.pw-field-row .t-checkout-payment__privacy-policy',
        errorMessage: '.t-checkout-payment__generic-error',
        errorMessageClose: '.u-error-notification__action .pw-button__inner',
        productQuantityPPage: '.dbh-total-items td.pw-ledger__item',
        productCostPPage: '.dbh-total-items td.pw-ledger__value',
        shippingType: '.dbh-shipping-mode td.pw-ledger__item',
        shippingCost: '.dbh-shipping-mode td.pw-ledger__value',
        totalPayText: '.dbh-total-to-pay td.pw-ledger__item',
        totalPayValue: '.dbh-total-to-pay td.pw-ledger__value',
        newsLetterRadioButton: '.dbh-receive-newsletters',
        orderSummaryAccordionInt: '.dbh-top-summary button',
        promoCodeAccordionInt: '.dbh-promo-code button',
        deliveryTypeInt: '.dbh-top-summary .dbh-delivery-type',
        payPalAccordion: '.dbh-PayPal',
        payPalAccordionTitle: '.dbh-PayPal span',
        payPalAccordionText: '.dbh-PayPal .t-checkout-payment__card>div',
        countryAU: '.dbh-CreditDebitCard .dbh-country [value="AU"]',
        suburbcityField:
            '.dbh-city div.pw-field__inner.pw--stack div.pw-field__input > input:nth-child(1)',
        billingzipcode:
            '.dbh-zipCode div.pw-field__inner.pw--stack div.pw-field__input > input:nth-child(1)',
        addressline1Field: '.dbh-address-line1 input:nth-child(1)',
        addressInput: '.dbh-address-line1 input',
        city: '.dbh-city input',
        eirCode: '.dbh-zipCode input',
        county: '[name=state]',
        title: '.dbh-title [value="Mrs"]',
        firstName: '.dbh-first-name input',
        lastName: '.dbh-last-name input',
        phoneNumber: '.dbh-phone-number input',
        termConditionLink:
            '.u-margin-top-lg .pw-dangerous-html.u-padding-top-md.u-color-neutral-50 a:nth-child(1)',
        privacyPolicyLink: '.dbh-privacy-policy span a',
        addNewBillingAddressForm: '.t-payment-address-form__elements',
        newPaymentCardForm: '.dbh-card-form',
        saveThisCardCheckbox: '.dbh-save-card-details',
        sameAsDeliveryAddress: '.dbh-savedUserAddressRadio',
        sameAsDeliveryAddressRadioLabel:
            '.dbh-savedUserAddressRadio .pw-field__label-wrap',
        sameAsDeliveryAddressRadioButton: '.dbh-savedUserAddressRadio input',
        useNewBillingAddressRadioButton: '.dbh-newAddressRadio input',
        newBillingAddress: '.dbh-newAddressRadio',
        requiredFieldCopy: '',
        titleDropDown: '.dbh-title select',
        findAddressField: '.dbh-full-address input',
        useThisAddressCTA: '.dbh-submit',
        invalidPromoCodeErrorMessage: '.pw-feedback-error.dbh-info b',
        promoCodeInlineErrorMessage: '.c-promo-code-form .pw-field__error',
        footerPaymentLabel: 'app.payment.footerLabel',
        rewardClubCardPointText: '.dbh-earn-beauty-points-message',
        rewardClubCardPointPreID:
            '.dbh-loyalty-card-form .t-checkout-payment__field-earn-bcc-prefix',
        rewardClubCardPointIDField:
            '.dbh-loyalty-card-form .dbh-loyalty-number',
        rewardClubCardPointIDError: '.dbh-loyalty-card-form .pw-field__error',
        rewardClubCardPointApply:
            '.dbh-loyalty-card-form .dbh-loyalty-card-apply-btn',
        rewardClubCardPointContainer: '.dbh-loyalty-card-container',
        rewardClubCardPointContainerText: '.dbh-loyalty-card-container p',
        rewardClubCardPointContainerSpan: '.dbh-loyalty-card-container span',
        rewardClubCardPointIDApplied:
            '.dbh-loyalty-card-container .dbh-loyalty-number',
        rewardClubCardPointRemoveLink:
            '.dbh-loyalty-card-container .dbh-remove-loyalty-card-link',
        rewardClubCardPointHeaderError: '.c-notification-error__msg',
        rewardCardAccordion: '.dbh-BeautyCard button',
        rewardCardAccordionTitle:
            '.dbh-BeautyCard .pw-accordion__title .pw-accordion__title',
        rewardCardAccordionInfo:
            '.dbh-beauty-club-card-container .pw-accordion__info',
        rewardCardImages: '.dbh-BeautyCard .t-checkout-payment__form svg',
        rewardCardPreID:
            '.dbh-BeautyCard .dbh-bccCardNumber .t-checkout-payment__field-bcc-prefix',
        rewardCardIDField:
            '.dbh-BeautyCard .dbh-bccCardNumber .t-checkout-payment__field-bcc-card-number',
        rewardCardIDError:
            '.dbh-BeautyCard .dbh-bccCardNumber .pw-field__error',
        rewardCardPinField: '.dbh-BeautyCard .dbh-bccCardPin input',
        rewardCardPinError: '.dbh-BeautyCard .dbh-bccCardPin .pw-field__error',
        rewardCardSaveCheckbox: '.dbh-BeautyCard .dbh-save-details input',
        rewardCardValue:
            '.dbh-BeautyCard .t-checkout-payment__card-balance span',
        rewardCardApplyButton: '.dbh-BeautyCard .dbh-apply-button',
        rewardCardAppliedText:
            '.dbh-BeautyCard .dbh-applied-card .dbh-applied-card-label',
        rewardCardAppliedCard:
            '.dbh-BeautyCard .dbh-applied-card .dbh-applied-card-number',
        rewardCardAppliedValue: '.t-checkout-payment__card-balance span',
        rewardCardAppliedRemoveLink:
            '.dbh-BeautyCard .dbh-applied-card .dbh-applied-card-remove-link',
        genericErrorMessage: '.t-checkout-payment__generic-error',
        masterCardIconRoi: '.dbh-card-icons>li:nth-child(1) use',
        visaCardIconRoi: '.dbh-card-icons>li:nth-child(2) use',
        amexCardIconRoi: '.dbh-card-icons>li:nth-child(3) use',
        maestroCardIconRoi: '.dbh-card-icons>li:nth-child(4) use',
        beInTheNowText: '.dbh-privacy-policy span b',
        savedCardList: '.dbh-use-existing-card',
        addNewPaymentCardLink: '.t-checkout-payment__add-new-card',
        selectCardText: '.dbh-existing-card h2',
        genericPaymentError:
            '.t-checkout-payment__main-container .pw-feedback-error .pw-dangerous-html div',
        threeDSiFrame: '.t-checkout-payment__iframe',
        threeDSProgressNotification: '.t-checkout-payment-progress__feedback',
        hermesStoreLogo: '.c-payment-collection-details__icon--hermes-logo-bg',
        debsStoreLogo: '.c-payment-collection-details__icon--debenhams-logo-bg',
        storeName: '.c-payment-collection-details__name',
        deliveryMode: '.dbh-total-summary .dbh-shipping-mode .pw-ledger__item',
        deliveryCost: '.dbh-total-summary .dbh-shipping-mode .pw-ledger__value',
        threeDSPassword: '#password',
        threeDSScreenOtpTextInfo: '.canvas .challengeinfotext',
        threeDSOTtpInputBox: 'input[name="challengeDataEntry"]',
        genericNotAuthError: '.dbh-info .pw-dangerous-html',
        threeDsCardinalIframe: '#Cardinal-CCA-IFrame',
        threeDsSubmitButton: 'input[type="submit"]'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        headerText: '.dbh-payment-title',
        creditCardPointText: '.dbh-card-points .pw-feedback__content',
        orderSummaryAccordion: '.dbh-top-summary button',
        deliveryType: '.dbh-top-summary .dbh-delivery-type',
        changeDeliveryMethod: '.dbh-top-summary .dbh-change-delivery',
        deliveryEstimationText: '.dbh-top-summary .dbh-delivery-estimation',
        productNamesElements: '.dbh-top-summary .dbh-product-title',
        editShoppingBagLink: '.dbh-edit-shopping-bag',
        promoCodeAccordion: '.dbh-promo-code button',
        promoCodeInputField: '.dbh-promo-code .dbh-promocode',
        promoCodeApply: '.dbh-promo-code .dbh-apply-promocode',
        paymentMethodHeaderTest: '.t-checkout-payment__title h2',
        beautyClubCardPointText: '.dbh-earn-beauty-points-message',
        beautyClubCardPointPreID:
            '.dbh-loyalty-card-form .t-checkout-payment__field-earn-bcc-prefix',
        beautyClubCardPointIDField:
            '.dbh-loyalty-card-form .dbh-loyalty-number',
        beautyClubCardPointIDError: '.dbh-loyalty-card-form .pw-field__error',
        beautyClubCardPointApply:
            '.dbh-loyalty-card-form .dbh-loyalty-card-apply-btn',
        beautyClubCardPointIDApplied:
            '.dbh-loyalty-card-container .dbh-loyalty-number',
        beautyClubCardPointRemoveLink:
            '.dbh-loyalty-card-container .dbh-remove-loyalty-card-link',
        beautyCardAccordion: '.dbh-BeautyCard button',
        beautyCardPreID:
            '.dbh-BeautyCard .dbh-bccCardNumber .t-checkout-payment__field-bcc-prefix',
        beautyCardIDField:
            '.dbh-BeautyCard .dbh-bccCardNumber .t-checkout-payment__field-bcc-card-number',
        beautyCardIDError:
            '.dbh-BeautyCard .dbh-bccCardNumber .pw-field__error',
        beautyCardPinField: '.dbh-BeautyCard .dbh-bccCardPin input',
        beautyCardPinError: '.dbh-BeautyCard .dbh-bccCardPin .pw-field__error',
        beautyCardSaveCheckbox: '.dbh-BeautyCard .dbh-save-details input',
        beautyCardValue:
            '.dbh-BeautyCard .t-checkout-payment__card-balance span',
        beautyCardApplyButton: '.dbh-BeautyCard .dbh-apply-button',
        beautyCardAppliedText:
            '.dbh-BeautyCard .dbh-applied-card .dbh-applied-card-label',
        beautyCardAppliedCard:
            '.dbh-BeautyCard .dbh-applied-card .dbh-applied-card-number',
        beautyCardAppliedValue:
            '.dbh-BeautyCard .dbh-applied-card .dbh-applied-card-amount-total',
        beautyCardAppliedRemoveLink:
            '.dbh-BeautyCard .dbh-applied-card .dbh-applied-card-remove-link',
        giftCardAccordion: '.dbh-GiftCard button',
        giftCardHeaderText: '.dbh-GiftCard .dbh-new-card p',
        giftCardIDField: '.dbh-GiftCard .dbh-gcCardNumber input',
        giftCardIDError: '.dbh-GiftCard .dbh-gcCardNumber .pw-field__error',
        giftCardPinField: '.dbh-GiftCard .dbh-gcCardPin input',
        giftCardPinError: '.dbh-GiftCard .dbh-gcCardPin .pw-field__error',
        giftCardValue: '.dbh-GiftCard .t-checkout-payment__card-balance span',
        giftCardApplyButton: '.dbh-GiftCard .dbh-apply-button',
        giftCard1AppliedText:
            '.dbh-GiftCard > div:nth-child(2) .dbh-applied-card-label',
        giftCard1AppliedCard:
            '.dbh-GiftCard > div:nth-child(2) .dbh-applied-card-number',
        giftCard1AppliedValue:
            '.dbh-GiftCard > div:nth-child(2) .dbh-applied-card-amount-total',
        giftCard1AppliedRemoveLink:
            '.dbh-GiftCard > div:nth-child(2) .dbh-applied-card-remove-link',
        giftCardAddAnotherCardLink:
            '.dbh-GiftCard .dbh-add-another-card-link a',
        giftCardAddAnotherText: '.dbh-GiftCard .dbh-new-card h4',
        // creditCardAccordion: '.dbh-CreditDebitCard button',
        creditCardAccordion:
            '.dbh-CreditDebitCard .t-checkout-payment__card-label',
        creditCardIcons: '.dbh-CreditDebitCard .dbh-card-icons',
        creditCardIDField: '.dbh-CreditDebitCard .dbh-card-number input',
        creditCardIDError:
            '.dbh-CreditDebitCard .dbh-card-number .pw-field__error',
        creditCardIconOnField: '.dbh-CreditDebitCard .dbh-card-number svg',
        creditCardExpiryMonth: '.dbh-expiry-month select option:nth-child(1)',
        creditCardExpireMonth: '.dbh-expire-month select option:nth-child(1)',
        creditCardExpiryYear:
            '.dbh-CreditDebitCard .dbh-expiry-year select option:nth-child(1)',
        creditCardDateJanMonth:
            '.dbh-CreditDebitCard .dbh-expiry-month select [value="01"]',
        creditCardDateNextYear:
            '.dbh-CreditDebitCard .dbh-expiry-year select option:nth-child(3)',
        creditCardExpiryDateError:
            '.dbh-CreditDebitCard .dbh-expiry-month .pw-field__error',
        creditCardSecurityNumber:
            '.dbh-CreditDebitCard .dbh-security-number .dbh-cvv-number input',
        creditCardSecurityNumError:
            '.dbh-CreditDebitCard .dbh-security-number .pw-field__error',
        creditCardDigitsText:
            '.dbh-CreditDebitCard .dbh-security-no-component .dbh-digits',
        billingAddressHeaderText:
            '.dbh-CreditDebitCard .t-checkout-payment__title',
        savedAddressText:
            '.dbh-CreditDebitCard .dbh-savedUserAddressRadio label',
        newAddressText: '.dbh-CreditDebitCard .dbh-newAddressRadio label',
        titleMrs: '.dbh-CreditDebitCard .dbh-title [value="Mrs"]',
        firstNameField: '.dbh-CreditDebitCard .dbh-first-name input',
        firstNameError: '.dbh-CreditDebitCard .dbh-first-name .pw-field__error',
        lastNameField: '.dbh-CreditDebitCard .dbh-last-name input',
        lastNameError: '.dbh-CreditDebitCard .dbh-last-name .pw-field__error',
        phoneNumberField: '.dbh-CreditDebitCard .dbh-phone-number input',
        phoneNumberError:
            '.dbh-CreditDebitCard .dbh-phone-number .pw-field__error',
        countryGB: '.dbh-CreditDebitCard .dbh-country [value="GB"]',
        houseNumberField: '.dbh-CreditDebitCard .dbh-house-number input',
        postcodeField: '.dbh-CreditDebitCard .dbh-postcode input',
        postcodeError: '.dbh-CreditDebitCard .dbh-postcode .pw-field__error',
        findAddressButton: '.dbh-CreditDebitCard .dbh-find-address',
        findAddressButton1: '.dbh-CreditDebitCard .dbh-find-address',
        enterAddressManuallyLink:
            '.dbh-CreditDebitCard .dbh-enter-manually div',
        bfpoLink: '.dbh-CreditDebitCard .dbh-bfpo',
        addressOne:
            '.dbh-CreditDebitCard .dbh-address-list option:nth-child(1)',
        addressTwo:
            '.dbh-CreditDebitCard .dbh-address-list option:nth-child(2)',
        useAddressButton: '.dbh-CreditDebitCard .dbh-submit',
        cantFindAddressLink: '.dbh-CreditDebitCard .dbh-enter-manually div',
        findAnotherAddressLink:
            '.dbh-CreditDebitCard .dbh-find-another-address div',
        searchPostcodeLink: '.dbh-CreditDebitCard .dbh-search-by div',
        bfpoCloseIcon: '.dbh-modal-header .dbh-close-button',
        bfpoCloseButton: '.dbh-modal-footer .dbh-close-button',
        bfpoHeaderText: '.dbh-modal-content h2',
        editAddressLink: '.dbh-CreditDebitCard .dbh-edit-this-address div',
        addNewAddressLink: '.dbh-CreditDebitCard .dbh-add-another-address div',
        placeOrderButton: '.dbh-place-order',
        termsConditionText: '.dbh-terms-conditions',
        privacyPolicyText: '.dbh-privacy-policy',
        errorMessage: '.u-error-notification__content',
        errorMessageClose: '.u-error-notification__action .pw-button__inner',
        productQuantityPPage: '.dbh-total-items td.pw-ledger__item',
        productCostPPage: '.dbh-total-items td.pw-ledger__value',
        shippingType: '.dbh-shipping-mode td.pw-ledger__item',
        shippingCost: '.dbh-shipping-mode td.pw-ledger__value',
        totalPayText: '.dbh-total-to-pay td.pw-ledger__item',
        totalPayValue: '.dbh-total-to-pay td.pw-ledger__value',
        newsLetterRadioButton: '.dbh-receive-newsletters',
        orderSummaryAccordionInt: '.dbh-top-summary button',
        promoCodeAccordionInt: '.dbh-promo-code button',
        deliveryTypeInt: '.dbh-top-summary .dbh-delivery-type',
        payPalAccordion: '.dbh-PayPal',
        countryAU: '.dbh-CreditDebitCard .dbh-country [value="AU"]',
        suburbcityField:
            '.dbh-city div.pw-field__inner.pw--stack div.pw-field__input > input:nth-child(1)',
        billingzipcode:
            '.dbh-zipCode div.pw-field__inner.pw--stack div.pw-field__input > input:nth-child(1)',
        addressline1Field: '.dbh-address-line1 input:nth-child(1)',
        addressInput: '.dbh-address-line1 input',
        city: '.dbh-city input',
        eirCode: '.dbh-zipCode input',
        county: '[name=state]',
        title: '.dbh-title [value="Mrs"]',
        firstName: '.dbh-first-name input',
        lastName: '.dbh-last-name input',
        phoneNumber: '.dbh-phone-number input',
        termConditionLink:
            '.u-margin-top-lg .pw-dangerous-html.u-padding-top-md.u-color-neutral-50 a:nth-child(1)',
        privacyPolicyLink: '.dbh-privacy-policy span a',
        promoCodeSuccessMsg: '.dbh-applied-promocode .pw-feedback__content div',
        creditCardAccordionUk:
            '.dbh-CreditDebitCard .t-checkout-payment__card-label',
        deliveryLeadTime: '.dbh-delivery-estimation strong',
        hermesStoreLogo: '.c-payment-collection-details__icon--hermes-logo-bg',
        debsStoreLogo: '.c-payment-collection-details__icon--debenhams-logo-bg',
        storeName: '.c-payment-collection-details__name',
        deliveryMode: '.dbh-total-summary .dbh-shipping-mode .pw-ledger__item',
        deliveryCost: '.dbh-total-summary .dbh-shipping-mode .pw-ledger__value',
        genericNotAuthError: '.c-notification-error__msg',
        threeDSiFrame: '.t-checkout-payment__iframe',
        threeDSProgressNotification: '.t-checkout-payment-progress__feedback',
        threeDSPassword: '#password',
        threeDSScreenOtpTextInfo: '.canvas .challengeinfotext',
        threeDSOTtpInputBox: 'input[name="challengeDataEntry"]',
        threeDsCardinalIframe: '#Cardinal-CCA-IFrame',
        threeDsSubmitButton: 'input[type="submit"]',
        beautyCardAccordionTitle:
            '.dbh-BeautyCard .pw-accordion__title .pw-accordion__title'
    }
} else {
    selectors = {
        headerText: '.dbh-payment-title',
        creditCardPointText: '.dbh-card-points .pw-feedback__content',
        orderSummaryAccordion: '.dbh-top-summary button',
        // orderSummaryAccordion: '.dbh-bottom-summary button',
        // deliveryType: '.dbh-bottom-summary .dbh-delivery-type',
        deliveryType: '.dbh-delivery-type',
        changeDeliveryMethod:
            '.c-payment-collection-details__link .dbh-change-delivery',
        deliveryEstimationText:
            '.dbh-top-summary .dbh-order-summary .dbh-delivery-estimation',
        productNamesElements:
            '.dbh-top-summary .dbh-order-summary .dbh-product-title',
        editShoppingBagLink: '.dbh-edit-shopping-bag',
        promoCodeAccordion: '.dbh-promo-code button',
        // promoCodeAccordion: '.dbh-bottom-summary .dbh-promo-code button',
        promoCodeInputField: '.dbh-promo-code .dbh-promocode',
        promoCodeApply: '.dbh-promo-code .dbh-apply-promocode',
        paymentMethodHeaderTest: '.t-checkout-payment__title h2',
        beautyClubCardPointText: '.dbh-earn-beauty-points-message',
        beautyClubCardPointPreID:
            '.dbh-loyalty-card-form .t-checkout-payment__field-earn-bcc-prefix',
        beautyClubCardPointIDField:
            '.dbh-loyalty-card-form .dbh-loyalty-number',
        beautyClubCardPointIDError: '.dbh-loyalty-card-form .pw-field__error',
        beautyClubCardPointApply:
            '.dbh-loyalty-card-form .dbh-loyalty-card-apply-btn',
        beautyClubCardPointIDApplied:
            '.dbh-loyalty-card-container .dbh-loyalty-number',
        beautyClubCardPointRemoveLink:
            '.dbh-loyalty-card-container .dbh-remove-loyalty-card-link',
        beautyCardAccordion: '.dbh-BeautyCard button',
        beautyCardPreID:
            '.dbh-BeautyCard .dbh-bccCardNumber .t-checkout-payment__field-bcc-prefix',
        beautyCardIDField:
            '.dbh-BeautyCard .dbh-bccCardNumber .t-checkout-payment__field-bcc-card-number',
        beautyCardIDError:
            '.dbh-BeautyCard .dbh-bccCardNumber .pw-field__error',
        beautyCardPinField: '.dbh-BeautyCard .dbh-bccCardPin input',
        beautyCardPinError: '.dbh-BeautyCard .dbh-bccCardPin .pw-field__error',
        beautyCardSaveCheckbox: '.dbh-BeautyCard .dbh-save-details input',
        beautyCardValue:
            '.dbh-BeautyCard .t-checkout-payment__card-balance span',
        beautyCardApplyButton: '.dbh-BeautyCard .dbh-apply-button',
        beautyCardAppliedText:
            '.dbh-BeautyCard .dbh-applied-card .dbh-applied-card-label',
        beautyCardAppliedCard:
            '.dbh-BeautyCard .dbh-applied-card .dbh-applied-card-number',
        beautyCardAppliedValue:
            '.dbh-BeautyCard .dbh-applied-card .dbh-applied-card-amount-total',
        beautyCardAppliedRemoveLink:
            '.dbh-BeautyCard .dbh-applied-card .dbh-applied-card-remove-link',
        giftCardAccordion: '.dbh-GiftCard button',
        giftCardHeaderText: '.dbh-GiftCard .dbh-new-card p',
        giftCardIDField: '.dbh-GiftCard .dbh-gcCardNumber input',
        giftCardIDError: '.dbh-GiftCard .dbh-gcCardNumber .pw-field__error',
        giftCardPinField: '.dbh-GiftCard .dbh-gcCardPin input',
        giftCardPinError: '.dbh-GiftCard .dbh-gcCardPin .pw-field__error',
        giftCardValue: '.dbh-GiftCard .t-checkout-payment__card-balance span',
        giftCardApplyButton: '.dbh-GiftCard .dbh-apply-button',
        giftCard1AppliedText:
            '.dbh-GiftCard > div:nth-child(2) .dbh-applied-card-label',
        giftCard1AppliedCard:
            '.dbh-GiftCard > div:nth-child(2) .dbh-applied-card-number',
        giftCard1AppliedValue:
            '.dbh-GiftCard > div:nth-child(2) .dbh-applied-card-amount-total',
        giftCard1AppliedRemoveLink:
            '.dbh-GiftCard > div:nth-child(2) .dbh-applied-card-remove-link',
        giftCardAddAnotherCardLink:
            '.dbh-GiftCard .dbh-add-another-card-link a',
        giftCardAddAnotherText: '.dbh-GiftCard .dbh-new-card h4',
        creditCardAccordion: '.dbh-CreditDebitCard button',
        // creditCardAccordion: '.dbh-CreditDebitCard p',
        payPalAccordion: '.dbh-PayPal',
        creditCardIcons: '.dbh-CreditDebitCard .dbh-card-icons',
        creditCardIDField: '.dbh-CreditDebitCard .dbh-card-number input',
        creditCardIDError:
            '.dbh-CreditDebitCard .dbh-card-number .pw-field__error',
        creditCardIconOnField: '.dbh-CreditDebitCard .dbh-card-number svg',
        creditCardExpiryMonth:
            '.dbh-CreditDebitCard .dbh-expiry-month select option:nth-child(1)',
        creditCardExpiryYear:
            '.dbh-CreditDebitCard .dbh-expiry-year select option:nth-child(1)',
        creditCardDateJanMonth:
            '.dbh-CreditDebitCard .dbh-expiry-month select [value="01"]',
        creditCardDateNextYear:
            '.dbh-CreditDebitCard .dbh-expiry-year select option:nth-child(3)',
        creditCardExpiryDateError:
            '.dbh-CreditDebitCard .dbh-expiry-month .pw-field__error',
        creditCardSecurityNumber:
            '.dbh-CreditDebitCard .dbh-security-number .dbh-cvv-number input',
        creditCardSecurityNumError:
            '.dbh-CreditDebitCard .dbh-security-number .pw-field__error',
        creditCardDigitsText:
            '.dbh-CreditDebitCard .dbh-security-no-component .dbh-digits',
        billingAddressHeaderText:
            '.dbh-CreditDebitCard .t-checkout-payment__title',
        savedAddressText:
            '.dbh-CreditDebitCard .dbh-savedUserAddressRadio label',
        newAddressText: '.dbh-CreditDebitCard .dbh-newAddressRadio label',
        titleMrs: '.dbh-CreditDebitCard .dbh-title [value="Mrs"]',
        firstNameField: '.dbh-CreditDebitCard .dbh-first-name input',
        firstNameError: '.dbh-CreditDebitCard .dbh-first-name .pw-field__error',
        lastNameField: '.dbh-CreditDebitCard .dbh-last-name input',
        lastNameError: '.dbh-CreditDebitCard .dbh-last-name .pw-field__error',
        phoneNumberField: '.dbh-CreditDebitCard .dbh-phone-number input',
        phoneNumberError:
            '.dbh-CreditDebitCard .dbh-phone-number .pw-field__error',
        countryGB: '.dbh-CreditDebitCard .dbh-country [value="GB"]',
        countryAU: '.dbh-CreditDebitCard .dbh-country [value="AU"]',
        houseNumberField: '.dbh-CreditDebitCard .dbh-house-number input',
        postcodeField: '.dbh-CreditDebitCard .dbh-postcode input',
        postcodeError: '.dbh-CreditDebitCard .dbh-postcode .pw-field__error',
        findAddressButton: '.dbh-CreditDebitCard .dbh-find-address',
        enterAddressManuallyLink:
            '.dbh-CreditDebitCard .dbh-enter-manually div',
        bfpoLink: '.dbh-CreditDebitCard .dbh-bfpo',
        addressOne:
            '.dbh-CreditDebitCard .dbh-address-list option:nth-child(1)',
        addressTwo:
            '.dbh-CreditDebitCard .dbh-address-list option:nth-child(2)',
        useAddressButton: '.dbh-CreditDebitCard .dbh-submit',
        cantFindAddressLink: '.dbh-CreditDebitCard .dbh-enter-manually div',
        findAnotherAddressLink:
            '.dbh-CreditDebitCard .dbh-find-another-address div',
        searchPostcodeLink: '.dbh-CreditDebitCard .dbh-search-by div',
        bfpoCloseIcon: '.dbh-modal-header .dbh-close-button',
        bfpoCloseButton: '.dbh-modal-footer .dbh-close-button',
        bfpoHeaderText: '.dbh-modal-content h2',
        editAddressLink: '.dbh-CreditDebitCard .dbh-edit-this-address div',
        addNewAddressLink: '.dbh-CreditDebitCard .dbh-add-another-address div',
        placeOrderButton: '.dbh-place-order',
        termsConditionText: '.dbh-terms-conditions',
        privacyPolicyText: '.dbh-privacy-policy',
        errorMessage: '.u-error-notification__content',
        errorMessageClose: '.u-error-notification__action .pw-button__inner',
        addressline1Field: '.dbh-address-line1 input:nth-child(1)',
        addressline2Field:
            '.t-payment-address-form__elements.u-margin-top-md:nth-child(2) > div.pw-field-row:nth-child(7)',
        addressline3Field:
            '.t-payment-address-form__elements.u-margin-top-md:nth-child(2) > div.pw-field-row:nth-child(8)',
        suburbcityField:
            '.dbh-city div.pw-field__inner.pw--stack div.pw-field__input > input:nth-child(1)',
        billingzipcode:
            '.dbh-zipCode div.pw-field__inner.pw--stack div.pw-field__input > input:nth-child(1)',
        addressInput: '.dbh-address-line1 input',
        city: '.dbh-city input',
        eirCode: '.dbh-zipCode input',
        county: '[name=state]',
        header: '.dhh-page-title',
        backButton: '.t-my-account__back-button>svg',
        addNewPaymentCardLink: '.dbh-add-card',
        existingCardDetails: '.t-my-account__saved-card--cardbox',
        subHeading: 'h2',
        cardTypeSection: '.dbh-saved-cards-section h3',
        selectCardTypeDropDown: 'select[name="payMethodId"]',
        billingAddressDetailSection: '.dbh-address-form-section h3',
        enterAddManuallyLink: '.dbh-enter-manually',
        findAddButton: '.dbh-find-address',
        cancelButton: '.dbh-cancel-address',
        savePaymentCardButton: '.dbh-add-address-btn',
        selectGiftCard: 'select[name="payMethodId"] option[value="GiftCard"]',
        selectCreditCard:
            'select[name="payMethodId"] option[value="CreditCard"]',
        selectStoreCard: 'select[name="payMethodId"] option[value="StoreCard"]',
        selectBeautyCard:
            'select[name="payMethodId"] option[value="BeautyCard"]',
        cardNumberInputBox: '.dbh-card-number input',
        selectSavedAddressDropDown:
            '.dbh-selected-saved-addresses select[name="selectShippingAddressId"]',
        title: '.dbh-title [value="Mrs"]',
        firstName: '.dbh-first-name input',
        lastName: '.dbh-last-name input',
        phoneNumber: '.dbh-phone-number input',
        countryDropDown: '.dbh-country',
        houseNumber: '.dbh-house-number input',
        postCode: '.dbh-postcode input',
        chooseFirstSavedAddress: '.dbh-selected-saved-addresses',
        creditCardStartMonth: '.dbh-start-month select option:nth-child(1)',
        creditCardStartYear: '.dbh-start-year select option:nth-child(1)',
        cCardIcons: '.dbh-card-number .pw-card-input__card-icon',
        cCardIDField: '.dbh-card-number input',
        cCardIDError: 'dbh-card-number .pw-field__error',
        cCardIconOnField: '.dbh-card-number svg',
        cCardExpiryMonth: '.dbh-expire-month select option:nth-child(1)',
        cCardExpiryYear: '.dbh-expire-month select option:nth-child(1)',
        issueNumber: '.dbh-security-number input',
        nameOnCard: '.dbh-cc_nameoncard input',
        multiAddressDropDown:
            '.dbh-address-list >div>div:nth-child(2) > select:nth-child(1)',
        editPaymentCardDetailsLink: '.dbh-edit-card',
        existingCardType: 'select[name="payMethodId"]',
        clearAddressLink: '.dbh-clear-address',
        creditCardAccordionUk:
            '.dbh-CreditDebitCard .t-checkout-payment__card-label',
        chooseFirstSavedBillingAddress:
            'select[name="selectShippingAddressId"] >option:nth-child(2)',
        creditCardExpireMonth: '.dbh-expire-month select option:nth-child(1)',
        creditCardExpireYear: '.dbh-expiry-year select option:nth-child(1)',
        houseNumField: '.dbh-house-number input',
        findAddressButton1:
            '.c-address-form__find-address.dbh-find-address>div',
        savesPaymentCardButton: '.t-my-account__address-submit>div',
        zipCode: '.dbh-zipCode>div>div:nth-child(2)',
        storeCardExpireYear: '.dbh-expire-year select option:nth-child(1)',
        termConditionLink:
            '.u-margin-top-lg .pw-dangerous-html.u-padding-top-md.u-color-neutral-50 a:nth-child(1)',
        privacyPolicyLink: '.dbh-privacy-policy span a',
        promoCodeSuccessMsg: '.dbh-applied-promocode .pw-feedback__content div',
        deliveryLeadTime: '.dbh-delivery-estimation strong',
        hermesStoreLogo: '.c-payment-collection-details__icon--hermes-logo-bg',
        debsStoreLogo: '.c-payment-collection-details__icon--debenhams-logo-bg',
        storeName: '.c-payment-collection-details__name',
        deliveryMode: '.dbh-total-summary .dbh-shipping-mode .pw-ledger__item',
        deliveryCost: '.dbh-total-summary .dbh-shipping-mode .pw-ledger__value',
        genericNotAuthError:
            '.u-error-notification__content .c-notification-error__msg',
        threeDSiFrame: '.t-checkout-payment__iframe',
        threeDSProgressNotification: '.t-checkout-payment-progress__feedback',
        threeDSPassword: '#password',
        threeDSScreenOtpTextInfo: '.canvas .challengeinfotext',
        threeDSOTtpInputBox: 'input[name="challengeDataEntry"]',
        threeDsCardinalIframe: '#Cardinal-CCA-IFrame',
        threeDsSubmitButton: 'input[type="submit"]',
        beautyCardAccordionTitle:
            '.dbh-BeautyCard .pw-accordion__title .pw-accordion__title'
        // creditCardAccordionUk: '.dbh-CreditDebitCard .t-checkout-payment__card-label'
    }
}

const payment = function() {
    this.selectors = selectors
}

export default payment
