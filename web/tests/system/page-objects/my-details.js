const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        headerText: '.dbh-my-account-header h2',
        fullName: '.dbh-user-name',
        emailAddress: '.dbh-info-email-address p',
        dateOfBirth: '.dbh-info-date-of-birth p',
        newsletterMessage: '.dbh-my-account-user-details div:nth-child(4) p',
        editDetailsButton: '.dbh-edit-details-link',
        managePasswordButton: '.dbh-link-changepassword div',
        myAddressBookButton: '.dbh-link-addressbook div',
        myPaymentCardsButton: '.dbh-link-editpayment div',
        myOrderButton: '.dbh-link-trackorderstatus div',
        savedItemsButton: '.dbh-link-wishlist div',
        beautyClubButton: '.dbh-link-beautycard div',
        titleOfPage: '.dhh-page-title',
        savedAddress: '#MyAccountCenterLinkDisplay_Widget form h2',
        addNewAddressButton: '#MyAccountCenterLinkDisplay_Widget form div a',
        backNavigationButton: '.t-my-account__back-button',
        existingAddressDetails:
            '#MyAccountCenterLinkDisplay_Widget form div:nth-child(2)',
        preferredaddressButton:
            '#MyAccountCenterLinkDisplay_Widget form div:nth-child(2) div:nth-child(2) div.left',
        editAddressLink:
            '#MyAccountCenterLinkDisplay_Widget form div:nth-child(2) div:nth-child(2) div.right a.edit',
        removeAddressLink:
            '#MyAccountCenterLinkDisplay_Widget form div:nth-child(2) div:nth-child(2) div.right a.remove',
        myDetailsButton: '.dbh-my-account-nav-links',
        pageTitle: 'h2.t-my-account__dashboard-title',
        selectedMyAccMenuOption: '.selected.dbh-my-account-nav-links',
        editDetailsBackButton: '.dbh-edit-details-back',
        editDetailsPageTitle: '.dbh-change-detail-label',
        title: '.dbh-title',
        firstName: '.dbh-first-name input',
        lastName: '.dbh-last-name input',
        emailAddressInput: '.dbh-email input',
        dateOfBirthInput: '.dbh-dob input',
        newsletterSubscriptionCheckbox: '.dbh-receive-newsletters input',
        saveChangesButton: '.dbh-my-account-button',
        subscriptionMessage: '.dbh-tooltip-message',
        rewardCardButton: '.dbh-link-rewardcard',
        leftHandNavigation:
            '.dbh-my-account-navigation > .dbh-my-account-nav-links'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        headerText: '.dbh-my-account-header h2',
        fullName: '.dbh-user-name',
        emailAddress: '.dbh-info-email-address p',
        dateOfBirth: '.dbh-info-date-of-birth p',
        newsletterMessage: '.dbh-my-account-user-details div:nth-child(4) p',
        editDetailsLink: '.dbh-edit-details-link',
        managePasswordButton: '.dbh-link-changepassword div',
        myAddressBookButton: '.dbh-link-addressbook div',
        myPaymentCardsButton: '.dbh-link-editpayment div',
        myOrderButton: '.dbh-link-trackorderstatus div',
        savedItemsButton: '.dbh-link-wishlist div',
        beautyClubButton: '.dbh-link-beautycard div',
        titleOfPage: '.dhh-page-title',
        savedAddress: '#MyAccountCenterLinkDisplay_Widget form h2',
        addNewAddressButton: '#MyAccountCenterLinkDisplay_Widget form div a',
        backNavigationButton: '.t-my-account__back-button',
        existingAddressDetails:
            '#MyAccountCenterLinkDisplay_Widget form div:nth-child(2)',
        preferredaddressButton:
            '#MyAccountCenterLinkDisplay_Widget form div:nth-child(2) div:nth-child(2) div.left',
        editAddressLink:
            '#MyAccountCenterLinkDisplay_Widget form div:nth-child(2) div:nth-child(2) div.right a.edit',
        removeAddressLink:
            '#MyAccountCenterLinkDisplay_Widget form div:nth-child(2) div:nth-child(2) div.right a.remove',
        myDetailsButton: '.dbh-my-account-nav-links',
        pageTitle: 'h2.t-my-account__dashboard-title',
        selectedMyAccMenuOption: '.selected.dbh-my-account-nav-links',
        editDetailsBackButton: '.dbh-edit-details-back',
        editDetailsPageTitle: '.dbh-change-detail-label',
        title: '.dbh-title',
        firstName: '.dbh-first-name input',
        lastName: '.dbh-last-name input',
        emailAddressInput: '.dbh-email input',
        dateOfBirthInput: '.dbh-dob input',
        newsletterSubscriptionCheckbox: '.dbh-receive-newsletters input',
        saveChangesButton: '.dbh-my-account-button',
        subscriptionMessage: '.dbh-tooltip-message',
        editDetailsButton: '.dbh-edit-details-link'
    }
} else {
    selectors = {
        headerText: 'h1',
        fullName: '.dbh-user-name',
        emailAddress: '.dbh-info-email-address p',
        dateOfBirth: '.dbh-info-date-of-birth p',
        newsletterMessage: '.dbh-my-account-user-details div:nth-child(4) p',
        editDetailsLink: '.dbh-edit-details-link',
        managePasswordButton: '.dbh-link-changepassword div',
        myAddressBookButton: '.dbh-link-addressbook div',
        myPaymentCardsButton: '.dbh-link-editpayment div',
        myOrderButton: '.dbh-link-trackorderstatus div',
        savedItemsButton: '.dbh-link-wishlist div',
        beautyClubButton: '.dbh-link-beautycard div',
        titleOfPage: '.dhh-page-title',
        savedAddress: '#MyAccountCenterLinkDisplay_Widget form h2',
        addNewAddressButton: '#MyAccountCenterLinkDisplay_Widget form div a',
        backNavigationButton: '.t-my-account__back-button',
        existingAddressDetails:
            '#MyAccountCenterLinkDisplay_Widget form div:nth-child(2)',
        preferredaddressButton:
            '#MyAccountCenterLinkDisplay_Widget form div:nth-child(2) div:nth-child(2) div.left',
        editAddressLink:
            '#MyAccountCenterLinkDisplay_Widget form div:nth-child(2) div:nth-child(2) div.right a.edit',
        removeAddressLink:
            '#MyAccountCenterLinkDisplay_Widget form div:nth-child(2) div:nth-child(2) div.right a.remove',
        rewardCardButton: '.dbh-link-rewardcard',
        pageTitle: 'h2.t-my-account__dashboard-title',
        editDetailsButton: '.dbh-edit-details-link',
        editDetailsBackButton: '.dbh-edit-details-back',
        editDetailsPageTitle: '.dbh-change-detail-label',
        title: '.dbh-title',
        firstName: '.dbh-first-name input',
        lastName: '.dbh-last-name input',
        emailAddressInput: '.dbh-email input',
        dateOfBirthInput: '.dbh-dob input',
        newsletterSubscriptionCheckbox: '.dbh-receive-newsletters input',
        saveChangesButton: '.dbh-my-account-button',
        subscriptionMessage: '.dbh-tooltip-message',
        leftHandNavigation:
            '.dbh-my-account-navigation > .dbh-my-account-nav-links'
    }
}

const details = function() {
    this.selectors = selectors
}

export default details
