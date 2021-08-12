Feature: Test sale page is loading in every x minutes which will be controlled from terminal

@automated @Scenario1 @DOTCOM
Scenario: Navigate to sale TCAT and click on adspot 1 on Dotcom site
    Given I navigate to "homeURL"
    When I "validate & click" menu option "Blue cross" on commonPage bigscreen
    Then I should see "tcatHeaderText" as "Sale" on "pspPage"
    And I should see "url" contains "/sale"
    When I click on "tcatAdSpot1" on "pspPage"
    Then I should see "url" contains "/sale/women"

@automated @Scenario2 @DOTCOM
Scenario: Navigate to sale TCAT and click on adspot 1 on Dotcom site
    When I "validate & click" menu option "Blue cross" on commonPage bigscreen
    Then I should see "tcatHeaderText" as "Sale" on "pspPage"
    And I should see "url" contains "/sale"
    When I "validate & click" subFilter option "Women" under "Categories" on commonPage bigscreen
    And I should see "headerText" containing "Women's sale" on "pspPage"
    Then I should see "url" contains "/sale/women"

@automated @Scenario3 @DOTIE
Scenario: Navigate to Dotie site and then goto sale TCAT and click on adspot 1
    Given I navigate to "homeROIURL"
    Given I navigate to "homeROIURL"
    #When I "validate & click" country as "IE" from "countryOptions" on "commonPage"
    And I "validate & click" menu option "Blue cross" on commonPage bigscreen
    Then I should see "tcatHeaderText" as "Sale" on "pspPage"
    And I should see "url" contains "/sale"
    When I click on "tcatAdSpot1" on "pspPage"
    Then I should see "url" contains "/sale/women"

@automated @Scenario2 @DOTIE
Scenario: Navigate to sale TCAT and click on adspot 1 on Dotie site
    When I "validate & click" menu option "Blue cross" on commonPage bigscreen
    Then I should see "tcatHeaderText" as "Sale" on "pspPage"
    And I should see "url" contains "/sale"
    When I "validate & click" subFilter option "Women" under "Categories" on commonPage bigscreen
    And I should see "headerText" containing "Women's clothing & accessories" on "pspPage"
    Then I should see "url" contains "/sale/women"
