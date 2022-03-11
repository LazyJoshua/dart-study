void main() {
  // 匿名函数
  var myPrint = (value) {
    print(value);
  };

  List fruits = ['apple', 'orange', 'banana', '------------------'];
  fruits.forEach(myPrint);

  // 箭头函数，函数体只能写一行，而且不能写结束的分号，大括号可以省略
  fruits.forEach((element) => {print(element)});

  fruits.forEach((element) => print(element));

  // 立即执行函数
  ((num n) {
    print('number is: $n');
  })(3.1415926);
}
