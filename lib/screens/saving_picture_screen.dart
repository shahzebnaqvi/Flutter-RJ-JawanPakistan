import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SavingPictureScreen extends StatefulWidget {
  const SavingPictureScreen({super.key});

  @override
  State<SavingPictureScreen> createState() => _SavingPictureScreenState();
}

class _SavingPictureScreenState extends State<SavingPictureScreen> {
  final storage = FirebaseStorage.instance;
  final ImagePicker picker = ImagePicker();
  XFile? image1;
// Pick an image.
  void pickimageFromCamera() async {
    image1 = await picker.pickImage(source: ImageSource.camera);

    setState(() {});
  }

  void pickimageFromGallery() async {
    image1 = await picker.pickImage(source: ImageSource.gallery);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image1 != null) ...[
              Text("${image1!.name}"),
              Image.file(File(image1!.path))
            ],
            ElevatedButton(
                onPressed: () {
                  pickimageFromCamera();
                },
                child: Text("Get Image From Camera")),
            ElevatedButton(
                onPressed: () {
                  pickimageFromGallery();
                },
                child: Text("Get Image From Gallery"))
          ],
        ),
      ),
    );
  }
}
