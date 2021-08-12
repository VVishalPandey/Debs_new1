Feature: Test Debenhams  New responsive inspireme component on TCATs/content pages/ home page

@manual @DEBD-4124
Scenario Outline: validate  New responsive component  on Tcat Pages
  Given I am on "<Pages>"
  When I scroll bottom   of the page
  Then I should see "New responsive component" exists on "<Pages>"
  And I should see one row of "New responsive inspire me component" with 3 thumbnails
  And the carousel should have 3 scrolling  spots
  And I should see 3 "New responsive spots" in total
  And I should see some part of the next spot(teaser) at the end of the each spot
  And the spots should autoscroll
#    need to check with Fran question raised
  And I should not see arrows
  And I should see maximum 2 and minimum 1 line of text inside each spots with CTA
  And I should see 3 scrolling dots below the carousel
  And each spots should have a CTA
  And I should see 3 thumbnail on the righside of the carsousel
  And I should see text below each thumbnail
  And I should see maximum 2 and minimum 1 line of text inside each spots with CTA
  And I should see same 3 images on Thumbnails which are the carousel
  Examples:
    |       Pages      |
    | womenTcat        |
    | contentPage      |
    | Home Page        |

@manual @DEBD-4124
Scenario: validate  New responsive  component's UI on TCATs/content pages/ home page

@manual @DEBD-4124
Scenario: validate  the padding between carousel and the thumbnails  on TCATs/content pages/ home page

@manual @DEBD-4124
Scenario: validate  the CTA's on thumbnail and carousel images are redirecting to respective PDPs

@manual @DEBD-4124
Scenario: validate  the images of spots and thumbnails are aligned properly

@manual @DEBD-4124
Scenario: validate  when the spots are scrolling, the colour of the dots changing to green for active spot

@manual @DEBD-4124
Scenario: validate  the texts for thumbnails are to the right side of it

@manual @DEBD-4124
Scenario: validate  the texts on Spot component can be set-up on left/center/right side


