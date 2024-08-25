Feature: Intercept test
  Scenario: Inject custom product
    * configure driver =  { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }
    * driver 'https://www.demoblaze.com'
    * driver.intercept({ patterns: [{ urlPattern: '*/entries' }], mock: 'products.feature' })
#    * karate.stop()