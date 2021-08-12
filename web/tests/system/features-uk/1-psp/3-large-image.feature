Feature: Test Debenhams psp filters image size

@automated @Fixed @DBNHST-75
Scenario: Navigate to Debenhams women -> dresses psp page and validate the image size should be large
  Given I navigate to "womenDressesPspUrl"
  Then I should see "large" images

@automated @Fixed @DBNHST-75
Scenario: Navigate to Debenhams beauty -> lipstick psp page and validate the image size should be normal
  Given I navigate to "beautyLipstickPspUrl"
  Then I should see "normal" images

@automated @Fixed @DBNHST-75
Scenario: Navigate to Debenhams search psp pages and validate the image size should be normal
  Given I navigate to "searchDressesWomenPspUrl"
  Then I should see "normal" images
  When I navigate to "searchTowelPspUrl"
  Then I should see "normal" images
