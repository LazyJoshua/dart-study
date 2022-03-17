import 'dart:isolate';

void main(List<String> args) {
  multiThread();
}

void multiThread() async {
  print('multiThread start');
  print('当前线程: ${Isolate.current.debugName}');
  ReceivePort r1 = ReceivePort();
  SendPort p1 = r1.sendPort;
  Isolate.spawn(newThread, p1);

  // 接收新线程发送过来的消息
  // var msg = r1.first;
  // print('来自新线程的消息: $msg');

  // r1.first.then((value) => print('来自新线程的消息: $value'));

  // r1.listen((value) {
  //   print('来自新线程的消息: $value');
  //   // 调用close可以把当前监听关闭，如果不关闭则会一直监听
  //   r1.close();
  // });

  SendPort p2 = await r1.first;
  // p2.send('来自主线程的消息');

  var msg = await sendToReceive(p2, 'hello');
  print('主线程接收到的消息：$msg');

  var msg2 = await sendToReceive(p2, 'dart');
  print('主线程接收到的消息：$msg2');

  var msg3 = await sendToReceive(p2, 'from main');
  print('主线程接收到的消息：$msg3');

  print('multiThread end');
}

void newThread(SendPort p1) async {
  print('当前线程: ${Isolate.current.debugName}');
  // 发送消息给main线程
  // p1.send('abc');

  ReceivePort r2 = ReceivePort();
  SendPort p2 = r2.sendPort;
  p1.send(p2);

  // r2.listen((message) {
  //   print(message);
  // });

  await for (var item in r2) {
    var data = item[0];
    print('新线程接收到了来自主线程的消息：$data');
    SendPort replyPort = item[1];
    // 给主线程回复消息
    replyPort.send('I get $data');
  }
}

Future sendToReceive(SendPort port, msg) {
  print('发送消息给新线程：$msg');
  ReceivePort response = ReceivePort();
  port.send([msg, response.sendPort]);
  return response.first;
}
