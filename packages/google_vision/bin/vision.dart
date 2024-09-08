import 'package:args/command_runner.dart';
import 'package:google_vision/google_vision_cli.dart';
import 'package:universal_io/io.dart';

/// Attempt to retrieve the 'home' folder of the user if running on a desktop.
String? get _userHome =>
    Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'];

void main(List<String> arguments) async {
  CommandRunner('vision',
      'A command line interface for making API requests to the Google Vision.')
    ..argParser.addOption('credential-file',
        defaultsTo: '$_userHome/.vision/credentials.json',
        valueHelp: 'credentials file path')
    ..argParser.addOption('log-level',
        allowed: ['all', 'debug', 'info', 'warning', 'error', 'off'],
        defaultsTo: 'off')
    ..addCommand(VisionCropHintCommand())
    ..addCommand(VisionDetectCommand())
    ..addCommand(VisionHighlightCommand())
    ..addCommand(VisionSafeSearchCommand())
    ..addCommand(VisionScoreCommand())
    ..addCommand(VisionVersionCommand())
    ..run(arguments).catchError((error) {
      if (error is! UsageException) throw error;

      print(error);

      exit(64); // Exit code 64 indicates a usage error.
    });
}
