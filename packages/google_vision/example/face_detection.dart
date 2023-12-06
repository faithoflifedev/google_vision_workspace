import 'package:google_vision/google_vision.dart';

void main() async {
  final googleVision =
      await GoogleVision.withJwtFile('service_credentials.json');

  print('checking...');

  final annotatedResponses = await googleVision.annotate(
    requests: AnnotationRequests(
      requests: [
        AnnotationRequest(
          jsonImage: JsonImage(
              imageUri:
                  'gs://gvision-demo/young-man-smiling-and-thumbs-up.jpg'),
          features: [
            Feature(maxResults: 10, type: AnnotationType.faceDetection),
          ],
        )
      ],
    ),
  );

  for (var faceAnnotation
      in annotatedResponses.responses.first.faceAnnotations) {
    print('Face - ${faceAnnotation.detectionConfidence}');

    print('Joy - ${faceAnnotation.enumJoyLikelihood}');
  }

  print('done.');
}
