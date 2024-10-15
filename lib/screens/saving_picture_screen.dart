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
  final storageRef = FirebaseStorage.instance.ref();

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

  uploadToFirebase() async {
    var file = File(image1!.path);
    try {
      var date = DateTime.now();
      final storageRef = FirebaseStorage.instance.ref();
      final mountainImagesRef = storageRef.child("images/product_${date}.jpg");
      await mountainImagesRef.putFile(file);
    } catch (e) {
      print("this is error $e");
    }
  }

  saveimage(XFile file) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('image/some-image${DateTime.now()}.jpg');

    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': file.path},
    );
    ref.putData(await file.readAsBytes(), metadata);
    var imageurl = await ref.getDownloadURL();
    print("imageurl --$imageurl");
    firestore
        .collection("userprofile")
        .add(
          {
            "prodName": "car",
            "prodImg": "$imageurl",
            "prodPrice": 33,
          },
        )
        .then((value) => print("Product Added"))
        .catchError((e) => print("this is error $e"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image1 != null) ...[
              ElevatedButton(
                  onPressed: () {
                    uploadToFirebase();
                  },
                  child: Text("Upload it To Firebase")),
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
