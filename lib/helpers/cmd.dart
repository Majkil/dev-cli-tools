import 'dart:convert';
import 'dart:io';

Future<void> runProcess(String executable, List<String> args) async {
  var process = await Process.start(executable, args);
  process.stdout.transform(utf8.decoder).forEach(print);

  process.stderr
      .transform(utf8.decoder)
      .forEach((x) => {print('\x1B[33m$x\x1B[0m')});
  var exitCode = await process.exitCode;
  if (exitCode != 0) {
    print("\x1B[32mexit code:$exitCode\x1B[0m");
  }
}

void ringBell() {
  print(String.fromCharCodes([0x07]));
}
