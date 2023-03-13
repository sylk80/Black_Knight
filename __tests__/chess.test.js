const { Board }  = require('../src/chess.js');

describe('Placing pieces', () => {
    test('Black king to H8', () => {
        const board = new Board();
        board.put('H8', 'BK');
        expect(board.squares[7][7]).toBe('BK');
    });
  });