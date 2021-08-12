Feature: Validate the layout and functionality of new Beauty club content Page

@manual @DEBD-4001
Scenario: Validate the components and features of Beauty Landing Page
  Given I navigate to "beautyLandingPage"
  Then I should see "heroBanner" exist on "beautyLandingPage"
  And I should see "debenhamsBeautyClub" exist on "hero Banner"
  And I should see "points" exist on "heroBanner"
  And I should see "freebies" exist on "heroBanner"
  And I should see "treats" exist on "heroBanner"
  And I should see "register" exist on "heroBanner"
  And I should see "signin" exist on "heroBanner"
  And I should see "seocontent" below "heroBanner" //is this SEO content?
  And I should see "Benefits" below "heroBanner" //do we have a name for this banner?
  And I should see "How to join" below "hero Banner"
  And I should see "earn" exist on "benefitsSection"
  And I should see "reward" exist on "benefitsSection"
  And I should see "Access to bonus points events" exist on "You'll also get section"
  And I should see "Free standard delivery of all orders" exist on "You'll also get section"
  And I should see "Access to exclusive free samples" exist on "You'll also get section"
  And I should see "Join Beauty Club today" exist on "banner2"
  And I should see "register" exist on "banner2"
  And I should see "gotQuestions?" exist on "beautyLandingPage"
  And I should see "FAQ link" exist on "beautyLandingPage"

@manual @DEBD-4001
Scenario: Validate the functinlaity of FAQ link on Beauty landing page
  And I should see "faqLink" exist on "beautyLandingPage"
  And I click on "faqLink" on "beautyLandingPage"
  And I should see "faqPageTitle" exist on "beautyLandingPage"

@manual @DEBD-4001
Scenario: Validate Register functionality on Beauty Landing Page Hero Banner when user is not registerd
  Given I navigate to "beautyLandingPage"
  And I should see "register" exist on "heroBanner"
  Then I click on "register" on "heroBanner"
  Then I should see "Create an Account tab" exist on "Join Beauty Club page"
  Then I should see "Email address" exist on "Beauty Club page"
  Then I should see "Create an Account" exist on "Beauty Club page"
  And I enter email in "Email address" on "Beauty Club page"
  And I click on "Create an Account" on "Beauty Club page"
  Then I should see "Create an Account form" exist on "Create an Account Page"
  Then I select "Mrs" from "Title" on "Create an Account Page"
  Then I enter "Test" in "First Name" on "Create an Account Page"
  Then I enter "Landing" in "Last Name" on "Create an Account Page"
  Then I enter "test@landing.com" in "Email Address" on "Create an Account Page"
  Then I enter "1234" in "Password" on "Create an Account Page"
  And I click on "Create an Account button" on "Create an Account Page"
  Then I should see "Thank you for Registering" exist on "Your new account Page"
  Then I should see "Create your Beauty Club Account button" exist on "Your new account Page"
  When I click on "Create your Beauty Club Account button" on "Your new account Page"
  And I should see "Beauty club registration" exist on "beauty club regitration page"


@manual @DEBD-4001
Scenario: Validate Register functionality in Join Beauty Club of Beauty Landing Page for the user whose beauty club registration has been completed
  Given I logout
  When I navigate to "beautyLandingPage"
  Then I should see "Join Beauty Club today" exist on "beautyLandingPage"
  Then I click on "register" on "Join Beauty Club today"
  And I enter "abc@abc.com" in "Email address" on "Beauty Club page"
  And I enter "1234" in "Password" on "Beauty Club page"
  And I click on "Sign in" on "Beauty Club page"
  And I should see "Welcome to your Beauty Club Account" exist on "Beauty Landing Page"
  And I should see "My points" exist on "Beauty Landing Page"
  And I should see "My rewards" exist on "Beauty Landing Page"


@manual @DEBD-4001
Scenario: Validate Register functionality in Join Beauty Club of Beauty Landing Page for the user who is not registred for beauty club
  Given I logout
  When I navigate to "beautyLandingPage"
  Then I should see "Join Beauty Club today" exist on "beautyLandingPage"
  Then I click on "register" on "Join Beauty Club today"
  And I enter "abc@abc.com" in "Email address" on "Beauty Club page"
  And I enter "1234" in "Password" on "Beauty Club page"
  And I click on "Sign in" on "Beauty Club page"
  Then I should not see "No Beauty Club Card linked" on "Manage Account"
  And I click on "I dont have a Beauty Club Card" on "Manage Account"
  And I enter "11/11/1990" in "Date of Birth" on "Manage Account"
  And I click on "I agree terms and Conditions" on "Manage Account"
  Then I click on "Continue" on "Manage Account"
  And I should see "Address" exist on "Manage Account"
  Then I enter "Test" in "firstName" on "Manage Account"
  Then I enter "Beauty" in "lastName" on "Manage Account"
  Then I enter "079898989898" in "phoneNumber" on "Manage Account"
  Then I enter "E149LN" in "findAddress" on "Manage Account"
  And I click on "Complete Registration" on "Manage Account"
  And I should see "Welcome to your Beauty Club Account" exist on "Beauty Landing Page"
  And I should see "My points" exist on "Beauty Landing Page"
  And I should see "My rewards" exist on "Beauty Landing Page"

@manual @DEBD-4001
Scenario: Validate Sign in functionality on Beauty Landing Page Hero Banner and  complete the beauty club registration with no beauty card linked
  Given I navigate to "beautyLandingPage"
  Then I should see "heroBanner" exist on "beautyLandingPage"
  And I should see "debenhamsBeautyClub" exist on "hero Banner"
  And I should see "Sign in" exist on "heroBanner"
  Then I click on "Sign in" on "heroBanner"
  Then I should see "Sign in Tab" exist on "Join Beauty Club page"
  Then I should see "Email address" exist on "Beauty Club page"
  Then I should see "Password" exist on "Beauty Club page"
  Then I should see "Forgot your password?" exist on "Beauty Club page"
  Then I should see "Sign in" exist on "Beauty Club page"
  Then I should see "New to Debenhams?" exist on "Beauty Club page"
  Then I should see "Create an Account" exist on "Beauty Club page"
  And I enter "abc@abc.com" in "Email address" on "Beauty Club page"
  And I enter "1234" in "Password" on "Beauty Club page"
  And I click on "Sign in" on "Beauty Club page"
  Then I should not see "No Beauty Club Card linked" on "Manage Account"
  And I click on "I dont have a Beauty Club Card" on "Manage Account"
  And I enter "11/11/1990" in "Date of Birth" on "Manage Account"
  And I click on "I agree terms and Conditions" on "Manage Account"
  Then I click on "Continue" on "Manage Account"
  And I should see "Address" exist on "Manage Account"
  Then I enter "Test" in "firstName" on "Manage Account"
  Then I enter "Beauty" in "lastName" on "Manage Account"
  Then I enter "079898989898" in "phoneNumber" on "Manage Account"
  Then I enter "E149LN" in "findAddress" on "Manage Account"
  And I click on "Complete Registration" on "Manage Account"
  And I should see "Welcome to your Beauty Club Account" exist on "Beauty Landing Page"
  And I should see "My points" exist on "Beauty Landing Page"
  And I should see "My rewards" exist on "Beauty Landing Page"

@manual @DEBD-4001
Scenario: Validate the functionality when user is already registerd for Beauty Club but not logged in
  Given I navigate to "beautyLandingPage"
  Then I should see "heroBanner" on "beautyLandingPage"
  And I should see "debenhamsBeautyClub" on "hero Banner"
  And I should see "Sign in" on "heroBanner"
  Then I click on "Sign in" on "heroBanner"
  Then I should see "Sign in Tab" selected on "Join Beauty Club page"
  Then I should see "Email address" on "Beauty Club page"
  Then I should see "Password" on "Beauty Club page"
  Then I should see "Forgot your password?" on "Beauty Club page"
  Then I should see "Sign in" on "Beauty Club page"
  Then I should see "New to Debenhams?" on "Beauty Club page"
  Then I should see "Create an Account" on "Beauty Club page"
  And I enter "abc@abc.com" in "Email address" on "Beauty Club page"
  And I enter "1234" in "Password" on "Beauty Club page"
  And I click on "Sign in" on "Beauty Club page"
  And I should see "Welcome to your Beauty Club Account" exist on "Beauty Landing Page"
  And I should see "My points" exist on "Beauty Landing Page"
  And I should see "My rewards" exist on "Beauty Landing Page"

@manual @DEBD-4001
Scenario: Validate the functionality when user is already registerd and Beauty Club Card is linked
  Given I navigate to "beautyLandingPage"
  Then I should see "heroBanner" exist on "beautyLandingPage"
  And I should see "debenhamsBeautyClub" exist on "hero Banner"
  And I should see "Sign in" exist on "heroBanner"
  Then I click on "Sign in" on "heroBanner"
  Then I should see "Sign in Tab" exist on "Join Beauty Club page"
  Then I should see "Email address" on "Beauty Club page"
  Then I should see "Password" on "Beauty Club page"
  Then I should see "Forgot your password?" on "Beauty Club page"
  Then I should see "Sign in" on "Beauty Club page"
  Then I should see "New to Debenhams?" on "Beauty Club page"
  Then I should see "Create an Account" on "Beauty Club page"
  And I enter "abc@abc.com" in "Email address" on "Beauty Club page"
  And I enter "1234" in "Password" on "Beauty Club page"
  And I click on "Sign in" on "Beauty Club page"
  And I should see "Welcome to your Beauty Club Account" exist on "Beauty Landing Page"
  And I should see "My points" exist on "Beauty Landing Page"
  And I should see "My rewards" exist on "Beauty Landing Page"

@manual @DEBD-4001
Scenario: Validate the components and features of "howToJoin" on Beauty Landing Page
  Given I navigate to "beautyLandingPage"
  Then I should see "heroBanner" on "beautyLandingPage"
  And I should see "howToJoin" exist on "heroBanner"
  And I click on "howToJoin" on "heroBanner"
  And I should see "To join the Beauty Club you'll need an online login" exist on "howToJoin Section"
  And I should see link "Click here to sign in" on "howToJoin Section"
  And I should see text "Click here to register" on "howToJoin Section"
  And I should see "Join Beauty Club today" on "banner2"
  And I should see "Register" on "banner2"
  And I should see "gotQuestions?" on "beautyLandingPage"

@manual @DEBD-4001
Scenario: Validate the functionality of new user in  "howToJoin" sectio of Beauty Landing Page
  Given I logout
  Given I navigate to "beautyLandingPage"
  And I should see "How to Join" exist on "Beauty Landing page"
  And I click on "How to Join" on "Beauty Landing page"
  And I click on "If you don't have a login yet Click here to register" on "Beauty Landing page"
  Then I should see "Create an Account tab" exist on "Join Beauty Club page"
  Then I should see "Email address" exist on "Beauty Club page"
  Then I should see "Create an Account" exist on "Beauty Club page"
  And I enter email in "Email address" on "Beauty Club page"
  And I click on "Create an Account" on "Beauty Club page"
  Then I should see "Create an Account form" exist on "Create an Account Page"
  Then I select "Mrs" from "Title" on "Create an Account Page"
  Then I enter "Test" in "First Name" on "Create an Account Page"
  Then I enter "Landing" in "Last Name" on "Create an Account Page"
  Then I enter "test@landing.com" in "Email Address" on "Create an Account Page"
  Then I enter "1234" in "Password" on "Create an Account Page"
  And I click on "Create an Account button" on "Create an Account Page"
  Then I should see "Thank you for Registering" exist on "Your new account Page"
  Then I should see "Create your Beauty Club Account button" exist on "Your new account Page"

@manual @DEBD-4001
Scenario: Validate the functionality of registered user in  "howToJoin" sectio of Beauty Landing Page
  Given I navigate to "beautyLandingPage"
  And I click on "Already a registered user? Click here to sign in" on "Beauty Landing page"
  Then I should not see "No Beauty Club Card linked" on "Manage Account"
  And I click on "Link your card" on "Beauty Club page"
  And I click on "I dont have a Beauty Club Card" on "Manage Account"
  And I enter "11/11/1990" in "Date of Birth" on "Manage Account"
  And I click on "I agree terms and Conditions" on "Manage Account"
  Then I click on "Continue" on "Manage Account"
  And I should see "Address" exist on "Manage Account"
  Then I enter "Test" in "firstName" on "Manage Account"
  Then I enter "Beauty" in "lastName" on "Manage Account"
  Then I enter "079898989898" in "phoneNumber" on "Manage Account"
  Then I enter "E149LN" in "findAddress" on "Manage Account"
  And I click on "Complete Registration" on "Manage Account"
  And I should see "Welcome to your Beauty Club Account" exist on "Beauty Landing Page"
  And I should see "My points" exist on "Beauty Landing Page"
  And I should see "My rewards" exist on "Beauty Landing Page"

@manual @DEBD-4001
Scenario: Validate Sign In from My beauty Club(header) should redirect user to My Beauty Card Linked page
  Given I navigate to "beautyLandingPage"
  And I click on "Already a registered user? Click here to sign in" on "Beauty Landing page"
  And I click on "debsLogo" on "commonPage"
  And I should see "myBeautyClubLink" exist on "commonPage"
  When I click on "myBeautyClubLink" on "commonPage"
  And I should see "headerSubTitleText" as "Welcome to your Beauty Club Account" on "beautyClubPage"
  And I should see "noCardLinkedHeaderText" as "No Beauty Club Card linked" on "beautyClubPage"
  And I should see "noCardLinkedText" as "Link your card to your Debenhams account so you can:" on "beautyClubPage"
  And I should see "linkCardButton" exist on "beautyClubPage"
  And I should not see "dashboardTab1" on "beautyClubPage"
  And I should not see "dashboardTab2" on "beautyClubPage"
  And I should not see "beautyPoints" on "beautyClubPage"





