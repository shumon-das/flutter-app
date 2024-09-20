import 'dart:io';
import 'package:path/path.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class FileUpload {
  Future<File> compressFile(File file) async {
    var fileFromImage = File(file.path);
    var basename = basenameWithoutExtension(fileFromImage.path);
    var pathString = fileFromImage.path.split(basename)[0];
    var pathStringWithExtension = "$pathString${basename}_image.jpg";

    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      pathStringWithExtension,
      quality: 88,
    );

    return null != result ? File(result.path) : file;
  }

    Future<String> uploadToFirebase(file) async {
    String imgName = '${DateTime.now().microsecondsSinceEpoch}.png';
    File compressedFile = await compressFile(file);
    try {
      final downloadUrl = await (
          await FirebaseStorage.instance
          .ref('images/$imgName')
          .putFile(compressedFile))
          .ref
          .getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('File upload error is: $e');
      return 'File upload error is: $e';
    }
  }
}
