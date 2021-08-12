Feature: Test Debenhams bundle pdp validation

@manual @DBNHST-1812
Scenario: Navigate to Debenhams luggage bundle and validate that the products should be stach in grid view (validate in both portrait and landscape view)
  Given i navigate to luggage bundle like (https://www.debenhams.com/webapp/wcs/stores/servlet/prod_10701_10001_36536+T44366b_-1)
  Then i should see the products should be stach in grid view rather than vertically like in mobile (validate in both portrait and landscape view)

@manual @DBNHST-1812
Scenario: Navigate to Debenhams dinnerware bundle and validate that the products should be stach in grid view (validate in both portrait and landscape view)
  Given i navigate to dinnerware bundle like (https://www.debenhams.com/home/tableware/matching-tableware)
  Then i should see the products should be stach in grid view rather than vertically like in mobile (validate in both portrait and landscape view)

@manual @DBNHST-1812
Scenario: Navigate to Debenhams suits pdp and validate that the products should be stached vertically (validate in both portrait and landscape view)
  Given i navigate to suits pdp like (https://www.debenhams.com/webapp/wcs/stores/servlet/prod_10701_10001_46497+0039372SB_-1)
  Then i should see the products should be stached vertically (validate in both portrait and landscape view)
