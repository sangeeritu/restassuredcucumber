Feature: Verify the api calls of the Californian Institute of Technology’s(CIT) SBDB Close-ApproachDataAPI.

  Scenario: To get all close-approach data with magnitude not in between 10 and 25

    Given I perform the GET operation for "https://ssd-api.jpl.nasa.gov/cad.api?h-min=10&h-max=25&sort=dist&fullname=true&limit=8&diameter=true"
    And export the response to json file "magnitudeCheck"
    Then I should see the status code "200"

  Scenario: To get all close-approach data of Moon in dates between 2020-01-01 to 2021-01-01

    Given I perform the GET operation for "https://ssd-api.jpl.nasa.gov/cad.api?body=Moon&date-min=2020-01-01&date-max=2021-01-01&sort=date&fullname=true&limit=5&diameter=true "
    And export the response to json file "moonwithdateCheck"
    Then I should see the status code "200"

  Scenario: To get all close-approach data of Moon in dates between 2020-01-01 to 2021-01-01

    Given I perform the GET operation for "https://ssd-api.jpl.nasa.gov/cad.api?body=Merc&date-min=2020-01-01&date-max=2021-01-01&sort=date&fullname=true&limit=15&diameter=true"
    And export the response to json file "mercwithdateCheck"
    Then I should see the status code "200"

  Scenario:  To get all close-approach data for pluto

    Given I perform the GET operation for "https://ssd-api.jpl.nasa.gov/cad.api?body= Pluto "
    And export the response to json file "plutoCheck"
    Then I should see the status code "400"

  Scenario: To To get all close-approach data of Moon in dates between 2021-08-30 & 2021-09-01 and limiting the data to 5

    Given I perform the GET operation for "https://ssd-api.jpl.nasa.gov/cad.api?body=Moon&date-min=2021-08-30&date-max=2021-09-01&sort=date&fullname=true&limit=5&diameter=true"
    And export the response to json file "moonlimitCheck"
    Then I should see the status code "200"
