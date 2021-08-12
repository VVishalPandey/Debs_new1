Feature: Test Debenhams payment page

@manual @DBNHST-1757
Scenario: Navigate to Debenhams payment page and validate that we are able to see the "Apply promo code" CTA below the delivery method details

@manual @DBNHST-1757
Scenario: Navigate to Debenhams payment page and validate that we are able to see the "Redeem gift card" CTA on the right side of the promo code CTA

@manual @giftcard
Scenario: Navigate to Debenhams payment page and validate that the "Redeem gift card" is clickable

@manual @promocode
Scenario: Navigate to Debenhams payment page and validate that the "Apply promo code" is clickable

@manual @promocode
Scenario: Navigate to Debenhams payment page and validate that the user is able to add new promocode

@manual @promocode
Scenario: Navigate to Debenhams payment page and validate that the user is able to remove a promo code

@manual @promocode
Scenario: Navigate to Debenhams payment page after adding a promo code on my bag page and validate that the user is able to see the applied promocode

@manual @promocode
Scenario: Navigate to Debenhams payment page and validate that the user is able to add more than one promocode on the payment page

@manual @promocode
Scenario: Navigate to Debenhams payment page and validate that the error is displayed on applying a duplicate promocode

@manual @promocode
Scenario: Navigate to Debenhams payment page and validate that the error is displayed on applying an incorrect promocode

@manual @promocode
Scenario: Navigate to Debenhams payment page and validate that the applied promocode amount is getting updated in the total to pay amount

@manual @giftcard
Scenario: Navigate to Debenhams payment page and validate that the we are able to apply a valid giftcard successfully

@manual @giftcard
Scenario: Navigate to Debenhams payment page and validate that the we are able to apply more than one valid giftcard successfully if the total to pay amount is not fulfilled in one

@manual @giftcard
Scenario: Navigate to Debenhams payment page and validate that the we are able to apply a valid giftcard successfully

@manual @giftcard
Scenario: Navigate to Debenhams payment page and validate that the we are able to see "Redeem giftcard" as disabled if the total to pay is already fulfilled by giftcard

@manual @giftcard
Scenario: Navigate to Debenhams payment page and validate that the we are able to see apply more giftcard if the total to pay amount is totally not fulfilled by giftcard

@manual @giftcard
Scenario: Navigate to Debenhams payment page and validate that the we getting an error when applying with a valid giftcard number but invalid pin

@manual @giftcard
Scenario: Navigate to Debenhams payment page and validate that the we getting an error when applying with a invalid giftcard number but correct pin

@manual @giftcard
Scenario: Navigate to Debenhams payment page and validate that the we getting an error when applying with a invalid giftcard number but invalid pin

@manual @giftcard
Scenario: Navigate to Debenhams payment page and validate that the we getting an error when we leave giftcard number and pin as blank when applying

@manual @giftcard
Scenario: Navigate to Debenhams payment page and validate that the applied giftcard value is getting updated in the total to pay amount

@manual @giftcard
Scenario: Navigate to Debenhams payment page and validate that the we are able to remove the applied giftcard from the payment page

@manual @giftcard
Scenario: Navigate to Debenhams payment page and validate that the we are able to see the updated total to pay amount after removing the apllied giftcard