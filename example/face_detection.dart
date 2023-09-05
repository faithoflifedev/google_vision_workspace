import 'dart:io';

import 'package:google_vision/google_vision.dart';

void main() async {
  final googleVision =
      await GoogleVision.withJwt('example/skc-live-decbd0969cbb.json');

  // google cloud storage uris don't work yet
  final request = AnnotationRequests(requests: [
    AnnotationRequest(
      image: Image(
          imageUri: 'gs://gvision-demo/young-man-smiling-and-thumbs-up.jpg'),
      features: [
        Feature(maxResults: 10, type: 'FACE_DETECTION'),
      ],
    )
  ]);

  print('checking...');

  print(request.toJson().toString());

  AnnotatedResponses annotatedResponses =
      await googleVision.annotate(requests: request);

  for (var annotatedResponse in annotatedResponses.responses) {
    if (annotatedResponse.error != null) {
      print(annotatedResponse.error?.message);

      exit(annotatedResponse.error!.code);
    }

    for (var faceAnnotation in annotatedResponse.faceAnnotations) {
      print('Face - ${faceAnnotation.detectionConfidence}');

      print('Joy - ${faceAnnotation.enumJoyLikelihood}');
    }
  }
}
