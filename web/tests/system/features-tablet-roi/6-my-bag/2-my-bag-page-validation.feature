Feature: Test Debenhams Ireland my bag page validation

@manual @missing
Scenario: Navigate to Debenhams my bag page and remove products and validate empty bag
  Given I logout
  Then I am on my details page
  Then I navigate to mybag and empty the bag
  Then I should see "emptyBagHeaderText" as "Your bag is currently empty." on "myBagPage"
  And I should see "emptyBagBodyText" as "Why not treat yourself to a little something?" on "myBagPage"
  And I should see "emptyBagContinueButton" exist on "myBagPage"

@manual @missing
Scenario: Navigate to Debenhams my bag page and remove products and validate empty bag
  When I click on "emptyBagContinueButton" on "myBagPage"
  Then I should see "url" contains "http://www.debenhams.com"
  And I should not see "emptyBagContinueButton" on "myBagPage"
  And I should not see "emptyBagHeaderText" on "myBagPage"
  And I should not see "emptyBagBodyText" on "myBagPage"

@manual @missing
Scenario: Navigate to Debenhams my bag page and validate the product added in bag and the banner price and message
  Given I navigate to "testDressPdpURL"
  And I am in view of "allSizeElements" on "pdpPage"
  And I add the product to bag and go to my bag page
  And I should see "testDressProductName" product name exist on myBagPage
  Then I validate the "banner price"
  And I validate the "banner message"

@manual @missing
Scenario: Add one more product and validate the banner price and message and product in my bag
  Then I navigate to "testDress2PdpURL"
  And I am in view of "allSizeElements" on "pdpPage"
  And I add the product to bag and go to my bag page
  And I should see "testDress2ProductName" product name exist on myBagPage
  Then I validate the "banner price"
  And I validate the "banner message"

@manual @missing
Scenario: Navigate to Debenhams my bag page and validate the page
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should not see "checkoutButton" on "myBagPage"
  And I should see "checkoutButton2" exist on "myBagPage"
  And I should see "creditCardInfo" exist on "myBagPage"
  And I should see "headerItemsCount" exist on "myBagPage"
  And I should see "totalItemsCount" exist on "myBagPage"

@manual @missing
Scenario: Navigate to Debenhams my bag page and validate the total number of items in header & in total section with the total products in my bag
  Then I validate the "total items"

@manual @missing
Scenario: Navigate to Debenhams my bag page and validate the total product price
  Then I validate the "total product price"

@manual @missing
Scenario: Navigate to Debenhams my bag page and validate the subtotal
  Then I validate the "subtotal"

@manual @missing
Scenario: Navigate to Debenhams my bag page and validate the total discount
  When I have products with discount
  Then I validate the "total product discounts"

@manual @missing
Scenario: Navigate to Debenhams my bag page and validate stepper for product
  Given I navigate to "basketCheckoutUrl"
  Then I validate increase or decrease of product by changing steper with price also gettng changed with it

@manual @missing
Scenario: Navigate to Debenhams my bag page and validate bag for out of stock product
  Given I navigate to "basketCheckoutUrl"
  Then I validate my bag in case of out of stock product
  And Secure checkout button to disable
  And Out of stock label to appear in place of product stepper
  And Out of stock banner to appear of myBagPage

@manual @missing
Scenario: Navigate to Debenhams my bag page and validate the product details
  Given I navigate to "basketCheckoutUrl"
  Then I validate the product details (image, price and title)

@manual @missing
Scenario: Navigate to Debenhams my bag page and validate the free gift details
  Given I navigate to "basketCheckoutUrl"
  Then I validate the product details of free gift which got added from purchase
@manual @missing
Scenario: Navigate to My bag as Signed In user
  Given I logout
  Then I am on my details page
  When I navigate to mybag and empty the bag
  And I navigate to "testDressPdpURL"
  And I am in view of "allSizeElements" on "pdpPage"
  And I add the product to bag and go to my bag page
  And I should see "testDressProductName" product name exist on myBagPage
  When I click on "checkoutButton2" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"

@manual @missing
Scenario: Navigate to My bag as Guest user
  Given I logout
  And I navigate to "testDressPdpURL"
  And I am in view of "allSizeElements" on "pdpPage"
  And I add the product to bag and go to my bag page
  And I should see "testDressProductName" product name exist on myBagPage
  When I click on "checkoutButton2" on "myBagPage"
  Then I should see "emailAddressField" exist on "basketCheckoutPage"
  And I should see "newCustomerRadioButton" exist on "basketCheckoutPage"
  And I should see "returningCustomerRadioButton" exist on "basketCheckoutPage"
  And I should see "continueButton" exist on "basketCheckoutPage"

@manual @missing
Scenario: Navigate to My bag as guest user and verify that the New customer radio button is selected as default

@manual @missing
Scenario Outline: Navigate to My bag as Guest user and enter the email address for guest
  Then I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "newCustomerRadioButton" on "basketCheckoutPage"
  And I should not see "passwordField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  Then I close the browser

  Examples:
    | email           |
    | teest@gmail.com |

@manual @missing
Scenario Outline: Navigate to My bag as Ghost user
  Given I logout
  And I navigate to "testDressPdpURL"
  And I am in view of "allSizeElements" on "pdpPage"
  And I add the product to bag and go to my bag page
  And I should see "testDressProductName" product name exist on myBagPage
  When I click on "checkoutButton2" on "myBagPage"
  Then I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "newCustomerRadioButton" on "basketCheckoutPage"
  And I should not see "passwordField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "errorTextMessage" as "We've found an account related to this email address" on "ghostPage"
  And I wait for "2000" milliseconds
  When I click on "continueAsGuestButton" on "ghostPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  Then I close the browser

  Examples:
    | email                      |
    | testautomationd2@gmail.com |

@manual @missing
Scenario Outline: Navigate to My bag as Ghost user
  Given I logout
  When I navigate to mybag and empty the bag
  And I navigate to "testDressPdpURL"
  And I am in view of "allSizeElements" on "pdpPage"
  And I add the product to bag and go to my bag page
  And I should see "testDressProductName" product name exist on myBagPage
  When I click on "checkoutButton2" on "myBagPage"
  Then I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "newCustomerRadioButton" on "basketCheckoutPage"
  And I should not see "passwordField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "errorTextMessage" as "We've found an account related to this email address" on "ghostPage"
  And I wait for "2000" milliseconds
  When I click on "signInButton" on "ghostPage"
  Then I should see "emailAddressField" exist on "basketCheckoutPage"
  And I should see "newCustomerRadioButton" exist on "basketCheckoutPage"
  And I should see "returningCustomerRadioButton" exist on "basketCheckoutPage"
  And I should see "continueButton" exist on "basketCheckoutPage"

  Examples:
    | email                      |
    | testautomationd2@gmail.com |

@manual @missing
Scenario: Navigate to Debenhams my bag page and that place order and pay are sticky on the payment page
