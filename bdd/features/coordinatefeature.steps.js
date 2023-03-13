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

And('the black king on square H8', () => {
    board.put('H8', 'BK');
})

When('showing the board', () => {})

Then('the black king is in the lower left corner', () => {
    expect(board.squares[8][8]).toBe('BK');
})

Fusion("coordinates.feature")



