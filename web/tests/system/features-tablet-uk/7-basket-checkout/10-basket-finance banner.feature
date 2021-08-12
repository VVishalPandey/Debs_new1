Feature: Validation fo the finance banner on the basket page for different dates

@manual @DDAI-1047	
Scenario: Validation of the 20% recruitment eventfinance banner  on the basket page for the mobile and tablet
  Given the user is logged in 
  When the user navigates to the site 
  And add the products to the basket page between the dates 4 to 16 sep 2018
  Then the user should view the promotion banner on the basket page 
  And the Banner should display the 20% Recruitment event 

@manual @DDAI-1047	
Scenario: Validation of the private sale 20% finance banner on the basket page for the mobile and tablet
  Given the user is logged in 
  When the user navigates to the site 
  And add the products to the basket page between the dates 20 to 23 sep 2018
  Then the user should view the promotion banner on the basket page 
  And the Banner should display the private sale 20% Recruitment event 

@manual @DDAI-1047	
Scenario: Validation of the default dynamic (10% of the basket value) finance banner on the basket page for the mobile and tablet
  Given the user is logged in 
  When the user navigates to the site 
  And add the products to the basket page 
  Then the user should view the promotion banner on the basket page 
  And the Banner should display the 10% of the basket value banner 

@manual @DDAI-1047	
Scenario: Validation of the quantity increased or decreased for the product on the basket page for mobile and tablet
  Given the user is logged in 
  When the user navigates to the site 
  And add the products to the basket page 
  And the user navigates to the basket page
  And the user increased/decreased the quantity of the product on the basket page
  Then the user should view the updated amount on the basket page
