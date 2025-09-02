import 'package:google_vision/google_vision.dart';
import 'package:universal_io/io.dart';

void main() async {
  final googleVision = await GoogleVision().withJwt(
    File('service_credentials.json').readAsStringSync(),
  );

  print('checking...');

  final entityAnnotations = await googleVision.image.labelDetection(
    JsonImage.fromGsUri('gs://cloud-samples-data/vision/label/setagaya.jpeg'),
  );

  for (var entityAnnotation in entityAnnotations) {
    print('Description: - ${entityAnnotation.description}');

    print('Score: - ${entityAnnotation.score}');
  }

  print('done.');
}
