Feature: Validation of mobile exposed search component on the Home,PSP,PDP and My bag page

# This feature is build to test Mobile Exposed Search - Test to be controlled via Maxi.
# It has four variations :- 
# Variation 1. Exposed search on Homepage > PSP > PDP > My Bag 
# Variation 2. Exposed search on Homepage > PSP > PDP (search icon then moves to header for Bag) 
# Variation 3. Exposed search on Homepage > PSP (search icon then moves to header for PDP & Bag) 
# Variation 4. Exposed search on Homepage only (search icon then moves to header for PSP, PDP & Bag)

@automated @DEBD-3049
Scenario Outline: Validation of search component on the Home page for Variant 1/2/3/4
  Given I navigate to "homeURL"
  And I set mvt test for "exposedSearch" as "<variant>"
  When I click on "menuIcon" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Dresses" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Maxi dresses" on "commonPage"
  And I click on "logoDebenhams" on "commonPage"
  Then I should see "exposedSearchField" exist on "commonPage"
  And I should see "searchApply" exist on "commonPage"
  And I click on "exposedSearchField" on "commonPage"
  And I enter "Dresses" in "searchField" on "commonPage"
  Then I should see "autoSuggestions" exist on "commonPage"
  And I should see "autoSuggestions" containing "dresses" on "commonPage"
  And I should see "CancelCTA" exist on "commonPage"
  And  I click on "CancelCTA" on "commonPage"
  Then I should see "exposedSearchField" exist on "commonPage"
  And I click on "exposedSearchField" on "commonPage"
  Then I enter "sale Home" in "searchField" on "commonPage"
  Then I click on "searchApply" on "commonPage"
  And I should see "url" contains "sale+Home"

  Examples:
  |variant|
  |variation1|
  |variation2|
  |variation3|
  |variation4|
  
@automated @DEBD-3049
Scenario Outline: Validation of search component on the PSP page for Variant 1/2/3
  Given I navigate to "homeURL"
  And I set mvt test for "exposedSearch" as "<variant>"
  When I click on "menuIcon" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Kids" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Babies" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Sleepsuits" on "commonPage"
  And I wait for "3000" milliseconds
  Then I should see "headerText" as "Sleepsuits" on "pspPage"
  And I should see "url" contains "kids/sleepsuits/baby"
  And I should see "exposedSearchField" exist on "commonPage"
  And I should see "searchApply" exist on "commonPage"
  And I click on "exposedSearchField" on "commonPage"
  And I enter "kids" in "searchField" on "commonPage"
  Then I should see "autoSuggestions" exist on "commonPage"
  And I should see "autoSuggestions" containing "kids sale" on "commonPage"
  And I should see "CancelCTA" exist on "commonPage"
  And  I click on "CancelCTA" on "commonPage"
  Then I should see "exposedSearchField" exist on "commonPage"
  And I click on "exposedSearchField" on "commonPage"
  Then I enter "kids sale" in "searchField" on "commonPage"
  Then I click on "searchApply" on "commonPage"
  And I should see "url" contains "search/kids+sale"
Examples:
  |variant|
  |variation1|
  |variation2|
  |variation3|

@automated @DEBD-3049
Scenario Outline: Validation of search component on the PDP page for Variant 1/2
  Given I navigate to "womenDressesPspUrl"
  And I set mvt test for "exposedSearch" as "<variant>"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should validate product name on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  Then I should see "exposedSearchField" exist on "commonPage"
  And I should see "searchApply" exist on "commonPage"
  And I click on "exposedSearchField" on "commonPage"
  And I enter "beauty" in "searchField" on "commonPage"
  And I wait for "3000" milliseconds
  Then I should see "autoSuggestions" exist on "commonPage"
  And I should see "autoSuggestions" containing "beauty sets" on "commonPage"
  And I should see "CancelCTA" exist on "commonPage"
  And  I click on "CancelCTA" on "commonPage"
  Then I should see "exposedSearchField" exist on "commonPage"
  And I click on "exposedSearchField" on "commonPage"
  Then I enter "beauty sets" in "searchField" on "commonPage"
  Then I click on "searchApply" on "commonPage"
  And I should see "url" contains "search/beauty+sets"
  Then I should see "exposedSearchField" exist on "commonPage"
  And I click on "exposedSearchField" on "commonPage"
  Then I enter "towels" in "searchField" on "commonPage"
  Then I click on "searchApply" on "commonPage"
  And I should see "url" contains "search/towels"
Examples:
  |variant|
  |variation1|
  |variation2|

@automated @DEBD-3049
Scenario Outline: Validation of search component on the My Bag page for Variant 1
  Given I navigate to "testDressPdpURL"
  And I set mvt test for "exposedSearch" as "<variant>"
  And I wait for "3000" milliseconds
  And I add the product to bag and go to my bag page
  And I should see "testDressProductName" product name exist on myBagPage
  Then I should see "exposedSearchField" exist on "commonPage"
  And I should see "searchApply" exist on "commonPage"
  And I click on "exposedSearchField" on "commonPage"
  And I enter "beauty" in "searchField" on "commonPage"
  And I wait for "3000" milliseconds
  Then I should see "autoSuggestions" exist on "commonPage"
  And I should see "autoSuggestions" containing "beauty sets" on "commonPage"
  And I should see "CancelCTA" exist on "commonPage"
  And  I click on "CancelCTA" on "commonPage"
  Then I should see "exposedSearchField" exist on "commonPage"
  And I click on "exposedSearchField" on "commonPage"
  Then I enter "electric kettles" in "searchField" on "commonPage"
  Then I should see "autoSuggestions" exist on "commonPage"
  And I should see "autoSuggestions" containing "electric kettles" on "commonPage"
  Then I click on "searchApply" on "commonPage"
  And I should see "url" contains "search/electric+kettles"
  
  Examples:
  |variant|
  |variation1|


@automated @DEBD-3049
Scenario Outline: Validate that user lands on PSP/search result if click on the first suggestions of the list
  Given I navigate to "homeURL"
  And I set mvt test for "exposedSearch" as "variation1"
  When I click on "menuIcon" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Kids" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Babies" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Sleepsuits" on "commonPage"
  Then I should see "headerText" as "Sleepsuits" on "pspPage"
  And I should see "url" contains "kids/sleepsuits/baby"
  And I should see "exposedSearchField" exist on "commonPage"
  And I should see "searchApply" exist on "commonPage"
  And I click on "exposedSearchField" on "commonPage"
  And I enter "kids" in "searchField" on "commonPage"
  Then I should see "autoSuggestions" exist on "commonPage"
  And I should see "autoSuggestions" containing "kids sale" on "commonPage"
  And I should see "CancelCTA" exist on "commonPage"
  And  I click on "CancelCTA" on "commonPage"
  Then I should see "exposedSearchField" exist on "commonPage"
  And I click on "exposedSearchField" on "commonPage"
  Then I enter "kids" in "searchField" on "commonPage"
  Then I click on "autoSuggestSelect" on "commonPage"
  And I should see "url" contains "search/kids+sale"

Examples:
  |variant|
  |variation1|
  |variation2|
  |variation3|
  |variation4|

@automated @DEBD-3049
Scenario Outline: Validation of different search result page for Variant 1/2/3/4
  Given I navigate to "homeURL"
  And I set mvt test for "exposedSearch" as "<variant>"
  When I click on "menuIcon" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Dresses" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Maxi dresses" on "commonPage"
  And I click on "logoDebenhams" on "commonPage"
  Then I should see "exposedSearchField" exist on "commonPage"
  And I should see "searchApply" exist on "commonPage"
  And I click on "exposedSearchField" on "commonPage"
  And I enter "Dresses" in "searchField" on "commonPage"
  Then I should see "autoSuggestions" exist on "commonPage"
  And I should see "autoSuggestions" containing "dresses" on "commonPage"
  And I should see "CancelCTA" exist on "commonPage"
  Then I click on "searchApply" on "commonPage"
  And I should see "url" contains "/search/Dresses"
  And I click on "exposedSearchField" on "commonPage"
  And I enter "freg" in "searchField" on "commonPage"
  Then I click on "searchApply" on "commonPage"
  And I should see "url" contains "/search/freg"
  And I click on "exposedSearchField" on "commonPage"
  And I enter "dresssssss" in "searchField" on "commonPage"
  Then I click on "searchApply" on "commonPage"
  And I should see "url" contains "/search/dresssssss"

  Examples:
  |variant|
  |variation1|
  |variation2|
  |variation3|
  |variation4|

@manual @DEBD-3049
Scenario: Validate that the user should not see any auto-suggestion items when user searches for a Chanel product
	Given I logout
  Then I should see "searchBar" exist on "commonPage"
	When I click on "searchBar" on "commonPage"
	And  I enter "chanel" in "searchField" on "commonPage"
  And I wait for "2000" milliseconds
	Then I should not see "autoSuggestions" on "commonPage"
	When I click on "searchApply" on "commonPage"
	And I should see "url" contains "content/chanel"

@manual @DEBD-3049
Scenario: Validate department search functionality
  When I set mvt test for "autoSuggest" as "variation1"
  Then I click on "searchIcon" on "commonPage"
  And I enter "Hats" in "searchField" on "commonPage"
  Then I select the auto search department as "ladies"
  Then I should see "headerText" as ""ladies hats"" on "pspPage"
  And I should see "url" contains "search/ladies+hats" 


@manual @DEBD-3049
 Scenario Outline: Validation of default search functionality when exposed search variation is not set
    Given I navigate to <Pages> with <Logged_in_user> or <Signout_user>
    Then I should see <Icon> for each <Pages> on the header section
    When I click on  <icon> link from each <pages>
    Then I should see default search exist on <Pages> as is production
    
Examples:
    | Pages     | Icon      |
    | homePage  | signIn    | 
    | homePage  | savedItems| 
    | homePage  | myBag     | 
    | homePage  | Search    | 
    | pspPage   | signIn    | 
    | pspPage   | savedItems| 
    | pspPage   | myBag     | 
    | pspPage   | Search    | 
    | pdpPage   | signIn    | 
    | pdpPage   | savedItems| 
    | pdpPage   | myBag     | 
    | pdpPage   | Search    | 
    | myBag     | signIn    | 
    | myBag     | savedItems|
    | myBag     | myBag     | 
    | myBag     | Search    | 

@manual @DEBD-3049
 Scenario Outline: Validation of border color and icons of the exposed searched componenet on home/psp/pdp/mybag page on Mobile-UK
    Given I navigate to <Variations> with <Logged_in_user> or <Signout_user>
    And I set mvt test for "exposedSearch" as "variation1 or 2 or 3 or 4"
    Then I should see "searchField" exist on <Variations> with text "Search"
    And I should see "searchApply" exist on <Variations>  
    Then I should see  <Color> of the "searchField" border component for each <variations>
    Then I should see  <Color> of the "SearchApply" icon for each <variations>
    Then I should see <Icon> for each <variations> on the header section
    When I click on "searchField" on the <Variations>
    Then I should validate color of the "searchField" border component as <exposed_Srch_Color> for each <variations>
    Then I should validate color of the "searchApply" icon as <exposed_Srch_Color> for each <variations>
    Then I should validate <icon>  for each <variations> on the header section
    Then I should see <Button> on the right hand side of the each <variations>
    Then I should see "searchField" exist on <Variations> with text "Search"
    When I click on <Button> for the each <variations>
    And I should see <Icon> icons in header section of the each <variations>
    Then I should see  <Color> of the "searchField" border component for each <variations>
    Then I should see  <Color> of the "SearchApply" icon for each <variations>
    Then I should see "searchField" exist on <Variations> with text "Search"

  Examples:
    | Variations| Icon      | Button       | exposed_Srch_Color| color | Logged_in_user | Signout_user|
    | homePage  | signIn    | CancelButton | teal              | grey  | abc@gmail.com  ||
    | homePage  | savedItems| CancelButton | teal              | grey  |||
    | homePage  | myBag     | CancelButton | teal              | grey  |||
    | pspPage   | signIn    | CancelButton | teal              | grey  |abc@gmail.com  ||
    | pspPage   | savedItems| CancelButton | teal              | grey  |||
    | pspPage   | myBag     | CancelButton | teal              | grey  |||
    | pdpPage  | signIn     | CancelButton | teal              | grey  |abc@gmail.com  ||
    | pdpPage  | savedItems | CancelButton | teal              | grey  |||
    | pdpPage  | myBag      | CancelButton | teal              | grey  |||
    | myBag    | signIn     | CancelButton | teal              | grey  |abc@gmail.com  ||
    | myBag    | savedItems | CancelButton | teal              | grey  |||
    | myBag    | myBag      | CancelButton | teal              | grey  |||

 @manual @DEBD-3049
 Scenario Outline: Validation of Exposed Search component in saved items and signIn
    Given I navigate to <page>
    And I set mvt test for "exposedSearch" for "variations"
    And click on "search-icon" link on <page>
    Then I should validate that "exposed-searchfiled" should get displayed
    And I should validate that "exposed-searchfiled" for <page> should be same as it is for "variations"
    And I click into the search field and start typing a search item
    When I rotate the mobile device to a landscape view
    Then "exposed-searchfiled" should get display without header

  Examples:
    |page|
    |singIn|
    |savedItems|    

@manual @DEBD-3049
 Scenario Outline: Validation of Exposed Search component when I rotate the mobile device to a landscape view
    Given I navigate to <page>
    And I set mvt test for "exposedSearch" for "variations"
    Then I should validate that "exposed-searchfiled" should get displayed on <page>
    When I rotate the mobile device to a landscape view
    Then "exposed-searchfiled" should get display with header
    When I click into the search field and start typing a search item
    And I rotate the mobile device to a landscape view
    Then "exposed-searchfiled" should get display without header
    When I naviage to "signIn" page
    And click on "search-icon" link on "signIn" page
    Then I should validate that "exposed-searchfiled" should get dislayed as it is as "variations"
    When I rotate the mobile device to a landscape view
    Then "exposed-searchfiled" should get display with header
    When I click into the exposed-searchfiled" and start typing a search item
    And I rotate the mobile device to a landscape view
    Then "exposed-searchfiled" should get display without header
    When I naviage to "mySavedItem" page
    And click on "search-icon" link on "mySavedItem" page
    Then I should validate that "exposed-searchfiled" should get dislayed as it is as "variations"
    When I rotate the mobile device to a landscape view
    Then "exposed-searchfiled" should get display with header
    When I click into the exposed-searchfiled" and start typing a search item
    And I rotate the mobile device to a landscape view
    Then "exposed-searchfiled" should get display without header

  Examples:
    |page|
    |homePage|
    |psp|   
    |pdp|
    |myBag|   
   
      

 @manual @DEBD-3049
 Scenario Outline: Validation of Exposed Search component in DESKTOP/TABLET
    Given I navigate to <page> on <device>
    And I set mvt test for "exposedSearch" for "variations"
    Then I should validate that "exposed-searchfiled" should not be displayed

  Examples:
    |page|device|
    |homePage|TABLET|
    |homePage|DEKSTOP|
    |pspPage|TABLET|
    |pspPage|DEKSTOP|
    |pdpPage|TABLET|
    |pdpPage|DEKSTOP|
    |myBag|TABLET|
    |myBag|DEKSTOP|

@manual @DEBD-3049
Scenario Outline: Validation of Exposed Search component in ROI and INT
    Given I navigate to <page> on <region>
    And I set mvt test for "exposedSearch" for "variations"
    Then I should validate that "exposed-searchfiled" should not be displayed on <page>

  Examples:
    |page|region|
    |homePage|ROI|
    |homePage|INT|
    |pspPage|ROI|
    |pspPage|INT|
    |pdpPage|ROI|
    |pdpPage|INT|
    |myBag|ROI|
    |myBag|INT|

@manual @DEBD-3049
Scenario Outline: Validation of Exposed Search component when user apply filter at PSP page
    Given I navigate to <page>
    And I set mvt test for "exposedSearch" for "variations"
    Then I should validate that "exposed-searchfiled" should  be displayed on <page>
    Then apply search on "exposedSearch" on each <page>
    Then From serach result apply filters
    And Validate the "exposedsearch" in <page> 
    And Validate that "exposedsearch" should not be displayed on <page> when user apply filter from psp page select saved items
 Examples:
    |page|
    |homePage|
    |pspPage|
    |pdpPage|
    |myBag|   

@manual @DEBD-3049
Scenario Outline: Validation of Exposed Search component when user apply filter at PSP page
    Given I navigate to <page>
    And I set mvt test for "exposedSearch" for "variations"
    Then I should validate that "exposed-searchfiled" should  be displayed on <page>
    Then apply search on "exposedSearch" on each <page>
    Then From serach result apply filters
    And Validate the "exposedsearch" in <page> 
    And Validate that "exposedsearch" should not be displayed on <page> when user apply filter from psp page select saved items
  Examples:
    |page|
    |homePage|
    |pspPage|
    |pdpPage|
    |myBag|   

@manual @DEBD-3049
Scenario Outline: Validation of exposed search with different parameter on Home/PSP/PDP/My Bag page
    Given I navigate to <page>
    And I set mvt test for "exposedSearch" for "variations"
    Then I should validate that "exposed-searchfiled" should  be displayed on <page>
    Then apply <search_param> on "exposedSearch" on each <page>
    Then Validate "search result" based on search paramter passed.
   
   Examples: 
    |page|search_param|
    |homePage|a*|
    |homePage|d[a]|
    |pspPage|a*|
    |pspPage|d[a]|
    |pdpPage|a*|
    |pdpPage|d[a]|
    |myBag|a*|
    |myBag|d[a]|