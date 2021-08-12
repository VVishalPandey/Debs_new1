Feature: Validation of the search redirect functionality

@automated @DEBD-1904 @Fixed @Issue-CreditCards
Scenario Outline: Validate the search redirects are working as expected
  Given I navigate to "homeURL"
  Then I should see "searchBar" exist on "commonPage"
	When I click on "searchBar" on "commonPage"
	And  I enter "<searchTerm>" in "searchBar" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "url" contains "<redirectURL>"

  Examples:
    | searchTerm              | redirectURL                       |
    | loyalty points          | urlPartOf_financeloyaltyLink      |
    | register loyalty card   | urlPartOf_financeloyaltyLink      |
    | loyaly card             | urlPartOf_financeloyaltyLink      |
    | loyalty rewards         | urlPartOf_financeloyaltyLink      |
    | loyalty scheme          | urlPartOf_financeloyaltyLink      |
    | loyalty                 | urlPartOf_financeloyaltyLink      |
    | debenhams loyalty card  | urlPartOf_financeloyaltyLink      |
    | personal shopper        | urlPartOf_personalShopLink        |
    | personal shop           | urlPartOf_personalShopLink        |
    | personal helper         | urlPartOf_personalShopLink        |
    | holiday insurance       | urlPartOf_insuranceLink           |
    | insurance               | urlPartOf_insuranceLink           |
    | phone insurance         | urlPartOf_insuranceLink           |
    | mobile phone insurance  | urlPartOf_insuranceLink           |
    | holiday insurance       | urlPartOf_insuranceLink           |
    | holiday insurance       | urlPartOf_insuranceLink           |
    | holiday insurance       | urlPartOf_insuranceLink           |
    | holiday insurance       | urlPartOf_insuranceLink           |
    | holiday insurance       | urlPartOf_insuranceLink           |
    | gadget insurance| urlPartOf_insuranceLink |
    | storecard| urlPartOf_debenhamsCardLink |
    | debenhams storecard| urlPartOf_debenhamsCardLink |
    | credit Card| urlPartOf_debenhamsCardLink |
    | Credit Cards| urlPartOf_debenhamsCardLink |
    | mastercard| urlPartOf_debenhamsCardLink |
    | cardholder benefits| urlPartOf_debenhamsCardLink |
    | pre-pay card| urlPartOf_debenhamsCardLink |
    | pre pay card| urlPartOf_debenhamsCardLink |
    | prepay card| urlPartOf_debenhamsCardLink |
    | prepaid card| urlPartOf_debenhamsCardLink |
    | visa|urlPartOf_debenhamsCardLink |
    | debit card| urlPartOf_debenhamsCardLink |
    | payg card| urlPartOf_debenhamsCardLink |
    | pay as you go card| urlPartOf_debenhamsCardLink |
    | store card| urlPartOf_debenhamsCardLink |
    | store cards| urlPartOf_debenhamsCardLink |
    | activate card| urlPartOf_debenhamsCardLink |
    | home insurance| urlPartOf_homeInsuranceLink |
    | home contents| urlPartOf_homeInsuranceLink |
    | home cover| urlPartOf_homeInsuranceLink |
    | contents insurance| urlPartOf_homeInsuranceLink |
    | buildings insurance| urlPartOf_homeInsuranceLink |
    | apartment insurance| urlPartOf_homeInsuranceLink |
    | flat insurance| urlPartOf_homeInsuranceLink |
    | contents only| urlPartOf_homeInsuranceLink |
    | household| urlPartOf_homeInsuranceLink |
    | tenant| urlPartOf_homeInsuranceLink |
    | landlord| urlPartOf_homeInsuranceLink |
    | second home cover| urlPartOf_homeInsuranceLink |
    | quote| urlPartOf_homeInsuranceLink |
    | property insurance| urlPartOf_homeInsuranceLink |
    | content cover| urlPartOf_homeInsuranceLink |
    | wedding insurance| urlPartOf_weddingInsuranceLink |
    | debenhams marriage insurance| urlPartOf_weddingInsuranceLink |
    | debenhams wedding insurance| urlPartOf_weddingInsuranceLink |
    | debenhams wedding insurance cover| urlPartOf_weddingInsuranceLink |
    | debenhams marriage insurance cover| urlPartOf_weddingInsuranceLink |
    | debenham wedding cover| urlPartOf_weddingInsuranceLink |
    | debenham wedding insurance| urlPartOf_weddingInsuranceLink |
    | debenham wedding insurance cover| urlPartOf_weddingInsuranceLink |
    | debenham wedding insurance quote| urlPartOf_weddingInsuranceLink |
    | debenham wedding insurer| urlPartOf_weddingInsuranceLink |
    | wedding cover debenhams| urlPartOf_weddingInsuranceLink |
    | wedding insurance cover debenhams| urlPartOf_weddingInsuranceLink |
    | wedding insurance debenhams| urlPartOf_weddingInsuranceLink |
    | wedding insurance quote debenhams| urlPartOf_weddingInsuranceLink |
    | wedding insurancedebenhams| urlPartOf_weddingInsuranceLink |
    | wedding insurer debenhams| urlPartOf_weddingInsuranceLink |
    | dbenhams wedding insurance| urlPartOf_weddingInsuranceLink |
    | ddebenhams wedding insurance| urlPartOf_weddingInsuranceLink |
    | debanhams wedding insurance| urlPartOf_weddingInsuranceLink |
    | debehams wedding insurance| urlPartOf_weddingInsuranceLink |
    | debehnams wedding insurance| urlPartOf_weddingInsuranceLink |
    | debenahms wedding insurance| urlPartOf_weddingInsuranceLink |
    | debenams wedding insurance| urlPartOf_weddingInsuranceLink |
    | debenhams weding insurance| urlPartOf_weddingInsuranceLink |
    | debenhans wedding insurance| urlPartOf_weddingInsuranceLink |
    | denenhams wedding insurance| urlPartOf_weddingInsuranceLink |
    | ebenhams wedding insurance| urlPartOf_weddingInsuranceLink |
    | wedding insurence debenhams| urlPartOf_weddingInsuranceLink |
    | insure wedding clothes| urlPartOf_weddingInsuranceLink |
    | wedding dress insurance| urlPartOf_weddingInsuranceLink |
    | debenhams wedding dress insurance| urlPartOf_weddingInsuranceLink |
    | pet insurance| urlPartOf_petInsuranceLink |
    | cat insurance| urlPartOf_petInsuranceLink |
    | dog insurance| urlPartOf_petInsuranceLink |
    | dog cover| urlPartOf_petInsuranceLink |
    | pet cover| urlPartOf_petInsuranceLink |
    | pet insurance quote| urlPartOf_petInsuranceLink |
    | canine insurance| urlPartOf_petInsuranceLink |
    | dog health| urlPartOf_petInsuranceLink |
    | cat health| urlPartOf_petInsuranceLink |
    | debenhams cat insurance| urlPartOf_petInsuranceLink |
    | debenhams dog insurance| urlPartOf_petInsuranceLink |
    | debenhams cat insurance cover| urlPartOf_petInsuranceLink |
    | debenhams dog insurance cover| urlPartOf_petInsuranceLink |
    | debanhams pet insurance| urlPartOf_petInsuranceLink |
    | debenahms pet insurance| urlPartOf_petInsuranceLink |
    | pet insurance debenhams| urlPartOf_petInsuranceLink |
    | buy debenhams pet insurance| urlPartOf_petInsuranceLink |
    | buy debenhams cat insurance| urlPartOf_petInsuranceLink |
    | buy debenhams dogs insurance| urlPartOf_petInsuranceLink |
    | buy debenhams cat insurance cover| urlPartOf_petInsuranceLink |
    | buy debenhams cat insurance quote| urlPartOf_petInsuranceLink |
    | buy cat insurance debenhams| urlPartOf_petInsuranceLink |
    | buy cat insurance cover debenhams| urlPartOf_petInsuranceLink |
    | buy cat insurance quote debenhams| urlPartOf_petInsuranceLink |
    | buy pet insurance debenhams| urlPartOf_petInsuranceLink |
    | buy debenhams pets insurance| urlPartOf_petInsuranceLink |
    | buy dog insurance debenhams| urlPartOf_petInsuranceLink |
    | buy dog insurance cover debenhams| urlPartOf_petInsuranceLink |
    | buy dog insurance quote debenhams| urlPartOf_petInsuranceLink |
    | buy pet insurance cover debenhams| urlPartOf_petInsuranceLink |
    | buy pet insurance quote debenhams| urlPartOf_petInsuranceLink |
    | debenhams cat cover| urlPartOf_petInsuranceLink |
    | debenhams dog cover| urlPartOf_petInsuranceLink |
    | debenhams cat insurance quote| urlPartOf_petInsuranceLink |
    | debenhams dog insurance quote| urlPartOf_petInsuranceLink |
    | debenhams cat insurer| urlPartOf_petInsuranceLink |
    | debenhams dog insurer| urlPartOf_petInsuranceLink |
    | debenhams cats insurance| urlPartOf_petInsuranceLink |
    | debenhams cats insurance cover| urlPartOf_petInsuranceLink |
    | debenhams cat insurance quotes| urlPartOf_petInsuranceLink |
    | debenhams pets cover| urlPartOf_petInsuranceLink |
    | cat cover debenhams| urlPartOf_petInsuranceLink |
    | cat insurance cover debenhams| urlPartOf_petInsuranceLink |
    | cat insurance quote debenhams| urlPartOf_petInsuranceLink |
    | dog insurance cover debenhams| urlPartOf_petInsuranceLink |
    | dog insurance quote debenhams| urlPartOf_petInsuranceLink |
    | debenham cat insurance| urlPartOf_petInsuranceLink |
    | debenham dog insurance| urlPartOf_petInsuranceLink |
    | cats insurance cover debenhams| urlPartOf_petInsuranceLink |
    | dogs insurance cover debenhams| urlPartOf_petInsuranceLink |
    | credit card| urlPartOf_creditCardLink |
    | credit card account| urlPartOf_creditCardLink |
    | credit card log in| urlPartOf_creditCardLink |
    | credit card login| urlPartOf_creditCardLink |
    | credit card management| urlPartOf_creditCardLink |
    | credit card online| urlPartOf_creditCardLink |
    | credit card payment| urlPartOf_creditCardLink |
    | credit card payments| urlPartOf_creditCardLink |
    | credit card services| urlPartOf_creditCardLink |
    | creditcard| urlPartOf_creditCardLink |
    | creditcard payment| urlPartOf_creditCardLink |
    | debenham credit card| urlPartOf_creditCardLink |
    | debenhams card| urlPartOf_creditCardLink |
    | debenhams credit card| urlPartOf_creditCardLink |
    | debenhams credit card payment| urlPartOf_creditCardLink |
    | debenhams credit cards| urlPartOf_creditCardLink |
    | debenhams master card| urlPartOf_creditCardLink |
    | debenhams master cards| urlPartOf_creditCardLink |
    | debenhams mastercard| urlPartOf_creditCardLink |
    | debenhams mastercard registeration| urlPartOf_creditCardLink |
    | manage credit card| urlPartOf_creditCardLink |
    | master card| urlPartOf_creditCardLink |
    | mastercard application| urlPartOf_creditCardLink |
    | my credit card account| urlPartOf_creditCardLink |
    | open mastercard account| urlPartOf_creditCardLink |
    | pay credit card| urlPartOf_creditCardLink |
    | pay credit card account| urlPartOf_creditCardLink |
    | pay credit card bill| urlPartOf_creditCardLink |
    | pay credit card bill on line| urlPartOf_creditCardLink |
    | pay my credit card| urlPartOf_creditCardLink |
    | pay off credit card| urlPartOf_creditCardLink |
    | paying credit card| urlPartOf_creditCardLink |
    | paying credit card bill| urlPartOf_creditCardLink |
    | travel insurance| urlPartOf_travelInsuranceLink |
    | survey| urlPartOf_debenhamsFeedbackLink |
    | suit hire| urlPartOf_formalHireLink |
    | formal hire| urlPartOf_formalHireLink |
    | mens formal hire| urlPartOf_formalHireLink |
    | mens suit hire| urlPartOf_formalHireLink |
    | lost card| urlPartOf_financeCardLink |
    | stolen card| urlPartOf_financeCardLink |
    | car insurance| urlPartOf_carInsuranceLink |
    | motor insurance| urlPartOf_carInsuranceLink |
    | vehicle insurance| urlPartOf_carInsuranceLink |
    | tpft| urlPartOf_carInsuranceLink |
    | comprehensive cover| urlPartOf_carInsuranceLink |
    | third party cover| urlPartOf_carInsuranceLink |
    | quotes| urlPartOf_carInsuranceLink |
    | payg cover| urlPartOf_carInsuranceLink |
    | short term insurance| urlPartOf_carInsuranceLink |
    | pass plus insurance| urlPartOf_carInsuranceLink |
    | named driver insurance| urlPartOf_carInsuranceLink |
    | car insurance debenhams| urlPartOf_carInsuranceLink |
    | debenhams auto insurance| urlPartOf_carInsuranceLink |
    | debenhams car cover| urlPartOf_carInsuranceLink |
    | debenhams car insurance| urlPartOf_carInsuranceLink |
    | debenhams motor insurance| urlPartOf_carInsuranceLink |
    | debenhams.com car insurance| urlPartOf_carInsuranceLink |
    | car insurance uk| urlPartOf_carInsuranceLink |
    | car insurence| urlPartOf_carInsuranceLink |
    | car insurer| urlPartOf_carInsuranceLink |
    | car insurers| urlPartOf_carInsuranceLink |
    | insurance for car| urlPartOf_carInsuranceLink |
    | car insurance quote| urlPartOf_carInsuranceLink |
    | car insurance quotes| urlPartOf_carInsuranceLink |
    | car insurance quote uk| urlPartOf_carInsuranceLink |
    | car insurance quotes uk| urlPartOf_carInsuranceLink |
    | car quote| urlPartOf_carInsuranceLink |
    | motor insurance policy| urlPartOf_carInsuranceLink |
    | motor insurance policies| urlPartOf_carInsuranceLink |
    | motor insurance cover| urlPartOf_carInsuranceLink |
    | motor insurance uk| urlPartOf_carInsuranceLink |
    | motor insurance in uk| urlPartOf_carInsuranceLink |
    | motor insurance quote| urlPartOf_carInsuranceLink |
    | motor insurance quotes| urlPartOf_carInsuranceLink |
    | motor insurer| urlPartOf_carInsuranceLink |
    | motor insurers| urlPartOf_carInsuranceLink |
    | car insurance premium| urlPartOf_carInsuranceLink |
    | car insurance premiums| urlPartOf_carInsuranceLink |
    | motor insurance premium| urlPartOf_carInsuranceLink |
    | motor insurance premiums| urlPartOf_carInsuranceLink |
    | motor insurence| urlPartOf_carInsuranceLink |
    | online car insurance| urlPartOf_carInsuranceLink |
    | online motor insurance| urlPartOf_carInsuranceLink |
    | car insurance online| urlPartOf_carInsuranceLink |
    | motor insurance online| urlPartOf_carInsuranceLink |
    | debenhams store card| urlPartOf_storeCardLink |
    | apply for store card| urlPartOf_storeCardLink |
    | apply store card| urlPartOf_storeCardLink |
    | store card application| urlPartOf_storeCardLink |
    | apply for a store card| urlPartOf_storeCardLink |
    | debenham store card| urlPartOf_storeCardLink |
    | additional store card| urlPartOf_storeCardLink |
    | getting a store card| urlPartOf_storeCardLink |
    | instore card| urlPartOf_storeCardLink |
    | apply for debenhams store card| urlPartOf_storeCardLink |
    | gold store card| urlPartOf_storeCardLink |
    | apply debenhams store card| urlPartOf_storeCardLink |
    | additional debenham store card| urlPartOf_storeCardLink |
    | how to apply for a store card| urlPartOf_storeCardLink |
    | gold card| urlPartOf_storeCardLink |
    | gold cards| urlPartOf_storeCardLink |
    | platinum card| urlPartOf_storeCardLink |
    | account card| urlPartOf_storeCardLink |
    | jobs| urlPartOf_careerLink |
    | job| urlPartOf_careerLink |
    | job opportunities| urlPartOf_careerLink |
    | careers| urlPartOf_careerLink |
    | management trainee programme| urlPartOf_careerLink |
    | graduate programme| urlPartOf_careerLink |
    | vacancies| urlPartOf_careerLink |
    | recruitment| urlPartOf_careerLink |
    | recruit| urlPartOf_careerLink |
    | job vacancies| urlPartOf_careerLink |
    | career| urlPartOf_careerLink |
    | christmas jobs| urlPartOf_careerLink |
    | blow| urlPartOf_blowLink |
    | blow ltd| urlPartOf_blowLink |