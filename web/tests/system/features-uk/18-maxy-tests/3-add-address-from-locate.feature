Feature: Verify the functionality of Address lookup on Delivery Page on Mobile

    @automated @DEBD-3080
    Scenario: Navigate to Home Delivery page and validate the address section for registered/guest/ghost user with saved and no saved addresses
        Given I logout
        Given I navigate to "testDressPdpURL"
        Then I add the product to bag and go to my bag page
        And I set mvt test for "checkoutLoqate" as "variation1"
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
        When I select pca address in address field with debenhamsMVT on
        And I should not see "findYourAddressButton" on "homeDeliveryPage"
        And I should see "useThisAddressButton" exist on "homeDeliveryPage"
        And I click on "useThisAddressButton" on "homeDeliveryPage"
        Then I should see the selected address
        And I should see "addressChangeLink" exist on "homeDeliveryPage"



    @manual @DEBD-3080
    Scenario Outline: click on change link from home delivery page and validate all prefilled information
        When I click on "ChangeLink" on "homeDeliveryPage"
        Then I should see value of "firstName" as "<firstNamePrefill>" on "homeDeliveryPage"
        And I should see value of "lastName" as "<lastNamePreFill>" on "homeDeliveryPage"
        And I should see value of "phoneNumber" as "<phoneNumberPreFill>" on "homeDeliveryPage"
        Then I should see value of "houseNumber" as "<houseNoPreFill>" on "homeDeliveryPage"
        And I should see value of "addressLine1" as "<addressL1PreFill>" on "homeDeliveryPage"
        And I should see value of "country" as "<country>" on "homeDeliveryPage"
        And I should see value of "city" as "<city>" on "homeDeliveryPage"
        And I should see value of "postcodePrefill" as "<postcode1>" on "homeDeliveryPage"
        Examples:
            | firstNamePrefill | lastNamePreFill | phoneNumberPreFill | postcode | houseNoPreFill    | addressL1PreFill | country        | city   |
            | Test             | User            | 9876543210         | E14BA    | 11 Anchor Terrace | Cephas Avenue    | United Kingdom | LONDON |

    @manual @DEBD-3080
    Scenario: Select the address and the delivery type from home delivery page and texts are aligned
        When I click on "useThisAddressButton" on "homeDeliveryPage"
        Then I should see "nextNominatedOption" exist on "deliveryOptionPage"
        When I click on "nextNominatedOption" on "deliveryOptionPage"
        Then I should see "headerText" as "When would you like to receive your delivery?" on "deliveryOptionPage"
        And I should see "daytimeTab" exist on "deliveryOptionPage"
        And I should see "eveningTab" exist on "deliveryOptionPage"
        And I validate all options under daytime
        And I validate first evening and daytime option navigation
        Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
        And I should see "3" "Changelink" alongside "Home Delivery", "Address" And "nextNominatedOption" on "deliveryOptionPage"

    @manual @DEBD-3080
    Scenario: Validate the debenhamsMVT for ROI and International, it should come as existing flow

    @automated @DEBD-3080
    Scenario: Navigate to Debenhams home delivery address page as guest and validate the page for country Australia
        Given I navigate to delivery option as guest
        When I click on "homeDeliveryOption" on "deliveryOptionPage"
        Then I should see "headerText" as "Where are we delivering to?" on "homeDeliveryPage"
        And I should see "title" exist on "homeDeliveryPage"
        When I click on "countrySelectAustralia" on "homeDeliveryPage"
        Then I should see "firstName" exist on "homeDeliveryPage"
        And I should see "lastName" exist on "homeDeliveryPage"
        And I should see "phoneNumber" exist on "homeDeliveryPage"
        And I should see "country" exist on "homeDeliveryPage"
        And I should see "houseNumber" exist on "homeDeliveryPage"
        And I should see "addressLine1" exist on "homeDeliveryPage"
        And I should see "addressLine2" exist on "homeDeliveryPage"
        And I should see "city" exist on "homeDeliveryPage"
        And I should see "county" exist on "homeDeliveryPage"
        And I should see "postcodeManual" exist on "homeDeliveryPage"
        And I should see "useThisAddressButton" exist on "homeDeliveryPage"
        And I should see "bfpoLink" exist on "homeDeliveryPage"
        And I should not see "findAnotherAddressLink" on "homeDeliveryPage"
        And I should not see "enterAddressManuallyLink" on "homeDeliveryPage"
        And I should not see "findYourAddressButton" on "homeDeliveryPage"

    @automated @DEBD-3080
    Scenario: Navigate to Debenhams home delivery page from above scenario and validate inline error messages for empty fields when selected use this address
        When I click on "useThisAddressButton" on "homeDeliveryPage"
        Then I should see "firstNameError" as "The first name field cannot be empty." on "homeDeliveryPage"
        And I should see "lastNameError" as "The last name field cannot be empty." on "homeDeliveryPage"
        And I should see "phoneNumberError" as "Please enter a valid phone number." on "homeDeliveryPage"
        And I should see "houseNumberError" as "The address field cannot be empty." on "homeDeliveryPage"
        And I should see "cityError" as "The town/city field cannot be empty." on "homeDeliveryPage"
        And I should see "postcodeManualError" as "The Postal code/ZIP code field cannot be empty." on "homeDeliveryPage"
