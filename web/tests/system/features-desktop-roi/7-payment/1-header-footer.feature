Feature: Test Debenhams header and footer on payment page

@notAutomated @DEBD-323
Scenario: Validate the verified by visa icon appearing in the footer
  Given I navigate to "testDressPdpURL"
  And I add the product to bag and go to my bag page
  And I should see "testDressProductName" product name exist on myBagPage
  When I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as ghost user with UK address
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I am in view of "progressbar" on "paymentPage"
  Then I should see "headerText" as "Payment" on "paymentPage"
  And I should see "MyBaglink" exist on "paymentPage"
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
  And I should see "footerPaymentLabel" as "You are making a payment to Debenhams PLC, 10 Brock Street, Regent's Place, London NW1 3FG, United Kingdom" on "paymentPage"

@notAutomated @DEBD-338
Scenario: Validate clicking on My bag link/Delivery  from Payment page is navigating to MyBag/delivery page
  When I am in view of "progressbar" on "paymentPage"
  And I click on "MyBaglink" on "paymentPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  And I should see "myBagSummarySection" exist on "myBagPage"
  And I should see "checkoutButton" exist on "myBagPage"
  Then I navigate to delivery options as ghost user with UK address
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Payment" on "paymentPage"
  And I click on "Delivery" on "paymentPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homedelivery" on "deliveryOptionPage"
  And I should see "ClickAndCollect" on "deliveryOptionPage"


@manual @DEBD-338
Scenario: Validate UI behavior of Payment Page
 When I'm on paymentPage
 Then I should see payment chevron highlighted in white
 And I should see payment copy in bold
 And I should see delivery chevron in grey
 And I should see confirmation chevron in grey colour
 And I should not be able to click on confirmation chevron
