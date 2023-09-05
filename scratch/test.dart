import 'dart:convert' show json;

import 'package:http/http.dart' as http;

void main() async {
  final response = await http.post(
    Uri.parse('https://vision.googleapis.com/v1/images:annotate'),
    headers: <String, String>{
      r'Authorization':
          'Bearer ya29.a0AVvZVsqHdR-Uy9kkMZ6wVzYIT5GcvwgcXl1G9Q3vRh7y_hAL-2C84d-xzal7p9pTkWZHcTKKLPWe7sSK5Oz8tya0YthHfXj4-gPVRhglBO1INbktMdwbUBdUI1P12d0VCn-H7eu0X8SS_BVDzv_EIHBXWoo3JB7OGWaxm8kaCgYKAV0SARASFQGbdwaIrxvz9tgh_NBGYiI5gYh-rA0174',
      r'x-goog-user-project': 'skc-live',
      r'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encode(<String, dynamic>{
      'requests': [
        {
          'image': {
            'source': {
              'imageUri': 'gs://cloud-samples-data/vision/face/faces.jpeg'
            }
          },
          'features': [
            {'maxResults': 10, 'type': 'FACE_DETECTION'}
          ]
        }
      ]
    }),
  );

  print(response.body);
}
