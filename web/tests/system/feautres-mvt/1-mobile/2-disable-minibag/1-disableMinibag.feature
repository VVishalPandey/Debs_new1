Feature: Validate that Mini Bag is not shown on tapping the Bag icon on Mobile.

@manual @DEBD-3882
Scenario: Validate that the My Bag is shown when the customer adds a product to the basket and taps on Bag icon.
  Given the user is logged in
  When the user adds products to the basket
  And the user validates the product count on the Mini bag icon
  And the user taps on the Mini bag icon
  Then the user is taken to the My Bag page

@manual @DEBD-3882
Scenario: Validate that the My Bag is shown when the customer taps on Bag icon.
  Given the user is logged in
  When the user doesnt add any item to the basket
  And the user validates the product count on the Mini bag icon
  And the user taps on the Mini bag icon
  Then the user is taken to the My Bag page

@manual @DEBD-3882
Scenario: Validate that the My Bag is shown when the customer taps on 'View basket & checkout' CTA.
  Given the user is logged in
  When the user adds products to the basket from PDP page
  And the user taps on View basket & checkout CTA from ATB notification
  And the user validates the product count on the Mini bag icon
  Then the user is taken to the My Bag page

@manual @DEBD-3882 @regression
Scenario: Validate that the My Bag is shown when the customer taps on bag icon on Tablet
  Given the user is logged in
  When the user adds products to the basket
  And the user validates the product count on the Mini bag icon
  And the user taps on the Mini bag icon
  Then the user is taken to the My Bag page

@manual @DEBD-3882 @regression
Scenario: Validate that the My Bag is shown when the customer taps on bag icon on Desktop
  Given the user is logged in
  When the user adds products to the basket
  And the user validates the product count on the Mini bag icon
  And the user taps on the Mini bag icon
  Then the user is taken to the My Bag page

  @manual @DEBD-3882
Scenario: Validate that the My Bag is shown when the customer adds a product to the basket and taps on Bag icon without login.
  Given the user is not logged in
  When the user adds products to the basket
  And the user validates the product count on the Mini bag icon
  And the user taps on the Mini bag icon
  Then the user is taken to the My Bag page

@manual @DEBD-3882
Scenario: Validate that the My Bag is shown when the customer taps on Bag icon without login.
  Given the user is not logged in
  When the user doesnt add any item to the basket
  And the user validates the product count on the Mini bag icon
  And the user taps on the Mini bag icon
  Then the user is taken to the My Bag page

  @manual @DEBD-3882
Scenario: Validate that the My Bag is shown when the customer taps on Bag icon when session timesout on PDP page.
  Given the user is not logged in
  When the user adds products to the basket
  And the user waits for the session to timeout on PDP
  And the user taps on the Mini bag icon
  Then the user is taken to the My Bag page