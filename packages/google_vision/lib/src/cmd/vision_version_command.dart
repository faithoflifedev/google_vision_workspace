import 'package:args/command_runner.dart';
import 'package:google_vision/meta.dart';

class VisionVersionCommand extends Command {
  @override
  String get description => 'Display the package name and version.';

  @override
  String get name => 'version';

  @override
  void run() async {
    print('${pubSpec['name']} v${pubSpec['version']}');
  }
}
