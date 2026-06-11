Feature:HerokuApp - Update

  Background: consume service
    * url 'https://restful-booker.herokuapp.com/'
    * def authToken = call read('classpath:features/token/createToken.feature@CreateToken')
    * def create = call read('classpath:features/create/createBooking.feature@Create')

  Scenario: Update restful booker herokuapp

    Given path 'booking/'
    And path create.id
    * header Accept = 'application/json'
    * header Cookie = 'token=' + authToken.Token
    And print authToken.accessToken
    And request read ('classpath:features/update/body.json')

    When method PUT
    Then status 200
    And match response == read('classpath:features/update/expectedvalues.json')
    And match response == read('classpath:features/update/expectedformat.json')

    And assert responseTime < 4000
    * def UpdateResponse = response

    And match response.[*].firstname == "#present", "#string", "#notnull"
    And match response.[*].lastname == "#present", "#string", "#notnull"
    And match response.[*].totalprice == "#present", "#number", "#notnull"
    And match response.[*].depositpaid == "#present", "#boolean", "#notnull"
    And match response.[*].[*].checkin == "#present", "#date", "#notnull"
    And match response.[*].[*].checkout == "#present", "#date", "#notnull"
    And match response.[*].additionalneeds == "#present", "#string", "#notnull"

    And print 'UpdateResponse: ', response

  Scenario: Update booking with invalid token - unhappy path

    Given path 'booking/'
    And path create.id
    * header Accept = 'application/json'
    * header Cookie = 'token=invalidtoken123'
    And request read ('classpath:features/update/body.json')

    When method PUT
    Then status 403

    And assert responseTime < 4000
    And print 'updateUnhappyResponse: ', response
