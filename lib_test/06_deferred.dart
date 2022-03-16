import 'lib/function.dart' deferred as func;

void main(List<String> args) {
  // func.hello();

  print('1');
  greet();
  print('2');
  print('3');
}

Future greet() async {
  print('before ${DateTime.now()}');
  await func.loadLibrary();
  print('after ${DateTime.now()}');
  func.hello();
}
