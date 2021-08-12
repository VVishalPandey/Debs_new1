Feature: Test Debenhams global navigation for Dekstop

@automated @DEBD-263 
Scenario Outline: Validate Top-nav Tier 1 & category landing page display and validation from top navigation
  Given I navigate to "homeURL"
  When I "validate & click" menu option "<TopnavCat>" on commonPage bigscreen
  Then I should see "pspHeaderText" as "<headerText>" on "pspPage"
  And I should see "url" contains "<urlcontains>"
  Examples:
    | TopnavCat    | headerText                     | urlcontains |
    | Women        | Women's clothing & accessories | women       |
    | Lingerie     | Lingerie                       | lingerie    |
    | Beauty       | beauty                         | beauty      |
    | Home         | Home                           | home        |
    | Furniture    | Furniture                      | furniture   |
    | Men          | Men's clothing & accessories   | men         |
    | Kids         | Kids' clothing & accessories   | kids        |
    | Gifts & Toys | Gifts                          | gifts       |
    | Electricals  | Electricals                    | electricals |

@automated @DEBD-263 @DEBD-745 @DEBD-265
Scenario Outline: Navigate to PSP page
  Given I navigate to "homeURL"
  And I wait for "8000" milliseconds
  When I "validate & click" subMenu option "<L2Category>" under "<L1Category>" on commonPage bigscreen
  And I wait for "5000" milliseconds
  Then I should see "headerText" as "<headerText>" on "pspPage"
  And I should see "url" contains "<urlContains>"
  Examples:
    | L2Category    | L1Category   | headerText         | urlContains         |
    | Duvets        | Home         | Duvets             | bedding/duvets      |
    | All dresses   | Women        | Dresses            | dresses             |
    | All nightwear | Lingerie     | Nightwear          | nightwear           |
    | Perfume       | Beauty       | Perfume            | perfume-aftershave  |
    | Beds          | Furniture    | Beds               | beds                |
    | All shoes & boots | Men      | Men's footwear     | shoes-boots         |
    | School uniform| Kids         | School uniform shop| /kids/school-uniform|
    | Anniversary   | Gifts & Toys | Anniversary gifts  | anniversaries       |
    | Audio         | Electricals  | Audio              | audio               |

    

@automated @DEBD-263 @DEBD-265
Scenario Outline: Navigate to Brand page
    Given I navigate to "homeURL"
    When I "validate & click" subMenu option "<L2Category>" under "<L1Category>" on commonPage bigscreen
    Then I should see "url" contains "<urlcontains>"
    
    Examples:
      | L2Category | L1Category  | urlcontains   |
      | Benefit    | Beauty      | benefit       |
      | DIOR       | Beauty      | dior          |
      | CHANEL     | Beauty      | content/chanel|

@manual @DEBD-263  @awsManual
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

@manual @DEBD-263 @awsManual
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
