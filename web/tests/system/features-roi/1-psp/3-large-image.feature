Feature: Test Debenhams psp page global banner,badging and larger images for ROI

@automated @DDAI-326
Scenario: Navigate to Debenhams women -> dresses psp page and validate the image size should be large
  Given I navigate to "homeUKURL"
  Then I "validate & click" country as "IE" from "countryOptions" on "commonPage"
  Given I navigate to "womenDressesPspUrl"
  Then I should see "large" images

@automated @DDAI-326
Scenario: Navigate to Debenhams beauty -> lipstick psp page and validate the image size should be normal
  Given I navigate to "beautyLipstickPspUrl"
  Then I should see "normal" images

@automated @DDAI-326
Scenario: Navigate to Debenhams search psp pages and validate the image size should be normal
  Given I navigate to "searchDressesWomenPspUrl"
  Then I should see "normal" images
  When I navigate to "searchTowelPspUrl"
  Then I should see "normal" images

@manual @DDAI-326
Scenario: Navigate to Debenhams psp page and validate current promotions displayed as a banner
  Given I have navigated to a PSP
  Then I should see current promotions displayed as a banner with click-through link

@manual @DDAI-326
Scenario: Navigate to Debenhams psp page and validate two type of badges
  Given I have navigated to women's all bras PSP
  Then I should see two types of badges
  And I should see 'More Colour options'
  And I should see a badge beneath pricing e.g 'Mix & Match' or '2 Pack' (on some products... not all)

@manual @DDAI-326
Scenario: Navigate to Debenhams psp page and validate discounted products
  Given I am on a PSP where products are discounted
  Then I should see save % off in red, was, now in bold, Then with strikethrough price
