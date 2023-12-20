import '../shapes/abstract_shape/shape.dart';
import '../shapes/shape_I.dart';
import '../shapes/shape_J.dart';
import '../shapes/shape_L.dart';
import '../shapes/shape_O.dart';
import '../shapes/shape_S.dart';
import '../shapes/shape_T.dart';
import '../shapes/shape_Z.dart';

class ShapeBuilder{
  static void createShape(int randomInt, Shape shape){
    switch (randomInt) {
      case 0:
        {
          shape = ShapeT();
        }
        break;
      case 1:
        {
          shape = ShapeJ();
        }
        break;
      case 2:
        {
          shape = ShapeI();
        }
        break;
      case 3:
        {
          shape = ShapeO();
        }
        break;
      case 4:
        {
          shape = ShapeL();
        }
        break;
      case 5:
        {
          shape = ShapeS();
        }
        break;
      case 6:
        {
          shape = ShapeZ();
        }
        break;
    }
  }
}