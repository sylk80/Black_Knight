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
let kingInCheck

Given('a chess board', () => {
    board = new Board();
})

And(/a white pawn is on square (.{2})/, (coordinates) => {
    board.put(coordinates, 'WP');
})

And(/the black king on square (.{2})/, (coordinates) => {
    board.put(coordinates, 'BK');
})

When('checking whether the black king is in check', () => {
    kingInCheck = board.isKingInCheck()
})

Then('the black king is not in check', () => {
    expect(kingInCheck).toBe(false);
})

Then('the black king is in check', () => {
    expect(kingInCheck).toBe(true);
})

Fusion("kingincheck.feature")



