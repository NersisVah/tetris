import 'values.dart';

class Piece {
  Tetromino? type;

  Piece({required this.type});

  List<int> position = [];

  void initializePiece() {
    switch (type) {
      case Tetromino.L:
        {
          position = [4, 14, 24, 25];
        }
        break;
      case Tetromino.J:
        {
          position = [4, 14, 24, 23];
        }
        break;
      case Tetromino.I:
        {
          position = [4, 14, 24, 34];
        }
        break;
      case Tetromino.O:
        {
          position = [4, 5, 14, 15];
        }
        break;
      case Tetromino.S:
        {
          position = [4, 5, 14, 13];
        }
        break;
      case Tetromino.Z:
        {
          position = [4, 5, 15, 16];
        }
        break;
      case Tetromino.T:
        {
          position = [4, 14, 24, 15];
        }
        break;
      default:
    }
  }

  moviePiece(Direction direction){
    switch(direction){
      case Direction.left:{
        for(int i = 0; i < position.length ; i++){
          position[i]++;
        }
      }break;
      case Direction.right:{
        for(int i = 0; i < position.length ; i++){
          position[i]--;
        }
      }break;
      case Direction.down:{
        for(int i = 0; i < position.length ; i++){
          position[i] += 10;
        }
      }break;
      default:{}
    }
  }
  rotatePieceRight() {
    switch (type) {
      case Tetromino.L:
        {
          // position = [4, 14, 24, 25];
          // position = [15, 14, 13, 23];
          // position = [24, 14, 4, 3];

          position[0] = position[1] + 1;
          position[2] = position[1] - 1;
          position[3] = position[1] + 9;

        }
        break;
      case Tetromino.J:
        {
          position = [4, 14, 24, 23];
        }
        break;
      case Tetromino.I:
        {
          position = [4, 14, 24, 34];
        }
        break;
      case Tetromino.O:
        {
          position = [4, 5, 14, 15];
        }
        break;
      case Tetromino.S:
        {
          position = [4, 5, 14, 13];
        }
        break;
      case Tetromino.Z:
        {
          position = [4, 5, 15, 16];
        }
        break;
      case Tetromino.T:
        {
          position = [4, 14, 24, 15];
        }
        break;
      default:
    }
  }
}
