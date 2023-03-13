
class Board {
    constructor() {
        this.squares = [];
        this.squares[0] = [];
        this.squares[7] = [];
        this.squares[0][0] = 'BK';
        this.squares[7][7] = 'BK';
    }

    put() {}
}

module.exports = { Board };