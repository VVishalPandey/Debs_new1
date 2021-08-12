const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        cccDebsLogoSignIn: '.dbh-csr-svglogo',
        cccDebsDotComTextLogo: '.dbh-logo-text',
        cccSignOutLink: '.dbh-link-signOut',
        cccManagePassword: '.managepassword-signout > a:nth-child(1)',
        employeeName: '.logo-user-name >h4 >span',
        registeredcustomersearchheader: '.customer-search-title',
        firstnamefield: '.dbh-first-name input',
        Lastnamefield: '.dbh-last-name input',
        emailaddressfield: '.dbh-email input',
        phonenumberfield: '.dbh-phone-number input',
        searchanywherewithinthefieldcheckbox: '.dbh-save-anywhere-checkbox',
        searchCTA: '.dbh-customer-search-button',
        cccLoginField: '.dbh-csr-email input',
        cccPasswordField: '.dbh-csr-password input',
        cccSignInButton: '.dbh-signin-button',
        shopOnBehalfOfCustomerCTA: '.csr-guest-customer button',
        cccEmployeeNameLabel: '.dbh-reg-customer-title',
        cccEmployeeName: '.dbh-reg-customer-title >span',
        cccManagePasswordLink: '.dbh-csr-manage-password',
        youSearchedForResultLine1: '.search-for p:nth-child(1)',
        youSearchedForResultLine2: '.search-for p:nth-child(2)',
        youSearchedForResultLine3: '.search-for p:nth-child(3)',
        youSearchedForResultLine4: '.search-for p:nth-child(4)',
        searchResultsTable: '.search-results-table',
        backToSearch: '.back-to-search a',
        selectResultRadioButton: '.search-result-row input',
        searchResultsTableHeaderEmail: '.search-results-table th:nth-child(1)',
        searchResultsTableHeaderFirstName:
            '.search-results-table th:nth-child(2)',
        searchResultsTableHeaderLastName:
            '.search-results-table th:nth-child(3)',
        searchResultsTableHeaderPhoneNo:
            '.search-results-table th:nth-child(4)',
        searchResultsTableHeaderPostCode:
            '.search-results-table th:nth-child(5)',
        searchResultsTableHeaderAddress:
            '.search-results-table th:nth-child(6)',
        searchResultFirstName: '.search-result-row td:nth-child(2)',
        searchResultLastName: '.search-result-row td:nth-child(3)',
        searchResultPhoneNumber: '.search-result-row td:nth-child(4)',
        searchResultPostCode: '.search-result-row td:nth-child(5)',
        searchResult1stLineAddress: '.search-result-row td:nth-child(6)',
        registeredCustomerSearchTitle: '.dbh-reg-customer-title',
        guestCustomerSearchTitle: '.dbh-csr-guest-customer-title',
        enactCustomerButton: '.pw-button__inner',
        cccshopOnBehalfBanner: '.dbh-csr-header-message',
        dropCustomerSessionButton: '.dbh-csr-header-cta',
        emailAddressMyAccount: '.dbh-info-email-address p',
        searchTooManyResultsText: '.too-many-results',
        noResultsError: '.no-results',
        editEmailAddressMyAccount: '.dbh-edit-details-link',
        saveDetailsMyAccount: '.dbh-my-account-button',
        emailAddressInputBox: '.dbh-email input'
    }
}
const cccCustomerSearch = function() {
    this.selectors = selectors
}

export default cccCustomerSearch
