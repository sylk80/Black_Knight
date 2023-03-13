Feature: Board coordinates
A chess board has coordinates from A1 to H8

Scenario: Coordinate H8 is on the lower left corner from the black's perspective
  Given a chess board
  And the black king on square H8
  When showing the board
  Then the black king is in the lower left corner from the black's perspective

Scenario: Coordinate A1 is on the top right corner from the black's perspective
  Given a chess board
  And the black king on square A1
  When showing the board
  Then the black king is in the top right corner from the black's perspective

Scenario: Coordinate H8 and H7 is on the lower left corner from the black's perspective
  Given a chess board
  And the black king on square H8
  And a white pawn is on square H7
  When showing the board
  Then the black king is in the lower left corner from the black's perspective
  And a white pawn is in the above the lower left corner from the black's perspective