Feature: Using headers
  Background:
    Given url 'https://dev-457931.okta.com/oauth2/aushd4c95QtFHsfWt4x6/v1/token'
    * def credentials = {scope: 'offline_access', grant_type: 'password', username: 'api-user4@iwt.net',  password: 'b3z0nV0cLO', client_id: '0oahdhjkutaGcIK2M4x6'}
    And form fields credentials
    When method post
    * def token = response.access_token