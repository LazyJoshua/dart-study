import 'lib/Father.dart';
import 'lib/Son.dart';

void main() {
  var f = Father('皇帝');
  print(f.name);
  print(f.job);
  f.say();

  var s = Son('太子');
  print(s.name);
  print(s.job);
  // 无法访问父类的私有属性
  // print(s._money);
  print(s.getMoney);
  s.say();
}
