import 'package:google_vision/google_vision.dart';
import 'package:universal_io/io.dart';

void main() async {
  final googleVision = await GoogleVision().withJwt(
    File('service_credentials.json').readAsStringSync(),
  );

  final requests = [
    AnnotateImageRequest(
      // You may want to crop or shrink the image to the area of interest to
      // safe bandwidth/upload time, but that's optional.
      jsonImage: JsonImage.fromGsUri(
        'gs://gvision-demo/young-man-smiling-and-thumbs-up.jpg',
      ),
      features: [
        Feature(maxResults: 10, type: AnnotationType.faceDetection),
        Feature(maxResults: 10, type: AnnotationType.objectLocalization),
      ],
    ),
  ];

  print('checking...');

  final annotatedResponses = await googleVision.image.annotate(
    requests: requests,
  );

  print(annotatedResponses.responses.first.annotations);
}
