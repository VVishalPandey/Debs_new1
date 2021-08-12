Feature: Test Debenhams geo location service on mobile 	delivery page

@manual @DEBD-4071
Scenario: Validate use my location is visible on delivery page
  Given I logout
  Given I navigate to "testDressPdpURL"
  And geolocation service on the browser is not enabled by default
  Then I add the product to bag and go to my bag page
  And I set mvt test for "geaolocationvariant" as "variation1"
  And I click on "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as guest user
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  Then I should see "headerText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I should see "title" exist on "homeDeliveryPage"
  And I should see "firstName" exist on "homeDeliveryPage"
  And I should see "lastName" exist on "homeDeliveryPage"
  And I should see "phoneNumber" exist on "homeDeliveryPage"
  And I enter "firstName" in "firstName" on "homeDeliveryPage"
  And I enter "lastName" in "lastName" on "homeDeliveryPage"
  And I enter "phoneNumber" in "phoneNumber" on "homeDeliveryPage"
  When I click  "Find AddressInput Box"  on "homeDeliveryPage"
  And I should see "Use my location" in find address  on "homeDeliveryPage"
  And I should see "enterAddressManuallyLink" exist on "homeDeliveryPage"

@manual @DEBD-4071
Scenario: Validate user is able to add address using my location pop-up  on delivery page
  When I click on "Use my location" on "homeDeliveryPage"
  Then I should see "browserlocationPop-Up" exist on "homeDeliveryPage"
  And I should see "allowLocationService" exist on "homeDeliveryPage"
  And I should see "don'tAllowLocationService" exist on "homeDeliveryPage"
  When I click on "AllowLocationService" on "homeDeliveryPage"
  Then I should see "adressDropDown" exists on "homeDeliveryPage"
  And I click on one of the address from dropdown
  And I should see "useThisAddressButton" exist on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see the selected address
  And I should see "changelink" exist on "homeDeliveryPage"

@manual @DEBD-4071
Scenario: click on edit address from home delivery page and validate all prefilled information
    When I click on "ChangeLink" on "homeDeliveryPage"
    Then I should see value of "firstName" as "SelectedfirstNamePrefill" on "homeDeliveryPage"
    And I should see value of "lastName" as "selectedlastNamePreFill" on "homeDeliveryPage"
    And I should see value of "phoneNumber" as "selectedphoneNumberPreFill" on "homeDeliveryPage"
    Then I should see value of "houseNumber" as "selectedhouseNoPreFill" on "homeDeliveryPage"
    And I should see value of "addressLine1" as "selectedaddressL1PreFill" on "homeDeliveryPage"
    And I should see value of "country" as "selectedcountry" on "homeDeliveryPage"
    And I should see value of "city" as "city" on "homeDeliveryPage"
    And I should see value of "postcodePrefill" as "postcode1" on "homeDeliveryPage"

@manual @DEBD-4071
Scenario: Edit address from home delivery page and validate existing PCA find address is working
    When I click on "ChangeLink" on "homeDeliveryPage"
    Then I should change the value of "firstName" as "newfirstname" on "homeDeliveryPage"
    And I should see change the value of "lastName" as "newlastName" on "homeDeliveryPage"
    And I should see change the value of "phoneNumber" as "newPhoneNumber" on "homeDeliveryPage"
    And I enter "Sapient 63 turnmill" in findaddress field
    When I select pca address in address field
    And I should be able to proceed to payment Page

@manual @DEBD-4071
Scenario: Navigate back to  delivery address page and validate enter address manually link working as expected
  When I click on "ChangeLink" on "homeDeliveryPage"
  And I click on "enterAddressManuallyLink" on "homeDeliveryPage"
  Then I should see "headerText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I should see "title" exist on "homeDeliveryPage"
  And I should see "firstName" exist on "homeDeliveryPage"
  And I should see "lastName" exist on "homeDeliveryPage"
  And I should see "phoneNumber" exist on "homeDeliveryPage"
  And I should see "country" exist on "homeDeliveryPage"
  And I should see "houseNumber" exist on "homeDeliveryPage"
  And I should see "postcodeManual" exist on "homeDeliveryPage"
  And I should see "addressLine1" exist on "homeDeliveryPage"
  And I should see "addressLine2" exist on "homeDeliveryPage"
  And I should see "city" exist on "homeDeliveryPage"
  And I should see "county" exist on "homeDeliveryPage"
  And I should see "findAnotherAddressLink" exist on "homeDeliveryPage"
  And I enter all the details
  And I should be able to proceed to paymentPage

@manual @DEBD-4071
Scenario: validate billing address doesn't have use my location button
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Payment" on "paymentPage"
  Then I should see "billingAddressHeaderText" as "Billing Address" on "paymentPage"
  And I should see "newAddressText" as "Use new billing address" on "paymentPage"
  When I click on "newAddressText" on "paymentPage"
  Then I should see "titleMrs" exist on "paymentPage"
  And I should see "firstNameField" exist on "paymentPage"
  And I should see "lastNameField" exist on "paymentPage"
  And I should see "phoneNumberField" exist on "paymentPage"
  And I should see "countryGB" exist on "paymentPage"
  And I should see "houseNumberField" exist on "paymentPage"
  And I should see "postcodeField" exist on "paymentPage"
  And I should see "findAddButton" exist on "paymentPage"
  And I should see "enterAddressManuallyLink" exist on "paymentPage"
  And I should not see "usemylocation" on "paymentPage"

@manual @DEBD-4071
Scenario: place the order and validate that the selected address using my location is displayed on order confirmation page

@manual @DEBD-4071
Scenario: Validate that the use my location is not coming on entering the address while Beauty club registration

@manual @DEBD-4071
Scenario: Validate that the use my location is not coming on adding/editing the new address from my account


@manual @DEBD-4071
Scenario: Validate the existing delivery page behavior in case user don't allow the geo location
  Given I logout
  Given I navigate to "testDressPdpURL"
  Then I add the product to bag and go to my bag page
  And I set mvt test for "geaolocationvariant" as "variation1"
  And I click on "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as guest user
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  Then I should see "headerText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I enter "<firstName>" in "firstName" on "homeDeliveryPage"
  And I enter "<lastName>" in "lastName" on "homeDeliveryPage"
  And I enter "<phoneNumber>" in "phoneNumber" on "homeDeliveryPage"
  And I should see "Use my location" exist on "homeDeliveryPage"
  When I click on "Use my location" on "homeDeliveryPage"
  Then I should see "browserlocationPop-Up" exist on "homeDeliveryPage"
  And I should see "allowLocationService" exist on "homeDeliveryPage"
  And I should see "don'tAllowLocationService" exist on "homeDeliveryPage"
  When I click on "don'tAllowLocationService" exist on "homeDeliveryPage"
  When I click on "Use my location" on "homeDeliveryPage"
  Then I should not see "browserlocationPop-Up" on "homeDeliveryPage"
  When I select pca address in address field
  And I should see "useThisAddressButton" exist on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see the selected address
  And I should see "addressChangeLink" exist on "homeDeliveryPage"
  When I navigate to myBagPage
  Then I navigate to delivery options as guest user
  When I click on "Use my location" on "homeDeliveryPage"
  Then I should see "browserlocationPop-Up" exist on "homeDeliveryPage"


@manual @DEBD-4071
Scenario: Validate no Pop-up is displayed when the location service is already on
  Given I logout
  Given I navigate to "testDressPdpURL"
  And geolocation service on the browser enabled by default
  Then I add the product to bag and go to my bag page
  And I set mvt test for "geaolocationvariant" as "variation1"
  And I click on "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as guest user
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  Then I should see "headerText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I should see "title" exist on "homeDeliveryPage"
  And I should see "firstName" exist on "homeDeliveryPage"
  And I should see "lastName" exist on "homeDeliveryPage"
  And I should see "phoneNumber" exist on "homeDeliveryPage"
  And I enter "<firstName>" in "firstName" on "homeDeliveryPage"
  And I enter "<lastName>" in "lastName" on "homeDeliveryPage"
  And I enter "<phoneNumber>" in "phoneNumber" on "homeDeliveryPage"
  And I should see "Use my location" exist on "homeDeliveryPage"
  Then I should not see "browserlocationPop-Up" on "homeDeliveryPage"
  Then I should see "adressDropDown" exists on "homeDeliveryPage"
  And I click on one of the address from dropdown
  And I should see "useThisAddressButton" exist on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see the selected address
  And I should see "changelink" exist on "homeDeliveryPage"

@manual @DEBD-4071
Scenario: place the order and validate that the selected address using my location is displayed on order confirmation page

@manual @DEBD-4071
Scenario: validate existing billing address doesn't regressed after enabling geolocation service


@manual @DEBD-4071
Scenario: Validate the geolocation service with VPN on to another country
  Given I'm on connected to VPN (India)
  Given I navigate to "testDressPdpURL"
  And geolocation service on the browser enabled by default
  Then I add the product to bag and go to my bag page
  And I set mvt test for "geaolocationvariant" as "variation1"
  And I click on "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as guest user
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  Then I should see "headerText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I should see "title" exist on "homeDeliveryPage"
  And I should see "firstName" exist on "homeDeliveryPage"
  And I should see "lastName" exist on "homeDeliveryPage"
  And I should see "phoneNumber" exist on "homeDeliveryPage"
  And I enter "<firstName>" in "firstName" on "homeDeliveryPage"
  And I enter "<lastName>" in "lastName" on "homeDeliveryPage"
  And I enter "<phoneNumber>" in "phoneNumber" on "homeDeliveryPage"
  And I should see "Use my location" exist on "homeDeliveryPage"
  Then I should not see "browserlocationPop-Up" on "homeDeliveryPage"
  When I click on "Use my location" on "homeDeliveryPage"
  Then I should see results from Indian location
  And If the the product is not eligible for International delivery
  Then I should get an error message when address is selected from dropdown
  And if the product is eligible for international delivery
  Then I should be able to place order

@manual @DEBD-4071
Scenario: Validate the request made to loqate and validate the response
# need to check the request/response call for the validation

@manual @DEBD-4071
Scenario: Validate pca addresslook-up/enter Address manually/Change Adress functionality should work as it is when geolocation MVT is off



