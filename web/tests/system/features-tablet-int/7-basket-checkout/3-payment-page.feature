Feature: Validate payment via PayPal

@manual @DBMTE-353
Scenario: Validate as a customer on DOTINT I am able to pay by paypal
  Given I am on the payment page
  Then I can see the credit card container open by default
  And a closed paypal container

@manual @DBMTE-353
Scenario: Validate as a customer on DOTINT I am able to pay by paypal
  Given I am on the payment page
  When I click on the paypal container
  Then the paypal accordion will open with the paypal messaging
  And the pay by credit card container will close
  And the radio for paypal will be selected
  And place order CTA will change to an orange pay with paypal CTA with a link to paypal

@manual @DBMTE-367
Scenario: Navigate to Debenhams payment page and validate the Duty & Tax notification box for International Site
  Given that I am on the payment page
  When I press the find out more on the duty and tax messaging
  Then I will be taken (in a new tab) to the international delivery FAQ (https://iwwiit02.debenhams.com/wcsstore/DebenhamsIntSite/faq/en-cn/delivery_information/international_delivery.html#Will I be charged any additional fees for international orders%3F) - update link for live

@manual @DBMTE-389
Scenario: Payment Page - sticky pay section & one promo/order summary accordion
  Given I am on the payment page
  When I have the credit card accordion open
  Then I will see a sticky place order & pay section

@manual @DBMTE-389
Scenario: Payment Page - sticky pay section & one promo/order summary accordion
  Given I am on the payment page
  When I have the paypal accordion open
  Then I will see a sticky pay by paypal section

@manual @DBMTE-389
Scenario: Payment Page - sticky pay section & one promo/order summary accordion
  Given I am on tablet
  Then I will only see one promo accordion
  And it will be closed by default (unless a promo has been applied in my bag Then it should show outside of the closed accordion)

@manual @DBMTE-389
Scenario: Payment Page - sticky pay section & one promo/order summary accordion
  Given I am on tablet
  Then I will only see one order summary accordion
  And it will be expanded by default

@manual @DBMTE-362
Scenario: Navigate to Debenhams payment Page>Validate card icon for different cards after entering And removing digits
  Given I am on the payment page 
  When I enter the first 4 digits of my payment card 
  Then an icon appears on the right side of the card entry box to denote the card type entered
  When I delete more than the first four digits of the payment card 
  Then the icon disappears on the right side of the card entry box to denote the card type entered 

@manual @DBMTE-362
Scenario: Navigate to Debenhams payment Page>Validate payment page section And 3 card And new And saved billing address
  When I am on the Payment page 'Pay with a credit or debit card' section
  Then I can only see 3 card icons above the Card number field - Mastercard, visa, Maestro
  When I am try to pay with a new credit or debit card
  Then only mastercard, visa, or maestro will be accepted

@manual @DBMTE-362
Scenario: Navigate to Debenhams payment Page>Validate saved cards,changecard>validate icons And saved billing address
  Given I am on the Pay with a Credit, Debit And I have saved card(s)
  When I navigate to view my cards
  Then it should be displayed to me in a radio button (single saved card) or drop down (multiple saved cards)
  And my saved card(s) should be presented with four (****) asterisk
  And the saved Credit Card should reflect the correct saved billing address
  And upon changing the card(s), the icons must update (visa/Mastercard etc) 

@manual @DBMTE-362
Scenario: Navigate to Debenhams payment Page>Validate expiry cards
  Given THAT I have a saved expired card
  Then it should show me a functionality to Remove 
  And if I remove it should erase my saved card from both the Pay section And My Payment Cards (in My Account) 

@manual @DBMTE-362
Scenario: Validate save my card functionality
  Given I am on the credit card container
  And I have entered new card details
  When I tick the save card details checbox
  Then When I complete the purchase Then card details will be saved my my account - my payment cards

@manual @DBMTE-358
Scenario: Pay with a Credit, Debit or Store Card (Billing Address section)
  Given that I am on a site that is not the UK or ROI e.g. China or Germany
  When I enter my billing address
  Then I will see country specific address fields, layout and behaviour (mandatory vs optional) (as per desktop)
  And the country I'm in selected as default in the country field
  And no QAS postcode look up
  And no BFPO link

@manual @DBMTE-341
Scenario: validate pay with gift card container
  Given I am on an international site (not UK or ROI)
  When I am on the payment page
  Then I CANNOT see the pay with gift card container (only paypal or credit/debit)
  