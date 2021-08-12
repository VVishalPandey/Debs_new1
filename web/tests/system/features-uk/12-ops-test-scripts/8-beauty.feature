Feature: Test Debenhams ops test script journey number 15 and 16

@automated @opsTC
Scenario:Verify PSP, PSP Pricing, Sort by, Filter, View more for the PSP page of Mother of the bride
  Given I logout
  Then I navigate to "freeGiftBadgeUrl"
  And I should see "freeGiftBadge" exist on "pspPage"
  Then I navigate to "freeGiftBadgePdpUrl"
  And I should see "giftBadgeLink" exist on "pdpPage"
  Then I click on "giftBadgeLink" on "pdpPage"
  And I should see "freeGiftSection" exist on "pdpPage"
