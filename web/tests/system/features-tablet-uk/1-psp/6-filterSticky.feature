Feature: Test Debenhams filter sticky on psp, brand room pages

# Below scenarios are for Sticky filter default variant of filters

@manual @DBNHST-1815
Scenario: Navigate to Debenhams psp page and validate that filter sticky should not appear when filter button is in view
  Given I am on psp page
  When i am in view of filter button
  Then i should not see the filter sticky activated

@manual @DBNHST-1815
Scenario: Navigate to Debenhams psp page and validate that filter sticky is activated when user passed the filter button
  Given I am on psp page
  When I am pass the filter button
  Then I should see the filter sticky is activated both upwards and downwards

@manual @DBNHST-1815
Scenario: Navigate to Debenhams brand room page and validate that filter sticky is not activated when filter in below and is view port
  Given I am on brand room page
  When filter button is below the view port
  Then filter sticky should not be activated

@manual @DBNHST-1815
Scenario: Navigate to Debenhams brand room page and validate that filter sticky is activated when filter in below and is view port
  Given I am on brand room page
  When filter button is above the view port
  Then filter sticky should be activated

@manual @DBNHST-1815
Scenario: Navigate to Debenhams brand room page and validate that user takes back to top of page when filter drawer is closed
  Given I am on brand room page
  When user scroll down on the page
  Then open and apply or remove filter
  When close the filter drawer
  Then user takes back to the top of the page

@manual @DBNHST-1815
Scenario: Navigate to Debenhams psp page and validate that user takes back to top of page when filter drawer is closed
  Given I am on psp page
  When user scroll down on the page
  Then open and apply or remove filter
  When close the filter drawer
  Then user takes back to the top of the page

@manual @DBNHST-1815
Scenario: Navigate to Debenhams psp page and validate UI updates will be done to the sticky filter
  Given I am on PSP page
  Then Remove number of filters from filter CTA
  And Increase font size from 12 to 16
  And Add shadow at the bottom of sticky area to highlight it more
  And Change filter CTA colour from teal to dark orange

@manual @DBNHST-1815
Scenario: Validate the filter sticky on the plp page, search psp page and Chanel psp page

@manual @DBNHST-1815
Scenario: Validate the filter sticky after sorting from filter sticky section
