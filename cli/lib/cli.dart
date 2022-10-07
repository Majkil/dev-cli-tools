import 'package:args/args.dart';

int calculate() {
  return 6 * 7;
}

void main(List<String> arguments, ArgResults argResults) {
  final String name = argResults['name'];

  print("Hello, $name!");
}
