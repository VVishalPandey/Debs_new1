Feature: Test Debenhams global navigation landscape mode

@manual @DBMTE-176
Scenario: to test scenario 1 on DBMTE-176 story
  Given I am on tablet landscape view
  And on any page
  When I click on a department within the drop-down nav e.g. Christmas, Womens etc.
  Then I will see a pop out modal with the sub categories for that department displayed (always in max 5 columns)
  And the relevant department highlighted in green
  And a close X CTA

@manual @DBMTE-176
Scenario: to test scenario 2 on DBMTE-176 story
  Given I have opened the modal
  When there are only 4 columns required for the sub categories
  Then the very right column will be left blank

@manual @DBMTE-176
Scenario: to test scenario 3 on DBMTE-176 story
  Given I have opened a department on the drop-down nav
  When I click on another department
  Then the sub-categories will update to reflect the new department

@manual @DBMTE-176
Scenario: to test scenario 4 on DBMTE-176 story
  Given I have opened a department on the drop-down nav
  When there more sub-categories than fills the page
  Then the I have to scroll down the page (no scroll within pop up)

@manual @DBMTE-176
Scenario: to test scenario 5 on DBMTE-176 story
  Given I click on the offers department
  Then I will see the offers department highlighted in red on the pop out modal:

@manual @DBMTE-176
Scenario: to test scenario 6 on DBMTE-176 story
  Given I have opened a department on the drop-down nav e.g. womens
  When I click on a sub-category e.g. tops
  Then I am taken to the relevant page And the nav will close e.g. womens tops PSP

@manual @DBMTE-176
Scenario: to test scenario 7 on DBMTE-176 story
  Given I have tapped on a department to open the department modal
  When I tap it a second time 
  Then the modal will close

@manual @DBMTE-176
Scenario: to test scenario 8 on DBMTE-176 story
  Given I have opened a department on the drop-down nav
  When I click on the close CTA
  Then the department pop out modal will close
  And I can see the normal header
  And homepage content

@manual @DBMTE-176
Scenario: to test scenario 9 on DBMTE-176 story
  Given have the DDN open
  When I click anywhere behind the overlay
  Then the DDN will close

@manual @DBMTE-176
Scenario: to test scenario 10 on DBMTE-176 story
  Given I am on landscape view 
  And the DDN is open
  When I switch to portrait view
  Then the DDN will close
