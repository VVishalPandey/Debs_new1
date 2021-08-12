Feature: Test Debenhams psp seo,banner and merch UI

@manual @DEBD-769 @DEBD-325 @DEBD-883
Scenario: Validate UI for different components of PSP page
 Given I navigate to "womenDresspspURL"
 When "seo" is enabled for "pspPage"
 Then I should see "seo conatiner"
 And if the "seo" is " text only SEO content"
 Then I should see "textonlySEO" on "pspPage"
 And It should be in between of "HeaderText" and "pspSlimBanner"
 When Seo is disabled on "pspPage"
 Then I should not see "seo conatiner"
 When "merch set" is enabled for "pspPage"
 Then I should see "merchset" on "pspPage"
 When "merch set" is disabled for "pspPage"
 Then I should not see "merch set" on "pspPage"
 When "pspSlimBanner" is enabled on "pspPage"
 Then I should see "pspSlimBanner" on "pspPage"
 And It should be in between of "HeaderText" and "Pagination container"

@manual @DEBD-884
Scenario: Validate the psp page  when changing the product count
 Given I navigate to "womenDresspspURL"
 Then the default number of products displayed per page will be 18
 And  the maximum number of products displayed per page will be 60
 Then I will see a "View 60 products per page" text link
 And it will be on the same line as the pagination as per the design
 When I click on the "View 60 products per page" text link
 Then  the page will reload
 And I will see 60 products on the page
 And the text link will update to say "View 18 products per page"
 And when the products count gets reduced from 60 to 30
 Then I will see "view 30  products per page"
 And pagination will be updated accordingly



