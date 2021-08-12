Feature: Validate Debenhams payment Page>Candaian or German Site>validate marketing preferences is opted out by default when marketing prefernce is not selected previously

@manual @DBMTE-354
Scenario: Navigate to Debenhams payment Page>Candaian or German Site>validate marketing preferences is opted out by default when marketing prefernce is not selected previously
  Given that I am on the German or Canadian site
  And I have not previously selected a marketing preference (on my account)
  When I am on the payment page
  Then the marketing preferences is opted out by default (checkbox is not selected)

@manual @DBMTE-354
Scenario: Navigate to Debenhams payment Page>Any otherSite>validate marketing preferences is opted in by default when marketing prefernce is not selected previously
  Given  that I am on any other site as a guest user
  And I have not previously selected a marketing preference (on my account)
  When I am on the payment page
  Then the marketing preferences is opted in by default (checkbox is selected)

@manual @DBMTE-354
Scenario: Navigate to Debenhams payment Page>Any otherSite>Validate marketing preference will match what is on my account
  Given I have a marketing preference on my account
  When I am on the payment page
  Then  the marketing preference will match what is on my account
