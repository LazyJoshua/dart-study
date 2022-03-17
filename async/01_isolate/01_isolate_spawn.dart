import 'dart:isolate';

void main(List<String> args) {
  multiThread();
}

void multiThread() {
  print('multi thread start');

  print('当前线程: ${Isolate.current.debugName}');
  Isolate.spawn(newThread1, 'hello1');
  Isolate.spawn(newThread2, 'hello2');
  Isolate.spawn(newThread3, 'hello3');

  print('multi thread end');
}

void newThread1(String message) {
  print('当前线程: ${Isolate.current.debugName}');
  print(message);
}

void newThread2(String message) {
  print('当前线程: ${Isolate.current.debugName}');
  print(message);
}

void newThread3(String message) {
  print('当前线程: ${Isolate.current.debugName}');
  print(message);
}
