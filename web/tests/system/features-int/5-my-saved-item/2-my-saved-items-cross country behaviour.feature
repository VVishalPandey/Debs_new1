Feature: Test Debenhams my saved items

@manual @DDAI-371
Scenario:Navigate to Debenhams my saved items>Change country>Validate change item message
  Given I am on DOTCOM UK
  And I am on the my saved items page
  And I have products saved
  When I open the country selector
  Then I will the items may change message on the country selector
  When I am on DOTCOM UK
  And I have products in my saved items from multiple categories
  When I change countries to DOTINT e.g. Australia
  And the product is available in the new country
  Then it will remain in my saved items
  And When I click on it
  Then I will be taken to the appropriate PDP

@manual @DDAI-371
Scenario:Navigate to Debenhams my saved items>Change Country>Validate When items not availble for the selected country
  Given I am on DOTCOM UK
  And I have products in my saved items from multiple categories
  When I change countries to DOTINT e.g. Australia
  And the product is *NOT* available in the new country
  Then it will remain in my saved items
  And have a "product not available in this country" message in red
  And there will be no choose options CTA
  Given I have a product in my saved items
  And it is not available in the country site I am on
  When I click on it
  Then I will be taken to the appropriate PDP
  And  the add to bag button will be greyed out
  And  under delivery options I will see the "Not available for delivery to selected country" message
  When I use the country selector(AS a DOTCOM customer)
  Then I must see all my saved items to remain as-is
  And any ineligible items (Beauty, Furniture, Lighting) must be shown as Out of Stock/Not available in this country
  And I must not be able to add those items to bag)

@manual @DDAI-371
Scenario:Navigate to Debenhams my saved items>IReland site>Change Country>Validate that we are logged out
  Given I am on DOTIE
  When I use the country selector and change country
  Then I will be shown the homepage with the correct domain (e.g. http://www.Debenhams.com/en-au)
  And I must be logged out
  And When I land on my Saved Items, I must be presented with the Sign in page
