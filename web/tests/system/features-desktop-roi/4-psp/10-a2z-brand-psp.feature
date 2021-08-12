Feature: Test Debenhams A 2 Z Brands Page

@manual @DEBD-3296
 Scenario Outline: Validate A2Z Brand Page validation from top navigation
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "<L2Category>" under "Brands" on commonPage bigscreen
  Then I should see "headerText" as "<headerText>" on "pspPage"
  And I should see "url" contains "<urlContains>"
  And I should not see "BrandDropdown" on "pspPage"
  And I should see "A2Z Strip" on "pspPage"
  And I should see "AlphabetSeparatorLines" on "pspPage"
  And I should see "AllBrands" on "pspPage"
  When I click on "P" from "BrandDropdown" on "pspPage"
  Then I should be inview of Brands started with "p" on "pspPage"
  When I click on "BrandName" on "pspPage"
  Then I should see "headerText" as "Brand" on "pspPage"
  And I should see products exists on "pspPage"

  Examples:
    | L2Category         | headerText                          | urlContains                          |
    | All brands A-Z     | A-Z OF DEBENHAMS BRANDS             | intcmp=brandsddn-brandaz-allbrandsaz |
    | Womens brands      | A-Z OF WOMEN'S BRANDS               | intcmp=brandsddn-brandaz-womens      |
    | Lingerie brands    | A To Z Of Debenhams Lingerie Brands | intcmp=brandsddn-brandaz-lingerie    |
    | Men's brands       | A to Z of Debenhams Men brands      | brand-directory-mens                 |
    | Kids' brands       | A to Z of Debenhams Children brands | brand-directory-kids                 |
    | Beauty brands      | A to Z of Debenhams Beauty brands   | brand-directory-beauty               |
    | Home brands        | A to Z of Debenhams Home brands     | brand-directory-home-furniture       |
    | Electricals brands | A-Z OF ELECTRICALS BRANDS           |  brand-directory-electricals         |


@manual @DEBD-3296
 Scenario Outline: Validate A2Z Brand Page validation from top navigation
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "<L2Category>" under "<L2Category>" on commonPage bigscreen
  Then I should see "headerText" as "<headerText>" on "pspPage"
  And I should see "url" contains "<urlContains>"
  And I should not see "BrandDropdown" on "pspPage"
  And I should see "A2Z Strip" on "pspPage"
  And I should see "AlphabetSeparatorLines" on "pspPage"
  And I should see "AllBrands" on "pspPage"
  When I click on "P" from "BrandDropdown" on "pspPage"
  Then I should be inview of Brands started with "p" on "pspPage"
  When I click on "BrandName" on "pspPage"
  Then I should see "headerText" as "Brand" on "pspPage"
  And I should see products exists on "pspPage"

  Examples:
    | L1Category  | L2Category             | headerText                          | urlContains                     |
    | Women       | Brands A-Z             | A-Z OF WOMEN'S BRANDS               | brand-directory-womens            |
    | Men         | Brands A-Z             | A to Z of Debenhams Men brands      | brand-directory-mens            |
    | Gift & Toys | Toys brands A-Z        | A to Z of Debenhams Children brands | brand-directory-kids            |
    | Beauty      | Beauty Brands A-Z      | A to Z of Debenhams Beauty brands   | brand-directory-beauty          |
    | Electricals | Electricals brands A-Z | A-Z OF ELECTRICALS BRANDS           | brand-directory-electricals     |
