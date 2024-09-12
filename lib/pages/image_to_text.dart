import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageToText extends StatefulWidget {
  const ImageToText({super.key});

  @override
  State<ImageToText> createState() => _ImageToTextState();
}

class _ImageToTextState extends State<ImageToText> {
  File? selectedImage;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedImage = await picker.pickImage(
        source: ImageSource.gallery
    );

    setState(() {
      if (pickedImage != null) {
        selectedImage = File(pickedImage.path);
      } else {
        print("No Image");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image To Text', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Center(
            child: selectedImage == null ? Text("No Image") : Image.file(selectedImage!),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}
