/* eslint-disable new-cap */
const {
    Given,
    When,
    Then,
    And,
    Fusion,
} = require("jest-cucumber-fusion")

const { Board } = require('../../src/chess')

let board

Given('a chess board', () => {
    board = new Board();
})

And(/the black king on square (.{2})/, (coordinates) => {
    board.put(coordinates, 'BK');
})

And(/a white pawn is on square (.{2})/, (coordinates) => {
    board.put(coordinates, 'WP');
})

When('showing the board', () => {})

Then(/the black king is in the (.+) from the black's perspective/, (squarePosition) => {
    const positionCoordinates = {
        "lower left corner": {
            row: 7,
            column: 7
        },
        "top right corner": {
            row: 0,
            column: 0
        }
    };
    const coordinates = positionCoordinates[squarePosition];
    expect(board.squares[coordinates.row][coordinates.column]).toBe('BK');
})

And(/a white pawn is in the (.+) from the black's perspective/, (squarePosition) => {
    const positionCoordinates = {
        "lower left corner": {
            row: 7,
            column: 7
        },
        "top right corner": {
            row: 0,
            column: 0
        },
        "above the lower left corner": {
            row: 6,
            column: 7
        }
    };
    const coordinates = positionCoordinates[squarePosition];
    expect(board.squares[coordinates.row][coordinates.column]).toBe('WP');
})

Fusion("coordinates.feature")



