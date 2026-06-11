Feature:HerokuApp - Create

  Background: consume service
    * url 'https://restful-booker.herokuapp.com/'
    * def authToken = call read('classpath:features/token/createToken.feature@CreateToken')

  @Create
  Scenario: Create restful booker herokuapp

    Given path 'booking'
    Given header Accept = 'application/json'
    And request read ('classpath:features/create/body.json')

    When method POST
    Then status 200

    And match response == read('classpath:features/create/expectedvalues.json')
    And match response == read('classpath:features/create/expectedformat.json')

    And assert responseTime < 4000
    And def id = response.bookingid
    And print id
    * def createResponse = response

    And match response.bookingid == "#present", "#number", "#notnull"
    And match response.[*].firstname == "#present", "#string", "#notnull"
    And match response.[*].lastname == "#present", "#string", "#notnull"
    And match response.[*].totalprice == "#present", "#number", "#notnull"
    And match response.[*].depositpaid == "#present", "#boolean", "#notnull"
    And match response.[*].[*].checkin == "#present", "#date", "#notnull"
    And match response.[*].[*].checkout == "#present", "#date", "#notnull"
    And match response.[*].additionalneeds == "#present", "#string", "#notnull"

    And print 'createResponse: ', response

  @CreateUnhappy
  Scenario: Create booking with empty body - unhappy path

    Given path 'booking'
    Given header Accept = 'application/json'
    And request {}

    When method POST
    Then status 500

    And assert responseTime < 4000
    And print 'createUnhappyResponse: ', response