/**
 * 枚举
 */

enum Color { red, green, blue }

void main(List<String> args) {
  List<Color> colors = Color.values;
  print(colors);
  print(Color.blue.index);
}
