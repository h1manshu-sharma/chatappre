import 'dart:developer';
import 'dart:io';
import 'package:chatapp/app.dart';
import 'package:chatapp/presentation/widgets/gap_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ImageServices {
  static void pickImage(ImageSource source,
      {required Function(File) onImagePicked}) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      log("Image picked");
      cropImage(pickedFile, onImageCropped: (file) {
        onImagePicked(file);
      });
    }
  }

  static void cropImage(XFile xfile,
      {required Function(File) onImageCropped}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: xfile.path,
        compressQuality: 40,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1));
    if (croppedFile != null) {
      onImageCropped(File(croppedFile.path));
    }
  }

  static void showPhotoOptions({required Function(File) onImagePicked}) {
    showDialog(
        context: navigatorKey.currentContext!,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Upload Photo"),
                  GapWidget(
                    size: 10,
                  ),
                  ListTile(
                    onTap: () {
                      pickImage(ImageSource.gallery, onImagePicked: (file) {
                        onImagePicked(file);
                      });
                    },
                    leading: Icon(Icons.photo_album),
                    title: Text("Upload form gallery"),
                  ),
                  ListTile(
                    onTap: () {
                      pickImage(ImageSource.camera, onImagePicked: (file) {
                        onImagePicked(file);
                      });
                    },
                    leading: Icon(Icons.camera_alt),
                    title: Text("Take a photo"),
                  ),
                ],
              ),
            ),
          );
        });
  }

  static Future<String> uploadImage(File image, String folderName) async {
    Uuid uuid = Uuid();
    UploadTask task = FirebaseStorage.instance
        .ref()
        .child(folderName)
        .child(Uuid().v1())
        .putFile(image);
    TaskSnapshot snapshot = await task;
    String imageUrl = await snapshot.ref.getDownloadURL();
    return imageUrl;
  }
}
