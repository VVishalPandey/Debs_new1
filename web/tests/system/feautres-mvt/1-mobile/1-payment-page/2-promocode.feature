Feature: Validation of the apply Promocode on the Payment Page on Mobile-UK

@manual @DBNHST-1782
Scenario: Validation of the apply promo code drawer on the payment page on the Mobile-UK
  Given the user is logged in
  And the user adds products to the basket
  And the user navigates to the Payment Page
  When the user press the apply promocode on the Payment page
  Then the drawer with the promocode page should be opened
  And the user should be see the following on the Promocode page drawer

  Fields            | Type
  add promo code    | Header
  close             | CTA
  promo input       | text box
  good to know copy | Label
  apply code        | CTA


@manual @DBNHST-1782
Scenario: Validation of the close button on the promocode drawer on the payment page on the Mobile-UK
  Given the user is logged in
  And the user adds products to the basket
  And the user navigates to the Payment Page
  When the user press the apply promocode on the Payment page
  And the drawer with the promocode page should be opened
  When the user press the close button
  Then the drawer should get closed
  And user should see the payment page

@manual @DBNHST-1782
Scenario: Validation of the promocode format on the payment page on the Mobile-UK
  Given the user is logged in
  And the products added to the basket page
  And the user navigates to the Payment Page
  And the user press the apply promocode on the Payment page
  And the drawer with the promocode page should be opened
  When the user enter the promocode in small letters
  Then it should turned to the upper case letters in the promocode



@manual @DBNHST-1782
Scenario: Validation of the apply code on the payment page on the Mobile-UK
  Given the user is logged in
  And the products added to the basket page
  And the user navigates to the Payment Page
  And the user press the apply promocode on the Payment page
  And the drawer with the promocode page should be opened
  When the user enter the valid promocode
  And press the apply code CTA
  Then user should see a spinner in the CTA
  And a tick
  And the drawer should close
  And user should see the payment page

@manual @DBNHST-1782
Scenario: Validation of the Price updation on the payment page on the Mobile-UK
  Given the user is logged in
  And the products added to the basket page
  And the user navigates to the Payment Page
  When the user applied a valid promocode on the payment page
  Then the user should see the promocode applied in a banner
  And the user should see the Total to Pay under the banner
  And the updated total price in the order summary
  And the updated promotional discounts in the order summary


@manual @DBNHST-1782
Scenario: Validation of the Promocode banner on the payment page on the Mobile-UK
  Given the user is logged in
  And the products added to the basket page
  And the user navigates to the Payment Page
  When the user applied a valid promocode on the payment page
  Then the user should see the banner on the payment page
  And the user should see the "promocode" applied on the banner
  And the user should see "promo description", "trash can" on the banner

@manual @DBNHST-1782
Scenario: Validation of the Promocode banner on the payment page on the Mobile-UK
  Given the user is logged in
  And the products added to the basket page
  And the user navigates to the Payment Page
  When the user applied a valid promocode on the payment page
  Then the user should see the banner on the payment page
  And the user should see the "promocode","promo description", "trash can" on the banner

@manual @DBNHST-1782
Scenario: Validation of the multiple promocodes applied on the payment page on the Mobile-UK
  Given the user is logged in
  And the products added to the basket page
  And the user navigates to the Payment Page
  When the user applied multiple valid promocodes on the payment page
  Then the user should see all the applied promocode on banner on the payment page

@manual @DBNHST-1782
Scenario: Validation of the promotional autoadded Product discounts on the payment page on the Mobile-UK
  Given the user is logged in
  And the products added to the basket page
  And the promotional offer automatically appied on the product on the basket
  When the user navigates to the Payment Page
  Then the user should not see a promocode added
  And user should see the Product discounts under the price updates section

@manual @DBNHST-1783
Scenario: Validation of the promo code error on the payment page on the Mobile-UK
  Given the user is logged in
  And the products added to the basket page
  And the user navigates to the Payment Page
  And the user press the apply promocode on the Payment page
  And the drawer with the promocode page should be opened
  When the user enter the invalid promocode
  And the user press the apply code
  Then the user should see the field with a red border
  And the error message should come below the box
  And the Input field should be blanked out

@manual @DBNHST-1783
Scenario: Validation of the promo code error on the payment page incase the user apply the duplicate promocode on the Mobile-UK
  Given the user is logged in
  And the products added to the basket page
  And the user navigates to the Payment Page
  And the user press the apply promocode on the Payment page
  And the drawer with the promocode page should be opened
  When the user enter the already applied promocode
  And the user press the apply code
  Then the user should see the field with a red border
  And the error message should come below the box
  And the Input field should be blanked out

@manual @DBNHST-1783
Scenario: Validation of the promo code error on the payment page incase the user apply the valid promocode with blank spaces on the Mobile-UK
  Given the user is logged in
  And the products added to the basket page
  And the user navigates to the Payment Page
  And the user press the apply promocode on the Payment page
  And the drawer with the promocode page should be opened
  When the user enter the valid promocode with spaces
  And the user press the apply code
  Then the user should see the field with a red border
  And the error message should come below the box
  And the Input field should be blanked out

@manual @DBNHST-1784
Scenario: Validation of the Price updation on the removal of the applied Promocode on the Payment Page
  Given the user is logged in
  And the user adds products to the basket
  And apply the valid promocode on the basket page
  And the user navigates to the Payment Page
  And the user should view the applied promocode
  When the user press the trash
  Then the Promocode with the banner should be removed
  And the Total Price should be updated
  And the Promotional discount price should also be updated

@manual @DBNHST-1784
Scenario: Validation of the removal of the multiple applied Promocodes on the Payment Page
  Given the user is logged in
  And the user adds products to the basket
  And the user navigates to the Payment Page
  And the user applied the multiple promocodes on the Payment page
  And the user should view all the applied promocodes
  When the user press the trash icon for the promocodes
  Then the Promocodes with the banner should be removed

@manual @DBNHST-1784
Scenario: Validation of the Promocodes displaying successfully on the payment when user applied Promocodes on the basket
  Given the user is logged in
  And the user adds products to the basket
  When the user applied the Promocodes on the Basket
  And the user views the applied promocode and updated price on the basket page
  And the user navigates to the Payment Page
  Then the user should view the applied Promocodes successfully on the payment page
  And the user should see the "promocode","promo description", "trash can" on the promotional banner


@manual @DBNHST-1784
Scenario: Validation of the One time Promocodes displaying successfully on the payment when user applied One Time Promocodes on the basket
  Given the user is logged in
  And the user adds products to the basket
  When the user applied the One Time Promocodes on the Basket
  And the user views the applied promocode and updated price on the basket page
  And the user navigates to the Payment Page
  Then the user should view the applied Promocodes successfully on the payment page
  And the user should see the "promocode","promo description", "trash can" on the promotional banner


@manual @DBNHST-1784
Scenario: Validation of the One time Promocodes getting applied successfully on the payment
  Given the user is logged in
  And the user adds products to the basket
  When the user navigates to the Payment Page
  Then the user should view the one time Promocodes applied successfully on the payment page
  And the user should see the "promocode","promo description", "trash can" on the promotional banner

@manual @DBNHST-1784
Scenario: Validation of the Promocode applied with the Temporary card applied on the Payment section
  Given the user is logged in
  And the user adds products to the basket
  When the user navigates to the Payment Page
  And the user applied the promocode on the payment page
  And the user views the message "Please use temporary card details "
  And the user add the particular temporary card under the credit card section
  Then the user should view  code and discount applied automatically on the Payment Page
