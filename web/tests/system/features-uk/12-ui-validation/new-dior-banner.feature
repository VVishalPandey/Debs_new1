Feature: Test new DIOR banner of different DIOR categories

@notAutomated @DEBD-3672
Scenario Outline: Navigate to Debenhams chanel psp page and validate the page
  Given I navigate to "<DIORCategoriyPspPages>"
  Then I should see "DiorPspBanner" exist on "pspPage"
  Examples:
    | DIORCategoriyPspPages |
    | skinCare              |
    | MakeUp                |
    | Perfume               |
    | AfterShave            |

