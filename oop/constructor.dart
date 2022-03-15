void main() {
  // var p = Point();
  // p.showInfo();
  var p2 = Point(1, 1);
  p2.showInfo();
  var origin = Point.origin();
  origin.showInfo();
  var p3 = Point.fromJson({'x': 6, 'y': 6});
  p3.showInfo();

  var p5 = Point(1, 2);
  var p6 = Point(1, 2);
  print(p5 == p6); // false

  // 常量构造函数可以当做普通构造函数使用
  var p7 = ImmutablePoint(1, 2);
  var p8 = ImmutablePoint(1, 2);
  print(p7 == p8); // false

  // 声明不可变对象，必须通过const关键字修饰
  var p9 = const ImmutablePoint(1, 2);
  var p10 = const ImmutablePoint(1, 2);
  print(p9 == p10); // true

  // 工厂函数
  Person person1 = Person('关羽');
  print(person1.name); // 关羽
  Person person2 = Person('张飞');
  print(person2.name); // 关羽
  print(person1 == person2); // true

  // 工厂函数的调用
  var logger = Logger('UI');
  logger.log('Button clicked');
  var logMap = {'name': 'UI'};
  var loggerJson = Logger.fromJson(logMap);
  print(logger == loggerJson); // true
}

class Point {
  // num x = 0;
  // num y = 0;
  // num x = 0, y = 0;
  late num x, y;

  /**
   * 默认构造函数
   * 如果你没有声明构造函数，那么 Dart 会自动生成一个无参数的构造函数并且该构造函数会调用其父类的无参数构造方法。
   * 
   * 构造函数不被继承
   * 子类不会继承父类的构造函数，如果子类没有声明构造函数，那么只会有一个默认无参数的构造函数。
   */

  // 声明普通构造函数
  // Point() {
  //   print('我是默认构造函数。');
  // }

  // 声明普通构造函数
  // Point(num x, num y) {
  //   this.x = x;
  //   this.y = y;
  // }

  // 普通构造函数简化写法
  Point(this.x, this.y);

  /**
   * 构造函数是不能被继承的，这将意味着子类不能继承父类的命名式构造函数，如果你想在子类中提供一个与父类命名构造函数名字一样的命名构造函数，则需要在子类中显式地声明。
   */

  // 命名构造函数
  Point.origin() {
    x = 0;
    y = 0;
  }

  // 命名构造函数
  Point.fromJson(Map data) {
    x = data['x'] ?? 0;
    y = data['y'] ?? 0;
  }

  void showInfo() {
    print('Point x: $x, y: $y');
  }
}

class ImmutablePoint {
  // 属性必须通过final修饰
  final num x, y;

  // 常量构造函数必须通过const修饰
  const ImmutablePoint(this.x, this.y);
}

/**
 * 工厂构造函数
 * 通过fatory声明，工厂函数不会自动生成实例，而是通过代码来决定返回的实例。
 * 工厂函数可能会从缓存中返回一个实例，或者返回一个子类型的实例。
 * 工厂构造函数中无法访问this。
 */

class Person {
  String name = '';

  static Person? instance;

  factory Person([String name = '刘备']) {
    if (instance == null) {
      instance = Person.newSelf(name);
    }
    return instance!;
  }

  Person.newSelf(this.name);
}

// Logger的工厂函数从缓存中返回对象
class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}
