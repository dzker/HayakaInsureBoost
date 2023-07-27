import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class AdminDatabase {
  late File file;

  Future downloadPDF(filename) async {
    final storageRef = FirebaseStorage.instance.ref();
    final islandRef = storageRef.child(filename);

    final appDocDir = await getApplicationDocumentsDirectory();
    final filePath = "${appDocDir.absolute}/$filename";
    final file = File(filePath);

    final downloadTask = islandRef.writeToFile(file);
  }

  Future<String> chooseImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result.files.single.path!);
      UploadTask? uploadTask;

      final ref =
          FirebaseStorage.instance.ref().child('banner/${basename(file.path)}');

      uploadTask = ref.putFile(file);

      final snapshot = await uploadTask.whenComplete(() {});

      return basename(file.path);
    } else
      return 'No image';
  }

  Future<void> deleteImage(filename) async {
    final path = 'banner/$filename';
    final ref = FirebaseStorage.instance.ref().child(path);
    await ref.delete();
  }

  Future<List<Map>> checkIfImagesExist() async {
    List<Map> files = [];

    final ListResult result =
        await FirebaseStorage.instance.ref().child('banner').list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final String fileType = file.name.split('.').last.toLowerCase();
      if (fileType == 'jpg' || fileType == 'jpeg' || fileType == 'png') {
        files.add({"url": fileUrl, "path": file.fullPath});
      }
    });

    return files;
  }

  Future uploadTNC(tnc, category) async {
    final CollectionReference reference =
        FirebaseFirestore.instance.collection("tnc");

    reference.doc(category).set({'category': category, 'tnc': tnc});
  }

  Future updateTNC(tnc, category) async {
    final CollectionReference reference =
        FirebaseFirestore.instance.collection("tnc");

    reference.doc(category).update({'tnc': tnc});
  }

  Future<String> loadTNC(category) async {
    try {
      final DocumentReference documentReference =
          FirebaseFirestore.instance.collection('tnc').doc(category);

      final DocumentSnapshot documentSnapshot = await documentReference.get();
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;
      return data['tnc'];
    } catch (e) {
      return '';
    }
  }

  Future uploadCash(value, point, image) async {
    final CollectionReference reference =
        FirebaseFirestore.instance.collection("gift");

    reference.doc(value).set({
      "value": value,
      "point": point,
      "image": image,
    });
  }

  Future<String> uploadGiftImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result.files.single.path!);

      FirebaseStorage.instance
          .ref()
          .child('cash/${basename(file.path)}')
          .putFile(file);

      return basename(file.path);
    } else {
      return 'Fail to upload';
    }
  }

  Future deleteGift(value) async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('gift');

    await collectionRef.doc(value).delete();
  }

  Future<QuerySnapshot> getAllGift() async {
    return await FirebaseFirestore.instance.collection('gift').get();
  }

  Future assignConsultantAndCustomer(mykad, id) async {
    final CollectionReference customer =
        FirebaseFirestore.instance.collection("customer");
    final CollectionReference consultant =
        FirebaseFirestore.instance.collection("consultant");

    customer.doc(mykad).update({'consultant': id});
    consultant.doc(id).update({'customer': mykad, 'status': 'Assigned'});
  }
}