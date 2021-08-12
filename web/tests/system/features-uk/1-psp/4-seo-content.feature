Feature: Test Debenhams psp seo content

@automated @dataNA @DBNHST-1322
Scenario: Validate the on the first PSP page the SEO content is displayed at the botton of the page with hyperlinks
  Given I navigate to "womenMaxiPSPURL"
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  Then I should see "seoContent" exist on "pspPage"
  And I should see "seoPspLinks" as "New dresses Midi dresses Plus size dresses" on "pspPage"
  Then I click on "seoPspLink1" on "pspPage"
  And I wait for "5000" milliseconds
  Then I should see "url" contains "/women/new-arrivals-clothing/dresses#intcmp=dresses_new_dresses"
  Then I go back to previous page
  And I wait for "5000" milliseconds
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  Then I click on "seoPspLink2" on "pspPage"
  And I wait for "5000" milliseconds
  Then I should see "url" contains "/women/dresses/midi#intcmp=dresses_midi_dresses"
  Then I go back to previous page
  And I wait for "5000" milliseconds
  When I should scroll to "subscribeToNewsletter" on "commonPage"
  Then I click on "seoPspLink3" on "pspPage"
  And I wait for "5000" milliseconds
  Then I should see "url" contains "/women/dresses/plus-size"
  Then I go back to previous page

@manual @DBNHST-1322
Scenario: Validate that only seo content is displayed without any hyperlinks for sports-leisure
