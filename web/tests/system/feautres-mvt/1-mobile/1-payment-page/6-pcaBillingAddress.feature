Feature: Verify the functionality of PCA on Payment Page on Mobile

@manual @DBNHST-2100
Scenario: Navigate to Payment page as Guest or Ghost Click and Collect journey when no billing address is saved and validate the address section default
  Given I am on Payment page as Guest or Ghost Click and Collect journey
  Then I should see Use new billing address section by default
  And I should see below fields

  Fields                  | Type
  title                   | dropdown (defaulted to Mrs)
  first name              | Text Box
  last name               | Text Box
  phone number            | Text Box
  address                 | Text Box  (having hint text as "Start typying your postcode or address")
  enter address manually  | link
  BFPO address format information | link
  use this address        | CTA

@manual @DBNHST-2066
Scenario: Navigate to Payment page as Guest or Ghost Click and Collect journey when no billing address is saved and validate the address section when enter address manually selected
  Given I am on Payment page as Guest or Ghost Click and Collect journey
  Then I should see Use new billing address section by default
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
  search by postcode      | link
  BFPO address format information | link
  use this address        | CTA

@manual @DBNHST-2100
Scenario: Navigate to Payment page as Guest or Ghost Click and Collect journey when no billing address is saved and validate the address section when user click on use by postcode when in manual address form
  Given I am on Payment page as Guest or Ghost Click and Collect journey
  Then I should see Use new billing address section by default
  When I click on enter address manually
  And I click on search by postcode
  Then I should see below fields

  Fields                  | Type
  title                   | dropdown (defaulted to Mrs)
  first name              | Text Box
  last name               | Text Box
  phone number            | Text Box
  address                 | Text Box  (having hint text as "Start typying your postcode or address")
  enter address manually  | link
  BFPO address format information | link
  use this address        | CTA

@manual @DBNHST-2100 @DBNHST-2065
Scenario: Navigate to Payment page as Guest or Ghost Standard delivery journey when no billing address is saved and validate the address section default
  Given I am on Payment page as Guest or Ghost Standard delivery journey (delivery address to enter through PCA)
  Then I should see same as delivery address selected and address to be same as what was entered in delivery address PCA
  And I should see Use new billing address section as collapse and radio button not selected
  When I click on Use new billign address
  Then I should see below fields

  Fields                  | Type
  title                   | dropdown (defaulted to Mrs)
  first name              | Text Box
  last name               | Text Box
  phone number            | Text Box
  address                 | Text Box  (having hint text as "Start typying your postcode or address")
  enter address manually  | link
  BFPO address format information | link
  use this address        | CTA

@manual @DBNHST-2066
Scenario: Navigate to Payment page as Guest or Ghost Standard delivery journey when no billing address is saved and validate the address section when enter address manually selected
  Given I am on Payment page as Guest or Ghost Standard delivery journey (delivery address to enter through PCA)
  Then I should see same as delivery address selected and address to be same as what was entered in delivery address PCA
  And I should see Use new billing address section as collapse and radio button not selected
  When I click on Use new billign address
  And I click on enter address manually
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
  search by postcode      | link
  BFPO address format information | link
  use this address        | CTA

@manual @DBNHST-2100
Scenario: Navigate to Payment page as Guest or Ghost Standard delivery journey when no billing address is saved and validate the address section when user click on use by postcode when in manual address form
  Given I am on Payment page as Guest or Ghost Standard delivery journey (delivery address to enter through PCA)
  Then I should see same as delivery address selected and address to be same as what was entered in delivery address PCA
  And I should see Use new billing address section as collapse and radio button not selected
  Then I click on Use new billign address
  And I click on enter address manually
  And I click on search by postcode
  Then I should see below fields

  Fields                  | Type
  title                   | dropdown (defaulted to Mrs)
  first name              | Text Box
  last name               | Text Box
  phone number            | Text Box
  address                 | Text Box  (having hint text as "Start typying your postcode or address")
  enter address manually  | link
  BFPO address format information | link
  use this address        | CTA

@manual @DBNHST-2069
Scenario: Validate the no results tooltip is displayed when user enter non alphanumeric characters in the address fields in new billing address form
  Given I am on payment page
  When I enter non alphanumeric chanracters in address field in new billing address
  Then I see the no results found tooltip

@manual @DBNHST-2069
Scenario: Validate the when no results are returned from PCA library then no results found tooltip is displayed in the address fields in new billing address form
  Given I am on payment page
  When I enter address which results in no address from PCA library
  Then I see the no results found tooltip

@manual @DBNHST-2069
Scenario: Validate the error message when for the empty address field value in billing address form
  Given I am on payment page
  When I navigate away from the address field without entering any data
  Then I see inline error "The address field cannot be empty"

@manual @DBNHST-2069
Scenario: Validate when PCA is down then error saying, "Address look up unavailable please enter address manually." is displayed
  Given I am on payment page
  When PCA is down or PCA library is not loaded
  Then I will see the postcode lookup

@manual @DBNHST-2069
Scenario: Validate the error message when user search for International address with a bag of non International products like Mac lipstick
  Given I am on payment page with product not delivery to International like Mac lipstick
  When I search for International address
  Then I should be able to select International billing address

@manual @DBNHST-2095
Scenario: Validate the error message when user search for International country where product cannot be deliveryed like China with a bag of International products like a dress
  Given I am on payment page with product capable of delivery to International like a dress
  When I search for International address like China where delivery cannot be made
  Then I will see results returned 
  When I click on the address
  Then I see error stating that "we don't deliver to that country"
  And the address field will blank out

@manual @DBNHST-2095
Scenario: Validate address search result for International address in billing address form both for search result narrow and International characters
  Given I am on payment page with product capable of delivery to International like a dress
  When I start typing an International address
  Then I will see UK addresses first as it is based on location
  When I type more of my address 
  Then it will narrow down to the International address
  When I enter international characters e.g. à, è, ù
  Then they will be recognised for international addresses e.g. Musée du Louvre, 75058 Paris

@manual @DBNHST-2070
Scenario: Validate the billing address form when selected edit address after entering the address using PCA
  Given I am on the payment page
  And I have entered a new billing address using PCA
  When I press edit address 
  Then I will see the full address form expand within the container
  And the details I've previously entered are retained

@manual @DBNHST-2065
Scenario: Validate the address result when user start typing the address in new billing address form via PCA
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
  Then the whole address field will be cleared

@manual @DBNHST-2065
Scenario: Validate the address saved when user selects use this address in billing address form via PCA
  Given I have selected a new billing address
  When I press use this address
  Then I can see my address populated in the new billing address area

@manual @DBNHST-2100 @DBNHST-2336
Scenario: Validate PCA address field should not be there and it should have the default billing address form with postcode lookup
  Given PCA should not work for mobile INT
  Then validate all the validation as in above scenarios
  Given PCA should not work for mobile ROI
  Then validate all the validation as in above scenarios

# Need to check with Abel
@manual @DBNHST-2069
Scenario: Validate the RETRIEVEERROR on the billing address
  Given I have searched for an address
  When I am disconnected from the internet
  Then I will see the RETRIEVEERROR : "Sorry , we could not retrieve this the address"
  And I will not be able to use the address

# Need to check with Abel
@manual @DBNHST-2069
Scenario: Validate the SERVICEERROR on the billing address
  Given the PCA credits have expired
  When the user types in some characters in the address field
  Then the SERVICEERROR will trigger
  And the error will flag via tracking
