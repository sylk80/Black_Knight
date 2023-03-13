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

And('the black king on square HA1', () => {
    board.put('A1', 'BK');
})

When('showing the board', () => {})

Then("the black king is in the lower left corner from the black's perspective", () => {
    expect(board.squares[7][7]).toBe('BK');
})

Then("the black king is in the top right corner from the black's perspective", () => {
    expect(board.squares[0][0]).toBe('BK');
})

Fusion("coordinates.feature")



