Feature: Test Debenhams basket checkout page with variation 4

@automated @DEBD-3156
Scenario: Validate that the Checkout Sign In page is displayed when tealium_audienceref cookie present
 Given I logout
 Then I am on my details page
 Given I logout
 Given I navigate to "testDressPdpURL"
 Then I add the product to bag and go to my bag page
 And I set mvt test for "checkoutLoginTealium" as "variation4"
 And I click on "checkoutButton" on "myBagPage"
 And I should see "guestHeaderText" as "Sign in" on "basketCheckoutPage"
 And I should see "emailAddressField" exist on "basketCheckoutPage"
 And I should see "passwordField" exist on "basketCheckoutPage"
 And I should see "forgotPasswordLink" exist on "basketCheckoutPage"
 And I should see "signInButton" exist on "basketCheckoutPage"
 And I should see "continueAsGuestButton" exist on "basketCheckoutPage"
 And I should see "closeButton" exist on "basketCheckoutPage"

@automated @DEBD-3156
Scenario Outline: Validate that user gets an error on entering incorrect email on Checkout Sign In page is displayed when tealium_audienceref cookie present
 When I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
 And I enter "<password>" in "passwordField" on "basketCheckoutPage"
 And I click on "signInButton" on "basketCheckoutPage"
 Then I should see "emailErrorMessage" as "Enter a valid email address" on "basketCheckoutPage"
 And I should see "passwordErrorMessage" as "The password field cannot be empty" on "basketCheckoutPage"

 Examples:
   | email | password |
   | user1 |          |

@automated @DEBD-3156
Scenario Outline: Navigate to Checkout Sign In page when tealium_audienceref cookie present and validate login with incorrect credentials
 And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
 And I enter "<password>" in "passwordField" on "basketCheckoutPage"
 And I click on "signInButton" on "basketCheckoutPage"
 Then I should see "invalidLoginMessage" as "We can’t find an account with this email address. Please check your email address and try again or register for a new account." on "basketCheckoutPage"

 Examples:
   | email           | password |
   | user111111111@gmail.com | pass1    |

@automated @DEBD-3156
Scenario Outline: Navigate to Checkout Sign In page when tealium_audienceref cookie present and validate login with correct credentials
 And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
 And I enter "<password>" in "passwordField" on "basketCheckoutPage"
 And I click on "signInButton" on "basketCheckoutPage"
 Then I should see "headerText" as "How would you like to receive your order?" on "deliveryOptionPage"

 Examples:
   | email                      | password     |
   | testautomationd5@gmail.com | password5    |

@automated @DEBD-3156
Scenario: Validate that the Checkout Guest page when tealium_audienceref cookie present
 Given I logout
 Given I navigate to "testDressPdpURL"
 Then I add the product to bag and go to my bag page
 And I set mvt test for "checkoutLoginTealium" as "variation1"
 And I click on "checkoutButton" on "myBagPage"
 Then I should not see "loginExisting" on "basketCheckoutPage"
 And I should see the "headerText" as "Sign in" on "basketCheckoutPage"
 Then I click on "continueAsGuestButton" on "basketCheckoutPage"
 And I should see the "headerText" as "Continue as guest" on "basketCheckoutPage"
 And I should see "emailAddressField" exist on "basketCheckoutPage"
 And I should not see "passwordField" on "basketCheckoutPage"
 And I should not see "signInButton" on "basketCheckoutPage"
 And I should see "continueButton" exist on "basketCheckoutPage"
 And I should see "closeButton" exist on "basketCheckoutPage"

@automated @DEBD-3156
Scenario Outline: Validate that the Checkout Guest page when tealium_audienceref cookie present and validate guest with incorrect credentials
 When I enter "<email>" in "emailAddressFieldSignIn" on "basketCheckoutPage"
 And I click on "continueButton" on "basketCheckoutPage"
 Then I should see "emailErrorMessage" as "Enter a valid email address" on "basketCheckoutPage"

 Examples:
   | email |
   | user1 |

@manual @DEBD-3156
Scenario Outline: Validate that the Checkout Guest page when tealium_audienceref cookie present and validate guest with correct credentials
 When I enter "<email>" in "emailAddressFieldSignIn" on "basketCheckoutPage"
 And I click on "continueButton" on "basketCheckoutPage"
 Then I should see "headerText" as "How would you like to receive your order?" on "deliveryOptionPage"

 Examples:
   | email           |
   | user1@gmail.com |

@automated @DEBD-3156
Scenario Outline: Validate that the Checkout Ghost page when tealium_audienceref cookie present
 Given I logout
 Given I navigate to "testDressPdpURL"
 Then I add the product to bag and go to my bag page
 And I set mvt test for "checkoutLoginTealium" as "variation1"
 And I click on "checkoutButton" on "myBagPage"
 And I should see the "headerText" as "Sign in" on "basketCheckoutPage"
 Then I click on "continueAsGuestButton" on "basketCheckoutPage"
 And I should see the "headerText" as "Continue as guest" on "basketCheckoutPage"
 And I should see "emailAddressField" exist on "basketCheckoutPage"
 When I enter "<email>" in "emailAddressFieldSignIn" on "basketCheckoutPage"
 Then I click on "guestLoginContinueButton" on "basketCheckoutPage"
 And I should see "checkoutHeader" as "You have an account" on "basketCheckoutPage"
 And I should see "goToAccountText" as "Go to your account" on "basketCheckoutPage"
 And I should see "quickerSignText" as "Sign in for a quicker checkout" on "basketCheckoutPage"
 And I should see "emailAddressGhost" as "<email>" on "basketCheckoutPage"
 And I should see "passwordField" exist on "basketCheckoutPage"
 And I should see "ghostSignInButton" exist on "basketCheckoutPage"
 And I should see "continueAsGuestButton" exist on "basketCheckoutPage"
 Then I click on "continueAsGuestButton" on "basketCheckoutPage"
 And I should see "headerTextUk" as "How would you like to receive your order?" on "deliveryOptionPage"

 Examples:
   | email                      |
   | testautomationd5@gmail.com |
