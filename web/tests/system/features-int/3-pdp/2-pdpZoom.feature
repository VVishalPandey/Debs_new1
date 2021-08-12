Feature: Implement PDP zoom fixes

@manual @DDAI-969
Scenario Outline: Validate PDP zoom functionality on PDP
When I singularly tap on the "<PDP>" image
Then I should see image open full screen
And I should see image centered
And I should see a close button on the top right

Examples:
| PDP       |
| Beauty    |
| Furniture |
| Chanel    |

@manual @DDAI-969
Scenario Outline: Validate PDP close button on zoom functionality on PDP
When I singularly tap on the PDP image
Then I should see image open full screen
And I should see image centered
And I should see a close button on the top right
When I click on close button
Then zoom image should close
And I should seen the image module

Examples:
| PDP       |
| Beauty    |
| Furniture |
| Chanel    |

@manual @DDAI-969
Scenario Outline: Validate swipe functionality on image module  PDP
Given I am on PDP image
And I have opened the image module
Then I should be able to swipe through the image carousel both right and left
Then I should see previous and next images

Examples:
| PDP       |
| Beauty    |
| Furniture |
| Chanel    |

@manual @DDAI-969
Scenario Outline: Validate scroll functionality on image module  PDP
Given I am on PDP image
And I have opened the image module
Then  I should be able to use the arrows to scroll through the image carousel both right and left
Then I should see previous and next images

Examples:
| PDP       |
| Beauty    |
| Furniture |
| Chanel    |

@manual @DDAI-969
Scenario Outline: Validate pinch to zoom functionality should not work
Given I am on PDP
And I have opened the image module
And I pinch to zoom
Then the image should not zoom in

Examples:
| PDP       |
| Beauty    |
| Furniture |
| Chanel    |

@manual @DDAI-969
Scenario Outline: Validate pinch to zoom functionality should not work
Given I am on  PDP
And I pinch to zoom
Then the image should not zoom in

Examples:
| PDP       |
| Beauty    |
| Furniture |
| Chanel    |

@manual @DDAI-969
Scenario Outline: Validate if user clicks on alternative images
Given I am on the PDP page
When I click on the alternative images
Then the image should update without the user making another interaction with the image/module

Examples:
| PDP       |
| Beauty    |
| Furniture |
| Chanel    |
