import 'dart:io';
import 'package:cli/helpers/cmd.dart';
import 'package:cli/interfaces.dart/interfaces.dart';
import 'package:cli/templates/flask/flask_code.dart';

class FlaskApp implements CreateApp {
  @override
  String appName;

  @override
  void createFolders() {
    print("Creating new Directories for app");
    Directory(appName).createSync();
    Directory('$appName/app').createSync();
    Directory('$appName/app/templates').createSync();
    Directory('$appName/app/static').createSync();
    Directory('$appName/app/routes').createSync();
    Directory('$appName/app/controllers').createSync();
    Directory('$appName/app/services').createSync();
  }

  @override
  createAppFiles() {
    print("Creating requirements file");
    File('$appName/requirements.txt')
      ..createSync(recursive: true)
      ..writeAsStringSync(flaskRequirements);
    File('$appName/app/app.py')
      ..createSync(recursive: true)
      ..writeAsStringSync(flaskMainAppContent);
    File('$appName/app/.env.dev').createSync(recursive: true);
    File('$appName/app/.env.prod').createSync(recursive: true);
    File('$appName/app/config.py').createSync(recursive: true);
    File('$appName/app/__init__.py').createSync(recursive: true);
    File('$appName/app/routes/about.py').createSync(recursive: true);
    File('$appName/app/routes/weather.py').createSync(recursive: true);
    File('$appName/app/controllers/weather.py').createSync(recursive: true);
    File('$appName/app/services/weather.py').createSync(recursive: true);
    File('$appName/app/templates/index.html')
      ..createSync()
      ..writeAsStringSync(flaskIndexHTML(appName));
  }

  @override
  Future<void> runPrepartaionScripts() async {
    print("\x1B[32mPreparing development environment \x1B[0m");
    print("Creating venv");
    await runProcess('py', ['-m', 'venv', '$appName/Env']);
  }

  @override
  Future<void> runRequiredScripts() async {
    await runProcess('$appName/Env/Scripts/pip',
        ['install', '-r', ('$appName/requirements.txt')]);
  }

  @override
  FlaskApp({required this.appName}) {
    
    print("Starting new app called $appName");
    lazyCreate();
  }
  lazyCreate() async {
    await runPrepartaionScripts();
    createFolders();
    createAppFiles();
    await runRequiredScripts();
    await runApp();
  }

  @override
  Future<void> runApp() async {
    ringBell();
    await runProcess('$appName/Env/Scripts/python', ['$appName/app/app.py']);
  }
}
