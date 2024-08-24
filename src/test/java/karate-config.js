function fn() {

  // browser settings, if not set it takes chrome
  var browser = karate.properties['browser'] || 'chrome';
  karate.log('the browser set is: ' + browser + ', default: "chrome"');

  // grid flag, if not set it takes false. The grid url is in this format http://localhost:4444/wd/hub
  var grid_url = karate.properties['grid_url'] || false;
  karate.log('the grid url set is: ' + grid_url + ', default: false');

  // configurations.
  var config = {
    host: 'http://httpstat.us/'
  };

  if (browser == 'chrome') {
      if (!grid_url) {
         karate.configure('driver', { type: 'chromedriver', executable: 'chromedriver' });
         karate.log("Selected Chrome");
      } else {
         karate.configure('driver', { type: 'chromedriver', start: false, webDriverUrl: grid_url });
         karate.log("Selected Chrome in grid");
      }
   } else if (browser == 'firefox') {
      if (!grid_url) {
          karate.configure('driver', { type: 'geckodriver', executable: 'geckodriver' });
          karate.log("Selected Firefox");
      } else {
          karate.configure('driver', { type: 'geckodriver', start: false, webDriverUrl: grid_url });
          karate.log("Selected Firefox in grid");
      }
   }

  return config;
}