const { Board }  = require('../src/chess.js');

describe('Placing pieces', () => {
    test('Black king to H8', () => {
        const board = new Board();
        board.put('H8', 'BK');
        expect(board.squares[7][7]).toBe('BK');
    });

    test('Black king to A1', () => {
        const board = new Board();
        board.put('A1', 'BK');
        expect(board.squares[0][0]).toBe('BK');
    });

    test('White pawn to H7', () => {
        const board = new Board();
        board.put('H7', 'WP');
        expect(board.squares[6][7]).toBe('WP');
    });
  });
describe('Placing pieces', () => {
    test('Black king to H8 and white pawn to H7', () => {
        const board = new Board();
        board.put('H8', 'BK');
        board.put('H7', 'WP');
        const kingInCheck = board.isKingInCheck()
        expect(kingInCheck).toBe(false);
    })
    test('Black king to H8 and white pawn to G7', () => {
        const board = new Board();
        board.put('H8', 'BK');
        board.put('G7', 'WP');
        const kingInCheck = board.isKingInCheck()
        expect(kingInCheck).toBe(true);
    })
    test('Black king to G8 and white pawn to G7', () => {
        const board = new Board();
        board.put('G8', 'BK');
        board.put('G7', 'WP');
        const kingInCheck = board.isKingInCheck()
        expect(kingInCheck).toBe(false);
    })
});