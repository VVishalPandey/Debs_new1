Feature: Test Debenhams ops test script journey number 26

@automated @opsTC
Scenario:Validate List bundles for Mens Suite on the PDP page as per opsTC-26
  Given I logout
  Then I navigate to "ListBundleProductUrl"
  And I validate all the details for list bundle product "1" and choose size as "4" for add to bag
  And I validate all the details for list bundle product "2" and choose size as "5" for add to bag
  Then I click on "miniBagButton" on "pdpPage"
  And I should validate name of product "1" as "Charcoal skinny fit jacket" on minibag page
  And I should validate name of product "2" as "Charcoal skinny fit trouser" on minibag page
  And I should "validate subtotal & remove" product "1" from minibag page
  And I click on "closeButton" on "minibagPage"
  And I validate all the details for list bundle product "1" and choose size as "4" for add to bag
  Then I click on "miniBagButton" on "pdpPage"
  Then I click on "secureCheckoutButton" on "minibagPage"
  And I remove first product and select "Close" then I validate bag on myBagPage
  And I select save for later for first product then I validate bag on myBagPage
  And I wait for "15000" milliseconds
  And I enter quantity as "2" for product "1"
  And I verify the "disabled" delivery options are in "grey" colour for product "1"
  And I verify the "enabled" delivery options are in "black" colour for product "1"
  And I should see "deliveryOptionTooltip" exist on "myBagPage"
  And I should see "freeDelveryQualifyMessage" as "Your shopping bag qualifies for FREE Standard Delivery." on "myBagPage"
  Then I click on "miniBagButton" on "pdpPage"
  And I should "remove" product "1" from minibag page
  And I click on "closeButton" on "minibagPage"
