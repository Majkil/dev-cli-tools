abstract class CreateApp {
  final String appName;
  CreateApp({required this.appName});

  void createFolders() {}
  void createAppFiles() {}
  Future<void> runPrepartaionScripts() async {}
  Future<void> runRequiredScripts() async {}
  Future<void> runApp() async {}
}
