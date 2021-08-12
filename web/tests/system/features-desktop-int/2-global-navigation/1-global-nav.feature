Feature: Test Debenhams global navigation for Dekstop

@automated @Fixed  @DEBD-263
Scenario Outline: Validate Top-nav Tier 1
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I should see "flagCountrySelectedFooter" as "Australia" on "commonPage"
  Then I should see "menuOverlay" exist on "commonPage"
  And I "validate" menu option "<TopnavCat1>" on commonPage bigscreen
  And I "validate" menu option "<TopnavCat2>" on commonPage bigscreen
  And I "validate" menu option "<TopnavCat3>" on commonPage bigscreen
  And I "validate" menu option "<TopnavCat4>" on commonPage bigscreen
  And I "validate" menu option "<TopnavCat5>" on commonPage bigscreen
  And I "validate" menu option "<TopnavCat6>" on commonPage bigscreen
  And I "validate" menu option "<TopnavCat7>" on commonPage bigscreen

  Examples:
    | TopnavCat1   | TopnavCat2   | TopnavCat3   | TopnavCat4   | TopnavCat5   | TopnavCat6   | TopnavCat7   |
    | Women        | Lingerie     | Home         | Men          | Kids         | Gifts & Toys | Holiday shop |

@automated @Fixed @DEBD-263 @DEBD-265
Scenario Outline: Validate Top-nav Tier 1 & category landing page display and validation from top navigation
  When I "validate & click" menu option "<L1category>" on commonPage bigscreen
  Then I should see "pspHeaderText" as "<headerText>" on "pspPage"
  And I should see "url" contains "<urlcontains>"

  Examples:
    | L1category   | headerText                     | urlcontains  |
    | Women        | Women's clothing & accessories  | women        |
    | Lingerie     | Lingerie                       | lingerie     |
    | Home         | Home                           | home         |
    | Men          | Men's clothing & accessories   | men          |
    | Kids         | Kids' clothing & accessories   | kids         |
    | Gifts & Toys | Gift & Present Ideas           | gifts        |
    # | Holiday shop | Holiday shop                   | holiday-shop | Holidayshop is coming as search text

@automated @Fixed @DEBD-263 @DEBD-265
Scenario Outline: Navigate to PSP page
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  When I "validate & click" subMenu option "<L2 Category>" under "<L1 Category>" on commonPage bigscreen
  Then I should see "headerText" as "<headerText>" on "pspPage"
  And I should see "url" contains "<urlcontains>"

  Examples:
    | L2 Category         | L1 Category  | headerText                   | urlcontains        |
    | Duvets              | Home         | Duvets                       | bedding/duvets     |
    | All dresses         | Women        | Dresses                      | dresses            |
    | Pyjamas             | Lingerie     | Pyjamas                      | /nightwear/pyjamas |
    | All shoes & boots   | Men          | Men's shoes & boots          | shoes-boots        |
    | All babies' clothes | Kids         | Kids' clothing & accessories | /kids/baby         |
    | All toys            | Gifts & Toys | Toys                         | toys               |

@manual @DEBD-263
Scenario: Validate DDN UI behavior
  Given I navigate to "homeUrl"
  When I "validate" menu option "WomenDepartment" for .5 seconds on commonPage bigscreen
  Then I should see the women Department gets underlined
  And DDN will open in .1 second on commonPage
  And width of the DDN container will be locked to the width of  Department
  And the height of the DDN container should never be less than 468px.
  And I should see the page should be greayedout below the DDN
  And I should see each Subcategories are divided equally
  When I hover on Men Department
  Then I should see the Men Department gets underlined
  And I should see subcategory and Espot of Men Department
  When I hover on any subcategory of Mendepartment
  Then I should see the subcategory of Mendepartment gets underlined
  When I "validate" menu option "TopnavCat" on commonPage bigscreen
  Then I should see "menuOverlayContainer" exist on "commonPage"

@manual @DEBD-263
Scenario: Validate DDN behavior based Espot enablement
  Given I navigate to "homeUrl"
  When Espot is disabled
  When I "validate" menu option "<TopnavCat>" on commonPage bigscreen
  Then I should see "DDN" exist on "commonPage"
  And I should not see "Espot" exist on "DDN"
  And I should see 6 or less columns of sub-categories
  When Espot is enabled
  Then I should see "DDN" exist on "commonPage"
  And I should  see "Espot" exist on "DDN"
  And I should see 5 or less columns of sub-categories
  And I should see 5 or less columns of sub-categories
  And I "validate" the size of the Espot as per new specification

@manual @DEBD-263
Scenario: Validate colours of DDN
  When I see "Sale/Offer" department on "commonpage"
  Then I should be in Red colours
  When I hover on "Sale/offer" department
  Then I should see all subcategories under the department is in Red colours
  When I hover on any other Department
  Then I should see Sale/offer sub category should be red in colours
  When "Blue cross sale" is live
  Then I should see blue colour instead of Red for Sale/offers department/subcategories
