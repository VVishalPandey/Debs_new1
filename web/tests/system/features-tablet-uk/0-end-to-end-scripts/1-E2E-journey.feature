Feature: Test Debenhams end to end journey number 1

@automatedSanity1 @preprodSanity @e2e
Scenario: Navigate to homepage with a signout out user and validate the search icon with field and apply button
  Given I logout
  Then I should see "searchIcon" exist on "commonPage"
  When I click on "searchIcon" on "commonPage"
  Then I should see "searchField" exist on "commonPage"
  And I should see "searchApply" exist on "commonPage"

@automatedSanity1 @preprodSanity @e2e
Scenario: Validate that user lands on SCAT if search for Home Sale
  And I enter "Home sale" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "headerText" as "SALE: HOMEWARE" on "pspPage"
  And I should see "url" contains "sale/home"

@automatedSanity1 @preprodSanity @e2e
Scenario: Validate the search result when user choose Joseph Joseph under Brand
  And I should see "filterButton" exist on "pspPage"
  When I click on "filterButton" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Joseph Joseph" on "pspPage"
  And I click on "closeIcon" on "pspPage"
  And I should see "headerText" containing "Home" on "pspPage"
  And I should see "pspHeader" as "Joseph Joseph" on "pspPage"
  And I should see "url" contains "sale/home/joseph-joseph"

@automatedSanity1 @preprodSanity @e2e
Scenario: Validate that user lands on brand room if search for Kat Von D
  When I click on "searchIcon" on "commonPage"
  And I enter "Kat Von D" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  And I should see "url" contains "beauty/kvd-vegan-beauty"

@automatedSanity1 @preprodSanity @e2e
Scenario: Validate that user lands on TCAT Page if search for Men
  When I click on "searchIcon" on "commonPage"
  And I enter "Men" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  And I should see "headerText" containing "Men" on "pspPage"
  And I should see "url" contains "/Men"

@automatedSanity1 @preprodSanity @e2e
Scenario: Validate the search result psp page when user search for MAC
  When I click on "searchIcon" on "commonPage"
  And I enter "MAC" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "searchText" as "Search results for..." on "pspPage"
  And I should see "headerText" containing "MAC" on "pspPage"
  And I should see "url" contains "search/MAC"

@automatedSanity1 @preprodSanity @e2e
Scenario: Validate that user lands on SCAT if search for Women sale
  When I click on "searchIcon" on "commonPage"
  And I enter "Women sale" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "headerText" as "Women's sale" on "pspPage"
  And I should see "url" contains "sale/women"

@automatedSanity1 @preprodSanity @e2e
Scenario: Validate the search result when user choose Coats & jackets under Categories
  When I click on "filterButton" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Categories" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Categories"  as "filterSubMenuLinkList" as "Coats & jackets" on "pspPage"
  And I click on "closeButton" on "pspPage"
  Then I should see "headerText" containing "Women's Coats & Jackets" on "pspPage"
  And I should see "url" contains "/sale/women/coats-jackets"

@automatedSanity1 @preprodSanity @e2e
Scenario: Validate the search result psp page when user apply filter Brand - Dorothy Perkins
  When I click on "filterButton" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewCheckboxList" as "View" on "pspPage"
  Then I should see "searchPanel" exist on "pspPage"
  When I am in view of "searchPanel" on "pspPage"
  And I enter "Dorothy Perkins" in "searchPanel" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewCheckboxList" as "Dorothy Perkins" on "pspPage"
  And I click on "closeButton" on "pspPage"
  And I should see "headerText" containing "Women's coats & jackets" on "pspPage"
  And I should see "pspHeader" as "Dorothy Perkins" on "pspPage"
  And I should see "url" contains "/sale/women/coats-jackets/dorothy-perkins"

@automatedSanity1 @preprodSanity @e2e
Scenario: Validate that user lands on SCAT if search for Home Sale
  Then I click on "searchIcon" on "commonPage"
  And I enter "Hats" in "searchField" on "commonPage"
  Then I select the auto search department as "ladies"
  Then I should see "headerText" as ""ladies hats"" on "pspPage"
  And I should see "url" contains "search/ladies+hats"

@automatedSanity1 @preprodSanity @e2e
Scenario: Validate that user lands on SCAT if search for Home Sale
  When I click on "searchIcon" on "commonPage"
  And I enter "Hats" in "searchField" on "commonPage"
  Then I select the auto search department as "Women"
  Then I should see "headerText" as ""hats"" on "pspPage"
  And I should see "url" contains "search/hats/women"

@automatedSanity1 @preprodSanity @e2e
Scenario: Validate the product gets added in my when user select add to bag
  When I navigate to "testDress2PdpURL"
  Then I add the product to bag and go to my bag page
  And I should see "testDress2ProductName" product name exist on myBagPage
  And I store details from myBag to validate later
#   And I validate the "banner price"
#   And I validate the "banner message"
  And I validate the "total items"
  And I validate the "total product price"
  And I validate the "subtotal"

@automatedSanity1 @preprodSanity @e2e
Scenario: Navigate to payments page with new delivery address and delivery option selected as standard
  When I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as ghost user with UK address
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"

@automatedSanity1 @preprodSanity @e2e
Scenario: On Payment page add a new delivery address which handle PCA address also
  When I am in view of "billingAddressHeaderText" on "paymentPage"
  Then I should see "billingAddressHeaderText" as "Billing Address" on "paymentPage"
  And I should see "newAddressText" as "Use new billing address" on "paymentPage"
  Then I am in view of "newAddressText" on "paymentPage"
  When I click on "newAddressText" on "paymentPage"
  Then I select new billing address and provide UK address details and use this address
  And I should see "editAddressLink" exist on "paymentPage"
  And I should not see "findAddressButton" on "paymentPage"
  And I should not see "useAddressButton" on "paymentPage"
  And I should not see "bfpoLink" on "paymentPage"
  And I should not see "searchPostcodeLink" on "paymentPage"
  And I should not see "enterAddressManuallyLink" on "paymentPage"
