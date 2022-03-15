import 'dart:math';

/**
 * 初始化列表
 * 作用：在构造函数中设置属性的默认值
 * 时机：在构造函数体执行之前执行
 * 语法：使用逗号分隔初始化表达式
 * 场景：常用于设置final常量的值
 */

class Point {
  final double x;
  final double y;
  final double distanceFromOrigin;

  Point(double x, double y)
      : x = x,
        y = y,
        distanceFromOrigin = sqrt(x * x + y * y);

  // 在开发模式下，你可以在初始化列表中使用 assert 来验证输入数据
  Point.withAssert(this.x, this.y)
      : assert(x >= 0),
        assert(y >= 0),
        distanceFromOrigin = sqrt(x * x + y * y) {
    print('In Point.withAssert(): ($x, $y)');
  }
}

void main() {
  var p = Point(2, 3);
  print(p.distanceFromOrigin);

  var p2 = Point(2, 2);
  print(p2.distanceFromOrigin);

  var p3 = Point.withAssert(-1, 10);
  print(p3.distanceFromOrigin);
}

/**
 * 重定向构造函数
 * 有时候类中的构造函数仅用于调用类中其它的构造函数，此时该构造函数没有函数体，只需在函数签名后使用（:）指定需要重定向到的其它构造函数 (使用 this 而非类名)
 */
// class Point {
//   double x, y;

//   // The main constructor for this class.
//   Point(this.x, this.y);

//   // Delegates to the main constructor.
//   Point.alongXAxis(double x) : this(x, 0);
// }

// void main() {
//   var p = Point.alongXAxis(10);
//   print(p.y);
// }
