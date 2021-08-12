Feature: Validate new Tablet header - SFL heart

@manual @DDAI-967
Scenario: Validate header on home page as registered user(portrait)
  Given I am on any page (not delivery or payment pages) 
  Then I should see the following CTAs in the header (order of left to right): hamburger menu ,search icon ,Debenhams logo ,SFL heart icon ,Mini bag icon

@manual @DDAI-967
Scenario: Validate header on dress psp page as guest user(portrait)
  Given I am on any page (not delivery or payment pages) 
  Then I should see the following CTAs in the header (order of left to right): hamburger menu ,search icon ,Debenhams logo ,SFL heart icon ,Mini bag icon

@manual @DDAI-967 
Scenario Outline: Validate header on PSP page (portrait)
  Given I am on <PSP> page  
  Then I should see the following CTAs in the header (order of left to right): search bar ,Debenhams logo ,SFL heart icon with border ,Mini bag icon with border

  Examples:
    | PSP                         |
    | Standard PSP (small images) |
    | Standard PSP (large images) |
    | Enhanced PSP                |
    | Simple pick list            |
    | Brand room                  |

@manual @DDAI-967  
Scenario Outline: Validate header on TCAT page(portrait)
  Given I am on <TCAT> page  
  Then I should see the following CTAs in the header (order of left to right): search bar ,Debenhams logo ,SFL heart icon with border ,Mini bag icon with border

  Examples:
    | TCAT      |
    | Dresses   |
    | Furniture |

@manual @DDAI-967 
Scenario: Validate header on order confirmation page(portrait) 
  Given I am on order confirmation page  
  Then I should see the following CTAs in the header (order of left to right): search bar ,Debenhams logo ,SFL heart icon with border ,Mini bag icon with border

@manual @DDAI-967
Scenario: Validate header on home page as registered user(landscape)
  Given I am on any page (not delivery or payment pages) 
  Then I should see the following CTAs in the header (order of left to right): search bar ,Debenhams logo ,SFL heart icon with border ,Mini bag icon with border

@manual @DDAI-967
Scenario: Validate header on dress psp page as guest user(landscape)
  Given I am on any page (not delivery or payment pages) 
  Then I should see the following CTAs in the header (order of left to right): search bar ,Debenhams logo ,SFL heart icon with border ,Mini bag icon with border

@manual @DDAI-967  
Scenario Outline: Validate header on PSP page (landscape)
  Given I am on <PSP> page  
  Then I should see the following CTAs in the header (order of left to right): search bar ,Debenhams logo ,SFL heart icon with border ,Mini bag icon with border

  Examples:
    | PSP                         |
    | Standard PSP (small images) |
    | Standard PSP (large images) |
    | Enhanced PSP                |
    | Simple pick list            |
    | Brand room                  |

@manual @DDAI-967  
Scenario Outline: Validate header on TCAT page(landscape)
  Given I am on <TCAT> page  
  Then I should see the following CTAs in the header (order of left to right): search bar ,Debenhams logo ,SFL heart icon with border ,Mini bag icon with border

  Examples:
    | TCAT      |
    | Dresses   |
    | Furniture |

@manual @DDAI-967 
Scenario: Validate header on order confirmation page(landscape) 
  Given I am on order confirmation page  
  Then I should see the following CTAs in the header (order of left to right): search bar ,Debenhams logo ,SFL heart icon with border ,Mini bag icon with border


@manual @DDAI-967
Scenario: Validate SFL in the header with no items (both)
  Given I have no items SFL 
  Then I should see SFL heart as transparent with a grey border

@manual @DDAI-967
Scenario: Validate SFL in the header with 1 item already added as registered user (both)
  Given I logged in
  And I have 1 product in SFL
  Then I should see the heart as pink 
  And I should see count of products, 1 in this case   

@manual @DDAI-967
Scenario: Validate SFL in the header with 0 item and add product from PSP (both)
  Given I have 0 product in SFL 
  When I save a product from PSP 
  Then I should see the heart as pink 
  And I should see count of products, 1 in this case

@manual @DDAI-967
Scenario: Validate SFL in the header with 0 item and add product from PDP (both)
  Given I have 0 product in SFL 
  When I save a product from PDP 
  Then I should see the heart as pink 
  And I should see count of products, 1 in this case   

@manual @DDAI-967
Scenario: Validate SFL in the header with 0 item and add product from My Bag (both)
  Given I have 0 product in SFL 
  When I save a product from My Bag 
  Then I should see the heart as pink 
  And I should see count of products, 1 in this case
  When I add one more item in SFL 
  And I should see count of products, 2 in this case
  When I remove one item from SFL on my bag, item count should get update 


@manual @DDAI-967 
Scenario: Validate SFL count increase in the header with 1 item already added (both)
  Given I have one product in SFL 
  When I save one more product PSP, PDP or my bag 
  Then I should see the heart as pink
  Then I should see the SLF heart count should increase
  And I should see count of products, 2 in this case

@manual @DDAI-967
Scenario: Validate SFL count  decrease in the header with two item already added (both)
  Given I have two product in SFL 
  When I remove one productfrom SFL
  Then I should see the heart as pink
  Then I should see the SLF heart count should decrase
  And I should see count of products, 1 in this case
  When I remove last product from SFL
  Then I should see the heart turns back to transparent with a grey border
  And I should not see any count of products in SFL

@manual @DDAI-967
Scenario: Validate SFL count on my bag page decrease in the header with two item already added (both)
  Given I have two product in SFL 
  When I remove one productfrom SFL
  Then I should see the heart as pink
  Then I should see the SLF heart count should decrase
  And I should see count of products, 1 in this case
  When I remove last product from SFL
  Then I should see the heart turns back to transparent with a grey border
  And I should not see any count of products in SFL


@manual @DDAI-967
Scenario: Validate SFL page after clicking on heart icon from header if SFL is empty (both)
  Given I am on any page 
  And I have no products added in my SFL 
  When I click on the SFL heart in the header 
  Then I should be taken to the SFL page
  And I should see empty SFL page with continue shopping button

@manual @DDAI-967
Scenario: Validate SFL page after clicking on heart icon from header if user have some products already added (both)
  Given I am on any page 
  And I have two products already added in my SFL 
  When I click on the SFL heart in the header 
  Then I should be taken to the SFL page
  And I should see both products in SFL page

@manual @DDAI-967
Scenario: Validate SFL products merge after login , if guest user saved something in SFL and then login (both)
  Given I am on any page as guest user 
  And I added 2 products SFL
  When I log in as already registered user  
  And  I have 1 item already added SFL 
  Then I should see my SFL merged 
  And I should see 3 products in SFL page, both which I had in guest user SFL and Registered user's SFL
  Then I should be taken to the SFL page
  And I should see 3 products in SFL page

@manual @DDAI-967
Scenario: Validate SFL products merge after login , if guest user saved something in SFL and then login from checkout page (both)
  Given I am on any page as guest user 
  And I added 2 products SFL
  When I log in as already registered user from checkout login page
  And  I have 1 item already added SFL 
  Then I should see my SFL merged 
  And I should see 3 products in SFL page, both which I had in guest user SFL and Registered user's SFL
  Then I should be taken to the SFL page
  And I should see 3 products in SFL page   

@manual @DDAI-967
Scenario: Validate SFL products merge after login , if guest user saved something in SFL and then login (both)
  Given I am on any page as guest user 
  And I added 2 products SFL
  When I closed the browser and again open site  
  And  I should see 2 items already added SFL 

@manual @DDAI-967
Scenario: Validate SFL products merge after login , if guest user saved something in SFL and then login (both)
  Given I am on any page as Registered user 
  And I added 2 products SFL
  And I logged out 
  When I logged in again
  Then I should see 2 items already added SFL

@manual @DDAI-967
Scenario: Validate SFL if registered user have large volume of products in SFL  (both)   

@manual @DDAI-967  
Scenario Outline: Validate I add products in SFL after session timeout from different pages (both)
  Given I am on <page>  
  Then I should be able to add products in SFL
  Then My SFL count should get updated accordingly  

  Examples:
    | SFL    |
    | PSP    |
    | PDP    |
    | My Bag |

@manual @DDAI-967
Scenario: Validate SFL count when changing country (both)
  Given I am on any page as Registered user 
  And I added 2 products SFL in UK, one is not available for International country i.e. Aus
  Then I change country to Aus
  Then I should see SFL count as 1
  When I click on SFL icon 
  Then I should see one product in SFL which is eligible for that country 

@manual @DEBD-2559
Scenario: Validate the Sign I icon is displayed on the header if the user is non signed in
  Given I am on the Debenhams mobile/portrait tablet site and have not signed in 
  When I look at the top nav
  Then the sign in/account icon will show 'Sign In'

@manual @DEBD-2559
Scenario: Validate that the Account icon is displayed on the header if the user is signed in
  Given I am on the Debenhams mobile/portrait tablet site and have signed in to my account
  When I look at the top nav
  Then the sign in/account icon will show 'Account'

@manual @DEBD-2559
Scenario: Validate that icons order is as per the sequence on the header
  Given I am on the Debenhams mobile/portrait tablet site (homepage, PSP, PDP and bag etc)
  When I look at the top nav
  Then I will see the following icons after the Debenhams logo in the following order: Search, Account/Sign In, Saved and Bag

@manual @DEBD-2559
Scenario: Validate that the Account or Sign in icons are not displayed on the header when the user is on checkout page
  Given I am on the Debenhams bag page on mobile/portrait tablet and select 'Go to Checkout'
  When I look at the top nav
  Then I will see a different header 'Secure Checkout' displayed in the top nave, the Debenhams logo or Search, Account, Saved and Bag logos will not be displayed

@manual @DEBD-2559
Scenario: Validate that the sign in/Create accountpage is displayed on clicking Account icon for non-signed in user 
  Given I am on the Debenhams mobile/portrait tablet site and have not previously signed in
  When I click on the 'Account' icon
  Then I will see the My Account sign in/create account page (as-is logic for the LHN sign in)

@manual @DEBD-2559
Scenario: Validate the partial login page is displayed in case of session timeout when clicking Account icon on the header 
  Given I am on the Debenhams mobile/portrait tablet site and have previously signed in
  When I click on the 'Account' icon
  Then I will see the 'Welcome Back' sign in page (as-is logic for the LHN sign in)

@manual @DEBD-2559
Scenario: Validate the My account page is displayedfor the user already logged in when clicking Account icon on the header
  Given I am on the Debenhams mobile/portrait tablet site
  When I click on the burger menu in the top nav
  Then I will see 'My Account' in the bottom section (between Offers/Blue Cross and Saved Icon) 
  And when I click on 'My Account'
  Then I will see the My Account sign in page

@manual @DEBD-2559
Scenario: Validate that the sign In icon is displayed when user is logged out from global nav
  Given I am on the Debenhams mobile/portrait tablet site
  And I have signed into my account
  When I click on the burger menu in the top nav and sign out
  Then I should be signed out of my account
  And the sign in/account icon in the top nav will show 'Sign In'
  When I click on the 'Sign In' icon in the top nav
  Then I will see the My Account sign in/create account page