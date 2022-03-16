## 自定义库
1、通过library来声明库
2、通过import来引入库
3、通过part和part of来组装库


## 不同库的引入方式
- 自定义库（import '库的位置/库名称.dart'）
- 系统库（import 'dart:库名称'）
- 第三方库

## 引入部分库（仅需引入的内容）
- 包含引入（show）
- 排除引入（hide）

## 指定库的前缀
- 当库名冲突时，可以通过as关键字，给库声明一个前缀

## 延迟引入（懒加载）
- 使用deferred as关键字来标识需要延时加载的库

## 系统库
- 系统库（核心库）是dart提供的常用内置库
- 不需要单独下载，就可以直接使用
### 引入系统库
import 'dart:库名';
import 'dart:core; // 自动引入
- 系统库列表
https://dart.cn/guides/libraries


