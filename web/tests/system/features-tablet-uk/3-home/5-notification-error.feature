Feature: Verify the functionality of the notifications on mobile/Tab

@manual @DDAI-843 @DDAI-842  
Scenario: Validation of the warning error messages on the mobile/Tab on Product details page
  Given the user is logged in 
  And the user is on the PDP page
  When the user adds the quantity more than threshold
  Then the user should see the error message in red colour with cross icon on the top of the screen
  And the error message should be " You have exceed the maximum quantity for this item"
  And clicking on the cross icon should close the error message

@manual @DDAI-843 @DDAI-842  
Scenario: Validation of the warning error messages on the mobile/Tab on the basket page
  Given the user is logged in 
  And the user is on the Basket page with the products added 
  When the user adds the incorrect promo code on the basket page and clicks on the apply button
  Then the user should see the warning message in red colour with cross icon on the top of the screen
  And the error message should be "Sorry that promotional code was not recognised, please check and try again"
  And clicking on the cross icon should close the error message

@manual @DDAI-843 @DDAI-842  
Scenario: Validation of the warning messages on the mobile/Tab on the sign in page
  Given the user is on the Sign in page 
  And the user enters the email address
  And user enters the incorrect password
  Then the user should see the warning message in red colour on the top of the screen
  And notification message should be "Password incorrect-You have 2 attempts left before your account will be locked" 

@manual @DDAI-843 @DDAI-842  
Scenario: Validation of the information messages on the mobile/Tab on basket page
  Given the user is logged in 
  And the user is on the Basket page with the products added 
  When the user removes the product on the basket page
  Then the user should see the warning message in blue colour 
  And the info message should be "Item removed from Mybag" on the top of the screen

@manual @DDAI-908
Scenario Outline: Validate notification on PDP --> Out of Stock message
  Given I am on the <PDP>
  And I have selected a product which is out of stock
  Then I should see notification "Sorry - this item is currently out of stock."
  And Inline message "Sorry - this item is currently out of stock."
  And box with drop shadow And not full screen
  And mobile text should be left aligns
  And tablet text should be center aligned 
  And box should be white filled not red

  Examples:
    | PDP                      | SKU              |
    | PDP’s with dropdown      | 306901902280FTDB |
    | carousel                 | 150010203443     |
    | single sku               | 312010614180     |
    | multiple sku             | 008020209843     |
    | PDPs with color swatches | 121076003699     |
    | price range pdp          | 306901902280FTDB |
    | furniture                | 322002257363     |
    | concession pdp           | 61252+276687     |

@manual @DDAI-908
Scenario Outline: Validate notification on PDP --> Exceeded maximum quantity message
  Given I am on the PDP
  And I have selected a product which exceeds the quantity limit
  Then I should see notification "You have exceeded the maximum quantity allowed for this item"
  And Inline message "You have exceeded the maximum quantity allowed for this item"
  And box with drop shadow And not full screen
  And mobile text should be left aligns
  And tablet text should be center aligned 
  And box should be white filled not red

  Examples:
    | PDP    |
    | Chanel |
    | Armani |

@manual @DDAI-908
Scenario: Validate notification of Item removed from bag should display atleast 5 sceonds on screen and after that it should removed.

@manual @DDAI-908
Scenario: Validate notification of Item removed from bag should display atleast 5 sceonds on screen and if user moved to some other page before 5 seconds message should get removed.

@manual @DDAI-908
Scenario: Validate notification of Incorrect password from Home page should display atleast 5 sceonds on screen and after that it should removed.

@manual @DDAI-908
Scenario: Validate notification of Incorrect password from Home page should display atleast 5 sceonds on screen and and if user moved to some other page before 5 seconds message should get removed.

@manual @DDAI-908
Scenario: Validate notification of Incorrect password from checkout login page should display atleast 5 sceonds on screen and after that it should removed.

@manual @DDAI-908
Scenario: Validate notification of Incorrect password from checkout login page should display atleast 5 sceonds on screen and and if user moved to some other page before 5 seconds message should get removed.

@manual @DDAI-908
Scenario: Validate notification of Incorrect password from beauty login page should display atleast 5 sceonds on screen and after that it should removed.

@manual @DDAI-908
Scenario: Validate notification of Incorrect password from beauty login page should display atleast 5 sceonds on screen and and if user moved to some other page before 5 seconds message should get removed.
