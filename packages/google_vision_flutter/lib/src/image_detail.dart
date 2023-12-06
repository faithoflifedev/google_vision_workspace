import 'dart:typed_data';

class ImageDetail {
  final int width;
  final int height;
  final ByteBuffer? byteBuffer;

  ImageDetail({required this.width, required this.height, this.byteBuffer});
}
