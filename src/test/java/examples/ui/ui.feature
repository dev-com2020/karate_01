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