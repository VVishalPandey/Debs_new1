const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        removePopUpMessage: '.dbh-remove-address-warning',
        removeYesLabel: '.dbh-remove-address-button'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        addNewAddressLink: '.dbh-add-address',
        existingAddresses: '.dbh-address',
        preferredDeliveryAddress: '.dbh-preferred-address',
        editAddressLink: '.dbh-edit-address',
        removeLink: '.dbh-remove',
        title: '.dbh-title [name=title]',
        removePopUpMessage: '.dbh-remove-address-warning',
        removeYesLabel: '.dbh-remove-address-button',
        removeCancelLabel: '.dbh-cancel-button',
        existingAddressDetails: '.dbh-address'
    }
} else {
    selectors = {
        title: '.dbh-title [name=title]',
        firstName: '.dbh-first-name input',
        lastName: '.dbh-last-name input',
        phoneNumber: '.dbh-phone-number input',
        emailAddressField: '.dbh-email input',
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
        zipcode: '[name=zipCode]'
    }
}

const addressBook = function() {
    this.selectors = selectors
}

export default addressBook
