Feature: Test Debenhams click and collect

@manual @DEBD-814 @awsManual
  Scenario: Navigate to Debenhams delivery options page as guest in user and validate the chosen C&C store section 
  Given I logout
  When I navigate to "testFurniturePdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "deliveryAddressheaderText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"
  When I click on "clickCollectOption" on "deliveryOptionPage"
  Then I should see the store section with 'Storename','Change storeLink','Interactive store map','Contact details','opening times','C&C location'
  
  @manual @DEBD-814 @awsManual
  Scenario: Navigate to Debenhams delivery options page as guest in user and validate the store search results on search store
  Given I logout
  When I navigate to "testFurniturePdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "deliveryAddressheaderText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"
  When I click on "clickCollectOption" on "deliveryOptionPage"
  Then I should see the store section with 'Storename','Change storeLink','Interactive store map','Contact details','opening times','C&C location'
  And I should not search the store
  And I press the change store link
  Then chosen store section should be removed
  And should see the recent store and new store search options
  
  
  @manual @DEBD-814  @awsManual
  Scenario: Validation of the store search results on search store if the user has already searched the store before on delivery options page
  Given I logout
  When I navigate to "testFurniturePdpURL"
  And I had already searched the store on delivery options page
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "deliveryAddressheaderText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"
  When I click on "clickCollectOption" on "deliveryOptionPage"
  Then I should see the store section with 'Storename','Change storeLink','Interactive store map','Contact details','opening times','C&C location'
  And I should see the recent store search 
  And I press the change store link
  Then chosen store section should be removed
  And should see the new store search results list


  @manual @DEBD-177
  Scenario: Navigate to Debenhams delivery options page as registered user and validate the chosen C&C store section 
  Given I am signed in user
  And already placed orders with C&C location
  When I navigate to "testFurniturePdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"
  When I click on "clickCollectOption" on "deliveryOptionPage"
  Then I should see the recent stores section on the left with 'Recent stores label','store drop down','choose store CTA'

  @manual @DEBD-177 @DEBD-234
  Scenario: Navigate to Debenhams delivery options page as registered user and validate that the user is able to proceed to the payment page on choosing store
  Given I am signed in user
  And already placed orders with C&C location
  When I navigate to "testFurniturePdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"
  And I click on "clickCollectOption" on "deliveryOptionPage"
  And I should see the recent stores section on the left with 'Recent stores label','store drop down','choose store CTA'
  Then I should see other recent stores chosen in the store dropdown  
  And I press the choose store CTA
  And I should scrolled down to see the Payment CTA
  And I should be taken to the Payment Page on click of Payment CTA


  @manual @DEBD-234
  Scenario: Validation of the store search results on search store if the user has already searched the store before on delivery options page
  Given I am signed in user
  When I navigate to "testFurniturePdpURL"
  And I had already searched the store on delivery options page
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"
  When I click on "clickCollectOption" on "deliveryOptionPage"
  Then I should see the nearest store field and 'Town,city or Eircode' hint text in the store field
  And 'Find Stores' CTA
  And I enter a valid eircode or town into the nearest store field
  And Press the find stores CTA
  Then I should see the store results with 'Store name & label', 'store details link','distance &label','choose this store CTA'
  And I should see the recent store search 
  And I should see the copy 'Stores closest to [Eircode searched]
  And I press the change store link
  Then chosen store section should be removed
  And should see the store search results list
  

  @manual @DEBD-234
  Scenario: Validation of the store details section when the registered user search for the store
  Given I am signed in user
  When I navigate to "testFurniturePdpURL"
  And I had already searched the store on delivery options page
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"
  When I click on "clickCollectOption" on "deliveryOptionPage"
  Then I should see the nearest store field and 'Town,city or Eircode' hint text in the store field
  And 'Find Stores' CTA
  And I enter a valid eircode or town into the nearest store field
  And Press the find stores CTA
  Then I should see the store results with 'Store name & label', 'store details link','distance &label','choose this store CTA'
  And I click on the view store details CTA for the store 
  And I should see the store details section with 'store name','change store link','interactive store map','contact details','opening times','C&C location','choose store CTA'
 
  