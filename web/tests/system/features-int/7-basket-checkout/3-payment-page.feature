Feature: Test Debenhams payment page

@manual @DDAI-263
Scenario: Navigate to Debenhams payment page and validate the Duty & Tax notification box for International Site
  Given that I am on the payment page
  When I press the find out more on the duty and tax messaging
  Then I will be taken (in a new tab) to the international delivery FAQ (https://iwwiit02.debenhams.com/wcsstore/DebenhamsIntSite/faq/en-cn/delivery_information/international_delivery.html#Will I be charged any additional fees for international orders%3F) - update link for live

@manual @DDAI-287
Scenario: Navigate to Debenhams payment Page>Candaian or German Site>validate marketing preferences is opted out by default when marketing prefernce is not selected previously
  Given that I am on the German or Canadian site
  And I have not previously selected a marketing preference (on my account)
  When I am on the payment page
  Then the marketing preferences is opted out by default (checkbox is not selected)

@manual @DDAI-287
Scenario: Navigate to Debenhams payment Page>Any otherSite>validate marketing preferences is opted in by default when marketing prefernce is not selected previously
  Given  that I am on any other site
  And I have not previously selected a marketing preference (on my account)
  When I am on the payment page
  Then the marketing preferences is opted in by default (checkbox is selected)

@manual @DDAI-287
Scenario: Navigate to Debenhams payment Page>Any otherSite>Validate marketing preference will match what is on my account
  Given I have a marketing preference on my account
  When I am on the payment page
  Then  the marketing preference will match what is on my account

@manual @DDAI-181
Scenario: Navigate to Debenhams payment Page>Any otherSite>Validate Payment Page - Order Summary (Accordion) for International
  Given THAT I have navigated to the Payment page
  Then I should see Order summary title in an accordion (collapsed by default)
  And I should see Deliver address listed
  And I should see Change delivery method' link
  And I should see Product information (Image, Title, Price, 'low in stock' messaging if available
  And I should see Edit shopping bag' link
  And I should see Out of stock messaging in red and a remove link for the product
  And I should see  Order summary section duplicated in the bottom of the Payment page

@manual @DDAI-65
Scenario: Navigate to Debenhams payment Page>Any otherSite>Validate Order Summary>Total to Pay on Payment page for International

  Given THAT I have navigated to the Payment page
  When I expand the Order Summary section and viewed Total to pay
  Then I should be presented with two lines detailing
  And I should see Number of items and total cost
  And I should see Promotional Discounts (if any)
  And I should see Product Discounts (if any)
  And I should see Delivery type and charges (if any)

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
  Then the page refreshes and the promo code should disappear

@manual @DDAI-66
Scenario: Validate duplicate promo code apply on Payment page.
  Given THAT I am on the Payment page
  When I choose to enter a duplicate promo code
  Then I must see the error message 'You cannot enter the same promo code'
  And the promo code must not be applied twice
@manual @DDAI-277
Scenario: Navigate to Debenhams payment Page>Validate card icon for different cards after entering and removing digits

@manual @DDAI-277
Scenario: Navigate to Debenhams payment Page>Validate payment page section and 3 card and new and saved billing address

@manual @DDAI-277
Scenario: Navigate to Debenhams payment Page>Validate inline error message entering invalid card and expiry date

@manual @DDAI-277
Scenario: Navigate to Debenhams payment Page>Validate saved cards,changecard>validate icons and saved billing address

@manual @DDAI-277
Scenario: Navigate to Debenhams payment Page>Validate expiry cards

@manual @DDAI-286
Scenario: Navigate to Debenhams payment Page>Payment Page - Pay with Paypal
  Given I am on the payment page
  Then I can see the credit card container open by default
  And a closed paypal container
  Given I am on the payment page
  When I click on the paypal container
  Then I am taken to the pay with paypal CTA
  And the paypal conatiner will open with the paypal messaging
  And the pay by credit card container will close
  And place order CTA will change to a pay with paypal CTA with a link to paypal

@manual @DDAI-508
Scenario: Navigate to Debenhams payment Page>Payment Page - Make the field numerical keypad for (add,edit,input payment card)

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
Scenario: Navigate to Debenhams payment Page>Payment Page -User has multiple saved card(expired  and non expired card ),user should be able to select "use new payment card" and radio button should be selected and saved card radio button should not be selected

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
