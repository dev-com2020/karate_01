Feature: UI Test

  Background:
    * configure driver = {type: 'chrome', webDriverSession: {args: ['--no-first-run','--no-default-browser-check']}}
#    * configure driver = { type: 'chromedriver', showDriverLog: true }

  Scenario: First test
    Given driver 'https://softwaretester.blog'
    When input('.search-input',['Magic',Key.ENTER])
    And waitForUrl('search/query:Magic')