Feature: Test Debenhams TCAT-SCAT-GLP-RSP page

@manual @DBNHST-335 to @DBNHST-339
Scenario: In the Beauty TCAT, check that there exists a Hero banner; 2 content spots followed by a slider/carousel with 6 content spots under What's Hot; 2 content spots and a CTA button under Latest Offers; one content spot with outline under Beauty Spotlight 

@manual @DBNHST-331
Scenario: In the Beauty TCAT, check that there is a Filter section with all the associated links (Categories, Brand, Price, Discount, Offers)

@manual @DBNHST-331
Scenario: On the Beauty TCAT, under the Brand filter, check that you can expand 'View 153 more' link 

@manual @DBNHST-331
Scenario: In the Beauty TCAT, check that there is a description text with a 'Read more' link that expands the paragraph when selected

@manual @DBNHST322, DBNHST-325 and DBNHST-338
Scenario: In the Women TCAT, check that there exists a Hero banner with CTA button; 6 content spots with click-through

@manual @DBNHST-331
Scenario: In the Women TCAT, check that there is a Filter section, all accordions can be expanded and selecting a brand (e.g. Mango) takes you to the right PSP

@manual @DBNHST-331
Scenario: In the Women TCAT, check that there is a description text with a 'Read more' link that expands the paragraph when selected

@manual @DBNHST-399 
Scenario: In the Sale TCAT (www.debenhams.com/sale), check that every offers section has only 4 content spots (Women offers, Beauty offers etc) 
Select first content spot udner Women's Offers, check that it takes you to the correct PSP (/sale/women/dresses)

@manual @DBNHST-322
Scenario: In the Sale TCAT, check that the clearance banner is appearing (UP TO 70% OFF FINAL REDUCTIONS)
  Given Select "Beautybutton" in the Clearance banner, check that it takes you to the correct PSP (/sale/beauty)

@manual @DBNHST-331
Scenario: Go to Beauty TCAT, check that there is a slim banner on promotions. Navigate to Makeup PSP, check that there is the same slim banner appearing

@manual @DBNHST-331
Scenario: In the Living room furniture (/furniture/living-room) SCAT, check that the Filters section exist
  Given Expand the Categories accordion and select Sofas & Chairs. Check you are directed to the correct PSP
  Then Expand Colour filter, click on "View 11 more" link, check that the search bar is not appearing.
  And Go back to (/furniture/living-room), select Furniture Store Locator. Check you are directed to correct page 

@manual @DBNHST-331
Scenario: Debenhams.com/women/new-arrivals-clothing, check that the Categories accordion is expanded by default when page loads

@manual @DBNHST-331
Scenario: Debenhams.com/sale/women, click on Shoes & boots link under Categories and check that it lands on the correct PSP 

@manual @DBNHST-321 (GLP)
Scenario: Go to Debenhams.com/content/sofas, check that there is as hero image animation
  Given Select Fabric sofas, check that you are directed to 'Brushed Cotton, Chenille...' PSP
  Then Select a product with more colour options to PDP, check that you are on the right PDP

@manual @DBNHST-321 (RSP)
Scenario: Go to Debenhams.com/content/sofas, check there are 1 content spot reserved for Buying guide and 6 content spot images underneath it displaying sofa types 
