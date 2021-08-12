Feature: Test Debenhams order confirmation page

@manual @DBMTE-371
Scenario: Navigate to Debenhams Order confirmation page>validate Order confirmation page for International
  Given that I have successfully made a purchase through PayPal
  Then I should see the order confirmation page
  Then I should see(order number,delivery details,order summary,payment information,Prices in local currency)
  And I should not see (No personal finance points earned,No beauty points earned,No reward points earned,No web loyalty)

@manual @DBMTE-371
Scenario: Navigate to Debenhams Order confirmation page>validate Order confirmation page for International
  Given that I have successfully made a purchase through Credit Card
  Then I should see the order confirmation page
  Then I should see(order number,delivery details,order summary,payment information,Prices in local currency)
  And I should not see (No personal finance points earned,No beauty points earned,No reward points earned,No web loyalty)

@manual @DBMTE-371
Scenario: Navigate to Debenhams Order confirmation page>validate Order confirmation page for International
  Given that I have successfully made a purchase through Credit Card as a guest user
  Then I should see the order confirmation page
  Then I should see(order number,delivery details,order summary,payment information,Prices in local currency)
  And I should not see (No personal finance points earned,No beauty points earned,No reward points earned,No web loyalty)
  And I should see create an account link

@manual @DBMTE-371
Scenario: Navigate to Debenhams Order confirmation page>validate Order confirmation page for International
  Given that I have successfully made a purchase through Credit Card as a ghost user
  Then I should see the order confirmation page
  Then I should see(order number,delivery details,order summary,payment information,Prices in local currency)
  And I should not see (No personal finance points earned,No beauty points earned,No reward points earned,No web loyalty)
  And I should see create password link
