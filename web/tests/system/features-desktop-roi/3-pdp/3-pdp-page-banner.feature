Feature: Test Debenhams pdp page banner

@manual @DEBD-528
Scenario Outline: Navigate to PDP of dior backstage and validate the pdp banner and its navigation when clicked on it
  Given I navigate to "PDPages"
  Then I should see "pdpBanner" exist on "pdpPage"
  When I click on "pdpBanner" on "pdpPage"
  And I should see "url" contains "productPageurl"
  Then I go back to previous page

Examples:
    | PDPages                  | productPageurl             |
    | diorBackstagePdpUrl      | /content/dior-backstage    |
    | DressBackstagePdpUrl      | /content/dior-backstage   |

