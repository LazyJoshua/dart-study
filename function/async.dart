/**
 * 异步函数
 * Dart中，异步调用通过Future来实现
 * async函数返回一个Future，await用于等待Future
 */

import 'dart:convert';

import 'package:http/http.dart' as http;

void main() {
  // then
  getIpAddress()
      .then((ip) => print(ip))
      .catchError((onError) => print(onError));

  showIp();
}

// then写法
Future getIpAddress() {
  Uri uri = Uri.parse('http://httpbin.org/ip');
  return http.get(uri).then((response) {
    print(response.body);
    String ip = jsonDecode(response.body)['origin'];
    return ip;
  });
}

// async写法
Future getIpAddress2() async {
  Uri uri = Uri.parse('http://httpbin.org/ip');
  http.Response response = await http.get(uri);
  String ip = jsonDecode(response.body)['origin'];
  return ip;
}

void showIp() async {
  try {
    String ip = await getIpAddress2();
    print('async show ip: ' + ip);
  } catch (error) {
    print(error);
  }
}
