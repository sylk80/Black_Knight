const  isBlackKingInChess  = require('../src/chess.js');

describe('Given the black king', () => {
    test('When checking for chess', () => {
      expect(isBlackKingInChess()).toEqual('Hello world');
    });
  });