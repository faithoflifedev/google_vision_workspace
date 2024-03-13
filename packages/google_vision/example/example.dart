import 'package:google_vision/google_vision.dart';

void main() async {
  final googleVision =
      await GoogleVision.withJwtFile('service_credentials.json');

  final requests = AnnotationRequests(requests: [
    AnnotationRequest(
        // You may want to crop or shrink the image to the area of interest to
        // safe bandwidth/upload time, but that's optional.
        jsonImage: JsonImage.fromFilePath(
            'sample_image/young-man-smiling-and-thumbs-up.jpg'),
        features: [
          Feature(maxResults: 10, type: AnnotationType.faceDetection),
          Feature(maxResults: 10, type: AnnotationType.objectLocalization),
        ])
  ]);

  print('checking...');

  AnnotatedResponses annotatedResponses =
      await googleVision.annotate(requests: requests);

  print(annotatedResponses.responses.first.annotations);
}
