import 'package:google_vision/google_vision.dart';
import 'package:universal_io/io.dart';

void main() async {
  // final googleVision =
  //     await GoogleVision.withJwtFile('example/service_credentials.json');

  final googleVision = await GoogleVision.withApiKey(
      Platform.environment['GOOGLE_VISION_API_KEY'] ?? '[YOUR API KEY]');

  print('checking...');

  final faceAnnotationResponses = await googleVision.faceDetection(
      JsonImage.fromGsUri(
          'gs://gvision-demo/young-man-smiling-and-thumbs-up.jpg'));

  for (var faceAnnotation in faceAnnotationResponses) {
    print('Face - ${faceAnnotation.detectionConfidence}');

    print('Joy - ${faceAnnotation.enumJoyLikelihood}');
  }

  print('done.');
}
