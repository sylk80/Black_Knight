Feature: Board coordinates
A chess board has coordinates from A1 to H8

Scenario: Coordinate H8 is on the lower left corner
  Given a chess board
  And the black king on square H8
  When showing the board
  Then the black king is in the lower left corner

Scenario: Coordinate A1 is on the top right corner
  Given a chess board
  And the black king on square A1
  When showing the board
  Then the black king is in the top right corner