import 'dart:isolate';

void main(List<String> args) {
  multiThread();
}

void multiThread() {
  print('multiThread start');
  print('当前线程: ${Isolate.current.debugName}');
  ReceivePort r1 = ReceivePort();
  SendPort p1 = r1.sendPort;
  Isolate.spawn(newThread, p1);

  // 接收新线程发送过来的消息
  // var msg = r1.first;
  // print('来自新线程的消息: $msg');

  // r1.first.then((value) => print('来自新线程的消息: $value'));

  r1.listen((value) {
    print('来自新线程的消息: $value');
    // 调用close可以把当前监听关闭，如果不关闭则会一直监听
    r1.close();
  });

  print('multiThread end');
}

void newThread(SendPort p1) {
  print('当前线程: ${Isolate.current.debugName}');
  // 发送消息给main线程
  p1.send('abc');
}
