Feature: Test Debenhams hygiene page

@manual @DEBD-155
Scenario Outline: Validate offline banner
 Given I navigate to "<page>"
 When I lose my internet connection completely
 And I click on Debenhams logo
 And I enter offline mode
 And I click on "clickableIIcon" on "hygieneBanner"
 And I should see "offlineModeBanner" on "hygieneBanner"
 And I navigate to "dressPspUrl"
 And I should see "offlineModeBanner" on "hygieneBanner"
 And I navigate to "shoePdpUrl"
 And I should not see banner and blank page

   Examples:
    | page       |
    | psp        | 
    | pdp        |
    | mybag      |
    | homepage   |

@manual @DEBD-155
Scenario Outline: Validate the components of offline banner
 Given I navigate to "<page>"
 When I lose my internet connection completely
 And I click on Debenhams logo
 And I enter offline mode
 Then I should see "offlineModeBanneText" as "Currently browsing in offline mode" on "hygieneBanner"
 And I should see "clickableIIcon" exist on "hygieneBanner"

   Examples:
    | page       |
    | psp        | 
    | pdp        |
    | mybag      |
    | homepage   |

@manual @DEBD-155
Scenario: Verify offline mode pop up in offline mode
 And I click on "clickableIIcon" on "hygieneBanner"
 And I should see "darkOverlay" on "hygieneBanner"
 And I should see "offlineModeTitle" on "hygieneBanner"
 And I should see "textCopy" on "hygieneBanner"
 And I should see "orangeRetryConnectionButton" on "hygieneBanner"
 And I should see "whiteContineueOfflineButton" on "hygieneBanner"

@manual @DEBD-155
Scenario: Validate the behavior when clicked on Retry connection button in offline mode pop up
  And I click on "orangeRetryConnectionButton" on "hygieneBanner"
  Then my device will attempt to reconnect 
  When the device I am on has reconnected to the internet
  Then the offline mode banner will disappear and I will be able to continue browsing through the website 

@manual @DEBD-155
Scenario: Validate the behavior when clicked on Continue Offline button in offline mode pop up
 And I click on "whiteContineueOfflineButton" on "hygieneBanner"
 And I navigate to cached page
 And I should not see "offlineModeBanner" on "hygieneBanner"

@manual @DEBD-155
Scenario: Validate the behavior in payment page 
 When I am in Paymnet Page
 When I lose my internet connection completely
 And I click on edit delivery page 
 And I click on "whiteContineueOfflineButton" on "hygieneBanner"
 And I click on "clickableIIcon" on "hygieneBanner"
 And I should see "offlineModeBanner" on "hygieneBanner"
 And I should see "orangeRetryConnectionButton" on "hygieneBanner"
 And I should see "whiteContineueOfflineButton" on "hygieneBanner"
 And I click on Retry button
 And I should be able to navigate back to Payment Page
 And I should be able to place order sucessfully
 And I should not see "offlineModeBanner" on "hygieneBanner"
