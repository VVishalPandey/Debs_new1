Feature: Test Debenhams Beauty PDP page

@automated @PDP @DEBD-531
Scenario: Verify the colour accordion for beauty product with 13 or more colour swatches
  Given I navigate to "beautyPDPWithMoreSwatches"
  Then I should see "pddpColourSwatches" exist on "pdpPage"
  And I count number of "pddpColourSwatches" greater than "13" on "pdpPage"
  And I should see "showmoreColorsButton" exist on "pdpPage"
  And I should see "showmoreColorsButton" containing "Show more colours" on "pdpPage"
  When I click on "showmoreColorsButton" on "pdpPage"
  Then I should see "showmoreColorsButton" containing "Show less colours" on "pdpPage"
  When I click on "showmoreColorsButton" on "pdpPage"
  Then I should see "showmoreColorsButton" containing "Show more colours" on "pdpPage"

@manual  @DEBD-531 @awsManual
Scenario: UI Validation for beauty product with 13 or more colour swatches
  When I should see 1.5 rows of swatches
  When I click on "Show More Colours" accordion
  Then I should see the colour swatches expanding into a scrollable container
  And I should see 3.5 rows of swatches
  And I should see show less colours CTA


@manual  @DEBD-531 @awsManual
Scenario: Verify the "Show less Colours" accordion for beauty product with 13 or more colour swatches
  When I click on "Show less Colours" CTA
  Then I should see colour swatch container will collapse
  And I should see 1.5 rows of swatches
  And I should see "Show More Colours" acoordion

@manual  @DEBD-531
Scenario: Verify the colour accordion for beauty product with 7 or more colour swatches on larger view port
  Given I navigate to beauty PDP page
  Then I should see colour swatches
  And I should verify that 6 swatches per row as a maximum are displayed
  And I should see the colour and price per ml/g in one line

@manual  @DEBD-531
Scenario: Verify the colour accordion for beauty product with 7 or more colour swatches on smaller view port
  Given I navigate to beauty PDP page
  Then I should see colour swatches
  And I should verify that 4 swatches per row as a maximum are displayed
  And I should see the colour and price per ml/g stacked on top of each other

@manual @DEBD-531 @awsManual
Scenario: Verify that the tooltip is displayed on hovering colour swatches
  When I hover over a colour swatch
  Then I should see a tool tooltip
  And I should see the tool tip displays the colour name

@notAutomated  @DEBD-104 @awsManual
Scenario: Valdiate all espots and links on Beauty PDP
  Given I navigate to "testBeauty5BreadcrumbPdpURL"
  Then I should see "FreeGift anchor link" on "PdpPage"
  And I should see "beautyClubValuePoints" exist on "pdpPage"
  And I should see "colour dropdown/swatches" on "PdpPage"
  And I should see "Price per ml/g" on "PdpPage"
  # And I should see "free gift espot" on "PdpPage"
  And I should see "Non refundable espot" on "PdpPage"
  And I validate quantity selector
  And I validate customerphoto container
  When I click on "beautyClubValuePoints" on "PdpPage"
  Then I should see "url" contains "/beauty-club"

@manual @DEBD-104
Scenario: Validate No size beauty pdp
  Given I navigate to "NoSizebueatyPDPurl"
  Then I should not see size selector on "PdpPage"
  When I select "Colourselectordropdown" on "PdpPage"
  Then I should see "ColourThumbnails" on "PdpPage"
  And I should see "ColourName" on "PdpPage"
  And I should see "Price" on "PdpPage"
  And I should be able to scroll
  When I select the first available colour from the dropdown
  Then I should see the colour gest selected
  And image of the product should changed to selected colour

@notautomated @DEBD-104 @awsManual
Scenario: Navigate to PDP page and validate the sizes available in dropdown with out of stock and low stock message
  Given I navigate to "bueatyPDPurl"
  Then I select "Out of Stock" size from "dropdown"
  And I validate "Out of Stock" message from  "dropdown" on  "pdpPage"
  Then I select "low stock" size from "dropdown"
  And I validate "low stock" message from  "dropdown" on  "pdpPage"


@manual @DEBD-104 @awsManual
Scenario: Validate the inline error when user adds more than allowed quntity to bag
  Given I navigate to "MacPdpURL"
  And I enter "6" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I see inline error "You have exceeded the maximum quantity allowed for this item"
  When I navigate to "BenefitPDPURL"
  And I enter "7" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I see inline error "You have exceeded the maximum quantity allowed for this item"
  When I navigate to "KatVonDPDP"
  And I enter "6" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I see inline error "You have exceeded the maximum quantity allowed for this item"
  When I navigate to "BurberryPDP"
  And I enter "6" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I see inline error "You have exceeded the maximum quantity allowed for this item"
  When I navigate to "HugoBossPDP"
  And I enter "6" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I see inline error "You have exceeded the maximum quantity allowed for this item"
  When I navigate to "PacoRabanePDP"
  And I enter "6" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I see inline error "You have exceeded the maximum quantity allowed for this item"
  When I navigate to "ChanelMakeUpPDP"
  And I enter "6" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I see inline error "You have exceeded the maximum quantity allowed for this item"
  When I navigate to "ChanelFragerencePDP"
  And I enter "6" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I see inline error "You have exceeded the maximum quantity allowed for this item"
  When I navigate to "BobbiBrownPDP"
  And I enter "6" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I see inline error "You have exceeded the maximum quantity allowed for this item"
  When I navigate to "CliniqueMakeUpPDP"
  And I enter "6" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I see inline error "You have exceeded the maximum quantity allowed for this item"
  When I navigate to "CliniqueFragrence"
  And I enter "6" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I see inline error "You have exceeded the maximum quantity allowed for this item"
  When I navigate to "DiorMakeUp"
  And I enter "6" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I see inline error "You have exceeded the maximum quantity allowed for this item"
  When I navigate to "DiorFragrence"
  And I enter "6" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I see inline error "You have exceeded the maximum quantity allowed for this item"
  When I navigate to "D&GPDP"
  And I enter "6" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I see inline error "You have exceeded the maximum quantity allowed for this item"
  When I navigate to "EsteeLauderMakeup"
  And I enter "6" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I see inline error "You have exceeded the maximum quantity allowed for this item"
  When I navigate to "EsteeLauderFrag"
  And I enter "6" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I see inline error "You have exceeded the maximum quantity allowed for this item"
  When I navigate to "Givenchymakeup"
  And I enter "6" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I see inline error "You have exceeded the maximum quantity allowed for this item"
  When I navigate to "GivenchyFrag"
  And I enter "6" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I see inline error "You have exceeded the maximum quantity allowed for this item"
  When I navigate to "Hermes"
  And I enter "6" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I see inline error "You have exceeded the maximum quantity allowed for this item"
  When I navigate to "UrbanDecay"
  And I enter "6" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I see inline error "You have exceeded the maximum quantity allowed for this item"
  When I navigate to "YvesSaintLaurent"
  And I enter "6" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I see inline error "You have exceeded the maximum quantity allowed for this item"
  When I navigate to "YvesSaintLaurentFPDP"
  And I enter "6" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I see inline error "You have exceeded the maximum quantity allowed for this item"
