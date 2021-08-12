Feature: Test Debenhams order confirmation page

@manual DDAI-134
Scenario: Navigate to Debenhams Order confirmation page>validate create account Feature
  Given THAT I am a guest user and successfully made a payment
  When I am directed to the Order Confirmation page
  Then I must be given the option to sign up by entering a new password and have a new account created

@manual @DDAI-194
Scenario: Navigate to Debenhams Order confirmation page>validate Order confirmation page
  Given that I have successfully made a purchase
  Then I should see the order confirmation page
  Then I should see(order number,delivery details,order summary,payment information,Prices in euros,Reward points earned instead)
  And I should not see (No personal finance points earned,No beauty points earned,No web loyalty)

@manual @DDAI-290
Scenario: Navigate to Debenhams Order confirmation page>Home delivery>Standard delievery>Validate Order inforamtion section

@manual @DDAI-290
Scenario: Navigate to Debenhams Order confirmation page>Next day delivery>Validate Order inforamtion section

@manual @DDAI-290
Scenario: Navigate to Debenhams Order confirmation page>Click & Collect>Validate Order inforamtion section
