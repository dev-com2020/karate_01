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

      @smoke
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
    And match response[0] contains { userId: 2, id: 11, body: '#present', age: '#notpresent'}
    * print "RESPONSE:", response[0]
    * print "Długość:", response.length

  Scenario: Checking user specs of posts if type is correct then print
    Given url 'https://jsonplaceholder.typicode.com/posts?userId=2'
    When method get
    And match response[0] contains { userId: '#number', userId: 2, id: 11, body: '#string'}
    * print "RESPONSE:", response[0]
    * print "Długość:", response.length

  Scenario: Checking user specs of all posts if type is correct then print
    Given url 'https://jsonplaceholder.typicode.com/posts?userId=3'
    When method get
    And match each response contains { userId: '#number', userId: 3, id: '#number', body: '#string'}
    * print "RESPONSE:", response[0]
    * print "Długość:", response.length

  @smoke
  Scenario: Checking user specs of all posts if elements is table
    Given url 'https://jsonplaceholder.typicode.com/posts?userId=3'
    When method get
    And match response == '#[10]? _.userId == 3'


