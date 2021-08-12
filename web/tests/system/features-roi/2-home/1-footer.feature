Feature: Test Debenhams footer links on Home Page and Payment Page 

@automated @DDAI-291
Scenario Outline: verify that the delivery Options are present
  Given I navigate to "homeURL"
  When I am in view of "deliveryOptions" on "commonPage"
  Then I should see "deliveryOptions" exist on "commonPage"
  When I am in view of "subscribeToNewsletter" on "commonPage"
  Then I enter "<email>" in "subscribeEmail" on "commonPage"
  Then I click on "subscribeButton" on "commonPage"
  And I wait for "5000" milliseconds
  Then I should see "url" contains "https://pages.e.debenhams.com/"
  Then I go back to previous page

  Examples:
    | email         |
    | abc@gmail.com |

@automated @DDAI-291
Scenario: Verify that the social media links are working
  Given I navigate to "homeURL"
  When I am in view of "socialMediaSection" on "commonPage"
  Then I should see "socialMediaSection" exist on "commonPage"
  Then I verify "href" of "socialMediaFacebook" as "socialMediaLinkFacebook" on "commonPage"
  Then I verify "href" of "socialMediaTwitter" as "socialMediaLinkTwitter" on "commonPage"
  Then I verify "href" of "socialMediaPinterest" as "socialMediaLinkPinterest" on "commonPage"
  Then I verify "href" of "socialMediaInstagram" as "socialMediaLinkInstagram" on "commonPage"
  Then I verify "href" of "socialMediaYoutube" as "socialMediaLinkYoutube" on "commonPage"

@manual @DDAI-291
Scenario: Navigate to Debenhams PSP page and validate the Verified by visa icons that appear in footer
  Given I am on Ireland PSP Page.
  Then I Navigate to bottom of the page
  Then I should see "Verified by visa icons" on the page
  And  : I Should see 3 verified by visa logos 
  Then I click on these logos i should navigate to faq page

@manual @DDAI-41
Scenario: Navigate to Debenhams Payment page and validate the reduced footer options that appear
  Given I am on Ireland Payment Page.
  Then I Navigate to bottom of the page and check footer links
  Then I should see reduced footer on the page

@manual @DDAI-209
Scenario: Navigate to Debenhams Home page and validate the footer options that appear
  Given I am on Ireland Home Page.
  Then I Navigate to bottom of the page and check footer links
  Then I should see footer links on the page

@manual @DDAI-209
Scenario: Navigate to Debenhams Saved item page and validate the footer options that appear
  Given I am on Ireland Saved item Page.
  Then I Navigate to bottom of the page and check footer links
  Then I should see footer links on the page

@manual @DDAI-209
Scenario: Navigate to Debenhams PSP page and validate the footer options that appear
  Given I am on Ireland PSP Page.
  Then I Navigate to bottom of the page and check footer links
  Then I should see footer links on the page
