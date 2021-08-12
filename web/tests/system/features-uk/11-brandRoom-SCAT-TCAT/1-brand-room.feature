Feature: Test Debenhams brand room page

@manual @DBNHST-79
Scenario: Navigate to Shop Departments -> Beauty -> Shop by Brands -> Lancôme.
  Given Verify that the 6 filters are shown on the PSP 
  Then Verify that there is a hero image 
  And Check that Filter, sort and column/non-column view exist

@manual @DBNHST-79
Scenario: Navigate to Shop Departments -> Beauty -> Shop by Brands -> Lancôme and validate a PSP PDP journey
  Given Click on first product in PSP, and add to bag in PDP.
  Then Go back to PSP, Save for later.
  And Expand Categories accordion, and select Makeup 
  And Check in new PSP that Makeup is applied in Filter
