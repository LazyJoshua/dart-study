/**
 * 闭包
 * 闭包是一个方法（对象）
 * 闭包定义在其他方法内部，闭包能够调用外部方法内的局部变量，并持有其状态
 * 使用时机：既能重用变量，又保护变量不被污染。
 * 实现原理：外层函数被调用后，外层函数的作用域对象（AO）被内层函数引用着，导致外层函数的作用域对象无法释放，从而形成闭包。
 */

void main() {
  // 闭包
  parent() {
    var money = 1000;
    return () {
      money -= 100;
      print(money);
    };
  }

  var p = parent();
  p();
  p();
  p();

  Function fn() {
    var num = 1;
    return (int a) {
      num += a;
      print(num);
    };
  }

  var loadFn = fn();
  loadFn(1); // 2
  loadFn(2); // 4
  loadFn(4); // 8

  Function makeAdder(int addBy, String name) {
    return (int i) => '${addBy + i} $name';
  }

  var add2 = makeAdder(2, 'aaa');
  var add4 = makeAdder(4, 'bbb');
  print(add2(3)); // 5 aaa
  print(add2(5)); // 7 aaa
  print(add4(3)); // 7 bbb
  print(add4(6)); // 10 bbb
}
