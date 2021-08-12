Feature: Test Debenhams  New responsive inspireme component on TCATs/content pages/ home page

@manual @DEBD-4124
Scenario Outline: validate  New responsive component  on Tcat Pages
  Given I am on "<Pages>"
  When I scroll bottom   of the page
  Then I should see "New responsive component" exists on "<Pages>"
  And I should see one row of "New responsive inspire me component"
  And the carousel should have 3 scrolling  spots
  And I should see 3 "New responsive spots" in total
  And I should see not see the teaser
  And the spots should autoscroll
#    need to check with Fran question raised
  And I should not see arrows
  And I should see maximum 1 and minimum 0 line of text inside each spots with CTA
  And I should see 3 scrolling dots below the carousel
  And each spots should have a CTA
  And I should not see the thumbnails

  Examples:
    |       Pages      |
    | womenTcat        |
    | contentPage      |
    | Home Page        |

@manual @DEBD-4124
Scenario: validate  New responsive  component's UI on TCATs/content pages/ home page

@manual @DEBD-4124
Scenario: validate  the padding between carousel and other components on TCATs/content pages/ home page

@manual @DEBD-4124
Scenario: validate  the CTA's and carousel images are redirecting to respective PSP


@manual @DEBD-4124
Scenario: validate  when the spots are scrolling, the colour of the dots changing to green for active spot


@manual @DEBD-4124
Scenario: validate  the texts on Spot component can be set-up on left/center/right side


