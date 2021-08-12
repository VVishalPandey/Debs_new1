const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        myAccountLink: '.dbh-edit-details-link',
        emailAddress: '.dbh-info-email-address p'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        myBeautyClubLink: '.dbh-link-beautycard',
        myAccountLink: '.dbh-edit-details-link',
        emailAddress: '.dbh-info-email-address p'
    }
} else {
    selectors = {
        myBeautyClubLink: '.dbh-link-beautycard',
        myAccountLink: '.dbh-edit-details-link',
        emailAddress: '.dbh-info-email-address p'
    }
}

const myAccount = function() {
    this.selectors = selectors
}

export default myAccount
