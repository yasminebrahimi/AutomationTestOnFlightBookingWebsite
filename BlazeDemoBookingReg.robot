*** Settings ***
Library    SeleniumLibrary
Library    String
Library    XML


*** Test Cases ***
Assignment5

    #1. Siirry sivulle http://blazedemo.com/ 
    Open Browser    http://blazedemo.com    Chrome
    Maximize Browser Window
    Sleep    2

    #2. Tarkista, että sivulla lukee "Welcome to the Simple Travel Agency!"
    Page Should Contain    Welcome to the Simple Travel Agency!


    #3. Valitse lähtökaupungiksi "Boston" (kirjoita tämä tieto muuttujaan)
    Click Element    name:fromPort
    Select From List By Label    name:fromPort    Boston

    Sleep    1


    #4. Valitse määränpääksi "Cairo" (kirjoita tämä tieto muuttujaan)
    Click Element    name:toPort
    Select From List By Label    name:toPort    Cairo

    Sleep    1

    #5.Tarkista, että Find Flights nappi on valittavissa
    #6. Paina Find Flights nappia 
    Click Button    //input[@value='Find Flights']

    Sleep    2


    #7. Tarkista, että sivulla lukee Flights from Boston to Cairo: (anna kaupunkien nimet luomillasi muuttujilla)
    Page Should Contain    Flights from Boston to Cairo:

    Sleep    1

    #8. Tarkista, että sinulla on ainakin yksi osuma näkyvillä
    ${results}=    Get Element Count    //table/tbody/tr
    Should Be True    ${results} > 0

    #9. Valitse jokin lennoista -> kirjoita muuttujiin muistiin kyseisen lennon hinta, numero ja lentoyhtiö
    ${price}=    Get Text    xpath://table/tbody/tr[2]/td[6]
    ${airline}=    Get Text    xpath://table/tbody/tr[2]/td[3]
    ${flightNumber}=    Get Text    xpath://table/tbody/tr[2]/td[2]

    # Select the flight by clicking the "Choose This Flight" button
    Click Element    xpath://table/tbody/tr[2]/td[1]/input
    Sleep    1

    #10. Tarkista aukeavalta sivulta, että muuttujaan kirjoittamasi matkan hinta, lentoyhtiö ja lennon numero löytyvät sivulta (huomaa, että tässä joudut hieman muuttelemaan muuttujaan viemääsi tietoa (String-kirjasto(?))
    #Page Should Contain    ${price}
    #Page Should Contain    ${airline}
    #Page Should Contain    ${flightNumber}


    #11. tallena muuttujaan lennon kokonaishinta 
    ${totalPrice}=    Get Text    xpath://html/body/div[2]/p[5]/em


    #12. Täytä matkustajan tiedot kaavakkeelle (aseta kortin kuukausi ja vuosi globaaleiksi muuttujiksi)
    Click Element    name:inputName
    Input Text    name:inputName    Adam Smith 

    Sleep    1

    Click Element    name:address
    Input Text    name:address    Brown Street 12

    Sleep    1s

    Click Element    name:state
    Input Text    name:state    Califonia

    Click Element    name:zipCode
    Input Text    name:zipCode    123ABC


    Click Element    name:cardType
    Select From List By Label    name:cardType    Diner's Club 

    Click Element    name:creditCardNumber
    Input Text    name:creditCardNumber    12345678910121314167

    Click Element    name:nameOnCard
    Input Text    name:nameOnCard    Adam Smith

    

    #14. Klikkaa "Remember me"
    Click Element    name=rememberMe
    

    #15. Klikkaa "Purchase Flight"
    Click Button    xpath=//html/body/div[2]/form/div[11]/div/input

    Sleep    2

    #16. Tarkista, että aukeavalta sivulta löytyy teksti "Thank you for your purchase today!"
    Page Should Contain    Thank you for your purchase today!

    Sleep    2

    #17. Tarkista, että vanhentumisaika on oikein
    #should be true 

    #18. Tarkista, että kokonaishinta on oikein
    #Page Should Contain    ${totalPrice}


    #19.Sulje selain
        Close Browser

    
    #Kohtia 10, 17 ja 18 ei saatu onnistumaan.




