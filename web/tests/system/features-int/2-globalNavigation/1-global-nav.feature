Feature: Test Debenhams global navigation

@manual @DDAI-283
Scenario: Validate Debenhams global navigation first level
  Given I navigate to "loginUrl"
  And I Click on "ChangeCountryAustralia" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  And I should see value of position "1" as "Shop Departments"
  And I should see value of position "2" as "Saved Items"
  And I should see value of position "3" as "Create Account/Sign In"
  And I should see value of position "4" as "Help & Support"

@manual @DDAI-283
Scenario: Validate Debenhams global navigation>Offers or Sale tab font is coloured
  Given I am on any Debenhams page for Australia
  When I navigate to Shop Departments
  Then the Offers or Sale tab font is coloured (inherited from desktop)

@manual @DDAI-283
Scenario: Validate Debenhams global navigation to women -> clothing -> dresses And navigation When clicking on menu option on top
  Given I navigate to "loginUrl"
  And I Click on "ChangeCountryAustralia" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  When I click on "Shop Departments" position "1"
  Then I should see value of position "1" as "Women"
  When I click on "Women" position "1"
  Then I should see value of position "2" as "Dresses"
  When I click on "Dresses" position "2"
  Then I should see value of position "2" as "All dresses"
  When I click on "headerMenuText" on "globalNavigation"
  Then I should see value of position "1" as "Shop Departments"

@manual @DDAI-283
Scenario: Validate Debenhams global navigation to women -> shoes & boots -> all shoes & boots And navigation When clicking on menu option on top
  Given I navigate to "loginUrl"
  And I Click on "ChangeCountryAustralia" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  When I click on "Shop Departments" position "1"
  Then I should see value of position "1" as "Women"
  When I click on "Women" position "1"
  Then I should see value of position "2" as "Shoes & boots"
  When I click on "Shoes & boots" position "2"
  Then I should see value of position "1" as "All shoes & boots"
  When I click on "headerMenuText" on "globalNavigation"
  Then I should see value of position "1" as "Shop Departments"

@manual @DDAI-283
Scenario: Validate Debenhams global navigation to beauty -> shop by brAnd -> kat von d And navigation When clicking on menu option on top
  Given I navigate to "loginUrl"
  And I Click on "ChangeCountryAustralia" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  When I click on "Shop Departments" position "1"
  Then I should see value of position "2" as "Beauty"
  When I click on "Beauty" position "2"
  Then I should see value of position "1" as "Shop by brAnd"
  When I click on "Shop by brAnd" position "1"
  Then I should see value of position "27" as "Kat Von D"
  When I click on "headerMenuText" on "globalNavigation"
  Then I should see value of position "1" as "Shop Departments"

@manual @DDAI-283
Scenario: Validate Debenhams global navigation on clicking menu
  Given I navigate to "loginUrl"
  And I Click on "ChangeCountryAustralia" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  When I click on "closeIcon" on "globalNavigation"
  Then I should not see "closeIcon" on "globalNavigation"

@manual @DDAI-283
Scenario: Validate Debenhams global navigation to women -> clothing -> dresses And retention of menu option
  Given I navigate to "loginUrl"
  And I Click on "ChangeCountryAustralia" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  When I click on "Shop Departments" position "1"
  Then I should see value of position "1" as "Women"
  When I click on "Shop Departments" position "1"
  Then I should see value of position "1" as "Women"
  When I click on "Women" position "1"
  Then I should see value of position "2" as "Dresses"
  When I click on "Dresses" position "2"
  Then I should see value of position "2" as "All dresses"
  When I click on "All dresses" position "2"
  # And I should see "headerText" as "Dresses" on "pspPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see value of position "3" as "Dresses"

@manual @DDAI-283
Scenario: Validate Debenhams global navigation When navigated to women -> shoes & boots -> shoes from women -> clothing -> dresses
  When I click on "backOption" on "globalNavigation"
  Then I should see value of position "2" as "Shoes & boots"
  When I click on "Shoes & boots" position "2"
  Then I should see value of position "3" as "Shoes"
  When I click on "Shoes" position "3"
  # And I should see "headerText" as "Women's shoes" on "pspPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see value of position "3" as "Shoes"

@manual @DDAI-283
Scenario Outline: Validate Debenhams global navigation first level after sign in
  Given I navigate to "loginUrl"
  And I Click on "ChangeCountryAustralia" on "commonPage"
  #When I click on "tab1" on "loginPage"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  #And I click on "rememberMe" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should not see "tab1" on "loginPage"
  And I should not see "tab2" on "loginPage"
  # And I should see "titleOfPage" as "My Account" on "myDetailsPage"
  # And I should see "headerText" as "My details" on "myDetailsPage"
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  And I should see value of position "1" as "Shop Departments"
  And I should see value of position "2" as "Saved Items"
  And I should see value of position "3" as "My Account"
  And I should see value of position "4" as "Sign Out"
  And I should see value of position "5" as "Help & Support"
  When I click on "Sign out" position "5"
  # Then I should see "titleOfPage" as "Debenhams UK - Fashion, Beauty, Gifts, Furniture & Electricals" on "homePage"

  Examples:
    | email                      | password  |
    | testautomationd2@gmail.com | password2 |


@manual @DDAI-283
Scenario: Validate Debenhams global navigation>Navigation retain the place we left the place after refresh the  page
  Given I am on any Debenhams Category page for Australia
  And I have navigated to a section of the Menu
  When I refresh the page
  Then the navigation retains the place I left

@manual @DDAI-283
Scenario: Validate Debenhams global navigation>Navigation  doesn not retain the place we left after clicking on product
  Given I am on any Debenhams Category page for Australia
  And I have navigated to a section of the Menu
  When I click on a product (And move to the product PDP)
  Then the navigation does not retain the place I left

@manual @DDAI-303
Scenario: Validate Debenhams global navigation>Validate promotional banner on Beauty Category page
  Given THAT I am a customer shopping on DOTIE,
  When I click on a Beauty category (Makeup, Skincare, etc)
  Then I should see a promotional banner on the top of the page with click through link to the 'Offers' section of the site, or in some instance, the Beauty TCAT

@manual @DDAI-303
Scenario: Validate Debenhams global navigation>Validate promotional banner on Women Category page
  Given THAT I am a customer shopping on DOTINT for Australia
  When I click on a Women's category (Clothing, Lingerie, etc)
  Then I should see a promotional banner on the top of the page with click through link to a specific PSP of the site, or in some instance, the Women TCAT

@manual @DDAI-303
Scenario: Validate Debenhams global navigation>Validate popup When item is added to bag on saved item page
  Given I am on the saved items page for Australia
  When I add an item to the bag
  Then I will see a item moved to bag pop up

@manual @DDAI-303
Scenario: Validate Debenhams global navigation>Validate popup When item is removed on saved item page
  Given I am on the saved items page for Australia
  When I remove an item
  Then I will see a item removed pop up

@manual @DDAI-303
Scenario: Validate Debenhams global navigation>Validate signed out popup after logging out
  Given I am signed in for Australia
  When I press sign out
  Then I will see a you have signed out pop up

@manual @DDAI-303
Scenario: Validate Debenhams global navigation>Validate loaders implementation for the following scenarios
  When applying Filters in PSP
  And selecting Save icon in PDP
  And selecting a product from the Recently Viewed carousel
  And removing an item in the minibag
  And My Saved Items - removing an item
  And My Bag - updating the quantity selector
  And Payment - selecting the 'Place order And pay' button

@manual @DDAI-1034
Scenario: Validation of the 6 tile modules on the Toys TCAT Page on mobile for UK/Ireland/International
  Given the user is logged in
  When the user navigates to the Toys TCAT page i.e Toys
  Then the user should view the 6 tile module beneath the hero carousel image
  And clicking on the module should navigate user to the desired page

@manual @DDAI-1019
Scenario: Validation of the beauty offers page CTA for mobile for all sites
  Given the user is logged in
  When the user navigates to the beauty offers page i.e content/estee-lauder-promotions or https://www.debenhams.com/content/lancome-offers
  And user tries to add the product
  Then the product should be added
  And the mini bag should be updated
