Feature: Validation of the redeem giftcard on the Payment Page on Mobile-UK

@manual @DBNHST-1785
Scenario: Validation of the redeem giftcard drawer on the payment page on the Mobile-UK
  Given the user is logged in
  And the user adds products to the basket
  And the user navigates to the Payment Page
  When the user press the redeem giftcard on the Payment page
  Then the drawer with the redeem giftcard page should be opened
  And the user should be see the following on the Giftcard page drawer

  Fields                 | Type
  redeem gift card       | Header
  close                  | CTA
  gift card number input | Text Box
  PIN                    | Text Box
  Available balance      | Text
  good to know copy      | Label
  redeem gift card       | CTA


@manual @DBNHST-1785
Scenario: Validation of the close button on the Giftcard drawer on the payment page on the Mobile-UK
  Given the user is logged in
  And the user adds products to the basket
  And the user navigates to the Payment Page
  When the user press the the redeem giftcard on the Payment page
  And the drawer with the redeem giftcard page should be opened
  When the user press the close button
  Then the drawer should get closed
  And user should see the payment page

@manual @DBNHST-1785
Scenario: Validation of the Balance loader call for the available balance on the redeem gift card page drawer on the Mobile-UK
  Given the user is logged in
  And the user adds products to the basket
  And the user navigates to the Payment Page
  When the user press the the redeem giftcard on the Payment page
  And the drawer with the redeem giftcard page should be opened
  And the user enters the valid giftcard number and PIN
  Then the user should view the balance loader for the available balance

@manual @DBNHST-1785
Scenario: Validation of the insufficient cards funds error on the redeem gift card page drawer on the Mobile-UK
  Given the user is logged in
  And the user adds products to the basket
  And the user navigates to the Payment Page
  When the user press the the redeem giftcard on the Payment page
  And the drawer with the redeem giftcard page should be opened
  And the user enters the valid giftcard number and PIN
  And balance of the card does not cover the remaining total to pay
  Then the user should view insufficient funds error


@manual @DBNHST-1785
Scenario: Validation of the redeem giftcard CTA on the redeem gift card page drawer on the Mobile-UK
  Given the user is logged in
  And the user adds products to the basket
  And the user navigates to the Payment Page
  When the user press the the redeem giftcard on the Payment page
  And the drawer with the redeem giftcard page should be opened
  And the user enters the valid giftcard number and PIN
  And the user views the available balance
  Then the redeem gift card CTA will turn from grey to orange
  And should become clickable

@manual @DBNHST-1785
Scenario: Validation of the redeem giftcard  on the redeem gift card page drawer on the Mobile-UK
  Given the user is logged in
  And the user adds products to the basket
  And the user navigates to the Payment Page
  When the user press the the redeem giftcard on the Payment page
  And the drawer with the redeem giftcard page should be opened
  And the user enters the valid giftcard number and PIN
  And the user press the redeem giftcard CTA on the drawer
  Then the user should view the spinner in the CTA
  And a tick
  And the drawer should be closed
  And user should view the Payment page

@manual @DBNHST-1785
Scenario: Validation of the apply code on the payment page on the Mobile-UK
  Given the user is logged in
  And the products added to the basket page
  And the user navigates to the Payment Page
  And the user press the apply Giftcard on the Payment page
  And the drawer with the Giftcard page should be opened
  When the user enter the valid Giftcard
  And press the apply code CTA
  Then user should see a spinner in the CTA
  And a tick
  And the drawer should close
  And user should see the payment page

@manual @DBNHST-1785
Scenario: Validation of the Price updation on the payment page on the Mobile-UK
  Given the user is logged in
  And the products added to the basket page
  And the user navigates to the Payment Page
  When the user applied a valid Giftcard on the payment page
  Then the user should see the Giftcard applied in a banner
  And the user should see the Total to Pay under the banner
  And the updated total price in the order summary
  And the updated gift card amount in the order summary


@manual @DBNHST-1785
Scenario: Validation of the Giftcard banner on the payment page on the Mobile-UK
  Given the user is logged in
  And the products added to the basket page
  And the user navigates to the Payment Page
  When the user applied a valid Giftcard on the payment page
  Then the user should see the banner on the payment page
  And the user should see the "Giftcard" applied on the banner
  And the user should see "Last 4 digits of gift card", "giftcard value", "trash can" on the banner


@manual @DBNHST-1785
Scenario: Validation of the more than one Giftcards applied on the payment page on the Mobile-UK
  Given the user is logged in
  And the products added to the basket page
  And the user navigates to the Payment Page
  When the user applied more than one valid Giftcards on the payment page
  Then the user should see all the applied Giftcards on banner on the payment page

@manual @DBNHST-1785
Scenario: Validation of the Giftcard balance on the banner on the payment page on the Mobile-UK
  Given the user is logged in
  And the products added to the basket page
  And the user navigates to the Payment Page
  When the user applied a valid Giftcard on the payment page
  And the user should see the banner on the payment page
  And the user should see the "Giftcard" applied on the banner
  And the remaining balance on the giftcard should display within the giftcard banner

@manual @DBNHST-1785
Scenario: Validation of the error on the redeem Giftcard drawer for the multiple giftcards applied on the Mobile-UK
  Given the user is logged in
  And the products added to the basket page
  And the user navigates to the Payment Page
  And the user applied two valid Giftcards on the payment page
  And the user should see the applied Giftcards on banner on the payment page
  When the user press the redeem giftcard for the third time
  Then the redeem gift card drawer should open
  And the user should view the error message: 'You've reached the limit for number of gift cards applied to an order. If you wish to use more, please contact the call centre.'

@manual @DBNHST-1786
Scenario: Validation of the removal of the applied Giftcard on the Payment Page
  Given the user is logged in
  And the user adds products to the basket
  And apply the valid Giftcard on the basket page
  And the user navigates to the Payment Page
  And the user should view the applied Giftcard
  When the user press the trash
  Then the user should view the removing transtion loader for the Trash icon
  And the Giftcard with the banner should be removed
  And the user should view the successfully removed notification on the top of the payment page


Scenario: Validation of the Price updation on the removal of the applied Giftcard on the Payment Page
  Given the user is logged in
  And the user adds products to the basket
  And apply the valid Giftcard on the basket page
  And the user navigates to the Payment Page
  And the user should view the applied Giftcard
  When the user press the trash
  Then the Giftcard with the banner should be removed
  And the user should view the updated Total to Pay balance

@manual @DBNHST-1786
Scenario: Validation of the removal of the multiple applied Giftcard on the Payment Page
  Given the user is logged in
  And the user adds products to the basket
  And the user navigates to the Payment Page
  And the user applied the multiple giftcards on the Payment page
  And the user should view all the applied giftcards
  When the user press the trash icon for the giftcards
  Then the Giftcards with the banner should be removed
  And the Price should be displayed as updated

@manual @DBNHST-1785
Scenario: Validation of the error on the redeem giftcard drawer when applying with a valid giftcard number but invalid pin on the Mobile-UK
  Given the user is logged in
  And the user adds products to the basket
  And the user navigates to the Payment Page
  When the user press the the redeem giftcard on the Payment page
  And the drawer with the redeem giftcard page should be opened
  And the user enters the valid giftcard number
  And user enters the invalid PIN
  And the user press the redeem giftcard CTA on the drawer
  Then the user should view the error on the drawer page



@manual @DBNHST-1785
Scenario: Validation of the error on the redeem giftcard drawer when applying with a invalid giftcard number but valid pin on the Mobile-UK
  Given the user is logged in
  And the user adds products to the basket
  And the user navigates to the Payment Page
  When the user press the the redeem giftcard on the Payment page
  And the drawer with the redeem giftcard page should be opened
  And the user enters the invalid giftcard number
  And user enters the valid PIN
  And the user press the redeem giftcard CTA on the drawer
  Then the user should view the error on the drawer page

@manual @DBNHST-1785
Scenario: Validation of the error on the redeem giftcard drawer when applying with a invalid giftcard number with invalid pin on the Mobile-UK
  Given the user is logged in
  And the user adds products to the basket
  And the user navigates to the Payment Page
  When the user press the the redeem giftcard on the Payment page
  And the drawer with the redeem giftcard page should be opened
  And the user enters the invalid giftcard number
  And user enters the invalid PIN
  And the user press the redeem giftcard CTA on the drawer
  Then the user should view the error on the drawer page

@manual @DBNHST-1785
Scenario: Validation of the redeem giftcard CTA on the redeem gift card page drawer when the user leaves blank giftcard/PIN on the Mobile-UK
  Given the user is logged in
  And the user adds products to the basket
  And the user navigates to the Payment Page
  When the user press the the redeem giftcard on the Payment page
  And the drawer with the redeem giftcard page should be opened
  And the user leaves blank the giftcard number and PIN
  Then the redeem gift card CTA should be greyed out
  And shouldnot be clickable

@manual @DBNHST-1785
Scenario: Validation of the credit card section incase the whole amount is redeemed by the giftcard on the Payment page on mobile-uk
  Given the user is logged in
  And the user adds products to the basket
  And the user navigates to the Payment Page
  When the user applied the giftcard on the Payment page
  And the total amount is paid by the giftcard on the Payment Page
  Then the credit card section should be greyed out and disabled
  And the Place order and Pay button should become enabled
