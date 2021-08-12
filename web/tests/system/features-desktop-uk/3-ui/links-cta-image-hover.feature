Feature: Test Debenhams links-cta on all pages

@manual @DEBD-459
Scenario: validate hover functionality on cta 
  When I  hover over a cta
  And I  should see the colour of CTA gets changed to  black colour
  When I stop hover to the cta
  Then CTA should change back to original state

@manual @DEBD-459
Scenario: validate hover functionality on text link
  When I hover over a text link
  Then I should see the text link should get underlined
  And I should see the colour of the text link gets changed to "as per colour guidelines"
  When I stop hover to the cta
  Then Text Link should change back to original state

@manual @DEBD-459
Scenario: validate hover functinality on text link with a chevron
  When I hover over a text link with chevron
  Then I should see the text link should gets changed to outlineine style CTA
  When I stop hover to the text link with chevron
  Then Text Link with chevron should change back to original state

@manual 
Scenario: validate hover functionality on image 
  When I  hover over a image
  And I  should see the colour of image gets changed to  white colour
  When I stop hover to the image
  Then image should change back to original state

@manual @DEBD-111
Scenario: validate the hover functinality on Breadcrumb
  Given I'm on any "PDPPage"
  And I see "Breadcrumb" exist on "PdpPage"
  When I hover on BBreadcrumb
  Then I should see colour of Breadcrumbes changed to "Teal"
  When I stop hover to the "Breadcrumb"
  Then image should change back to original state

@manual @DEBD-494 
Scenario: validate on pdp/psp only icon is displayed for save for later.
 Given I'm on "PSP Page"
 Then I should see "SFL icon" on PDP Page.
 And I should not see "Save for later" text on product images on PDPpage
 And I click on first product
 Then I should see product PDP
 And I should see "SFL icon" on PDP Page.
 And I should not see "Save for later" text on product images on PDPpage
  
