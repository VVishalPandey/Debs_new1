Feature: Test Debenhams product checkout journey for registered with saved address

@automated
Scenario Outline: Navigate to sign page and login with e2e credentials
  Given I logout
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I click on "menuIcon" on "commonPage"
  And I "validate & click" option is available in "mainMenuList" as "Create Account/Sign In" on "commonPage"
  When I enter "<emailNewsYes>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<passwordNewsYes>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"

  Examples:
    | emailNewsYes      | passwordNewsYes |
    | testvad@gmail.com | test1234        |

@automated
Scenario: Navigate to women dresses pdp page and add to bag
  Then I navigate to "dressUrlAU"
  And I add to bag quantity "1" and go to my bag page

@automated
Scenario: Navigate to payments page with saved address and delivery option as standard
  Then I navigate to delivery options as user already loggedIn with IE savedAddress
  And I should see "headerText" as "Choose your delivery option" on "deliveryOptionPage"
  When I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive within" on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I wait for "2000" milliseconds
  Then I should see "headerText" as "Payment" on "paymentPage"

@automated @DBNHST-1429
Scenario: Validate the delivery address page for new address with MVT variation-2 and I should see the full name
  Then I am on my details page
  Then I navigate to "testDressPdpURL"
  Then I select the available size swatch
  And I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I wait for "20000" milliseconds
  And I click on "checkoutButton" on "myBagPage"
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  Then I should see "headerText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I click on "newAddressRadioButton" on "homeDeliveryPage"
  Then I should see "title" exist on "homeDeliveryPage"
  And I should see "firstName" exist on "homeDeliveryPage"
  And I should not see "lastName" on "homeDeliveryPage"
  And I should see "phoneNumber" exist on "homeDeliveryPage"
  And I should see "country" exist on "homeDeliveryPage"
  And I should see "houseNumber" exist on "homeDeliveryPage"
  And I should see "postcode" exist on "homeDeliveryPage"
  And I should see "findYourAddressButton" exist on "homeDeliveryPage"
  And I should see "enterAddressManuallyLink" exist on "homeDeliveryPage"

@manual @DBNHST-1429
Scenario: Validate that the copy under phone number changed to "We will use this to send updates about your delivery" is displayed for MVT-2 on the delivery address page

@manual @DBNHST-1429
Scenario: Validate that the delivery address entered on delivery page with MVT variation-1 is displayed in the billing address section on the payment page for guest user

@manual @DBNHST-1429
Scenario: Validate that the delivery address entered on delivery page with MVT variation-1 is displayed in the my address book page on the payment page for logged in user

@manual @DBNHST-1423
Scenario: Navigate to the delivery page of a registered user with saved addresses and validated that the saved addresses are displayed in different containers and not as useAddressDropDown

@manual @DBNHST-1423
Scenario: Navigate to the delivery page of a registered user with saved addresses and validated that the first saved address radio button is selected by default and the container contains the Use this address button

@manual @DBNHST-1423
Scenario: Navigate to the delivery page of a registered user with saved addresses and validated that user is able to select any of the saved address radio button

@manual @DBNHST-1423
Scenario: Navigate to the delivery page of a registered user with saved addresses and validated that the add new address container has dashed border with teal +

@manual @DBNHST-1430
Scenario: Navigate to the delivery page of a registered user with saved addresses and validated that user is able to see the title options in boxes with Mrs as default selected on clicking add new address link

@manual @DBNHST-1513
Scenario: Navigate to the delivery page of a registered user with saved addresses and validated that user is able to see the Add title input flied on selecting title as Other on add new address delivery page

@manual @DBNHST-1423
Scenario: Navigate to the delivery page of a registered user with saved addresses and validated that user is able to add new address successfully which also get reflected on the My aaddress book and the billing address page
