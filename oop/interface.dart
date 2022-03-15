/**
 * 接口
 * 接口在dart中就是一个类
 * 接口可以是任意类，但一般使用抽象类做接口
 * 一个类可以实现（implements）多个接口，多个接口用逗号分隔
 * 普通类实现接口后，必须重写接口中的所有属性和方法
 */

abstract class Processor {
  String cores = '';
  arch(String name);
}

abstract class Camera {
  String resolution = '';
  brand(String name);
}

class Phone implements Processor, Camera {
  @override
  String cores;

  @override
  String resolution;

  Phone(this.cores, this.resolution);

  @override
  arch(String name) {
    print('芯片制程：$name');
  }

  @override
  brand(String name) {
    print('相机品牌：$name');
  }
}

void main(List<String> args) {
  var p = Phone('4核', '3000万');
  p.arch('5nm');
  p.brand('蔡司');
}
