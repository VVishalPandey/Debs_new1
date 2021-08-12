Feature: Test Debenhams Marketing Preferences - GDPR changes  a

@manual @DDAI-767
Scenario: Navigate create account page -> validate Marketing Preferences , Checkbox should be unchecked - > message should be "I'd like to receive details of Debenhams new arrivals, offers & promotions via email"

@manual @DDAI-767
Scenario: Navigate my account page -> validate Marketing Preferences should be "No..." , if user opt out while creating account- > message should be "I'd like to receive details of Debenhams new arrivals, offers & promotions via email", with check box unchecked.

@manual @DDAI-767
Scenario: Navigate my account page -> validate Marketing Preferences should be "Yes..." , if user opt in while creating account- > message should be "I'd like to receive details of Debenhams new arrivals, offers & promotions via email", with check box checked.

@manual @DDAI-767
Scenario: Navigate my account page -> validate user is able to edit Marketing Preferences, either opt in or opt out and it should update in my account accordingly

@manual @DDAI-767
Scenario: Navigate Payment page -> validate Marketing Preferences should show according to user selection eirler -> message should be " We love sending you details of our new arrivals, offers & promotions,To opt in/out of receiving these communications, please tick the box", with check box unchecked.

@manual @DDAI-767
Scenario: Navigate Payment page -> validate is able to opt out Marketing Preferences if it is already opt in -> Preference should be updated in My account after order placement-> message should be(on payment page) " We love sending you details of our new arrivals, offers & promotions,To opt out of receiving these communications, please tick the box", with check box unchecked.

@manual @DDAI-767
Scenario: Navigate Payment page -> validate is able to opt in Marketing Preferences if it is already opt out -> Preference should be updated in My account after order placement-> message should be(on payment page) " We love sending you details of our new arrivals, offers & promotions,To opt in of receiving these communications, please tick the box", with check box unchecked.
