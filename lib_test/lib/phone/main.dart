library phone;

import 'dart:math';

// 与分库建立联系
part 'Camera.dart';
part 'Processor.dart';

void main(List<String> args) {
  Camera c = Camera();
  c.info();
  Processor p = Processor();
  p.info();

  print(pi);
}
