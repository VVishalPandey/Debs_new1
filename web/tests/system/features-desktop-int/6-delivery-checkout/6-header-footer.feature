Feature: Test Debenhams header and footer on delivery checkout


@notAutomated @DEBD-323 @DEBD-338
Scenario: Validate the verified by visa icon appearing in the footer
  Given I navigate to "testDressPdpURL"
  And I add the product to bag and go to my bag page
  And I should see "testDressProductName" product name exist on myBagPage
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I am in view of "progressbar" on "deliveryOptionPage"
  Then I should see "headerText" as "Delivery" on "deliveryOptionPage"
  And I should see "MyBaglink" exist on "deliveryOptionPage"
  When I am in view of "footerMenuSection" on "commonPage"
  Then I should see "verifiedByVisaIcon" exist on "commonPage"
  And I verify "href" of "verifiedByVisaIcon" as "WeacceptthefollowingpaymentmethodsHref" on "commonPage"
  Then I should not see "footerMenuList" on "commonPage"
  Then I should not see "footerSubMenuList" on "commonPage"
  Then I should not see "socialMediaSection" on "commonPage"

@notAutomated @DEBD-323
Scenario: Navigate to Debenhams home page and validate the footer links should work and open links in new tab
  When I am in view of "termsConditionSection" on "commonPage"
  Then I verify "href" of "cookies" as "CookiesLink" on "commonPage"
  And I verify "href" of "privacy" as "PrivacyLink" on "commonPage"
  And I verify "href" of "termsCondition" as "TermsConditionLink" on "commonPage"
  And I verify "href" of "legalDisclaimer" as "LegalDisclaimerPop" on "commonPage"
  And I should see "copyrightDisclaimerText" as "Copyright © Debenhams Retail plc. All rights reserved" on "commonPage"

@notAutomated @DEBD-338
Scenario: Validate clicking on My bag link from Delivery option page is navigating to MyBag page
  When I am in view of "progressbar" on "deliveryOptionPage"
  And I click on "MyBaglink" on "deliveryOptionPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I should see "myBagSummarySection" exist on "myBagPage"
  And I should see "checkoutButton" exist on "myBagPage"

@manual @DEBD-338
Scenario: Validate UI behavior of Payment Page
 When I'm on deliveryOptionPage
 Then I should see delivery chevron highlighted in white
 And I should see delivery text in bold
 And I should see payment chevron in grey and unclickable
 And I should see confirmation in grey and unclickable

