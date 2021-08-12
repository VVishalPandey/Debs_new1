Feature: Test Debenhams footer section

@automated @DEBD-345 @Fixed
Scenario: Verify that the footer menu section option-Customer Service and the href links of the options available under it
  Given I navigate to "homeURL"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  When I am in view of "footerMenuSection" on "commonPage"
  Then I "validate" option is available in "footerMenuList" as "Customer Service" on "commonPage"
  And I "validate" option from "footerMenuList" of "Customer Service"  as "footerSubMenuList" as "Track order & returns" on "commonPage"
  And I "validate" option from "footerMenuList" of "Customer Service"  as "footerSubMenuList" as "Returns & refunds" on "commonPage"
  And I "validate" option from "footerMenuList" of "Customer Service"  as "footerSubMenuList" as "Delivery information" on "commonPage"
  And I "validate" option from "footerMenuList" of "Customer Service"  as "footerSubMenuList" as "Get in touch" on "commonPage"


@automated @DEBD-345  @Fixed
Scenario: Verify that the footer menu section option-About Us and the href links of the options available under it
  Then I "validate" option is available in "footerMenuList" as "About us" on "commonPage"
  And I "validate" option from "footerMenuList" of "About us"  as "footerSubMenuList" as "Debenhams corporate" on "commonPage"
  And I "validate" option from "footerMenuList" of "About us"  as "footerSubMenuList" as "Careers" on "commonPage"


@automated @DEBD-345  @Fixed
Scenario: Verify that the social media links are working
  When I am in view of "socialMediaSection" on "commonPage"
  Then I should see "socialMediaSection" exist on "commonPage"
  And I verify "href" of "socialMediaFacebook" as "socialMediaLinkFacebook" on "commonPage"
  And I verify "href" of "socialMediaTwitter" as "socialMediaLinkTwitter" on "commonPage"
  And I verify "href" of "socialMediaPinterest" as "socialMediaLinkPinterest" on "commonPage"
  And I verify "href" of "socialMediaInstagram" as "socialMediaLinkInstagram" on "commonPage"
  And I verify "href" of "socialMediaYoutube" as "socialMediaLinkYoutube" on "commonPage"

@automated @DEBD-345  @Fixed
Scenario: Validate the verified by visa icon appearing in the footer
  Then I should see "verifiedByVisaIcon" exist on "commonPage"
  And I verify "href" of "verifiedByVisaIcon" as "verifiedByVisaLink" on "commonPage"

@automated @DEBD-345 @IssueEmptyEmail @Fixed
Scenario Outline: Validate the error message for empty email address for subscribe newsletter
  When I am in view of "subscribeToNewsletter" on "commonPage"
  And I enter "<email>" in "subscribeEmail" on "commonPage"
  And I click on "subscribeButton" on "commonPage"
  Then I should see "subscribeEmailError" as "The email address field cannot be empty" on "commonPage"

  Examples:
    | email |
    |       |

@automated @DEBD-345 @Fixed
Scenario Outline: Validate the error message for incorrect email address for subscribe newsletter
  When I am in view of "subscribeToNewsletter" on "commonPage"
  And I enter "<email>" in "subscribeEmail" on "commonPage"
  And I click on "subscribeButton" on "commonPage"
  Then I should see "url" contains "https://pages.e.debenhams.com/"
  When I go back to previous page
  Then I should see "url" not contains "https://pages.e.debenhams.com/" on "homePage"
  And I should see "subscribeEmail" exist on "commonPage"
  And I should see "subscribeButton" exist on "commonPage"

  Examples:
    | email |
    | abcd  |

@automated @DEBD-345 @Fixed
Scenario Outline: verify that the delivery Options are present
  When I enter "<email>" in "subscribeEmail" on "commonPage"
  And I click on "subscribeButton" on "commonPage"
  Then I should see "url" contains "https://pages.e.debenhams.com/"
  When I go back to previous page
  Then I should see "url" contains "https://www.debenhams.com/en-au"

  Examples:
    | email         |
    | abc@gmail.com |

@automated @DEBD-345 @Fixed
Scenario: Navigate to Debenhams home page and validate the footer links should work and open links in new tab
  When I am in view of "termsConditionSection" on "commonPage"
  Then I verify "href" of "cookies" as "CookiesLink" on "commonPage"
  Then I verify "href" of "privacy" as "PrivacyLink" on "commonPage"
  Then I verify "href" of "termsCondition" as "TermsConditionLink" on "commonPage"
  Then I verify "href" of "legalDisclaimer" as "LegalDisclaimerPop" on "commonPage"
  Then I should see "copyrightDisclaimerText" as "Copyright © Debenhams Retail Ltd. All rights reserved" on "commonPage"