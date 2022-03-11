void main() {
  // 必填参数
  String sayHello(String name) => 'hello, $name';

  print(sayHello('zhangsan'));

  // 可选参数，用中括号包起来，可设置默认值
  String userInfo(String name, [int age = 0]) => 'name: $name, age: $age';

  print(userInfo('zhangsan'));
  print(userInfo('zhangsan', 18));

  String userInfo2(String name, [int? age]) {
    if (age == null) {
      return 'name: $name';
    } else {
      return 'name: $name, age: $age';
    }
  }

  print(userInfo2('lisi'));
  print(userInfo2('lisi', 40));

  // 命名参数，用大括号包起来，调用时要与声明时的形参一致
  String userInfo3(String name, {int? age}) {
    // if (age == null) {
    //   return 'name: $name';
    // } else {
    //   return 'name: $name, age: $age';
    // }
    return 'name: $name, age: $age';
  }

  print(userInfo3('wangwu'));
  print(userInfo3('wangwu', age: 20));

  // 函数参数
  var myPrint = (value) {
    print(value);
  };
  List fruits = ['apple', 'orange', 'banana', '------------------'];
  // 将函数参数myPrint传递给foreach
  fruits.forEach(myPrint);
}
