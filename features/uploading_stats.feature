Feature: Uploading stats
  As Wilma the writer
  I want to type morning-pages for the first time and be asked for a login, which is then checked to see if it's available

  Scenario: Credential saving
    When I run 'morning-pages' for the first time
    Then I should be asked for my username and email before writing
    And I should have my stats uploaded to the website after writing

  Scenario: Username already taken
    When I run 'morning-pages' for the first time
    And I enter an existing username
    Then I should be asked for another username

