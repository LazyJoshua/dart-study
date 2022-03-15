class MixinA extends Object {
  String name = 'MixinA';

  // MixinA();

  void printA() {
    print('A');
  }

  void run() {
    print('A is running');
  }
}

mixin MixinB {
  String name = 'MixinB';

  void printB() {
    print('B');
  }

  void run() {
    print('B is running');
  }
}

class SimpleClass with MixinA, MixinB {}

void main(List<String> args) {
  var c = SimpleClass();
  c.printA();
  c.printB();
  print(c.name);
  c.run();
}
