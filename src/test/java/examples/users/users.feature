Feature: karate test script
  Background:
    * url 'https://jsonplaceholder.typicode.com'

    Scenario: get all users and then get the first user by id
      Given path 'users'
      When method get
      Then status 200

      * def first = response[0]

      Given path 'users', first.id
      When method get
      Then status 200

      Scenario: Checking user specs of posts then print
        Given url 'https://jsonplaceholder.typicode.com/posts?userId=2'
        When method get
        And match response[0].userId == 2
        * print "RESPONSE:", response[0]
        * print "Długość:", response.length

  Scenario: Checking user specs of posts
    Given path 'posts'
    When method get
    And param userId = 2
    And match response[0].userId == 1

  Scenario: Checking user specs of posts if contains then print
    Given url 'https://jsonplaceholder.typicode.com/posts?userId=2'
    When method get
    And match response[0] contains { userId: 2, id: 11}
    * print "RESPONSE:", response[0]
    * print "Długość:", response.length

