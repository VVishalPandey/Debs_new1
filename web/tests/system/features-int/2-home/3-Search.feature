Feature: Test Debenhams psp search

@manual @DDAI-160
Scenario: Navigate to Debenhams home page And validate the search feature
  Given I navigate to "loginUrl"
  Then I should see "searchIcon" exist on "commonPage"
  And I enter "dresses" in "searchField" on "commonPage"
  And I should see "CancelLink" exist on "commonPage"
  And I should see value of "dressoption"  as "evening dresses" on "commonPage"
  When I click on "evening dresses" on "commonPage"
  Then I should see "headerText" as "evening dresses" on "pspPage"
  And I should see "url" contains "/search/evening"
  And I should validate "products" exist on "pspPage"

@manual @DDAI-160
Scenario: Navigate to Debenhams home page >SearchPage>Enter Invalid search term And verify the result
  Given I navigate to "loginUrl"
  Then I should see "searchIcon" exist on "commonPage"
  And I enter "drasses" in "searchField" on "commonPage"
  And I click on "searchIcon" on "commonPage"
  Then I should see "headerText" as "drasses" on "pspPage"
  And I should see "url" contains "/search/drasses"
  And I should see "Searchtext" contains "Did you mean:"
  And I should see "Searchtext" contains "? See our selection below for"
  And I should see "Searchtext" contains "or try searching again."
  And I should see "Searchtext" contains "dresses"
  And I should validate "products" exist on "pspPage"


@manual @DDAI-160
Scenario: Navigate to Debenhams home page >SearchPage>searched for a term that has no products or no similar products
  Given I navigate to "loginUrl"
  Then I should see "searchIcon" exist on "commonPage"
  And I enter "Dhdhjs" in "searchField" on "commonPage"
  And I click on "searchIcon" on "commonPage"
  Then I should see "headerText" as "Dhdhjs" on "pspPage"
  And I should see "url" contains "search/Dhdhjs"
  And I should see "Searchtext" contains "We're afraid the search you asked us to perform for "
  And I should see "Searchtext" contains " hasn't delivered any results."
  And I should see "Searchtext" contains "We're really sorry but we don't think you're going to find this item using these terms."
  And I should see "Searchtext" contains "Try a new search"
  And I should validate "products" exist on "pspPage"

@manual @DDAI-160
Scenario: Navigate to Debenhams home page >SearchPage>searched for a term that has no products or no similar products
  Given I navigate to "loginUrl"
  Then I should see "searchIcon" exist on "commonPage"
  And I enter "Sofa" in "searchField" on "commonPage"
  And I click on "searchIcon" on "commonPage"
  Then I should see "headerText" as "Dhdhjs" on "pspPage"
  And I should see "url" contains "search/Dhdhjs"
  And I should see "Searchtext" contains "We're afraid the search you asked us to perform for "
  And I should see "Searchtext" contains " hasn't delivered any results."
  And I should see "Searchtext" contains "We're really sorry but we don't think you're going to find this item using these terms."
  And I should see "Searchtext" contains "Try a new search"
  And I should validate "products" exist on "pspPage"

@manual @DDAI-160 @Test5 @RoISearch5
Scenario: Navigate to Debenhams home page >SearchPage>searched for a term "Ted Baker" And validate the result
  Given I navigate to "loginUrl"
  Then I should see "searchIcon" exist on "commonPage"
  And I enter "Ted Baker" in "searchField" on "commonPage"
  When I click on position "1" "ted baker"
  Then I should see "headerText" as "Ted Baker" on "pspPage"
  And I should see "url" contains "content/ted-baker"
  And I should see "CatheaderText" as "Ted Baker" on "pspPage"
  And I should see "TCATText" as "Categories" on "pspPage"
  And I should see "SCAT1Text" as "Lingerie & nightwear" on "pspPage"
  And I should see "SCAT2Text" as "Kidswear" on "pspPage"
  And I should see "SCAT3Text" as "Men's accessories" on "pspPage"
  And I should see "SCAT4Text" as "Women's Watches" on "pspPage"



@manual @DDAI-160
Scenario: Validate that the auto suggest options are correct When user enter a search text 'jeans' in search area
  Given I have been presented with autosuggest options
  When I click on an autosuggest option
  Then I am taken to the relevant PSP

@manual @DDAI-160
Scenario:Validate id the user is on women dress psp Then larger product images should be displayed
  Given I am on a womens dresses PSP or a lingerie PSP
  Then I will see larger product images than other PSPs like tops


@manual @DDAI-160
Scenario: Navigate to Debenhams home page >SearchPage>searched for a term that has no products or no similar products
  Given I am on DOTINT
  When I search for 'sofa'
  Then no Furniture products should be returned

@manual @DDAI-160
Scenario Outline: Navigate to Debenhams home page >LoggedIn User>Validate that wishlist icon turned pink after clicking on it
  Given I logout
  Then I navigate to "loginUrl"
  When I click on "tab1" on "loginPage"
  And I click on "rememberMe" on "loginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should not see "tab1" on "loginPage"
  And I should not see "tab2" on "loginPage"
  And I should see "titleOfPage" as "My Account" on "myDetailsPage"
  And I should see "headerText" as "My account" on "myDetailsPage"
  When I navigate to "womenDressesPspUrl"
  Then I click on "FirstSaveForLaterIcon" on "pspPage"
  Then I should see "SavedIcon" on pspPage
  And I logout
  When I navigate to sign in page
  Then I should see value of "emailAddressFieldSignIn" as "testautomationd2@gmail.com" on "loginPage"

  Examples:
    | email                      | password  |
    | testautomationd2@gmail.com | password2 |

@manual @DDAI-160
Scenario: Navigate to Debenhams home page >Guest User>Validate that SignIn/Continue as a guest link should display When user is not logged in
  Given I navigate to "womenDressesPspUrl"
  Then I click on "FirstSaveForLaterIcon" on "pspPage"
  Then I should see "ContinueShoppingButton" on "pspPage"
  And I should see "SignInRegisterButton" on "pspPage"
  And I should See "closeIcon" on "pspPage"

@manual @DDAI-160
Scenario: Navigate to Debenhams women dresses psp page And validate save for later heart icon
  Given I navigate to "womenDressesPspUrl"
  Then I should count And validate "saveForLaterButton" on "pspPage"


@manual @DDAI-160
Scenario:Validate that following elements present on psp page
  Given I have searched for a valid search term
  And it redirects to a PSP (see tops PSP) OR I have navigated directly to a PSP
  Then I will see (in this order):
  And I should see search results message
  And I should see number of products
  And I should see filter CTA
  And I should see sort drop down
  And I should see column view button
  And I should see product information (2 products per column is default, image (links to PDP), product title (links to PDP), % off (if applicable), was now Then price (if applicable) but always now price in local currency (if only now price available Then it will just display price no "now" messaging)
  And I should see badging e.g. free gift, editors pick, more colour options (if applicable to the product)n
  And I should see save for later heart icon
  And I should see pagination

@manual @DDAI-262
Scenario: Navigate to Debenhams home page And validate the search icon
  Given I am on the header & ensure that the search icon (magnifying glass) is grey
  When I click on the grey search icon
  Then I can see the search overlay
  And a cancel CTA
  And Verify that search icon should become "blue"
  And Verify place holder value should be "Search"

@manual @DDAI-262
Scenario: Navigate to Debenhams home page And validate the search dropdown functionality
  Given I am on any Debenhams page
  And the Search drop down is open
  When I click the Search icon
  Then the Search drop down field closes

@manual @DDAI-262
Scenario: Navigate to Debenhams home page And validate the search term retain functionality
  Given I have entered a term in the search field
  When I close the search box
  Then the search query is retained

@manual @DDAI-262
Scenario: Navigate to Debenhams home page And validate the search term retain functionality When page is refreshed
  Given I have entered a term in the search field
  And I navigate to a new page or refresh the existing page
  When I close the search box
  Then the search query is not retained


@manual @DDAI-262
Scenario: Navigate to Debenhams home page And validate the search term does not retain '
  Given I have entered a search term with an "e.g. men's suits"
  Then the will be removed in the returned results

@manual @DDAI-262
Scenario: Navigate to Debenhams home page And validate the no autosuggestion
  Given I am on DOTINT
  When I type characters into the search box
  Then I will see no auto-suggestions

@manual @DDAI-262
Scenario: Navigate to Debenhams home page And validate 	search term When characters from search field deleted
  Given I click in the Search text field
  And I have entered a valid search term
  When I delete the characters from the search field
  Then I am not able to see suggestions based on my search input And the number of results for each suggested search up until I delete the final character

@automated @DDAI-262
Scenario: Navigate to Debenhams home page And validate the search feature
  Given I navigate to "homeURL"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I should see "searchIcon" exist on "commonPage"
  When I click on "searchIcon" on "commonPage"
  Then I should see "searchField" exist on "commonPage"
  And I should see "searchApply" exist on "commonPage"
  And I should see "CancelCTA" exist on "commonPage"
  And I enter "dresses" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  And I wait for "3000" milliseconds
  Then I should see "headerText" as ""dresses"" on "pspPage"
  And I should see "url" contains "/en-au/search/dresses"
  And I should validate "products" exist on "pspPage"
