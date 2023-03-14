const {toInteger} = require("lodash");

class Board {
    constructor() {
        this.squares = [];
        for(let index=0; index < 8 ; index++) {
            this.squares.push(new Array(8))
        }
    }

    put(coordinates, piece) {
        const rowAndColumn = this.toRowAndColumn(coordinates);
        this.squares[rowAndColumn.row][rowAndColumn.column] = piece;
    }

    toRowAndColumn(coordinates) {
        const columns = {
            A: 0,
            G: 6,
            H: 7
        };
        const row = toInteger(coordinates[1]) - 1;
        const column = columns[coordinates[0]];
        return { row, column };
    }

    isKingInCheck() {
        return this.squares[6][6] === 'WP' && this.squares[7][7] === 'BK'
    }
}

module.exports = { Board };