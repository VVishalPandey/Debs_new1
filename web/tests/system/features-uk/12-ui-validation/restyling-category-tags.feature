Feature: Test restyled category tags on Tcat/content Page

@manual @DEBD-4212
Scenario: validate the UI of newly designed category tags
 Given I'm on  "giftsTcatPage"
 And I scrolled to "categoryTags component"
 And I validate the edges are changed to curved instead of earlier square designed category
 And I validate the colour of the buttons can be changed from backend
 And I validate the colour of the text is Black
 When I hover to the button
 Then I should see the colour of the button changes to #333333
 And the colour of the copy text should change to white
 And I validate all the variant of the buttons (4 buttons, 3 buttons and 2 buttons)
 And the hight of of the button should be 30px
 And the margin between two buttons should be 20 px
 And validate all the buttons should be aligned vertically

@manual @DEBD-4212
Scenario: validate the functionality of newly designed category tags
Given I'm on "giftsTcatPage"
And I'm in view of  "categoryTags component"
When I click on each buttons
Then I should be redirected to respective PSP Page

@manual @DEBD-4212
Scenario: validate the category tags can be placed anywhere on the TCAT/Content Page

@manual @DEBD-4212
Scenario: validate the category tags changes doesn't regress the other components of the Page

@manual @DEBD-4212
Scenario: validate the padding between the other components of the Page doesn't change












