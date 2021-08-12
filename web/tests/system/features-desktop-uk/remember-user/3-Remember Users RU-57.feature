Feature: Test no login required to view SFL if user gets time out

@manual @DDAI-801 @awsManual
Scenario: Navigate SFL page from burger menu -> validate no login required after session time out

@manual @DDAI-801 @awsManual
Scenario: Navigate SFL section from My bag -> validate no login required after session time out

@manual @DDAI-801 @awsManual
Scenario: Navigate  My bag with product added -> After Session time out, move products to SFL -> validate products are moved to SFL -> no login required after session time out

@manual @DDAI-801 @awsManual
Scenario: Navigate  SFL (my bag page) with product added after Session time out-> move products from SFL to My bag -> validate products are moved to my bag -> no login required after session time out

@manual @DDAI-801 @awsManual
Scenario: Navigate  My bag with product added as guest user-> After 30 mins(Session time out), move products to SFL -> validate products are moved to SFL -> User should asked for login or continue shopping

@manual @DDAI-801 @awsManual
Scenario: Navigate to My bag with product added -> After Session time out, try to remove product from basket --> from Remove alert pop up move products to SFL -> validate products are moved to SFL -> no login required after session time out

@manual @DDAI-801 @awsManual
Scenario: Validate after session time out user is able to move products from SFL to my bag, also validate mini bag count should get updated accordingly --> validate no login required after session time out
