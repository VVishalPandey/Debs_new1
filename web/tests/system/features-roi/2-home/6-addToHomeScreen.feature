Feature: Test Add to Home screen feature on Debenhams mobile site (Android-chrome only)

@manual  @DDAI-853
Scenario: Validate A2HS prompt on Debenhams site on user's third visit in a month
  Given I am on my third visit to Debenhams site's home page in one month
  And I have navigated to the Debenhams mobile homepage
  Then I should get Add to Homescreen prompt

@manual  @DDAI-853
Scenario: Validate functionality when user chose to add the debenhams site to home screen 
  Given I have chosen to add the Debenhams site to my homescreen
  Then Debenhams icon(D) should get saved on my device's home screen
  Then I clicks on Debenhams icon from home screen 
  Then I should see home page of debenhams site on the app
  And My experience should be the same as per current browser

@manual  @DDAI-853
Scenario: Validate functionality if I ignore the A2HS pop up
  Given I have ignored the prompt
  Then I will not see it again
  When I navigate to other pages on the site

@manual  @DDAI-853
Scenario: Validate functionality on my fourth visit if I ignore the A2HS pop up on my third visit
  Given I have ignored the prompt on my third visit
  When I go to the Debs homepage on my fourth visit
  Then I should see the prompt

@manual  @DDAI-853
Scenario: Validate functionality if I close the A2HS pop up
  Given I have closed the prompt
  When I navigate on the site
  Then i won't see the prompt

@manual  @DDAI-853
Scenario: Validate functionality on my fourth visit if I close the A2HS pop up on my third visit
  Given I have closed the prompt on my third visit
  When I go to the Debs homepage on my fourth visit
  Then I should not see the prompt

@manual  @DDAI-853
Scenario: Validate A2HS prompt on Debenhams site if user already added and this is user's third visit in next month
  Given I am on my third visit to Debenhams site's home page next month
  Then I should not get Add to Homescreen prompt again

@manual  @DDAI-853
Scenario: Validate A2HS pop up should get disappear if I ignore the A2HS pop up
  Given I have ignored the prompt
  And I moved to some other page from home page
  Then A2HS pop up should get disappear
  When I navigate back to home page
  Then I should not see A2HS pop up again

@manual  @DDAI-853
Scenario: Validate A2HS prompt on Debenhams site if user closed the prompt but clears browser cookies after that
  Given I am on my third visit to Debenhams site's home page in same month after clear the browser's cookies
  Then I should get Add to Homescreen prompt again

@manual  @DDAI-853
Scenario: Validate A2HS prompt on Debenhams site if user already added but clears browser cookies after that
  Given I am on my third visit to Debenhams site's home page after clear the browser's cookies
  Then I should get Add to Homescreen prompt again

@manual  @DDAI-853
Scenario: Validate A2HS prompt on Debenhams site if user closed and this is user's third visit in next month
  Given I am on my third visit to Debenhams site's home page next month
  Then I should not get Add to Homescreen prompt again

@manual  @DDAI-853
Scenario: Validate A2HS prompt on Debenhams site if referesh site 3-4 times on home page
  Given I am on my first visit to Debenhams site's home page
  Then I should not get Add to Homescreen prompt again until i close and open pop up third time

@manual  @DDAI-853
Scenario: Validate A2HS prompt on Debenhams site on user's third visit in a month from Google search
  Given I am on my third visit to Debenhams site's home page in one month from google search
  And I have navigated to the Debenhams mobile homepage
  Then I should get Add to Homescreen prompt
