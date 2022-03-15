abstract class Phone {
  void processor();

  void camera();

  void info() {
    processor();
    camera();
  }
}

class Xiaomi extends Phone {
  @override
  void camera() {
    print('三星摄像头');
  }

  @override
  void processor() {
    print('骁龙888');
  }
}

class Huawei extends Phone {
  @override
  void camera() {
    print('徕卡摄像头');
  }

  @override
  void processor() {
    print('麒麟990');
  }
}

void main(List<String> args) {
  var xiaomi = Xiaomi();
  xiaomi.info();
  var huawei = Huawei();
  huawei.info();
}
