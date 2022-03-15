/**
 * getter（获取器）
 * getter是通过get关键字修饰的方法
 * 函数没有小括号，访问时也没有小括号（像访问属性一样访问方法）
 * 
 * setter（修改器）
 * setter是通过set关键字修饰发方法
 * 访问时，像设置属性一样给函数传参
 */

class Circle {
  final double PI = 3.1415926;
  num r;

  Circle(this.r);

  // num area() {
  //   return PI * r * r;
  // }

  // getter
  num get area {
    return PI * r * r;
  }

  set setR(num r) {
    this.r = r;
  }
}

void main() {
  Circle c = Circle(1);
  print(c.area);

  c.setR = 10;
  print(c.area);
}
