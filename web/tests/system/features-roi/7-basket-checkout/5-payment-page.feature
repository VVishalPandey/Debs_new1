Feature: Test Debenhams payment page

@manual DDAI-397
Scenario:Naviagte to payment page>Validate that debenhams credit card option should not be displayed
  Given I am on payment page
  And I should not see the debenhams credit card option

@manual @DDAI-181
Scenario: Navigate to Debenhams payment Page>Any otherSite>Validate Payment Page - Order Summary (Accordion) for ROI
  Given THAT I have navigated to the Payment page
  Then I should see Order summary title in an accordion (collapsed by default)
  And I should see Delivery/Click & collect address listed
  And I should see Change delivery method' link
  And I should see Product information (Image, Title, Price, 'low in stock' messaging if available
  And I should see Edit shopping bag' link
  And I should see Out of stock messaging in red And a remove link for the product
  And I should see  Order summary section duplicated in the bottom of the Payment page\

@manual @DDAI-65
Scenario: Navigate to Debenhams payment Page>Any otherSite>Validate Order Summary>Total to Pay on Payment page for ROI
  Given THAT I have navigated to the Payment page
  When I expAnd the Order Summary section And viewed Total to pay
  Then I should be presented with two lines detailing
  And I should see Number of items And total cost
  And I should see Promotional Discounts (if any)
  And I should see Product Discounts (if any)
  And I should see Delivery type And charges (if any)

@manual @DDAI-66
Scenario: Validate promo code applied in my bag should display on Payment page.
  Given THAT I have successfully applied a promo code in My Bag
  When I navigate to the Payment page
  Then I should see the promo code applied in the Order summary section too

@manual @DDAI-66
Scenario: Validate promo code apply on Payment page.
  Given THAT I am on the Payment Page
  When I enter a promo code
  Then I should be able to apply the promo code
  And the page refreshes to display the status of my applied code (successful or unsuccessful)

@manual @DDAI-66
Scenario: Validate promo code removal on Payment page.
  Given THAT I am on the Payment page
  When I choose to remove my applied promo code
  Then the page refreshes And the promo code should disappear

@manual @DDAI-66
Scenario: Validate duplicate promo code apply on Payment page.
  Given THAT I am on the Payment page
  When I choose to enter a duplicate promo code
  Then I must see the error message 'You cannot enter the same promo code'
  And the promo code must not be applied twice

@manual @DDAI-180
Scenario: Navigate to Debenhams payment Page>Validate gift card section,apply gift card CTA,success notification And total to pay

@manual @DDAI-180
Scenario: Navigate to Debenhams payment Page>Validate 2 gift cards And When second gift card doesnt cover the balance ,verify the error,removing gift cards
  Given THAT I am on the Payment page
  When I choose to enter a duplicate promo code
  Then I must see the error message 'You cannot enter the same promo code'
  And the promo code must not be applied twice

@manual @DDAI-317
Scenario: Validate reward club card apply on Payment page.
  Given I have navigated to the Payment page And am a Debenhams Reward Club customer 
  When I enter my 16 digit card number And apply (pre-fix 63383 auto-populated)
  Then I should be able to see my card number saved on the field (all of it)
  And after I made a payment, I should see the correct number of points earned on my Reward Club in Order Confirmation 
  And the correct number of points added to my reward club account

@manual @DDAI-317
Scenario: Validate invalid reward club card apply on Payment page.
  Given I am on the payment page
  When I enter an invalid reward ID
  Then I will see the invalid card error messaging 
  And I see "enter the right amount of digits" error messaging
  And the field will remain populated with what I have entered

@manual @DDAI-317
Scenario: Validate remove reward club card apply on Payment page.
  Given I have saved a reward ID into the earn points container
  When I choose to remove my applied card 
  Then the section should default me back to an empty field with my saved Reward card erased 
  And the reward points upon purchase will not be added to my reward club
  And all messaging should say I could have earned those points

@manual @DDAI-317
Scenario: Validate remove of already added reward club card on Payment page.
  Given I have a saved reward card
  Then the number will automatically be populated in the card number field (partially hidden by *s)
  And I can remove it

@manual @DDAI-163
Scenario: Validate user is able to see balance of reward card on payment page
  Given I am on the payment page
  When I open the reward club container
  And I enter a valid reward card ID & PIN (pre-fix 633586 auto-populated)
  And I have a balance more than 0 on my reward card
  Then I can see the reward card balance beside the PIN And underneath pay with reward club card
  And I am able to press use this card

@manual @DDAI-163
Scenario: Validate user is able to do full or part payment with my reward card
  Given that I am on the payment page
  When I enter my reward card number in the payment container
  Then I will be able to pay full or part payment with my reward card
  And I will be able to select the save card checkbox

@manual @DDAI-163
Scenario: Validate user is able to save details of reward card to my account for future purchases
  Given that I am on the payment page
  When I select the save card checkbox
  Then the card details will be saved to my account for future purchases

@manual @DDAI-163
Scenario: Validate error for invalid reward card ID & PIN
  Given I am on the payment page
  When I open the reward club container
  And I enter a invalid reward card ID & PIN (pre-fix 633586 auto-populated)
  Then I can see the invalid points ID & PIN errors
  And I am unable to press use this card

@manual @DDAI-163
Scenario: Validate automatic use of pre added reward card And remove functionality
  Given I have a saved reward card
  Then the number will automatically be populated in the card number field (partially hidden by *s)
  And an empty PIN field
  And I can remove it

@manual @DDAI-485
Scenario: Validate numberic keypad functionality for Reward card

@manual @DDAI-508
Scenario: Navigate to Debenhams payment Page>Payment Page - Make the field numerical keypad for (add,edit,input payment card,gift card id and points,reward id,pin,reward club card)

@manual @DDAI-607
Scenario: Navigate to Debenhams payment Page>Payment Page -User has only saved card(expired card) radio button then we should be able to see expire card with radio button and "use new card" with radio button

@manual @DDAI-607
Scenario: Navigate to Debenhams payment Page>Payment Page -User has only saved card(expired card) radio button should be default to "use a new payment card" 

@manual @DDAI-607
Scenario: Navigate to Debenhams payment Page>Payment Page -User has multiple saved card(expired  and non expired card ) radio button should be default to non expired saved card and CVV number should be displayed

@manual @DDAI-607
Scenario: Navigate to Debenhams payment Page>Payment Page -User has multiple saved card(expired  and non expired card ) then we should be able to see expire cards with radio button and "use new card" with radio button

@manual @DDAI-607
Scenario: Navigate to Debenhams payment Page>Payment Page -User has multiple saved card(expired  and non expired card ) and we select expire card then radio button should be default to "use new payment card" and expire or saved card should not be selected.

@manual @DDAI-607
Scenario: Navigate to Debenhams payment Page>Payment Page -User has multiple saved card(expired  and non expired card ),user should be able to select nonexpire card and radio button should be selected and use "new payment card" button should not be selected.

@manual @DDAI-607
Scenario: Navigate to Debenhams payment Page>Payment Page -User has multiple saved card(expired  and non expired card ),user should be able to select "use new payment card" and radio button should be selected" and saved card radio button should not be selected

@manual @DBNHST-1512
Scenario: Navigate to payment page and validate that newsletter preference checkbox is displayed above the place order & pay CTA

@manual @DBNHST-1512
Scenario: Navigate to payment page and validate that the order summary is not displayed at the top but only at the bottom

@manual @DBNHST-1512
Scenario: Navigate to payment page and validate that newsletter preference checkbox is displayed above the place order & pay CTA

@manual @DBNHST-1512
Scenario: Navigate to payment page and validate that the order summary is not displayed at the top but only at the bottom

@manual @DBNHST-1530
Scenario: Navigate to payment page and validate that the Debs address is displayed in the footer bottom
