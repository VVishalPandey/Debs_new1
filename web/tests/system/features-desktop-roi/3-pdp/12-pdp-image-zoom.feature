Feature: Test Debenhams pdp page and validate Image zoom functionality

@manual  @DEBD-716
Scenario: Validate that the user should not be able to see "tap to zoom" across the main image for 3seconds
  Given I navigate to "pdpPage"
  Then I validate the tap to zoom text which appears on top of first image for 2 seconds
  And I should not see "tap to zoom" across the main image for 3 seconds

@manual  @DEBD-716
Scenario: Validate that the carousel of smaller thumbnail images to the left of the large container should be displayed on PDP with multiple images
  Given I navigate to "pdpPage" with multiple images
  Then I should see the first product image in a large container
  And I should see a carousel of smaller thumbnail images to the left of the large container
  And I should see the first image in the thumbnails will have a green border

@automated @PDP @Fixed  @DEBD-716
Scenario: Validate that the user should see the thumbnails without carousal arrows on PDP with 4 or less product images
 Given I navigate to "homeUKURL"
 Then I "validate & click" country as "IE" from "countryOptions" on "commonPage"
 Given I navigate to "fewImageVideoPDP"
 Then I should see "thumbnailImages" exist on "pdpPage"
 And I should not see "thumbnailDownCarousalArrow" on "pdpPage"
 And I should not see "thumbnailUpCarousalArrow" on "pdpPage"

@automated @PDP @Fixed  @DEBD-716
Scenario: Validate that the user should see the thumbnails with carousal arrows on PDP with 5 or more product images
 Given I navigate to "manyImageVideoPDP"
 Then I should see "thumbnailImages" exist on "pdpPage"
 And I should see "thumbnailDownCarousalArrow" exist on "pdpPage"
 And I should see "thumbnailUpCarousalArrow" exist on "pdpPage"


@manual  @DEBD-716
Scenario: Validate that the user should see thumbnail carousel arrow to be grey when a thumbnail carousel arrow is inactive and thumbnail carousel arrow to be teal when active
  Given I navigate to "pdpPage" with 5 or more product images
  Then I should see "thumbnailImages" on "pdpPage"
  And I should see "thumbnailcarousalArrows" on "pdpPage"
  When I navigate to top of the "thumbnailImages" on "pdpPage"
  Then I should see "thumbnailcarousaltopArrow" as grey
  And I should see "thumbnailcarousalbottomArrow" as teal

@manual  @DEBD-716
Scenario: Validate that user should see a grey border when he hovers or focuses on a thumbnail that is not showing in the main image on PDP
  Given I navigate to "pdpPage" with multiple images
  When I hover or focus on a thumbnail that is not showing in the main image
  Then I should see a grey border around the "thumbnailImage"

@manual  @DEBD-716
Scenario: Validate that main image should be updated with the relevant thumbnail when user clicks on each thumbnail on PDP with multiple images
  Given I navigate to "pdpPage" with multiple images
  When I click on "thumbnailImage" on "pdpPage"
  Then I should see the "mainImage" should be updated with relevant image
  And I should see a teal border around selected "thumbnailImage"

@manual  @DEBD-716
Scenario: Validate that main image should be updated with the relevant thumbnail when user clicks on each thumbnail on PDP with 5 or more product images
  Given I navigate to "pdpPage" with 5 or more product images
  When I click on the horizontal arrows on the main image on "pdpPage"
  Then I should see the "mainImage" should be updated with relevant image
  And I should see a teal border around selected "thumbnailImage"

@manual  @DEBD-716
Scenario: Validate that the user should be able to see next set of product image thumbnails when user clicks up or down arrow on PDP with 5 or more product images
  Given I navigate to "pdpPage" with 5 or more product images
  When I click "thumbnailcarousaltopArrow" on "pdpPage"
  Then I should see next set of product image thumbnails
  When I click "thumbnailcarousalbottomArrow" on "pdpPage"
  Then I should see next set of product image thumbnails

@manual  @DEBD-716
Scenario: Validate that the main image container should be slighty smaller than on tablet viewports on PDP
  Given I navigate to "pdpPage"
  Then I should see the "mainImageContainer" as slighty smaller than on tablet viewports on "pdpPage"

@manual  @DEBD-716
Scenario: Validate that the main image container should increase in size to fill the gap on PDP with just one image
  Given I navigate to "pdpPage" with just one image
  Then I should see the "mainImageContainer" as increased size to fill the gap

@manual  @DEBD-716
Scenario: Validate that the image should be zoomed in to the focused area of the main image on PDP
  Given I navigate to "pdpPage"
  When I hover over the "mainImage" on "pdpPage"
  Then I should see the image will zoom in to the area I'm focusing on
  And I should not see "thumbnailcarousalArrows" on "pdpPage"
  When I move my cursor around
  Then I should see the image will remain zoomed in
  And I should see focus on the new location of my cursor

@automated @PDP @Fixed  @DEBD-716
Scenario: Validate that the zoomed image should be displayed on clicking on the main Image Container on PDP
  Given I navigate to "manyImageVideoPDP"
  When I click on "mainImageContainer" on "pdpPage"
  Then I should see "zoomedImagePopUp" exist on "pdpPage"
  Then I should see "closeIconOnzoomedImagePopUp" exist on "pdpPage"
  When I click on "closeIconOnzoomedImagePopUp" on "pdpPage"
  Then I should not see "zoomedImagePopUp" on "pdpPage"
  Then I should not see "closeIconOnzoomedImagePopUp" on "pdpPage"

@automated @PDP @Fixed  @DEBD-716
Scenario: Validate that the zoomed image should be displayed on clicking on the main Image Container on PDP
  Given I navigate to "manyImageVideoPDP"
  When I hover on "mainImageContainer" at position "580" and "360" on "pdpPage"
  Then I should see "zoomImageOnHover" exist on "pdpPage"
  When I mouse hover on "addToBagButton" on "pdpPage"
  Then I should not see "zoomImageOnHover" on "pdpPage"

@manual  @DEBD-718
Scenario: Validate that the zoom pop up overlay should open when user click on the main image
  Given I navigate to "pdpPage"
  When I click on the "mainImage" on "pdpPage"
  Then I should see "zoomPopUpOverlay" on "pdpPage"
  And I should see "darkBackground" on "pdpPage"
  And I should see "thumbnailImages" on "zoomPopUpOverlay" on "pdpPage"
  And I should see first "thumbnailImage" with teal border on "zoomPopUpOverlay" on "pdpPage"
  And I should not see "thumbnailcarousalArrows" on "zoomPopUpOverlay" on "pdpPage"
  And I should see "mainImageCarouselArrows" as teal and active on "zoomPopUpOverlay" on "pdpPage"
  And I should see "mainImage" on "zoomPopUpOverlay" on "pdpPage"
  And I should see "closeCTA" on "zoomPopUpOverlay" on "pdpPage"

@manual  @DEBD-718
Scenario: Validate that the thumbnail gets a teal border when selected on zoom pop up overlay on PDP
  Given I navigate to "pdpPage"
  When I click on the "mainImage" on "pdpPage"
  Then I should see "zoomPopUpOverlay" on "pdpPage"
  When I click on "thumbnailImage" on "zoomPopUpOverlay" on "pdpPage"
  Then I should see the "thumbnailImage" with teal border on "zoomPopUpOverlay" on "pdpPage"
  Then I should see the "mainImage" should be updated with relevant image on "zoomPopUpOverlay" on "pdpPage"

@manual  @DEBD-718
Scenario: Validate that the main image should update with the next or previous image on zoom pop up overlay on PDP when click on the main image carousel arrows
  Given I navigate to "pdpPage"
  When I click on the "mainImage" on "pdpPage"
  Then I should see "zoomPopUpOverlay" on "pdpPage"
  When I click "mainImageCarousal" on "zoomPopUpOverlay" on "pdpPage"
  Then I should see the "mainImage" should be updated with relevant image

@manual  @DEBD-718
Scenario: Validate that the zoom pop up overlay should close when user clicks on the close CTA or out of the overlay
  Given I navigate to "pdpPage"
  When I click on the "mainImage" on "pdpPage"
  Then I should see "zoomPopUpOverlay" on "pdpPage"
  When I click "CloseCTA" on "zoomPopUpOverlay" on "pdpPage"
  Then I should see "zoomPopUpOverlay" gets closed
  And I should see the "pdpPage"
  When I click on the "mainImage" on "pdpPage"
  Then I should see "zoomPopUpOverlay" on "pdpPage"
  When I click out of the "zoomPopUpOverlay" on "pdpPage"
  Then I should see "zoomPopUpOverlay" gets closed
  And I should see the "pdpPage"

@manual  @DEBD-718
Scenario: Validate that the thumbnail Image carousal on zoom pop up overlay when a product has 8 or more images
  Given I navigate to "pdpPage" with 8 or more product images
   When I click on the "mainImage" on "pdpPage"
  Then I should see "zoomPopUpOverlay" on "pdpPage"
  And I should see "thumbnailcarousalArrows" on "zoomPopUpOverlay" on "pdpPage"

@manual  @DEBD-718
Scenario: Validate that the video thumbnail should not show on zoom pop up overlay when a product has video
  Given I navigate to "pdpPage" a video
   When I click on the "mainImage" on "pdpPage"
  Then I should see "zoomPopUpOverlay" on "pdpPage"
  And I should not see "videoThumbnail" on "zoomPopUpOverlay" on "pdpPage"

@automated @PDP @Fixed @DEBD-348
Scenario: Validate that video thumbnail is displayed on PDP page with many product images
  Given I navigate to "manyImageVideoPDP"
  Then I should see "imageCarsoul" exist on "pdpPage"
  And I should see "videoThumbnail" exist on "pdpPage"
  When I click on "videoThumbnail" on "pdpPage"
  Then I should see "videoViewer" exist on "pdpPage"

@manual @DEBD-348
Scenario: validate that the video thumbnail appears outside the image carsoul
  Then I should see a video thumbnail at the bottom of the image
  And I should thumbnails outside of the image thumbnail carousel
  And I should see the thumbnail has a drop shadow
  And I hover or focus on it then the "video" copy will underline
  #And I should see the icon turns to a darker shade of green
  And I will be served the most appropriate version of the video based on my bandwidth and viewport

@automated @PDP @Fixed @DEBD-348
Scenario: Validate that video thumbnail is displayed on PDP page with few product images
  Given I navigate to "fewImageVideoPDP"
  Then I should not see "imageCarsoul" on "pdpPage"
  And I should see "videoThumbnail" exist on "pdpPage"
  When I click on "videoThumbnail" on "pdpPage"
  Then I should see "videoViewer" exist on "pdpPage"

@manual @DEBD-720
Scenario: Validate that the video open and play in the main image viewer container when clicked on video thumbnail as per bandwidth
  Given I navigate to "fewImageVideoPDP"
  Then I should not see "imageCarsoul" on "pdpPage"
  And I should see "videoThumbnail" exist on "pdpPage"
  When I click on "videoThumbnail" on "pdpPage"
  Then I should see "videoViewer" exist on "pdpPage"
  And I should see video open and play in the main image viewer container based viewport
  Then I click on "imageCarsoul" on "pdpPage"
  And I should not see "videoViewer" exist on "pdpPage"
