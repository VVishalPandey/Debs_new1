Feature: Validate Debenhams PDP page

@manual @DBMTE-377
Scenario: Validate different components on PDP Page
  Given I am on a PDP
  Then I should see Product title,Product infomation,Price - %off, was, then, now

@manual @DBMTE-377
Scenario: Validate currency symbol on PDP Page
  Given I am on a PDP
  Then I should see prices in local currency according to what country is selected on the country selector
  And  I should see the Euro symbol comes after the price value, for some countries e.g. France

@manual @DBMTE-339
Scenario: Navigate to dress pdp page and validate product desction and delivery returns accordions exist on page with name
  Given I navigate to "testDressPdpURL"
  Then I should see "prodDescAccordion" exist on "pdpPage"
  And I should see "deliveryReturnAccordion" exist on "pdpPage"
  And I should see "prodDescAccordion" as "Product Description" on "pdpPage"
  And I should see "deliveryReturnAccordion" as "Delivery / Returns" on "pdpPage"

@manual @DBMTE-339
Scenario: Navigate to dress pdp page from above scenario and validate the text inside product desction and delivery returns accordion from desktop
  Then I should validate text inside product description from desktop
  And I should validate text inside Delivery / Returns from desktop

@manual @DBNHST-339
Scenario: Navigate to PDP page and validate that the product reviews are displayed
  Then I should see "reviewsAccordion" exist on "pdpPage"
  And I should see "reviewSortDropdown" exist on "pdpPage"

@manual @DBNHST-378
Scenario: Navigate to PDP page and validate that x date countdown is not displayed
  Then I should not see "countdownTimer" exist on "pdpPage"

@manual @DBNHST-345
Scenario: Navigate to PDP page and validate that the loyalty points(beauty card, debenhams card and reward card points) are not displayed
  Then I should not see "loyaltyCardPoints" exist on "pdpPage"

@manual @DBNHST-343
Scenario: Navigate to Debenhams and validate that the suit and luggage bundles PDP page are not displayed

@manual @DBNHST-343
Scenario: Navigate to Debenhams and validate that the beauty products PDP page are not displayed

@manual @DBNHST-343
Scenario: Navigate to Debenhams and validate that the furnitures PDP page are not displayed

@manual @DBNHST-343
Scenario: Navigate to Debenhams and validate that the electrical products PDP page are not displayed

@manual @DBNHST-376
Scenario: Navigate to Debenhams PDP page and validate that Sizes should be in local country sizes

@manual @DBNHST-376
Scenario: Navigate to Debenhams PDP page and validate that different Sizes size selector button for different countries

@manual @DBNHST-376
Scenario: Navigate to Debenhams PDP page and validate that out of out message is displayed on selecting out of stock size

@manual @DBMTE-344
Scenario: Validate that round robin/cross sell are hiden on the PDP page

@manual  @DEBD-350
Scenario: Validate that the user should be able to see the cuser generated content like videos, photos etc
    Given I navigate to "pdpPage"
    Then I should see the user generated content"customerPhotosContainer"
    And I should see the container title  as "Customer Photos"
    And I shoould see the container ID to be changed from 'bv-carousel' to 'bv-carousel-uddebenhams'

@notAutomated  @DEBD-350
Scenario: Validate that the user should not be able to see the cuser generated content like videos, photos etc on Chanel PDPs
    Given I navigate to "ChanelpdpPage"
    Then I should not see the user generated content"customerPhotosContainer"

@notAutomated  @DEBD-350
Scenario: Validate that the user should not be able to see the cuser generated content like videos, photos etc on bundles PDPs
    Given I navigate to "bundlepdpPage"
    Then I should not see the user generated content"customerPhotosContainer"

@notAutomated @DEBD-2267
Scenario Outline: Validate that size dropdown is displayed on all PDP pages which have size selector
  Given I logout
  # Then I navigate to "<PDPurl>"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Then I should see "searchIcon" exist on "commonPage"
  When I click on "searchIcon" on "commonPage"
  And I enter "<Products>" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  When I click on "firstProductImage" on "pspPage"
  And I should not see "sizeSwatches" on "pdpPage"
  And I should see "sizeDropdownOptionElements" exist on "pdpPage"
  Then I select available size and add to bag on pdpPage


  Examples:
  | Products    |
  |Phase Eight |
  |Coast |
  |Dorothy Perkins |
  |Quiz |
  |Wallis |
  |Debut |
  |Jenny Packham |
  |Mantaray |
  |RedHerring |
  |The Collection |
  |Star by Julien Macdonald |
  |Dress Studio by Preen |
  |Nine by Savannah Miller |
  |Knickers |
  |Nightwear |
  |Jeans |
  |Shoes |

@manual @DEBD-2488
Scenario Outline: Valiadte the Global Delivery Banner is not displayed on PDP page in landscape mode
  Given I navigate to "homeURL"
  Then I verify "href" of "standardDelivery" as "standardDeliveryLink" on "commonPage"
  Then I verify "href" of "nextDayClickCollectDelivery" as "nextDayClickCollectDeliveryLink" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I navigate to "<PspPages>"
  Then I verify "href" of "standardDelivery" as "standardDeliveryLink" on "commonPage"
  Then I verify "href" of "nextDayClickCollectDelivery" as "nextDayClickCollectDeliveryLink" on "commonPage"
  When I click on "firstProductImage" on "pspPage"
  And I should not see "standardDelivery" on "commonPage"
  And I should not see "nextDayClickCollectDelivery" on "commonPage"

  Examples:
  | PspPages   |
  |Women dresses |
  |Chanel |
  |WomenTCAT |
  |Lingerie TCAT |
  |Bras |
  |Mens Jeans |
  |Mens TCAT |
  |Kids dresses |
  |Cooffe Machine |
  |Search -hats|

@automated @Fixed @DEBD-2428
Scenario Outline: Valiadte the selected colour swatch is highlighted in Green except Chanel
  Given I navigate to "homeURL"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I navigate to "<Products>"
  Then I select available size and add to bag on pdpPage
  Then I should verify "border-top-color" of "pdpSelectedSwatch" as "pdpSelectedBorderSwatchColor" on "pdpPage"

  Examples:
  | Products    |
  |braUrl |
  |pdpKnitWearProduct |

@manual @DEBD-2428
Scenario: Validate the low stock message displayed next to colour selected
  Given I am on a non beauty PDP (eg lingere/knitwear)
  When I select a colour swatch that has low stock availability
  Then the (low in stock) message will display next to the colour selected
  And the hurry less the X left message will appear underneath the swatches

@manual @DEBD-2428
Scenario: Validate the out of stock message displayed next to colour selected
Given I am on a non beauty PDP (eg lingere/knitwear)
When I select a colour swatch is out of stock
Then the (out of stock) message will display next to the colour selected
And the hurry less the Sorry - this item is currently out of stock message will appear underneath the swatches
And the size container (where applicable) will have a red border

@manual @DEBD-2428
Scenario: Validate the colour name is displayed on mouse hover on desktop
Given I am on a PDP
When I hoover the mouse over the colour swatches
Then the colour name will display

@manual @DEBD-2429
Scenario: Validate the prompt text is displayed when in view if size selector
  Given I am on a PDP
  When I view the size selector container
  Then the prompt text will read "Select a size"

@manual @DEBD-2429
Scenario: Validate the selected size is displayed within size selector container
  Given I have selected a size
  Then I will see the size within the size selector container

@manual @DEBD-2429
Scenario: Validate the OOS error message is displayed underneath the size container
  Given I am on a PDP
  When I select a size that is out of stock
  Then I will see the "Sorry this item is currently out of stock" underneath the size container
  And against the selected colour
  And the size will have a grey strikethrough
  And the size container will have a red border
  And a white cross inside the swatch

@manual @DEBD-2429
Scenario: Validate the low stock message is displayed underneath the size container
  Given I am on a PDP
  When I select a size that is low in stock
  Then I will see "hurry less than x left" underneath the size container
  And against the selected colour within the colour drop down


@manual @DEBD-2429
Scenario: Validate the size guide will sit underneath the size container for mobile and tablet
  Given I am on a mobile or tablet PDP
  Then the size guide will sit underneath the size container

@manual @DEBD-2504
Scenario: Validate the ATB button and quanitity selector are displayed inline
Given I AM on a PDP
Then the ATB button and quanitity selector will be inline

@manual @DEBD-2504
Scenario: Validate the save for later icon will be positioned inline with the Brand
Given I AM on a PDP
Then the save for later icon will be positioned inline with the Brand and Product Title


@manual @DEBD-2360
Scenario: Validate the size and location of Product Brand and Title on PDP
Given I am on a PDP
Then It will be above the product title
And have a reduced font size e.g."Mantaray Blue pattern dress"

@manual @DEBD-2360
Scenario: Validate the new Product description link on the PDP
Given I am on a PDP
When I view the product description link
Then I will see a new{color} icon to the left of the product description CTA
When I click on "productDescriptionLink" the "pdpPage"
Then I should be on the Product description link area on the page


@manual @DEBD-2360
Scenario: Validate the product reviews location in the PDP
Given I am on a PDP
When it has product reviews
Then I will see the review stars and rating underneath the product title
When I click on the review stars or review rating
Then It will anchor me down to the reviews section

@manual @DEBD-2360
Scenario: Validate price per ml for beauty/alochol products under the product price
Given I navigate to "alocholPdp"
Then I should see "priceperml" underneath the product price
