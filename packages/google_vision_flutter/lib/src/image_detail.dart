import 'dart:typed_data';

/// A class that holds the details of an image.
class ImageDetail {
  final int width;
  final int height;
  final ByteBuffer? byteBuffer;

  ImageDetail({required this.width, required this.height, this.byteBuffer});
}
