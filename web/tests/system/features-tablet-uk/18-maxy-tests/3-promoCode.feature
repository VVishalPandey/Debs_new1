
Feature: Test Debenhams Promo code T&C on My Bag and Payment

@manual @DEBD-2802
Scenario: Validate the hyperlink 'Find out  more' within promo code error message on My bag and Payment page
    Given I have added items to my bag which are not eligible for the promo code
    And I have entered a valid promo code in the bag
    When I press the 'Apply' CTA
    Then the 'Sorry your basket is not eligible for this promotion...' message should be displayed under the promo code entry box, the hyperlink within this message should read 'Find out why'

@manual @DEBD-2802
Scenario: Validate the T&C drawer should be displayed on My bag and Payment page
    Given I am on a tablet device and I have added items to my bag which are not eligible for the promo code
    And I have entered a valid promo code in the bag
    When I press the 'Apply' CTA
    Then the 'Sorry your basket is not eligible for this promotion...' message should be displayed under the promo code entry box
    When I press the 'Find out why' hyperlink
    Then the Terms and Conditions modal should be displayed for the promo code entered
    When I press the 'Close' CTA or click the space above the Terms and Conditions drawer
    Then the modal should close

@manual @DEBD-2802
Scenario: Validate the header title behaviour on My bag and Payment page
    Given I am on a desktop/tablet/mobile device and I have added items to my bag which are not eligible for the promo code
    And I have entered a valid promo code in the bag
    When I press the 'Apply' CTA
    Then the 'Sorry your basket is not eligible for this promotion...' message should be displayed under the promo code entry box
    When press the 'Find out why' hyperlink
    Then the Terms and Conditions modal/drawer should be displayed for the promo code entered - the header title should expand or decrease automatically depending on the length of the promo code title (1-3 lines)

@manual @DEBD-2802
Scenario: Validate relevant promo code message is displayed in the T&C modal popup on My bag and Payment page
    Given I am on a desktop/tablet/mobile device and I have added items to my bag which are not eligible for the promo code
    And I have entered a valid personal promo code (10 digits) in the bag
    When I press the 'Apply' CTA
    Then the 'Sorry your basket is not eligible for this promotion...' message should be displayed under the promo code entry box
    When I press the 'Find out why' hyperlink
    Then the Terms and Conditions modal/drawer should be displayed for the promo code entered

@manual @DEBD-2802
Scenario: Validate the "Read all Terms and condition" link in the T&C modal popup on My bag and Payment page
    Given I am on a desktop/tablet/mobile device and I have added items to my bag which are not eligible for the promo code
    And I have entered a valid promo code in the bag
    When I press the 'Apply' CTA
    Then the 'Sorry your basket is not eligible for this promotion...' message should be displayed under the promo code entry box
    When I press the 'Find out why' hyperlink
    Then the Terms and Conditions modal/drawer should be displayed for the promo code entered
    When I click the 'Read all Terms and Conditions' link
    Then the full Terms and Conditions page should be displayed

@manual @DEBD-2802
Scenario: Validate the scroller is displayed in the T&C drawer if the content lenght is more than one page on My bag and Payment page
    Given I am on a desktop/tablet device and I have added items to my bag which are not eligible for the promo code
    And I have entered a valid promo code in the bag
    When I press the 'Apply' CTA
    Then the 'Sorry your basket is not eligible for this promotion...' message should be displayed under the promo code entry box
    When press the 'Find out why' hyperlink
    Then the Terms and Conditions modal should be displayed for the promo code entered
    When the Terms and Conditions are longer than the space available on the modal
    Then I should see a scroll bar on the right hand side so I can scroll through the Terms and Conditions