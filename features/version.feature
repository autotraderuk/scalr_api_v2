Feature: ScalrApiV2
  In order run ScalrApiV2
  As a CLI

  Scenario: Has a version
    When I run `scalr_api_v2 version`
    Then the output should contain "0.1.1"
