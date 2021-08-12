Feature: Test Debenhams psp image sizes

@automated @DBMTE-129
Scenario: Navigate to Debenhams women -> dresses psp page and validate the image size should be large
  Given I navigate to "womenDressesPspUrl"
  Then I should see "large" images

@automated @DBMTE-129
Scenario: Navigate to Debenhams beauty -> lipstick psp page and validate the image size should be normal
  Given I navigate to "beautyLipstickPspUrl"
  Then I should see "normal" images
