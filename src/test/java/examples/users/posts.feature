Feature: Posts tests
  Scenario: Creating a new post
    Given url 'https://jsonplaceholder.typicode.com'
    And path 'posts'
    And request { userId: 100, title: 'Witaj', body: 'Świecie'}
    When method post
    Then status 201
    And match responseType == 'json'
    And match response == {userId: 100, id: "#number", body: 'Świecie',title: 'Witaj'}

    Scenario: Declaring var
      * def myName = 'Tomek'
      * print 'Witaj', myName