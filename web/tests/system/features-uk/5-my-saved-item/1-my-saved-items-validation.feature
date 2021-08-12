Feature: Test Debenhams my saved items

@manual @DBNHST-
Scenario: Navigate to Debenhams my saved items page after login and validate the page
  Given I logout
  When I am on my details page
  And I navigate to "mySavedItemPageUrl"
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  And I should see "itemsCountText" as "(0 items)" on "mySavedItemPage"
  And I should see "paraText" as "You haven't saved anything yet!" on "mySavedItemPage"
  And I should see "goShoppingButton" exist on "mySavedItemPage"

@manual @DBNHST-
Scenario: Navigate to Debenhams my saved items page from above scenario and validate the navigation when select go shopping button
  When I click on "goShoppingButton" on "mySavedItemPage"
  Then I should not see "goShoppingButton" on "mySavedItemPage"

@manual @DBNHST-
Scenario: Navigate to Debenhams my saved items page and validate dress name and price which is added from women's dress page
  Given I logout
  When I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductSaveItemIcon" on "pspPage"
  And I navigate to "mySavedItemPageUrl"
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  And I should see "headerMessage" as "Items saved for this visit, to save these items to 'My Account', create an account now ir sign in now." on "mySavedItemPage"
  And I should validate product name on "mySavedItemPage"
  And I should validate final price on "mySavedItemPage"
  And I validate the "total items"

@manual @DBNHST-
Scenario Outline: Navigate to Debenhams my saved items page from above and sign in using the link in header message and validate the landing page
  When I click on "signInLink" on "mySavedItemPage"
  Then I should see "headerText" as "My saved Items" on "mySavedItemPage"
  And I should see "tab1" as "Sign In" on "mySavedItemPage"
  And I should see "tab2" as "Create an account" on "mySavedItemPage"
  And I should see "emailAddressFieldSignIn" exist on "mySavedItemPage"
  And I should see "passwordField" exist on "mySavedItemPage"
  And I should see "signInButton" exist on "mySavedItemPage"
  And I should see "forgotPasswordLink" exist on "mySavedItemPage"
  And I should see "rememberMe" exist on "mySavedItemPage"
  And I should see "createAccountLink" exist on "mySavedItemPage"
  When I enter "<email>" in "emailAddressFieldSignIn" on "mySavedItemPage"
  And I enter "<password>" in "passwordField" on "mySavedItemPage"
  And I click on "signInButton" on "mySavedItemPage"
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  And I should not see "headerMessage" on "mySavedItemPage"
  And I should validate product name on "mySavedItemPage"
  And I should validate final price on "mySavedItemPage"
  And I validate the "total items"

  Examples:
    | email                      | password  |
    | testautomationd2@gmail.com | password2 |

@manual @DBNHST-
Scenario: Navigate to Debenhams my saved items page and validate the added product should be remove when user remove save for later from PDP
  When I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should validate final price on "pdpPage"
  When I click on "productSaveItemIcon" on "pdpPage"
  And I navigate to "mySavedItemPageUrl"
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  And I should see "itemsCountText" as "(0 items)" on "mySavedItemPage"
  And I should see "paraText" as "You haven't saved anything yet!" on "mySavedItemPage"
  And I should see "goShoppingButton" exist on "mySavedItemPage"

@manual @DBNHST-
Scenario: Navigate to Debenhams my saved items page and validate the name and price of new added foundation product
  When I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should validate final price on "pdpPage"
  And I validate all sizes on "pdpPage"
  Then I validate size on my bag page from "pdpPage"
  When I select save for later for above product on "myBagPage"
  And I navigate to "mySavedItemPageUrl"
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  And I should validate product name on "mySavedItemPage"
  And I should validate final price on "mySavedItemPage"
  And I should validate dress size on "mySavedItemPage"
  And I validate the "total items"

@manual @DBNHST-
Scenario: Navigate to Debenhams my saved items page and validate product added when add to bag from saved items page
  When I add to bag above product
  And I navigate to "basketCheckoutUrl"
  Then I should validate product name on "myBagPage"

@manual @DBNHST-
Scenario: Navigate to Debenhams my saved items page when user log out
  Given I logout
  When I navigate to "mySavedItemPageUrl"
  Then I should see "headerText" as "My saved Items" on "mySavedItemPage"
  And I should see "itemsCountText" as "(0 items)" on "mySavedItemPage"
  And I should see "tab1" as "Sign In" on "mySavedItemPage"
  And I should see "tab2" as "Create an account" on "mySavedItemPage"

@manual @DBNHST-
Scenario: Navigate to Debenhams my saved items page and validate remove all pop up and also validate when no is selected
  Given I logout
  When I am on my details page
  And I navigate to "mySavedItemPageUrl"
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  When I click on "removeAllLink" on "pspPage"
  Then I should see "removePopUpHeaderText" as "Remove all" on "mySavedItemPage"
  And I should see "removePopUpCloseIcon" exist on "mySavedItemPage"
  And I should see "removePopUpNoButton" exist on "mySavedItemPage"
  And I should see "removePopUpNYesButton" exist on "mySavedItemPage"
  When I click on "removePopUpNoButton" on "pspPage"
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  And I should see "removeAllLink" exist on "mySavedItemPage"

@manual @DBNHST-
Scenario: Navigate to Debenhams my saved items page and validate products removed when select remove all
  When I click on "removeAllLink" on "pspPage"
  Then I should see "removePopUpHeaderText" as "Remove all" on "mySavedItemPage"
  When I click on "removePopUpNYesButton" on "pspPage"
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  And I should see "itemsCountText" as "(0 items)" on "mySavedItemPage"
  And I should see "paraText" as "You haven't saved anything yet!" on "mySavedItemPage"
  And I should not see "removeAllLink" on "mySavedItemPage"

@manual @DBNHST-
Scenario: Navigate to Debenhams my saved items page having saved items and validate removing a product is working fine

@manual @DBNHST-
Scenario: Navigate to Debenhams my saved items page having saved items and add to bag is workign fine for bundle product

@manual @DBNHST-
Scenario: Navigate to Debenhams my saved items page and validate user able to add to bag for single sku product

@manual @DBNHST-
Scenario: Navigate to Debenhams my saved items page and validate user able to add to bag for product with options to choose

@manual @DBNHST-842
Scenario: Navigate to Debenhams my saved items page and validate user able to select an out of stock size/colour for a product

@manual @DBNHST-842
Scenario: Navigate to Debenhams my saved items page and validate user able to see an error when selecting an out of stock size/colour for a product


@manual @DDAI-1005
Scenario Outline: Validate notification displays to confirm item has been added to bag from SFL. Notification should be visible for 3 seconds before dispearing
  Given I am on SFL with some items in it
  Then I add a single "<Items>" to bag from SFL
  Then I should see notification " Your Item is added to the bag" should display

	Examples:
		| Items       |
		| Women Dress |
		| Mens Jeans  |
		| Sofa        |
		| T-shirt bras|
		| Chanel      |
		| Lipstick    |

@manual @DDAI-1005
Scenario: Validate notification should be visible for 3 seconds before dispearing
  Given I am on SFL with some items in it
  Then I add some items to bag from SFL
  Then I should see notification " Your Item is added to the bag" should display
  Then I should see the notification visible for 3 seconds before dispearing
  And After 3 seconds it should get disapear

@manual @DDAI-1005
Scenario: Validate notification should be visible for 3 seconds before dispearing and disapear if user navigates to some other page before 3 seconds
  Given I am on SFL with some items in it
  Then I add some items to bag from SFL
  Then I should see notification " Your Item is added to the bag" should display
  Then I move to some other page
  And  Notification should get disappear

@manual @DDAI-1005
Scenario Outline: Validate that we are able to see the notification on adding multiple products to my bag from saved items page
	Given I am on SFL with some items in it
    Then I add few "<Multi Items>" to bag from SFL
	Then I should see notification " Your Item is added to the bag" should display
	Then I should see the notification visible for 3 seconds before dispearing
    And After 3 seconds it should get disapear

	Examples:
		| Multi Items 		 |
		| Dress & Furniture  |
		| Beauty & Lingerie	 |
		| Mens Shirts & Jeans|

@manual @DDAI-1005
Scenario: Validate that we are not able to see the add to bag notification when adding an product which goes OOS at the backend on saved item page without refreshing the page
	Given I am on SFL with a in stock product in it
	Then I wait for the product to go OOS
    Then I click on "addToBag" button of the "OOS product" from SFL
	Then I should not see notification " Your Item is added to the bag" on the SFL page
	And I should see the OOS error message on SFL page

@manual @DDAI-1005
Scenario Outline: Validate that we are able to see the notification on adding multiple products(preselected size/colour from PDP with single SKU or products where size needs to be selected) to my bag from saved items page
    Given I am on SFL with some items in it
    Then I add "<Preselected Size>" and "<Single SKU or select size>" products to bag from SFL
	Then I should see notification " Your Item is added to the bag" should display
	Then I should see the notification visible for 3 seconds before dispearing
    And After 3 seconds it should get disapear

    Examples:
		| Preselected Size 	 | Single SKU or select size |
		| Dress              | Chanel                    |
		| Lipstick      	 | Lingerie                  |
		| Sofa               | Bed sheet                 |
