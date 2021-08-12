Feature: Test Debenhams end to end journey number 1

@automatedSanity @preprodSanity @e2e
Scenario: Validate robot.txt file is not throwing generic error and returning 200 status code
  Given I validate status code of "robotTxtUrl" as "200"

@aip @preprodSanity @e2e
Scenario: Set the mobify cookie & navigate to homepage with a signout out user and validate the search icon with field and apply button
  Given I logout
  #Then I should see "searchIcon" exist on "commonPage"
  #When I click on "searchIcon" on "commonPage"
  #Then I should see "searchField" exist on "commonPage"
  #And I should see "searchApply" exist on "commonPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate that user lands on SCAT if search for Home Sale
  And I enter "Hats" in "searchField" on "commonPage"
  Then I select the auto search department as "Women"
  Then I should see "headerText" as ""hats"" on "pspPage"
  And I should see "url" contains "search/hats/women"

@automatedSanity @preprodSanity @e2e
Scenario: Validate that user lands on SCAT if search for Home Sale
  When I click on "searchIcon" on "commonPage"
  And I enter "Hats" in "searchField" on "commonPage"
  Then I select the auto search department as "ladies"
  Then I should see "headerText" as ""ladies hats"" on "pspPage"
  And I should see "url" contains "search/ladies+hats"

@automatedSanity @preprodSanity @e2e
Scenario: Validate that user lands on SCAT if search for Home Sale
  And I enter "Home sale" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "headerText" as "Sale: Homeware" on "pspPage"
  And I should see "url" contains "sale/home"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the search result when user choose Joseph Joseph under Brand
  When I "validate & click" subFilter option "Joseph Joseph" under "Brand" on commonPage bigscreen
  And I should see "headerText" containing "Home" on "pspPage"
  And I should see "pspHeader" as "Joseph Joseph" on "pspPage"
  And I should see "url" contains "sale/home/joseph-joseph"

@automatedSanity @preprodSanity @e2e
Scenario: Validate that user lands on brand room if search for Kat Von D
  When I click on "searchIcon" on "commonPage"
  And I enter "Kat Von D" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  #Then I should see "headerText" as "Beauty" on "pspPage"
  And I should see "url" contains "beauty/kvd-vegan-beauty"

@automatedSanity @preprodSanity @e2e
Scenario: Validate that user lands on TCAT Page if search for Men
  When I click on "searchIcon" on "commonPage"
  And I enter "Men" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  And I should see "headerText" containing "Men" on "pspPage"
  And I should see "url" contains "/Men"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the search result psp page when user search for MAC
  When I click on "searchIcon" on "commonPage"
  And I enter "MAC" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "searchText" as "Search results for..." on "pspPage"
  And I should see "headerText" containing "MAC" on "pspPage"
  And I should see "url" contains "search/MAC"

@automatedSanity @preprodSanity @e2e
Scenario: Validate that user lands on SCAT if search for Women sale
  When I click on "searchIcon" on "commonPage"
  And I enter "Women sale" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "headerText" as "Women's sale" on "pspPage"
  And I should see "url" contains "sale/women"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the search result when user choose Coats & jackets wear under Categories
  When I "validate & click" subFilter option "Coats & jackets" under "Categories" on commonPage bigscreen
  Then I should see "headerText" containing "Sale: Women's Coats & Jackets" on "pspPage"
  And I should see "url" contains "sale/women/coats-jackets"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the search result psp page when user apply filter Brand - Dorothy Perkins
  When I "validate & click" subFilter option "View more" under "Brand" on commonPage bigscreen
  Then I should see "searchPanel" exist on "pspPage"
  When I enter "Dorothy Perkins" in "searchPanel" on "pspPage"
  And I "validate & click" subFilter option "Dorothy Perkins" under "Brand" on commonPage bigscreen
  And I should see "headerText" containing "Women's coats & jackets" on "pspPage"
  And I should see "pspHeader" as "Dorothy Perkins" on "pspPage"
  And I should see "url" contains "sale/women/coats-jackets/dorothy-perkins"

@automatedSanity @preprodSanity @e2e
Scenario: Validate discount amount on Finance banner for mixed bag
  Given I logout
  Given I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I navigate to "freeGiftPdpURL"
  And I select available size enter quantity as "3" and add to bag on pdpPage
  When I navigate to "knickerPdpUrl"
  And I select available size enter quantity as "3" and add to bag on pdpPage
  When I navigate to "testDress2PdpURL"
  And I select available size and add to bag on pdpPage
  When I navigate to "testChannelPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  And I wait for "5000" milliseconds
#   When I am in view of "financeBanner" on "myBagPage"
#   And I validate the "finance banner value"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to payments page with new delivery address and delivery option selected as standard
  When I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as ghost user with UK address

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to payments page with new delivery address and delivery option selected as standard
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario: On Payment page add a new delivery address which handle PCA address also
  When I am in view of "billingAddressHeaderText" on "paymentPage"
  Then I should see "billingAddressHeaderText" as "Billing Address" on "paymentPage"
  And I should see "newAddressText" as "Use new billing address" on "paymentPage"
  Then I am in view of "newAddressText" on "paymentPage"
  When I click on "newAddressText" on "paymentPage"
  Then I select new billing address and provide UK address details and use this address
  And I should see "editAddressLink" exist on "paymentPage"
  #And I should see "addNewAddressLink" exist on "paymentPage"
  And I should not see "findAddressButton" on "paymentPage"
  And I should not see "useAddressButton" on "paymentPage"
  And I should not see "bfpoLink" on "paymentPage"
  And I should not see "searchPostcodeLink" on "paymentPage"
  And I should not see "enterAddressManuallyLink" on "paymentPage"
