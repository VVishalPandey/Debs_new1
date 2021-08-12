Feature: Verify the functionality of PCA on Delivery Page on Mobile

@manual @DBNHST-2096 @DBNHST-2336
Scenario: Navigate to Home Delivery page and validate the address section for registered/guest/ghost user with saved and no saved addresses
  Given I am registered/guest/ghost user with saved and no saved addresses
  Then I should see Header text as "Where are we delivering to?"
  And I should see below fields for no saved address or add new address

  Fields                  | Type
  title                   | dropdown (defaulted to Mrs)
  first name              | Text Box
  last name               | Text Box
  phone number            | Text Box
  address                 | Text Box  (having hint text as "Start typying your postcode or address")
  enter address manually  | link
  use this address        | CTA
  *Required fields        | label

@manual @DBNHST-2066
Scenario: Navigate to Delivery page and validate the address section when enter address manually selected
  Given I am registered/guest/ghost user with saved and no saved addresses
  Then I should see Header text as "Where are we delivering to?"
  When I click on enter address manually
  Then I should see below fields

  Fields                  | Type
  title                   | dropdown (defaulted to Mrs)
  first name              | Text Box
  last name               | Text Box
  phone number            | Text Box
  country                 | dropdown
  address                 | Text Box(s)
  city                    | Text Box
  country                 | Text Box
  postcode                | Text Box
  find another address    | link
  BFPO address format information | link
  use this address        | CTA
  *Required fields        | label

@manual @DBNHST-2096
Scenario: Navigate to Delivery page as Guest or Ghost Home delivery journey when no delivery address is saved and validate the address section when user click on use by postcode when in manual address form
  Given I am on Delivery page as Guest or Ghost Home delivery journey
  Then I should see Header text as "Where are we delivering to?"
  When I click on enter address manually
  And I click on find another address
  Then I should see below fields

  Fields                  | Type
  title                   | dropdown (defaulted to Mrs)
  first name              | Text Box
  last name               | Text Box
  phone number            | Text Box
  address                 | Text Box  (having hint text as "Start typying your postcode or address")
  enter address manually  | link
  use this address        | CTA
  *Required fields        | label


@manual @DBNHST-2069
Scenario: Validate the no results tooltip is displayed when user enter non alphanumeric characters in the address fields in new delivery address form
  Given I am on delivery address page
  When I enter non alphanumeric chanracters in address field in new delivery address
  Then I see the no results found tooltip

@manual @DBNHST-2069
Scenario: Validate the when no results are returned from PCA library then no results found tooltip is displayed in the address fields in new delivery address form
  Given I am on delivery address page
  When I enter address which results in no address from PCA library
  Then I see the no results found tooltip

@manual @DBNHST-2069
Scenario: Validate the error message when for the empty address field value in delivery address form
  Given I am on delivery address page
  When I navigate away from the address field without entering any data
  Then I see inline error "The address field cannot be empty"

@manual @DBNHST-2069
Scenario: Validate when PCA is down then error saying, "Address look up unavailable please enter address manually." is displayed
  Given I am on delivery address page
  When PCA is down or PCA library is not loaded
  Then I will see the postcode lookup

@manual @DBNHST-2069
Scenario: Validate the error message when user search for International address with a bag of non International products like Mac lipstick
  Given I am on delivery address page with product not delivery to International like Mac lipstick
  When I search for International address
  Then I see error stating that "Sorry, some of your items are not available for international delivery. Please edit your bag."

@manual @DBNHST-2095
Scenario: Validate the error message when user search for International country where product cannot be deliveryed like China with a bag of International products like a dress
  Given I am on delivery address page with product capable of delivery to International like a dress
  When I search for International address like China where delivery cannot be made
  Then I will see results returned 
  When I click on the address
  Then I see error stating that "we don't deliver to that country"
  And the address field will blank out

@manual @DBNHST-2095
Scenario: Validate address search result for International address in delivery address form both for search result narrow and International characters
  Given I am on delivery address page with product capable of delivery to International like a dress
  When I start typing an International address
  Then I will see UK addresses first as it is based on location
  When I type more of my address 
  Then it will narrow down to the International address
  When I enter international characters e.g. à, è, ù
  Then they will be recognised for international addresses e.g. Musée du Louvre, 75058 Paris

@manual @DBNHST-2070
Scenario: Validate the delivery address form details are retained when selected change address after entering the address using PCA and manual
  Given I have selected delivery address via PCA
  And press use this address
  And I can see the choose delivery options next vs standard or International
  When I press change delivery address
  Then I will see the delivery address form with the previously entered address is retained
  When I press enter address manually
  Then I will see the full address form
  When I have entered an address and moved to delivery option
  And I press change delivery address
  Then I will see the delivery address form with the previously entered address is retained

@manual @DBNHST-2070
Scenario: Validate the delivery address form details are retained when selected change delivery typre from payment page after entering the address using PCA
  Given I have selected delivery address via PCA
  And I moved to Payment page
  When I selected Change delivery type
  And I selected Home delivery again
  Then I will see the delivery address form with the previously entered address is retained

@manual @DBNHST-2070
Scenario: Validate the delivery address form details are retained when selected change delivery type from delivery options page after entering the address using PCA
  Given I have selected delivery address via PCA
  And press use this address
  And I can see the choose delivery options next vs standard or International
  When I press change delivery type
  And I selected Home delivery again
  Then I will see the delivery address form with the previously entered address is retained

@manual @DBNHST-2065
Scenario: Validate the address result when user start typing the address in new delivery address form via PCA
  Given I am on the payment page
  # Validation 1
  When I start typing the first character (alphanumeric)
  Then my address results start to show
  And I will see the "keep typing your address to display more results" tool tip for X seconds
  # Validation 2
  When I enter further characters (alphanumeric)
  Then my address results narrow down (Validate the results from the PCA site)
  And I clear the field
  # Validation 3
  When I enter house name, house number, business name, postcode or street
  Then relevant results will be delivered based on what I've entered (Validate the results from the PCA site)
  And I clear the field
  # Validation 4
  When I have entered my address slightly incorrect e.g. Fiefly Road
  Then my results will still be found
  And I clear the field
  # Validation 5
  When I have entered characters that result in multiple results e.g a county, street name or postcode (SW12 0PG)
  Then I will see the suggested address e.g. Scholar's Road, London
  And the amount of relevant results e.g. - 45 addresses
  # Validation 6
  When I click on the suggested address
  Then the results will expand to show a list of all the suggested addresses
  # Validation 7
  When I click on a suggested address
  Then the address data is populated into the address field in a single line
  And the focus is taken off the address field
  # Validation 8
  When I start removing the selected address with the backspace
  Then I will see suggested results based on the data still left in the address field (Validate the results from the PCA site)
  # Validation 9
  When I  press clear all  in the address field for the selected address
  Then the whole address field will be cleared but the focus will be still on the same field
  And I clear the field
  # Validation 10
  Then I validate addresses with company name / company name & dept / without company name & dept

@manual @DBNHST-2065
Scenario: Validate the address breadcrump when user selects use this address in delivery address form via PCA
  Given I have selected a delivery address
  When I press use this address
  Then I am taken to choose delivery option (next or standard) page
  And I can see my address populated in the delivery address breadcrumb

@manual @DBNHST-2100 @DBNHST-2336
Scenario: Validate PCA address field should not be there and it should have the default delivery address form with postcode lookup
  Given PCA should not work for mobile INT
  Then validate all the validation as in above scenarios
  Given PCA should not work for mobile ROI
  Then validate all the validation as in above scenarios

# Need to check with Abel
@manual @DBNHST-2069
Scenario: Validate the RETRIEVEERROR on the delivery address
  Given I have searched for an address
  When I am disconnected from the internet
  Then I will see the RETRIEVEERROR : "Sorry , we could not retrieve this the address"
  And I will not be able to use the address

# Need to check with Abel
@manual @DBNHST-2069
Scenario: Validate the SERVICEERROR on the delivery address
  Given the PCA credits have expired
  When the user types in some characters in the address field
  Then the SERVICEERROR will trigger
  And the error will flag via tracking