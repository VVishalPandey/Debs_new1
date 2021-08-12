const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        deliveryAddressheaderText:
            '.t-checkout-shipping__form .t-checkout-shipping__title',
        loggedInuserUKOption: 'option[value="102129054"]',
        loggedInuserAUOption: '.dbh-savedUserAddressList [value="79655496"]',
        useThisAddressButton: '.dbh-use-address div',
        pcaAddressField: '.dbh-full-address [type=text]',
        title: '.dbh-title [name=title]',
        firstName: '.dbh-first-name input',
        lastName: '.dbh-last-name input',
        phoneNumber: '.dbh-phone-number input',
        country: '.dbh-country',
        houseNumber: '.dbh-house-number input',
        postcode: '.dbh-postcode input',
        postcodeManual: '[name=zipCode]',
        findYourAddressButton: '.dbh-find-address div',
        enterAddressManuallyLink: '.dbh-enter-manually div',
        address: '.dbh-address-list select',
        findAnotherAddressLink: '.dbh-find-another-address div',
        bfpoLink: '.dbh-bfpo-address div',
        addressLine1: '.dbh-address-line1 input',
        addressLine2: '.dbh-address-line2 input',
        city: '.dbh-city input',
        county: '[name=state]',
        bfpoCloseLink: '.bfpo-address-info-modal__header .pw-button',
        bfpoHeaderText: '.bfpo-address-info-modal__content h2',
        bfpoPara1Text: '.u-padding-start-lg > div:nth-child(2)',
        bfpoPara2Text: '.u-padding-start-lg > div:nth-child(3)',
        bfpoCloseButton: '.dbh-close-button',
        state: '.c-region-field [name=state]',
        zipcode: '[name=zipCode]',
        addressSelectDebenhams:
            '.dbh-address-list select > option:nth-child(3)',
        countrySelectAustralia: '.dbh-country > option[value=AU]',
        pcaListAddress1: '.pca > .pcaautocomplete .pcalist > .pcafirstitem',
        pcaSelectedAddress: '.dbh-selected-address',
        deliverySelectedAddress:
            '.dbh-address-container > .t-checkout-shipping__address-details',
        firstNameError: '.dbh-first-name .pw-field__error',
        lastNameError: '.dbh-last-name .pw-field__error',
        phoneNumberError: '.dbh-phone-number .pw-field__error',
        houseNumberError: '.dbh-house-number .pw-field__error',
        postcodeError: '.dbh-postcode .pw-field__error',
        cityError: '.dbh-city .pw-field__error',
        postcodeManualError: '.dbh-zipCode input',
        savedAddressRadioButton: '.dbh-savedUserAddressRadio input',
        newAddressRadioButton: '.dbh-newAddressRadio',
        savedAddressText: '.dbh-savedUserAddressRadio label',
        newAddressText: '.dbh-newAddressRadio span',
        useAddressDropDown: '.dbh-savedUserAddressList select',
        savedAddressOption2: '.dbh-savedUserAddressList-57512884',
        // loggedInuserUKOption: '.dbh-savedUserAddressList select > [value="63030220"]',
        addressContainer: '.dbh-address-container',
        savedNewAddressLine1:
            '.dbh-address-container > .t-checkout-shipping__address-details > li:nth-child(1)',
        savedNewAddressLine2:
            '.dbh-address-container > .t-checkout-shipping__address-details > li:nth-child(2)',
        savedNewAddressLine3:
            '.dbh-address-container > .t-checkout-shipping__address-details > li:nth-child(3)',
        savedNewAddressLine4:
            '.dbh-address-container > .t-checkout-shipping__address-details > li:nth-child(4)',
        editAddressLink: '.dbh-address-container .dbh-edit',
        headerText: '.t-checkout-shipping__title h1',
        loggedInuserIEOption: '.dbh-savedUserAddressList-77867216',
        pcaDropFirstOption: '.pca > .pcaautocomplete .pcalist > .pcafirstitem',
        pcaErrorMessage: '.pcaerror',
        pcaInlineErrorMessage: '.dbh-full-address .pw-field__error',
        cancelButton: '.dbh-btn-cancel',
        cccEmailAddressField: '.csr-dbh-email-id input',
        cccEmailAddressFieldError: '.csr-dbh-email-id .pw-field__error',
        returnToBagIcon: '.return-to-bag-text__container'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        deliveryAddressheaderText:
            '.t-checkout-shipping__form .t-checkout-shipping__title',
        title: '.dbh-title [name=title]',
        firstName: '.dbh-first-name input',
        lastName: '.dbh-last-name input',
        phoneNumber: '.dbh-phone-number input',
        country: '.dbh-country',
        houseNumber: '.dbh-house-number input',
        postcode: '.dbh-postcode input',
        postcodeManual: '[name=zipCode]',
        findYourAddressButton: '.dbh-find-address div',
        enterAddressManuallyLink: '.dbh-enter-manually div',
        address: '.dbh-address-list select',
        findAnotherAddressLink: '.dbh-find-another-address div',
        bfpoLink: '.dbh-bfpo-address div',
        useThisAddressButton: '.dbh-use-address div',
        addressLine1: '.dbh-address-line1 input',
        addressLine2: '.dbh-address-line2 input',
        city: '.dbh-city input',
        county: '[name=region]',
        state: '.c-region-field [name=state]',
        zipcode: '[name=zipCode]',
        addressSelectDebenhams:
            '.dbh-address-list select > option:nth-child(3)',
        countrySelectAustralia: '.dbh-country > option[value=AU]',
        firstNameError: '.dbh-first-name .pw-field__error',
        lastNameError: '.dbh-last-name .pw-field__error',
        phoneNumberError: '.dbh-phone-number .pw-field__error',
        houseNumberError: '.dbh-house-number .pw-field__error',
        postcodeError: '.dbh-postcode .pw-field__error',
        cityError: '.dbh-city .pw-field__error',
        postcodeManualError: '.dbh-zipCode input',
        bfpoCloseLink: '.bfpo-address-info-modal__header .pw-button',
        bfpoHeaderText: '.bfpo-address-info-modal__content h2',
        bfpoPara1Text: '.u-padding-start-lg > div:nth-child(2)',
        bfpoPara2Text: '.u-padding-start-lg > div:nth-child(3)',
        bfpoCloseButton: '.dbh-close-button',
        savedAddressRadioButton: '.dbh-savedUserAddressRadio input',
        newAddressRadioButton: '.dbh-newAddressRadio',
        savedAddressText: '.dbh-savedUserAddressRadio label',
        newAddressText: '.dbh-newAddressRadio label',
        useAddressDropDown: '.dbh-savedUserAddressList select',
        savedAddressOption2: '.dbh-savedUserAddressList-57512884',
        // loggedInuserUKOption: '.dbh-savedUserAddressList select > [value="63030220"]',
        loggedInuserUKOption: '.dbh-savedUserAddressList-102129044',
        loggedInuserAUOption: '.dbh-savedUserAddressList-79655497',
        addressContainer: '.dbh-address-container',
        savedNewAddressLine1:
            '.dbh-address-container > .t-checkout-shipping__address-details > li:nth-child(1)',
        savedNewAddressLine2:
            '.dbh-address-container > .t-checkout-shipping__address-details > li:nth-child(2)',
        savedNewAddressLine3:
            '.dbh-address-container > .t-checkout-shipping__address-details > li:nth-child(3)',
        savedNewAddressLine4:
            '.dbh-address-container > .t-checkout-shipping__address-details > li:nth-child(4)',
        editAddressLink: '.dbh-address-container .dbh-edit',
        headerText: '.t-checkout-shipping__title h1',
        loggedInuserIEOption: '.dbh-savedUserAddressList-77867216',
        pcaAddressField: '.dbh-full-address input',
        pcaDropFirstOption:
            '.pca > .pcaautocomplete > .pcalist > div:nth-child(1)',
        standardDeliveryText:
            '.dbh-options li:nth-child(2) .dbh-option-info .dbh-info-desc',
        pcaListAddress1: '.pcalist > .pcafirstitem',
        pcaSelectedAddress: '.dbh-selected-address',
        cancelButton: '.dbh-btn-cancel',
        cccEmailAddressField: '.csr-dbh-email-id input'
    }
} else {
    selectors = {
        headerText:
            '.c-address-selector .t-checkout-shipping__title.u-padding-top-lg h1',
        title: '.dbh-title',
        firstName: '.dbh-first-name input',
        lastName: '.dbh-last-name input',
        phoneNumber: '.dbh-phone-number input',
        country: '.dbh-country',
        countrySelected:
            '.t-checkout-shipping__guest-form .dbh-country > option[value=GB]',
        houseNumber: '.dbh-house-number input',
        postcode: '.dbh-postcode input',
        postcodeManual: '[name=zipCode]',
        findYourAddressButton: '.dbh-find-address div',
        enterAddressManuallyLink: '.dbh-enter-manually div',
        address: '.dbh-address-list select',
        findAnotherAddressLink: '.dbh-find-another-address div',
        bfpoLink: '.dbh-bfpo-address div',
        useThisAddressButton: '.dbh-use-address div',
        addressLine1: '.dbh-address-line1 input',
        addressLine2: '.dbh-address-line2 input',
        addressChangeLink:
            'ul.t-checkout-shipping__delivery-status > li:nth-child(2) >div >div:nth-child(2)',
        city: '.dbh-city input',
        county: '[name=region]',
        state: '.c-region-field [name=state]',
        zipcode: '[name=zipCode]',
        addressSelectDebenhams:
            '.dbh-address-list select > option:nth-child(3)',
        countrySelectAustralia: '.dbh-country > option[value=AU]',
        firstNameError: '.dbh-first-name .pw-field__error',
        lastNameError: '.dbh-last-name .pw-field__error',
        phoneNumberError: '.dbh-phone-number .pw-field__error',
        houseNumberError: '.dbh-house-number .pw-field__error',
        postcodeError: '.dbh-postcode .pw-field__error',
        cityError: '.dbh-city .pw-field__error',
        postcodeManualError: '.dbh-zipCode input',
        bfpoCloseLink: '.bfpo-address-info-modal__header .pw-button',
        bfpoHeaderText: '.bfpo-address-info-modal__content h2',
        bfpoPara1Text: '.u-padding-start-lg > div:nth-child(2)',
        bfpoPara2Text: '.u-padding-start-lg > div:nth-child(3)',
        bfpoCloseButton: '.dbh-close-button',
        errorMessage: '.c-notification__content',
        savedAddressRadioButton: '.dbh-savedUserAddressRadio input',
        newAddressRadioButton: '.dbh-newAddressRadio',
        savedAddressText: '.dbh-savedUserAddressRadio label',
        newAddressText: '.dbh-newAddressRadio label',
        useAddressDropDown: '.dbh-savedUserAddressList select',
        savedAddressOption2: '.dbh-savedUserAddressList-57512884',
        // loggedInuserUKOption: '.dbh-savedUserAddressList select > [value="63030220"]',
        loggedInuserUKOption: '.dbh-savedUserAddressList-101699494',
        loggedInuserAUOption: '.dbh-savedUserAddressList-79655497',
        eirCode: 'input[name="postcode"]',
        loggedInuserIEOption: '.dbh-savedUserAddressList-77867216',
        pcaAddressField: '.dbh-full-address input',
        pcaDropFirstOption:
            '.pca > .pcaautocomplete > .pcalist > div:nth-child(1)',
        standardDeliveryText:
            '.dbh-options li:nth-child(2) .dbh-option-info .dbh-info-desc',
        cancelButton: '.dbh-btn-cancel',
        savedAddress: 'li:nth-child(2) >div >.dbh-description:nth-child(1)',
        cccEmailAddressField: '.csr-dbh-email-id input'
    }
}

const homeDelivery = function() {
    this.selectors = selectors
}

export default homeDelivery
