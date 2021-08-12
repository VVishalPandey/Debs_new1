Feature: Test Debenhams footer section

@manual @DBMTE-626
Scenario: Verify that the footer menu section option-Customer Service and the href links of the options available under it
  Given I navigate to "homeURL"
  When I am in view of "footerMenuSection" on "commonPage"
  Then I "validate" option is available in "footerMenuList" as "Customer Service" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "Customer Service"  as "footerSubMenuList" as "Track order & returns" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "Customer Service"  as "footerSubMenuList" as "Returns & refunds" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "Customer Service"  as "footerSubMenuList" as "Delivery information" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "Customer Service"  as "footerSubMenuList" as "My order" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "Customer Service"  as "footerSubMenuList" as "Help & support" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "Customer Service"  as "footerSubMenuList" as "Get in touch" on "commonPage"

@manual @DBMTE-626
Scenario: Verify that the footer menu section option-Shopping With Us and the href links of the options available under it
  Then I "validate" option is available in "footerMenuList" as "Shopping with us" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "Shopping with us"  as "footerSubMenuList" as "Store Finder" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "Shopping with us"  as "footerSubMenuList" as "Store services" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "Shopping with us"  as "footerSubMenuList" as "Rewards Club" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "Shopping with us"  as "footerSubMenuList" as "Buying guides" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "Shopping with us"  as "footerSubMenuList" as "Giftcards & vouchers" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "Shopping with us"  as "footerSubMenuList" as "Shop by product" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "Shopping with us"  as "footerSubMenuList" as "Personal shopper" on "commonPage"

@manual @DBMTE-626
Scenario: Verify that the footer menu section option-About Us and the href links of the options available under it
  Then I "validate" option is available in "footerMenuList" as "About us" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "About us"  as "footerSubMenuList" as "About Debenhams" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "About us"  as "footerSubMenuList" as "Debenhams corporate" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "About us"  as "footerSubMenuList" as "Careers" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "About us"  as "footerSubMenuList" as "Debenhams press" on "commonPage"

@manual @DBMTE-626
Scenario: Verify that the social media links are working
  When I am in view of "socialMediaSection" on "commonPage"
  Then I should see "socialMediaSection" exist on "commonPage"
  And I verify "href" of "socialMediaFacebook" as "socialMediaLinkFacebook" on "commonPage"
  And I verify "href" of "socialMediaTwitter" as "socialMediaLinkTwitter" on "commonPage"
  And I verify "href" of "socialMediaPinterest" as "socialMediaLinkPinterest" on "commonPage"
  And I verify "href" of "socialMediaInstagram" as "socialMediaLinkInstagram" on "commonPage"
  And I verify "href" of "socialMediaYoutube" as "socialMediaLinkYoutube" on "commonPage"

@manual @DBMTE-626
Scenario: Validate the verified by visa icon appearing in the footer
  Then I should see "verifiedByVisaIcon" exist on "commonPage"
  And I verify "href" of "verifiedByVisaIcon" as "verifiedByVisaLink" on "commonPage"

@manual @DBMTE-626
Scenario Outline: Validate the error message for empty email address for subscribe newsletter
  When I am in view of "subscribeToNewsletter" on "commonPage"
  And I enter "<email>" in "subscribeEmail" on "commonPage"
  And I click on "subscribeButton" on "commonPage"
  Then I should see "subscribeEmailError" as "The email address field cannot be empty" on "commonPage"

  Examples:
    | email |
    |       |

@manual @DBMTE-626
Scenario Outline: Validate the error message for incorrect email address for subscribe newsletter
  When I am in view of "subscribeToNewsletter" on "commonPage"
  And I enter "<email>" in "subscribeEmail" on "commonPage"
  And I click on "subscribeButton" on "commonPage"
  Then I should see "subscribeEmailError" as "Enter a valid email address" on "commonPage"

  Examples:
    | email |
    | abcd  |

@manual @DBMTE-626
Scenario Outline: verify that the delivery Options are present
  When I enter "<email>" in "subscribeEmail" on "commonPage"
  And I click on "subscribeButton" on "commonPage"
  Then I should see "url" contains "http://pages.e.debenhams.com/"
  When I go back to previous page
  Then I should see "url" contains "www.debenhams.com"

  Examples:
    | email         |
    | abc@gmail.com |

@manual @DBMTE-626
Scenario: Navigate to Debenhams home page and validate the footer links should work and open links in new tab

@manual @DBMTE-626
Scenario: Navigate to Debenhams home page and validate the country overlay section where Uk should be selected by default

@manual @DBMTE-626
Scenario: Navigate to Debenhams home page and validate the country overlay section where user can change the country as per the choice
