Feature: Implement PDP zoom fixes

@manual @DDAI-969
Scenario Outline: Validate PDP zoom functionality on PDP
  When I singularly tap on the "<PDP>" image
  Then I should see image open full screen
  And I should see image centered
  And I should see a close button on the top right

  Examples:
    | PDP       |
    | Beauty    |
    | Furniture |
    | Chanel    |

@manual @DDAI-969
Scenario Outline: Validate PDP close button on zoom functionality on PDP
  When I singularly tap on the PDP image
  Then I should see image open full screen
  And I should see image centered
  And I should see a close button on the top right
  When I click on close button
  Then zoom image should close
  And I should seen the image module

  Examples:
    | PDP       |
    | Beauty    |
    | Furniture |
    | Chanel    |

@manual @DDAI-969
Scenario Outline: Validate swipe functionality on image module  PDP
  Given I am on PDP image
  And I have opened the image module
  Then I should be able to swipe through the image carousel both right and left
  Then I should see previous and next images

  Examples:
    | PDP       |
    | Beauty    |
    | Furniture |
    | Chanel    |

@manual @DDAI-969
Scenario Outline: Validate scroll functionality on image module  PDP
  Given I am on PDP image
  And I have opened the image module
  Then  I should be able to use the arrows to scroll through the image carousel both right and left
  Then I should see previous and next images

  Examples:
    | PDP       |
    | Beauty    |
    | Furniture |
    | Chanel    |

@manual @DDAI-969
Scenario Outline: Validate pinch to zoom functionality should not work
  Given I am on PDP
  And I have opened the image module
  And I pinch to zoom
  Then the image should not zoom in

  Examples:
    | PDP       |
    | Beauty    |
    | Furniture |
    | Chanel    |

@manual @DDAI-969
Scenario Outline: Validate pinch to zoom functionality should not work
  Given I am on  PDP
  And I pinch to zoom
  Then the image should not zoom in

  Examples:
    | PDP       |
    | Beauty    |
    | Furniture |
    | Chanel    |

@manual @DDAI-969
Scenario Outline: Validate if user clicks on alternative images
  Given I am on the PDP page
  When I click on the alternative images
  Then the image should update without the user making another interaction with the image/module

  Examples:
    | PDP       |
    | Beauty    |
    | Furniture |
    | Chanel    |

@automated @Fixed @DEBD-2662
Scenario Outline: Validate the Image src on pdp as amplience
  Given I navigate to "<pdpUrl>"
  Then I should see "pdpMainHeroImage" exist on "pdpPage"
  Then I should see "pdbThumbImage" exist on "pdpPage"
  And I verify "src" of "pdpMainHeroImage" containing "amplienceBaseUrl" on "pdpPage"
  And I verify "src" of "pdbThumbImage" containing "amplienceBaseUrl" on "pdpPage"


Examples:
|pdpUrl|
|testDressPdpURL|
|braUrl|
|diorBackstagePdpUrl|
|pdpKidRangeProduct|
|pdpKnitWearProduct|
|pdpBeautyColorProduct|
|testFurniturePdpURL|
|testPerfumePdpURL|
|testChannelPdpURL|
|testDress2PdpURL|
|ListBundleProductUrl|
|electricalsPDPURL|
|giftPDPURL|
|testShoePdpURL|
|PDPOOSKnitwear|
|PDPOOSLingerie|
|alcoholPDPURL|

@automated @Fixed  @DEBD-2890
Scenario: Validate the Video functionality and src on pdp as amplience
  Given I navigate to "videoPDPUrl"
  Then I should see "videoThumbnail" exist on "pdpPage"
  When I click on "videoThumbnail" on "pdpPage"
  Then I should see "videoComponent" exist on "pdpPage"
  And I verify "src" of "videoComponent" containing "amplienceBaseVideoUrl" on "pdpPage"
