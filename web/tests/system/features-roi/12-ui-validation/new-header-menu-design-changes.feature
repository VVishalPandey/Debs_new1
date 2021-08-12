Feature: Test Debenhams new disgn changes for Header and Menu for mobile

@manual @DEBD-3851
Scenario: Validate the resizing of Header icon
 Given I logout
 And I should see "MenuIcon" size should be "20*20 px" on "commonPage"
 And I should see "SearchIcon" size should be "20*20" on "commonPage"
 And I should see "SignInIcon" size should be "20*20" on "commonPage"
 And I should see "SavedIcon" size should be "20*20" on "commonPage"
 And I should see "MyBagIcon" size should be "20*20" on "commonPage"

@manual @DEBD-3851
Scenario: Validate the header icons are working fine after resizing
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  And I click on "closeIcon" on "commonPage"
  When I click on "SearchIcon" on "commonPage"
  Then I should see "searchField" exist on "commonPage"
  And I should see "searchApply" exist on "commonPage"
  When I click on "CancelIcon" on "commonPage"
  And I click on "SignIn" on "commonPage"
  Then I should see "headertext" as "Sigin" on "SiginPage"
  When I click on "SavedIcon" on "commonPage"
  Then I should see "headertext" as "MySavedIteams" on "SavedItemsPage"
  When I click on "MyBagIcon" on "commonPage"
  Then I should see "myBagDrawer" exists on "commonPage"

@manual @DEBD-3851
Scenario: Validate the colour changes of sale text and icons in menu
  When I click on "menuIcon" on "commonPage"
  Then I should see Sale under the Menu is in Black colours
  And I should see all subcategories under Menu is in Black colours
  And I should see "signInBIcon" "#000000" in colour
  And I should see "Help&SupportIcon" "#000000" in colour
  And I should see "Saved ItemsIcon" "#000000" in colour


@manual @DEBD-3851
Scenario: Validate the width of the Menu Bar is same as the width of Header



