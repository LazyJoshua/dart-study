// Without null safety:
requireStringNotObject(String definitelyString) {
  print(definitelyString.length);
}

main() {
  // Null a = null;
  // a.toString();
  Object maybeString = 'it is';
  requireStringNotObject(maybeString as String);
}

// Without null safety:
List<int> filterEvens(List<int> ints) {
  // return ints.where((n) => n.isEven);
  return ints.where((n) => n.isEven) as List<int>;
}

// Without null safety:
String missingReturn() {
  // No return. 不返回的话编译器会报错
  return '';
}

// Using null safety:
String alwaysReturns(int n) {
  if (n == 0) {
    return 'zero';
  } else if (n < 0) {
    throw ArgumentError('Negative values not allowed.');
  } else {
    if (n > 1000) {
      return 'big';
    } else {
      return n.toString();
    }
  }
}

int i = 0;

// Using null safety:
class SomeClass {
  int atDeclaration = 0;
  int initializingFormal;
  int initializationList;

  SomeClass(this.initializingFormal) : initializationList = 0;
}

// Using null safety:
int tracingFibonacci(int n) {
  int result;
  if (n < 2) {
    result = n;
  } else {
    result = tracingFibonacci(n - 2) + tracingFibonacci(n - 1);
  }

  print(result);
  return result;
}

// With (or without) null safety:
bool isEmptyList(Object object) {
  if (object is List) {
    return object.isEmpty; // <-- OK!
  } else {
    return false;
  }
}

// Without null safety:
// bool isEmptyList(Object object) {
//   if (object is! List) return false;
//   return object.isEmpty; // <-- Error!
// }

bool isEmptyList2(Object object) {
  if (object is! List) return false;
  return object.isEmpty;
}

// Using null safety:
Never wrongType(String type, Object value) {
  throw ArgumentError('Expected $type, but was ${value.runtimeType}.');
}

// Using null safety:
class Point {
  final double x, y;

  bool operator ==(Object other) {
    if (other is! Point) wrongType('Point', other);
    return x == other.x && y == other.y;
  }

  // Constructor and hashCode...
  Point(this.x, this.y);
}

// Using null safety:
int tracingFibonacci2(int n) {
  final int result;
  if (n < 2) {
    result = n;
  } else {
    result = tracingFibonacci(n - 2) + tracingFibonacci(n - 1);
  }

  print(result);
  return result;
}

// Using null safety:
String makeCommand(String executable, [List<String>? arguments]) {
  var result = executable;
  if (arguments != null) {
    result += ' ' + arguments.join(' ');
  }
  return result;
}

// Using null safety:
String makeCommand2(String executable, [List<String>? arguments]) {
  var result = executable;
  if (arguments == null) return result;
  return result + ' ' + arguments.join(' ');
}

// Using null safety:
String checkList(List<Object> list) {
  if (list?.isEmpty ?? false) {
    return 'Got nothing';
  }
  return 'Got something';
}

// Using null safety:
String checkList2(List<Object>? list) {
  if (list == null) return 'No list';
  if (list?.isEmpty ?? false) {
    return 'Empty list';
  }
  return 'Got something';
}

// Without null safety:
// String notAString = null;
// print(notAString?.length);

// Using null safety:
void test() {
  String? notAString = null;
  print(notAString?.length);

  // Using null safety:
  String? notAString2 = null;
  print(notAString2?.length?.isEven);

  // HttpResponse.notFound().code
}

// Using null safety, incorrectly:
class HttpResponse {
  final int code;
  final String? error;

  HttpResponse.ok()
      : code = 200,
        error = null;
  HttpResponse.notFound()
      : code = 404,
        error = 'Not found';

  @override
  String toString() {
    if (code == 200) return 'OK';
    // return 'ERROR $code ${error.toUpperCase()}';
    // return 'ERROR $code ${(error as String).toUpperCase()}';
    return 'ERROR $code ${error!.toUpperCase()}';
  }
}

function(String? value) {
  value!.length;
}

// Using null safety:
class Coffee {
  // String? _temperature;
  late String _temperature;

  void heat() {
    _temperature = 'hot';
  }

  void chill() {
    _temperature = 'iced';
  }

  String serve() => _temperature + ' coffee';
}

// Using null safety:
class Weather {
  // 当你这么声明时，会让初始化 延迟 执行。实例的构造将会延迟到字段首次被访问时执行，而不是在实例构造时就初始化。
  late int _temperature = _readThermometer();
}

int _readThermometer() {
  return 0;
}

// Using null safety:
class Coffee2 {
  // 与普通的 final 字段不同，你不需要在声明或构造时就将其初始化。
  // 你可以稍后在运行中的某个地方加载它。但是你只能对其进行 一次 赋值，并且它在运行时会进行校验。
  // 如果你尝试对它进行多次赋值，比如 heat() 和 chill() 都调用，那么第二次的赋值会抛出异常。
  late final String _temperature;

  void heat() {
    _temperature = 'hot';
  }

  void chill() {
    _temperature = 'iced';
  }

  String serve() => _temperature + ' coffee';
}

// Using null safety:
// 这里的所有参数都必须通过命名来传递。参数 a 和 c 是可选的，可以省略。参数 b 和 d 是必需的，调用时必须传递。
function1({int? a, required int? b, int? c, required int? d}) {}

class Beverage {}

// abstract class Cup {
//   Beverage contents;
// }

abstract class Cup {
  Beverage get contents;
  set contents(Beverage);
}

abstract class Cup2 {
  abstract Beverage contents;
}

// Using null safety, incorrectly:
class Coffee3 {
  String? _temperature;

  void heat() {
    _temperature = 'hot';
  }

  void chill() {
    _temperature = 'iced';
  }

  void checkTemp() {
    // if (_temperature != null) {
    //   print('Ready to serve ' + _temperature + '!');
    // }
    var temperature = _temperature;
    if (temperature != null) {
      print('Ready to serve ' + temperature + '!');
    }
  }

  String serve() => _temperature! + ' coffee';
}

// Using null safety:
class Box<T> {
  final T object;
  Box(this.object);
}

test1() {
  Box<String>('a string');
  Box<int?>(null);
}

// Using null safety:
class Box2<T> {
  T? object;
  Box2.empty();
  Box2.full(this.object);
}

// Using null safety:
class Box3<T> {
  T? object;
  Box3.empty();
  Box3.full(this.object);

  T unbox() => object as T;
}

void test2() {
  var map = {'key': 'value'};
  print(map['key']!.length); // Error.

  var value = map['key'];
  if (value != null) {
    value.length;
  }
}

void printInteger(int value) {
  print('this number is $value');
}

void callPrintInteger() {
  // var v = 't';
  var v = 1;
  printInteger(v);
}