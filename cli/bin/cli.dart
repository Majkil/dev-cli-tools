import 'package:args/args.dart';
import 'package:cli/create/python/create_py_flask.dart';

ArgResults? argResults;
void main(List<String> arguments) {
  final ArgParser argParser = ArgParser()
    ..addOption('name',
        abbr: 'n',
        defaultsTo: 'World',
        help: "What would you like to call your app?")
    ..addFlag(
      'create',
      abbr: 'c',
    )
    ..addFlag('python', abbr: 'p', help: 'Creates a python app')
    ..addFlag('generate',
        abbr: 'g', help: 'Generates components based on other flags')
    ..addFlag('help',
        abbr: 'h', negatable: false, help: "Displays this help information.");

  argResults = argParser.parse(arguments);

  if (argResults!['help']) {
    print("""
    ** HELP **
    ${argParser.usage}
        """);
  } else if (argResults!['create'] && argResults!['python']) {
    FlaskApp(appName: argResults!['name']);
  }
}
