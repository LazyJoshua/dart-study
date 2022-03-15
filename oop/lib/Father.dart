class Father {
  String name = '刘备';
  num _money = 10000;
  String job;

  Father(this.job);

  get getMoney {
    return _money;
  }

  say() {
    print('我是$name');
  }
}
