@ignore
Feature:connection

  Background: consume service
    * url 'https://restful-booker.herokuapp.com/'

  @CreateToken
  Scenario: Authentication test
    * def privateSettings = read('classpath:resources/privateSettings.json')
    Given path 'auth'
    Given header Accept = 'application/json'
    And request
      """
      {
                    username: '#(privateSettings.TenantCredentials.username)',
                    password: '#(privateSettings.TenantCredentials.password)'
      }
      """
    When method POST
    Then status 200
    And assert responseTime < 4000
    * def Token = response.token

    And match response.token == "#present", "#string", "#notnull"
    * print Token

  @CreateTokenUnhappy
  Scenario: Authentication with invalid credentials - unhappy path
    Given path 'auth'
    Given header Accept = 'application/json'
    And request
      """
      {
                    username: 'wronguser',
                    password: 'wrongpassword'
      }
      """
    When method POST
    Then status 200

    And assert responseTime < 4000
    And match response.reason == 'Bad credentials'
    And match response.reason == "#present", "#string", "#notnull"
    * print response