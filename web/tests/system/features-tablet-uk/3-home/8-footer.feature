Feature: Test Debenhams footer section

@automated @Fixed
Scenario: Verify that the footer menu section option-Customer Service and the href links of the options available under it
  Given I navigate to "homeURL"
  When I am in view of "footerMenuSection" on "commonPage"
  Then I "validate" option is available in "footerMenuList" as "Customer service" on "commonPage"
  And I "validate" option from "footerMenuList" of "Customer service"  as "footerSubMenuList" as "Track an order" on "commonPage"
  And I "validate" option from "footerMenuList" of "Customer service"  as "footerSubMenuList" as "Returns, exchanges & refunds" on "commonPage"
  And I "validate" option from "footerMenuList" of "Customer service"  as "footerSubMenuList" as "Delivery & collections" on "commonPage"
  And I "validate" option from "footerMenuList" of "Customer service"  as "footerSubMenuList" as "Get in touch" on "commonPage"


@automated @Fixed
Scenario: Verify that the footer menu section option-Shopping With Us and the href links of the options available under it
  Then I "validate" option is available in "footerMenuList" as "Shopping with us" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "Shopping with us"  as "footerSubMenuList" as "Debenhams cards" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "Shopping with us"  as "footerSubMenuList" as "Store finder" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "Shopping with us"  as "footerSubMenuList" as "Giftcards & vouchers" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "Shopping with us"  as "footerSubMenuList" as "Personal shopper" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "Shopping with us"  as "footerSubMenuList" as "Book a free bra fit appointment" on "commonPage"

@automated @Fixed
Scenario: Verify that the footer menu section option-About Us and the href links of the options available under it
  Then I "validate" option is available in "footerMenuList" as "About us" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "About us"  as "footerSubMenuList" as "Modern slavery statement" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "About us"  as "footerSubMenuList" as "Sustainability" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "About us"  as "footerSubMenuList" as "Debenhams corporate" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "About us"  as "footerSubMenuList" as "Careers" on "commonPage"


@automated @Fixed
Scenario: Verify that the footer menu section option-More From Debenhams and the href links of the options available under it
  Then I "validate" option is available in "footerMenuList" as "More from Debenhams" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "More from Debenhams"  as "footerSubMenuList" as "Style debrief" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "More from Debenhams"  as "footerSubMenuList" as "Travel money" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "More from Debenhams"  as "footerSubMenuList" as "Debenhams insurance" on "commonPage"
  And I "validate & click" option from "footerMenuList" of "More from Debenhams"  as "footerSubMenuList" as "Beauty Club Community" on "commonPage"


@automated @Fixed
Scenario: Verify that the social media links are working
  When I am in view of "socialMediaSection" on "commonPage"
  Then I should see "socialMediaSection" exist on "commonPage"
  And I verify "href" of "socialMediaFacebook" as "socialMediaLinkFacebook" on "commonPage"
  And I verify "href" of "socialMediaTwitter" as "socialMediaLinkTwitter" on "commonPage"
  And I verify "href" of "socialMediaPinterest" as "socialMediaLinkPinterest" on "commonPage"
  And I verify "href" of "socialMediaInstagram" as "socialMediaLinkInstagram" on "commonPage"
  And I verify "href" of "socialMediaYoutube" as "socialMediaLinkYoutube" on "commonPage"

@automated @Fixed
Scenario: Validate the verified by visa icon appearing in the footer
  Then I should see "verifiedByVisaIcon" exist on "commonPage"
  And I verify "href" of "verifiedByVisaIcon" as "verifiedByVisaLink" on "commonPage"

@automated @Fixed
Scenario Outline: Validate the error message for empty email address for subscribe newsletter
  When I am in view of "subscribeToNewsletter" on "commonPage"
  And I enter "<email>" in "subscribeEmail" on "commonPage"
  And I click on "subscribeButton" on "commonPage"
  Then I should see "subscribeEmailError" as "The email address field cannot be empty" on "commonPage"

  Examples:
    | email |
    |       |

@automated @Fixed
Scenario Outline: Validate the error message for incorrect email address for subscribe newsletter
  When I am in view of "subscribeToNewsletter" on "commonPage"
  And I enter "<email>" in "subscribeEmail" on "commonPage"
  And I click on "subscribeButton" on "commonPage"
  Then I should see "url" contains "https://pages.e.debenhams.com/"
  When I go back to previous page
  Then I should see "url" contains "www.debenhams.com"

  Examples:
    | email |
    | abcd  |

@automated @Fixed
Scenario Outline: verify that the delivery Options are present
  When I enter "<email>" in "subscribeEmail" on "commonPage"
  And I click on "subscribeButton" on "commonPage"
  Then I should see "url" contains "https://pages.e.debenhams.com/"
  When I go back to previous page
  Then I should see "url" contains "www.debenhams.com"

  Examples:
    | email         |
    | abc@gmail.com |

@manual @DBMTE-13
Scenario: Navigate to Debenhams home page and validate the footer links should work and open links in new tab

@manual @DBMTE-13
Scenario: Navigate to Debenhams home page and validate the country overlay section where Uk should be selected by default

@manual @DBMTE-13
Scenario: Navigate to Debenhams home page and validate the country overlay section where user can change the country as per the choice
