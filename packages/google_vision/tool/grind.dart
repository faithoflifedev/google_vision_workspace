import 'package:publish_tools/publish_tools.dart';

void main(List<String> args) async {
  PublishTools.addAllTasks();

  grind(args);
}

// @Task('Test stuff.')
// @Depends('pt-release')
// check() {
//   log('checked');
// }

@DefaultTask('Just keeping it real')
@Depends('pt-commit', 'pt-publish', 'pt-homebrew')
void done() {
  log('commit to faithoflifedev/google_vision complete');
  log('publish to pub.dev/packages complete.');
  log('commit to faithoflifedev/homebrew-google_vision complete');
}
