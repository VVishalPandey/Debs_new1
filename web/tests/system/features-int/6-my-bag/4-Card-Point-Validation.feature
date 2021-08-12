Feature: Test Debenhams Card Point validation on my bag

@manual @DDAI-344
Scenario: Navigate to Debenhams my bag page And validate no beauty club or Debenhams credit card points messaing
  Given I am on DOTINT
  And I am on my bag
  Then I should see NO points messaging at all
