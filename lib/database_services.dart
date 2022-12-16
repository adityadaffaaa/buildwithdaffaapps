import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  static Future<String> uploadImage(profilPicture) async {
    String fileName = basename(profilPicture?.path);
    Reference ref = FirebaseStorage.instance.ref().child(profilPicture);
    UploadTask task = ref.putFile(profilPicture);
    TaskSnapshot snapshot = await task.whenComplete(() {
      ref.getDownloadURL();
    }).catchError((onError) {
      print(onError);
    });

    return await snapshot.ref.getDownloadURL();
  }
}
