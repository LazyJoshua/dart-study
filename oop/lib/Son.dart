import 'Father.dart';

class Son extends Father {
  String name = '刘禅';

  Son(String job) : super(job);

  @override
  say() {
    super.say();
    print('我是刘禅, 我爹是${super.name}');
  }
}
