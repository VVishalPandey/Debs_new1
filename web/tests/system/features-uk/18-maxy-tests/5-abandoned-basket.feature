Feature: Test Debenhams Abandoned basket montenate test

@DEBD-3834  @manual
Scenario: Validate that a returning guest/registered user with abandoned basket having 0 product does not get the abandoned basket popup on any page

@DEBD-3834  @manual
Scenario: Validate that a returning guest/registered user with abandoned basket having 1 product does get the abandoned basket popup on any page

@DEBD-3834  @manual
Scenario: Validate that a returning guest/registered user with abandoned basket having 2 product does get the abandoned basket popup on Home page

@DEBD-3834  @manual
Scenario: Validate that a returning guest/registered user with abandoned basket having 2 product does get the abandoned basket popup on Content(Sale,Style debrief, Chanel) page

@DEBD-3834  @manual
Scenario: Validate that a returning guest/registered user with abandoned basket having 2 product does get the abandoned basket popup on TCAT(Women, Lingerie) page

@DEBD-3834  @manual
Scenario: Validate that a returning guest/registered user with abandoned basket having 2 product does get the abandoned basket popup on PSP(Maxi dress, Seach PSP,Google link, PLP, 0 PSP, Kat von D,Lipstick) page

@DEBD-3834  @manual
Scenario: Validate that abandoned basket popup is displayed on either of pages(Home, TCAT, Content or PSP page) after every 30 min. of inactive session for guest/registered with existing basket count 2 or greater

@DEBD-3834  @manual
Scenario: Validate that abandoned basket popup is displayed on either of pages(Home, TCAT, Content or PSP page) when reopening the closed browser or tab for guest/registered with existing basket count 2 or greater

@DEBD-3834  @manual
Scenario: Validate that abandoned basket popup is not displayed on checkout,PDP and My Account, My bag, MSI, Beauty club, Store finder,Session Timeout pages for guest/registered with existing basket count 2 or greater

@DEBD-3834  @manual
Scenario: Validate that abandoned basket popup is not displayed for the guest/registered user with existing basket count 2 or greater landing on PDP, Storefinder, My Bag page and then navigating to Home or PSP page

@DEBD-3834  @manual
Scenario: Validate that abandoned basket popup is not displayed for the guest/registered user with existing basket count 2 if it is already dismissed/closed/Naviagted to My bag/click outside during that session

@DEBD-3833  @manual
Scenario: Validate that variant 1 abandoned basket popup for the guest/registered user with existing basket count 2
    Given I logout
    Then I should see "abandonedBasket" containing "You have items in your bag" on "commonPage"
    Then I should see "Overlay title" exist on "commonPage"
    Then I should see "close X CTA" exist on "commonPage"
    Then I should see "product image" exist on "commonPage"
    Then I should see "product title" exist on "commonPage"
    Then I should see "chosen quantity" exist on "commonPage"
    Then I should see "nowPrice" exist on "commonPage"
    Then I should see "Go to My Bag button" exist on "commonPage"
    Then I should see "Continue shopping button" exist on "commonPage"
    Then I should see products in the same order as in the miniBag

@DEBD-3833  @manual
Scenario: Validate that variant 1 abandoned basket popup displays only first 3 products from the miniBag for the guest/registered user with existing basket count greater than 3

@DEBD-3833  @manual
Scenario: Validate that variant 1 abandoned basket popup displays only 3 product from the miniBag for the guest/registered user with existing basket count as 3 with same product with different SKUs same as minibag

@DEBD-3833  @manual
Scenario: Validate that variant 1 abandoned basket popup displays only 3 product with qantity and price same as minibag of the the SKUs for the guest/registered user with existing basket count as 3 with same product with different SKUs

@DEBD-3833  @manual
Scenario: Validate that variant 2 abandoned basket popup for the guest/registered user with existing basket count 2
    Given I logout
    Then I should see "abandonedBasket" containing "Did you forget something?" on "commonPage"
    Then I should see "Overlay title" exist on "commonPage"
    Then I should see "close X CTA" exist on "commonPage"
    Then I should see "product image" exist on "commonPage"
    Then I should see "product title" exist on "commonPage"
    Then I should see "chosen quantity" exist on "commonPage"
    Then I should see "nowPrice" exist on "commonPage"
    Then I should see "Go to My Bag button" exist on "commonPage"
    Then I should see "Continue shopping button" exist on "commonPage"
    Then I should see products in the same order as in the miniBag

@DEBD-3833  @manual
Scenario: Validate that variant 2 abandoned basket popup displays only first 3 products from the miniBag for the guest/registered user with existing basket count greater than 3

@DEBD-3833  @manual
Scenario: Validate that variant 2 abandoned basket popup displays only 3 product from the miniBag for the guest/registered user with existing basket count as 3 with same product with different SKUs

@DEBD-3833  @manual
Scenario: Validate that variant 2 abandoned basket popup displays only 3 product with qantity and price same as minibag of the the SKUs for the guest/registered user with existing basket count as 3 with same product with different SKUs

@DEBD-3833  @manual
Scenario: Validate that abandoned basket popup closes and taken to My bag page when user clicks on a product on abandoned basket popup

@DEBD-3833  @manual
Scenario: Validate that abandoned basket popup closes and taken to My bag page when user clicks on View my bag button on abandoned basket popup

@DEBD-3833  @manual
Scenario: Validate that abandoned basket popup closes and remain on the landing page when user clicks on Continue shopping button on abandoned basket popup

@DEBD-3833  @manual
Scenario: Validate that abandoned basket popup closes and remain on the landing page when user clicks on close X CTA on abandoned basket popup

@DEBD-3833  @manual
Scenario: Validate that Free gift with price as Free is displayed as last on abandoned basket popup irrespective of the order it appears on the miniBag/My bag with 2 products + Free gift

@DEBD-3833  @manual
Scenario: Validate that the first Free gift in the miniBag is displayed as last with price as Free on abandoned basket popup irrespective of the order it appears on the miniBag/My bag with 2 products + 2 Free gift

@DEBD-3833  @manual
Scenario: Validate that abandoned basket popup closes and taken to My bag page when user clicks on free gift on abandoned basket popup

@DEBD-3833  @manual
Scenario: Validate that Free gift is not displayed on abandoned basket popup  with miniBag/My bag with 3 products + Free gift

@DEBD-3833  @manual
Scenario: Validate that for a 3 for 2 product the actual price should be displayed not the discounted price is displayed on abandoned basket popup

@DEBD-3833  @manual
Scenario: Validate if a product is OOS then in abandoned basket popup we should not see OOS but see all the details as rest of the products in the popup

@DEBD-3833  @manual
Scenario: Validate if a product is OOS then when user click on the product in abandoned basket popup then abandoned basket popup closes and user taken to My bag page with the OOS message on My bag for the product

@DEBD-3833  @manual
Scenario: Validate if a product is Low stock then in abandoned basket popup we should not see Low stock messaging but see all the details as rest of the products in the popup

@DEBD-3833  @manual
Scenario: Validate if a product is Low stock then when user click on the product in abandoned basket popup then abandoned basket popup closes and user taken to My bag page with the Low stock message on My bag for the product

@DEBD-3833  @manual
Scenario: Validate that updated price for the product should be displayed on abandoned basket popup for the respective session

@DEBD-3833  @manual
Scenario: Validate that the applied promocode is displayed on My bag page when user clicks on View my bag button on abandoned basket popup