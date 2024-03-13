import 'package:google_vision/google_vision.dart';

void main() async {
  final googleVision =
      await GoogleVision.withJwtFile('service_credentials.json');

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
