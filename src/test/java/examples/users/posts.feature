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

      Scenario: Creating a new post with var
        Given url 'https://jsonplaceholder.typicode.com'
        And path 'posts'
        * def payload = { userId: 101, title: 'Witaj...', body: 'Świecie...'}
        And request payload
        When method post
        Then status 201
        And match responseType == 'json'

  Scenario: Declaring table
    * table numbersAndWords
      | number  | word  |
      | 5       | 'five'|
      | 10      | 'ten' |
    * print numbersAndWords

  Scenario: Creating a new post with table
    Given url 'https://jsonplaceholder.typicode.com'
    And path 'posts'
    * table payload
      |userId|title  |text   |
      |102   |'hello'|'world'|
    And request payload[0]
    When method post
    Then status 201
    And match responseType == 'json'

  Scenario: Creating a new post with set
    Given url 'https://jsonplaceholder.typicode.com'
    And path 'posts'
    * set payload
      |path  |      |
      |userId|103   |
      |title |"test"|
      |text  |"test"|
    And request payload
    When method post
    Then status 201
    And match responseType == 'json'