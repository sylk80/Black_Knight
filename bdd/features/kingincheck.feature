Feature: Determining whether a king is in check
If a piece could take the king, then the king is in check

Scenario: Pawn before king in same H column is not check
  Given a chess board
  And a white pawn is on square H7
  And the black king on square H8
  When checking whether the black king is in check
  Then the black king is not in check

Scenario: Pawn diagonally before king in adjacent column is in check
  Given a chess board
  And a white pawn is on square G7
  And the black king on square H8
  When checking whether the black king is in check
  Then the black king is in check

Scenario: Pawn before king in same G column is not in check
  Given a chess board
  And a white pawn is on square G7
  And the black king on square G8
  When checking whether the black king is in check
  Then the black king is not in check
