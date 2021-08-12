Feature: Test Debenhams basket checkout page with variation 2

    @automated @DEBD-3156
    Scenario Outline: Validate the checkout Sign in Page for Registered User
        Given I logout
        And I navigate to "testDressPdpURL"
        Then I add the product to bag and go to my bag page
        Then I should scroll to "checkoutButton" on "myBagPage"
        And I set mvt test for "checkoutLoginTealium" as "variation2"
        And I click on "checkoutButton" on "myBagPage"
        Then I should see "checkoutHeader" as "Secure Checkout" on "basketCheckoutPage"
        Then I should see "confirmOrderCopy" as "We'll confirm your order to this email address" on "loginPage"
        And I should see "bagLoginOverlay" exist on "loginPage"
        And I should see "bagLoginOverlayHeader" exist on "loginPage"
        And I should see "emailAddressFieldSignIn" exist on "loginPage"
        And I should see "continueAsGuestText" exist on "loginPage"
        And I should see "signInAsText" exist on "loginPage"
        And I should see "cancelButton" exist on "loginPage"
        And I should see "continueButton" exist on "loginPage"
        And I should see "closeIcon" exist on "loginPage"
        When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
        And I click on "signinRadioButton" on "loginPage"
        And I wait for "2000" milliseconds
        And I enter "<password>" in "passwordField" on "loginPage"
        And I click on "continueButton" on "loginPage"
        And I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
        Then I should not see "signinRadioButton" on "loginPage"

        Examples:
            | email                       | password  |
            | testautomationd2@gmail.com  | password2 |


    @automated @DEBD-3156
    Scenario Outline: Validate the checkout Sign in Page for guest User
        Given I logout
        And I navigate to "testDressPdpURL"
        Then I add the product to bag and go to my bag page
        And I click on "checkoutButton" on "myBagPage"
        And I should see "checkoutHeader1" as "Secure Checkout" on "basketCheckoutPage"
        And I should see "returningCustomerLogin" exist on "basketCheckoutPage"
        And I should see "returningCustomerLoginText" as "A quicker checkout using my saved details" on "basketCheckoutPage"
        And I should see "guestLogin" exist on "basketCheckoutPage"
        And I should see "closeButton" exist on "basketCheckoutPage"
        When I click on "guestLogin" on "basketCheckoutPage"
        And I should see "guestHeaderText" as "Continue as guest" on "basketCheckoutPage"
        And I should see "emailAddressField" exist on "basketCheckoutPage"
        And I should see "signInButton" exist on "basketCheckoutPage"
        And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
        Then I click on "guestLoginContinueButton" on "basketCheckoutPage"
        And I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"

        Examples:
            | email                         |
            | testautomationdnew2@gmail.com |

    @automated @DEBD-3156
    Scenario Outline: Validate the checkout Sign in Page for Ghost User
        Given I logout
        And I navigate to "testDressPdpURL"
        Then I add the product to bag and go to my bag page
        And I set mvt test for "checkoutLoginTealium" as "variation2"
        And I click on "checkoutButton" on "myBagPage"
        And I should see "checkoutHeader1" as "Secure Checkout" on "basketCheckoutPage"
        And I should see "returningCustomerLogin" exist on "basketCheckoutPage"
        And I should see "returningCustomerLoginText" as "A quicker checkout using my saved details" on "basketCheckoutPage"
        And I should see "guestLogin" exist on "basketCheckoutPage"
        And I should see "closeButton" exist on "basketCheckoutPage"
        When I click on "guestLogin" on "basketCheckoutPage"
        And I should see "guestHeaderText" as "Continue as guest" on "basketCheckoutPage"
        And I should see "emailAddressField" exist on "basketCheckoutPage"
        And I should see "signInButton" exist on "basketCheckoutPage"
        And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
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
            | testautomationd2@gmail.com |
