import 'dart:math';

void main() {
  List list = [1, 2, 3];
  print(list);
  test();
  test3();
  test4();
  test5();
}

class Top {
  void aaa() {}
  // var a = aaa;
  var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
}

void test() {
  const list = ['a', 'b', 'c'];
  list.forEach((element) {
    // print(element);
    print('${list.indexOf(element)}: $element');
  });
}

void test2() {
  // Function makeAdder(int addBy) {

  // }
  Function a = test;
  var b = test;
}

void foo() {} // A top-level function

class A {
  static void bar() {} // A static method
  void baz() {} // An instance method
}

void test3() {
  Function x;

  // Comparing top-level functions.
  x = foo;
  assert(foo == x);

  // Comparing static methods.
  x = A.bar;
  assert(A.bar == x);

  // Comparing instance methods.
  var v = A(); // Instance #1 of A
  var w = A(); // Instance #2 of A
  var y = w;
  x = w.baz;

  // These closures refer to the same instance (#2),
  // so they're equal.
  assert(y.baz == x);

  // These closures refer to different instances,
  // so they're unequal.
  assert(v.baz != w.baz);
}

void test4() {
  String a = 'aaa';
  try {
    fun(a as int);
  } catch (e) {
    print(e);
  }
}

void fun(int i) {}

void test5() {
  const a = 1;
  var b = 1;
  assert(identical(a, b));
  var c = Null;
  print('${c.runtimeType} ${c.hashCode} ${c.toString()}');
  var d = Null;
  print('${d.runtimeType} ${d.hashCode} ${d.toString()}');
}

class ProfileMark {
  final String name;
  final DateTime start = DateTime.now();

  ProfileMark(this.name);
  ProfileMark.unnamed() : name = '';
}

void test6() {
  ProfileMark p = ProfileMark('kkk');
  ProfileMark pm = ProfileMark.unnamed();
}

const double xOrigin = 0;
const double yOrigin = 0;

class Point {
  double x = 0;
  double y = 0;

  Point(this.x, this.y);

  // Named constructor
  Point.origin()
      : x = xOrigin,
        y = yOrigin;

  Point.o()
      : x = 0,
        y = 0;

  Point.d()
      : x = 1,
        y = 1;
}
