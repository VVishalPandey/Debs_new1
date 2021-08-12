Feature: Test Sprint 10 story DBNHST-1095

@manual @DBNHST-1095
Scenario: My Account - MBC :Senario-Manage account :Existing User : Validate beauty content below the beauty dashboard
  Given I am signed into beauty club
  When I am on the beauty dashboard
  Then I can see beauty content
  And it clicks through to the relevant locations


@manual @DDAI-1019	
Scenario: Validation of the beauty offers page CTA for mobile for all sites
  Given the user is logged in 
  When the user navigates to the beauty offers page i.e content/estee-lauder-promotions or https://www.debenhams.com/content/lancome-offers
  And user tries to add the product 
  Then the product should be added 
  And the mini bag should be updated
