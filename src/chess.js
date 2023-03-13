
class Board {
    constructor() {
        this.squares = [];
        for(let index=0; index < 8 ; index++) {
            this.squares.push(new Array(8))
        }
    }

    put(coordinates, piece) {
        if(coordinates === 'A1') {
           this.squares[0][0] = piece
        } else {
            this.squares[7][7] = piece
        }
    }
}

module.exports = { Board };