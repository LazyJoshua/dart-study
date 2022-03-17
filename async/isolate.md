## Isolate多线程——通信机制
Isolate多线程之间，通信的唯一方式是Port。
- ReceivePort
  初始化接收端口，创建发送端口，接收消息，监听消息，关闭端口
- SendPort
  将消息发送给ReceiverPort

- 通信方式
  - 单向通信（A -> B）
  - 双向通信（A <-> B）

![单向通信](./Isolate单向通信.png)
![双向通信](./Isolate双向通信.png)


