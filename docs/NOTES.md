...indicators...

:heavy_check_mark: / :green_circle:  - green test

:x: / :red_circle: - failing test

:dart: - goal

:heavy_plus_sign: - items

:hammer_and_pick: - refactor

:warning: - Techdebt

### Description

You have to write a function that takes for input a 8x8 chessboard in the form of a bi-dimensional array of chars (or strings of length 1, depending on the language) and returns a boolean indicating whether the king is in check.

The array will include 64 squares which can contain the following characters :

'K' for the black King;
'Q' for a white Queen;
'B' for a white Bishop;
'N' for a white kNight;
'R' for a white Rook;
'P' for a white Pawn;
' ' (a space) if there is no piece on that square.
There will always be exactly one king, which is the black king, whereas all the other pieces are white.
The board is oriented from Black's perspective.
Remember that pawns can only move and take forward.
Also be careful with the pieces' lines of sight ;-) .

The input will always be valid, no need to validate it. To help you visualize the position, tests will print a chessboard to show you the problematic cases. Looking like this :

```
|---|---|---|---|---|---|---|---|
|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
|   |   |   | ♜ |   |   |   |   |
|---|---|---|---|---|---|---|---|
|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
|   |   |   | ♔ |   |   |   |   |
|---|---|---|---|---|---|---|---|
|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
```

### Domain

- Board
  - Square
    - (Coordinate)
      - Row: 1-8
      - Column: A-H
    - 0 or 1 piece on a square
- Movement
  - Block
  - Direction
- Piece
  - King
  - Queen
  - Bishop
  - Knight
  - Rook
  - Pawn
- Color
    - White
    - Black
- Check

### Scenario 1: Board coordinates - H8

```
Given a chess board
And the black king on square H8
When showing the board
Then the black king is in the lower left corner from the black's perspective
```

### Scenario 2: Board coordinates - A1

```
Given a chess board
And the black king on square A1
When showing the board
Then the black king is in the top right corner from the black's perspective
```

### Scenario 3: Board coordinates - H8 and H7

```
Given a chess board
And a white pawn is on square H7
And the black king on square H8
When showing the board
Then the black king is in the lower left corner from the black's perspective
And a white pawn is in the above the lower left corner from the black's perspective
```

### User acceptance test 1

:heavy_plus_sign: Given

:construction: When

:heavy_exclamation_mark: Then

### Unit tests

### Pomodori

#### Pomodoro 1

- :heavy_check_mark: Set up repo

#### Pomodoro 2

- :heavy_check_mark: customize project to current
- :dart: First scenario - one white bishop and the black king present 

#### Pomodoro 3

- :heavy_check_mark: Define the domain

#### Pomodoro 4

- :heavy_check_mark: Refine domain

#### Pomodoro 5

- :heavy_check_mark: define first scenario
- :heavy_check_mark: define second scenario

#### Pomodoro 6

- :heavy_check_mark: discover scenarios

#### Pomodoro 7

- :heavy_check_mark: discover scenarios


#### Pomodoro 8

- :heavy_check_mark: Creating BDD test for the first scenario
- :heavy_check_mark: Creating BDD test for the second scenario

#### Pomodoro 9

- :heavy_check_mark: Refactoring implementation
- :dart: Creating BDD test for the third scenario

