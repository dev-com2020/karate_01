Feature: UI Test

  Background:
    * configure driver =  { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }

  Scenario: First test
    Given driver 'https://softwaretester.blog'
    When input('.search-input',['Magic',Key.ENTER])
    * def bytes = screenshot(false)
    * def file = karate.write(bytes, 'test.png')
    * print 'screenshot saved to:', file
    And waitForUrl('search/query:Magic')

    Scenario: Check product name
      Given driver 'https://www.demoblaze.com'
#      And driver.dimensions = {x: 0, y: 0, width: 1024, height: 768 }
      And waitForEnabled('{a}Monitors').click()
      * waitForUrl('/#')
      * def productName = text('.card-title')
      * match productName == 'Apple monitor 24'

  Scenario: Working with many elements
    Given driver 'https://computer-database.gatling.io/'
    * def searchTerm = 'MacBook'
    When input('#searchbox', searchTerm)
    And click('#searchsubmit')
    * def resultRows = locateAll('table.computers tbody tr')
    * assert karate.sizeOf(resultRows) > 0
    * def computers = []
    * def getNames = function(row) { karate.appendTo(computers, row.children[0].text) }
    * karate.forEach(resultRows, getNames)
    * print computers
    * match each computers contains searchTerm