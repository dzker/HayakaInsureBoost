import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class ConsultantDatabase {
  Future consultantRegister(id, code, agency, password, filename) async {
    final CollectionReference reference =
        FirebaseFirestore.instance.collection("consultant");

    reference.doc(id).set({
      'agent id': id,
      'national code': code,
      'agency': agency,
      'password': password,
      'filename': filename,
      'status': false,
    });
  }

  Future<String> uploadCert() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      final storageRef = FirebaseStorage.instance.ref();
      final uploadTask = storageRef.child(basename(file.path)).putFile(file);
      return basename(file.path);
    } else {
      return '';
    }
  }

  Future<bool> checkConsultant(id) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('consultant').doc(id);

    final DocumentSnapshot documentSnapshot = await documentReference.get();

    return documentSnapshot.exists;
  }
}