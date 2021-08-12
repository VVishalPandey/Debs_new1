Feature: Test Debenhams footer section

@automated @DEBD-342 @Fixed
Scenario: Verify that the footer menu section option-Customer Service and the href links of the options available under it
  Given I navigate to "homeURL"
  When I am in view of "footerMenuSection" on "commonPage"
  Then I "validate" option is available in "footerMenuList" as "Customer service" on "commonPage"
  And I "validate" option from "footerMenuList" of "Customer service"  as "footerSubMenuList" as "Track an order" on "commonPage"
  And I "validate" option from "footerMenuList" of "Customer service"  as "footerSubMenuList" as "Returns, exchanges & refunds" on "commonPage"
  And I "validate" option from "footerMenuList" of "Customer service"  as "footerSubMenuList" as "Delivery & collections" on "commonPage"
  And I "validate" option from "footerMenuList" of "Customer service"  as "footerSubMenuList" as "Get in touch" on "commonPage"

@automated @DEBD-342 @Fixed
Scenario: Verify that the footer menu section option-Shopping With Us and the href links of the options available under it
  Then I "validate" option is available in "footerMenuList" as "Shopping with us" on "commonPage"
  And I "validate" option from "footerMenuList" of "Shopping with us"  as "footerSubMenuList" as "Debenhams cards" on "commonPage"
  And I "validate" option from "footerMenuList" of "Shopping with us"  as "footerSubMenuList" as "Store finder" on "commonPage"
  And I "validate" option from "footerMenuList" of "Shopping with us"  as "footerSubMenuList" as "Giftcards & vouchers" on "commonPage"
  And I "validate" option from "footerMenuList" of "Shopping with us"  as "footerSubMenuList" as "Personal shopper" on "commonPage"

@automated @DEBD-342 @Fixed
Scenario: Verify that the footer menu section option-About Us and the href links of the options available under it
  Then I "validate" option is available in "footerMenuList" as "About us" on "commonPage"
  And I "validate" option from "footerMenuList" of "About us"  as "footerSubMenuList" as "Modern slavery statement" on "commonPage"
  And I "validate" option from "footerMenuList" of "About us"  as "footerSubMenuList" as "Sustainability" on "commonPage"
  And I "validate" option from "footerMenuList" of "About us"  as "footerSubMenuList" as "Debenhams corporate" on "commonPage"
  And I "validate" option from "footerMenuList" of "About us"  as "footerSubMenuList" as "Careers" on "commonPage"

@automated @DEBD-342 @Fixed
Scenario: Verify that the footer menu section option-More From Debenhams and the href links of the options available under it
  Then I "validate" option is available in "footerMenuList" as "More from Debenhams" on "commonPage"
  And I "validate" option from "footerMenuList" of "More from Debenhams"  as "footerSubMenuList" as "Style debrief" on "commonPage"
  And I "validate" option from "footerMenuList" of "More from Debenhams"  as "footerSubMenuList" as "Travel money" on "commonPage"
  And I "validate" option from "footerMenuList" of "More from Debenhams"  as "footerSubMenuList" as "Debenhams insurance" on "commonPage"
  And I "validate" option from "footerMenuList" of "More from Debenhams"  as "footerSubMenuList" as "Beauty Club Community" on "commonPage"

@automated @DEBD-342 @Fixed
Scenario: Verify that the social media links are working
  Then I should see "socialMediaSection" exist on "commonPage"
  And I verify "href" of "socialMediaFacebook" as "socialMediaLinkFacebook" on "commonPage"
  And I verify "href" of "socialMediaTwitter" as "socialMediaLinkTwitter" on "commonPage"
  And I verify "href" of "socialMediaPinterest" as "socialMediaLinkPinterest" on "commonPage"
  And I verify "href" of "socialMediaInstagram" as "socialMediaLinkInstagram" on "commonPage"
  And I verify "href" of "socialMediaYoutube" as "socialMediaLinkYoutube" on "commonPage"

@automated @DEBD-342 @Fixed
Scenario: Validate the verified by visa icon appearing in the footer
  When I am in view of "footerMenuSection" on "commonPage"
  Then I should see "verifiedByVisaIcon" exist on "commonPage"
  And I verify "href" of "verifiedByVisaIcon" as "WeacceptthefollowingpaymentmethodsHref" on "commonPage"

@automated @DEBD-342 @Fixed @IssueEmptyEmail
Scenario Outline: Validate the error message for empty email address for subscribe newsletter
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
    |       |

@automated @DEBD-342 @Fixed
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

@automated @DEBD-342 @Fixed
Scenario Outline: verify that the delivery Options are present
  When I enter "<email>" in "subscribeEmail" on "commonPage"
  And I click on "subscribeButton" on "commonPage"
  Then I should see "url" contains "https://pages.e.debenhams.com/"
  When I go back to previous page
  #Then I should see "url" contains "https://localhost:3443/"
  Then I should see "url" not contains "https://pages.e.debenhams.com/" on "homePage"
  And I should see "subscribeEmail" exist on "commonPage"
  And I should see "subscribeButton" exist on "commonPage"

  Examples:
    | email         |
    | abc@gmail.com |

@automated @DEBD-342 @Fixed
Scenario: Navigate to Debenhams home page and validate the footer links should work and open links in new tab
  When I am in view of "termsConditionSection" on "commonPage"
  Then I verify "href" of "cookies" as "CookiesLink" on "commonPage"
  Then I verify "href" of "privacy" as "PrivacyLink" on "commonPage"
  Then I verify "href" of "termsCondition" as "TermsConditionLink" on "commonPage"
  Then I verify "href" of "legalDisclaimer" as "LegalDisclaimerPop" on "commonPage"
  Then I should see "copyrightDisclaimerText" as "COPYRIGHT © DEBENHAMS RETAIL LTD. ALL RIGHTS RESERVED" on "commonPage"

