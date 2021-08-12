Feature: Test Debenhams basket checkout functionality

@automated @DEBD-336 @Fixed
Scenario: Validation of the  Bag Login pop up when user is not signed in
  Given I logout
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "bagLoginOverlayHeader" as "Secure Checkout" on "loginPage"
  Then I should see "confirmOrderCopy" as "We'll confirm your order to this email address" on "loginPage"
  And I should see "bagLoginOverlay" exist on "loginPage"
  And I should see "bagLoginOverlayHeader" exist on "loginPage"
  And I should see "emailAddressFieldSignIn" exist on "loginPage"
  And I should see "continueAsGuestText" exist on "loginPage"
  And I should see "signInAsText" exist on "loginPage"
  And I should see "cancelButton" exist on "loginPage"
  And I should see "continueButton" exist on "loginPage"
  And I should see "closeIcon" exist on "loginPage"

@automated @DEBD-336 @Fixed
Scenario: Validation of the  cancel/close functionality in Bag Login pop up
    And I click on "closeIcon" on "loginPage"
    #And I should not see "bagLoginOverlay" on "loginPage"
    And I click on "checkoutButton" on "myBagPage"
    And I wait for "5000" milliseconds
    And I click on "cancelButton" on "loginPage"
    And I wait for "3000" milliseconds
    And I should not see "bagLoginOverlay" on "loginPage"


@automated @DEBD-336 @Fixed
Scenario Outline: Validate email should prefilled when you enter email and then close overlay and open again
    And I click on "checkoutButton" on "myBagPage"
    When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
    And I click on "cancelButton" on "loginPage"
    #Then I should not see "bagLoginOverlay" on "loginPage"
    When I click on "checkoutButton" on "myBagPage"
    And I wait for "5000" milliseconds
    Then I validate "value" of "emailAddressFieldSignIn" as "<email>" on "loginPage"

  Examples:
    | email |
    | user1@gmail.com |

@automated @DEBD-318 @Fixed
Scenario Outline: Navigate to Debenhams bag login popup and validate the error messages for empty/invalid email
    And I click on "closeIcon" on "loginPage"
    And I click on "checkoutButton" on "myBagPage"
    When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
    And I click on "continueGuestRadioButton" on "loginPage"
    Then I click on "continueButton" on "loginPage"
    And I wait for "5000" milliseconds
    Then I should see "emailErrorMessage" as "<message>" on "loginPage"

 Examples:
    | email | message |
    | user1 | ENTER A VALID EMAIL ADDRESS |
    ||  THE EMAIL ADDRESS FIELD CANNOT BE EMPTY     |

@automated @DEBD-318 @Fixed
Scenario Outline: Navigate to Debenhams delivery page as a guest
    And I click on "closeIcon" on "loginPage"
    And I click on "checkoutButton" on "myBagPage"
    When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
    And I click on "continueGuestRadioButton" on "loginPage"
    And I click on "continueButton" on "loginPage"
    And I wait for "5000" milliseconds
    And I should see "url" contains "wcs/stores/servlet/SelectDeliveryMethodView"
    # Then I should see "headerText" as "How would you like to receive your order?" on "basketCheckoutPage"

 Examples:
    | email |
    | user1pp@gmail.com |

@manual @DEBD-318
Scenario: Validate the UI of Bag Login pop up overlay
    And I add the product to bag and go to my bag page
    When I click on "checkoutButton2" on "myBagPage"
    And I click on "continueGuestRadioButton" on "loginPage"
    Then the radio button will fill teal
    And the sign in radio button will remain unfilled
    And the continue CTA will activate

@automated @DEBD-319 @Fixed
Scenario: Validation of the Bag Login pop up when user has clicked on sign in
    Given I navigate to "homeURL"
    And I am on my details page
    And I logout
    When I navigate to "testDressPdpURL"
    And I select available size enter quantity as "1" and add to bag on pdpPage
    And I validate current pdp product "exist" on "myBagPage"
    When I click on "checkoutButton" on "myBagPage"
    And I should see "continueGuestRadioButton" exist on "loginPage"
    And I should see "signinRadioButton" exist on "loginPage"
    And I click on "signinRadioButton" on "loginPage"
    And I click on "signinRadioButton" on "loginPage"
    And I should see "bagLoginOverlayHeader" as "Secure Checkout" on "loginPage"
    And I should see "emailAddressFieldSignIn" exist on "loginPage"
    And I should see "passwordField" exist on "loginPage"
    And I should see "showHideButton" exist on "loginPage"
    And I should see "forgotPasswordLink" exist on "loginPage"
    And I should see "cancelButton" exist on "loginPage"
    And I should see "continueButton" exist on "loginPage"
    And I should see "closeIcon" exist on "loginPage"


@automated @DEBD-319 @Fixed
Scenario Outline: Navigate to bag pop up overlay and validate continue button state if you login with incorrect credentials
  And I click on "cancelButton" on "loginPage"
  When I click on "checkoutButton" on "myBagPage"
  And I click on "signinRadioButton" on "loginPage"
  And I click on "signinRadioButton" on "loginPage"
  Then I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "continueButton" on "loginPage"
  And I wait for "5000" milliseconds
  Then I should see "continueButton" "disabled" on "loginPage"

  Examples:
    | email            | password |
    | user31@gmail.com | Test1234 |

@automated @DEBD-319 @Fixed
Scenario Outline: Navigate to bag pop up overlay and validate errror message if you provid invalid email and valid password
  And I click on "cancelButton" on "loginPage"
  And I click on "checkoutButton" on "myBagPage"
  And I click on "signinRadioButton" on "loginPage"
  And I click on "signinRadioButton" on "loginPage"
  Then I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "continueButton" on "loginPage"
  And I wait for "5000" milliseconds
  And I should see "secureCheckoutError" as "We can't find an account with this email address. Please check your email address and try again or register for a new account." on "loginPage"

  Examples:
    | email            | password |
    | user31@gmail.com | ghgdd    |

@automated @DEBD-319 @Fixed
Scenario Outline: Navigate to bag login pop up  and validate errror message if you provid valid email and invalid password
  And I navigate to "forgotPasswordUrl"
  And I wait for "5000" milliseconds
  When I enter "<email>" in "emailAddressField" on "forgotPasswordPage"
  And I click on "resetPasswordButton" on "forgotPasswordPage"
  And I wait for "5000" milliseconds
  And I navigate to "basketCheckoutUrl"
  And I wait for "5000" milliseconds
  And I click on "checkoutButton" on "myBagPage"
  And I click on "signinRadioButton" on "loginPage"
  And I click on "signinRadioButton" on "loginPage"
  Then I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I wait for "2000" milliseconds
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "continueButton" on "loginPage"
  And I wait for "5000" milliseconds
  And I should see "secureCheckoutError1" as "Password incorrect - Please check your details and try again." on "loginPage"

  Examples:
    | email                       | password |
    | testautomationd31@gmail.com | ghgdd    |

@automated @DEBD-319 @Fixed
Scenario Outline: Navigate to bag login pop up and validate show hide functiality for password
  Given I logout
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I click on "signinRadioButton" on "loginPage"
  And I click on "signinRadioButton" on "loginPage"
  And I wait for "2000" milliseconds
  And I enter "<password>" in "passwordField" on "loginPage"
  Then I validate "type" of "passwordFieldType" as "password" on "loginPage"
  When I click on "showHideButton" on "loginPage"
  Then I validate "type" of "passwordFieldType" as "text" on "loginPage"
  When I click on "showHideButton" on "loginPage"
  Then I validate "type" of "passwordFieldType" as "password" on "loginPage"

  Examples:
    | password  |
    | password2 |

@automated @DEBD-319 @Fixed
Scenario Outline: Validate user is able to login when he enters the valid email and password
    And I click on "closeIcon" on "loginPage"
    And I click on "checkoutButton" on "myBagPage"
    And I wait for "2000" milliseconds
    And I click on "signinRadioButton" on "loginPage"
    And I click on "signinRadioButton" on "loginPage"
    When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
    And I wait for "2000" milliseconds
    And I enter "<password>" in "passwordField" on "loginPage"
    And I click on "continueButton" on "loginPage"
    And I wait for "10000" milliseconds
    And I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
    Then I should not see "signinRadioButton" on "loginPage"

     Examples:
    | email | password |
    | testautomationd111@gmail.com | password2 |


@automated @DEBD-319 @Fixed
Scenario: Navigate to bag login pop up and validate forgot password functionality
  Given I logout
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I click on "signinRadioButton" on "loginPage"
  And I click on "signinRadioButton" on "loginPage"
  And I click on "forgotPasswordLink" on "loginPage"
  And I wait for "5000" milliseconds
  Then I should see "headerText" as "Forgotten your password?" on "forgotPasswordPage"


@automated @DEBD-549 @Fixed
Scenario: Navigate to bag login pop up and validate secure checkout icon
  Given I logout
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I wait for "5000" milliseconds
  And I should see "secureCheckoutIcon" exist on "loginPage"
