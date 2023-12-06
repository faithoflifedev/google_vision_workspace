import 'package:google_vision/google_vision.dart';
import 'package:universal_io/io.dart';

void main() async {
  final googleVision =
      await GoogleVision.withJwtFile('service_credentials.json');

  // write cropped image to debug folder
  final imageFile = File('sample_image/young-man-smiling-and-thumbs-up.jpg')
      .readAsBytesSync();

  final requests = AnnotationRequests(requests: [
    AnnotationRequest(
        jsonImage: JsonImage(byteBuffer: imageFile.buffer),
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
