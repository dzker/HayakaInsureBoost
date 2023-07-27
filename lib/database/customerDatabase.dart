import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class CustomerDatabase {
  late File file;

  DateTime now = DateTime.now();

  Future customerRegister(mykad, phone, password, name, email, address) async {
    final CollectionReference reference =
        FirebaseFirestore.instance.collection("customer");

    reference.doc(mykad).set({
      'mykad': mykad,
      'phone': phone,
      'password': password,
      "status": "Not active",
      "name": name,
      "email": email,
      "consultant": "None",
      "address": address,
      "reward point": "0",
      "filename": "None/Not active"
    });
  }

  Future<bool> checkCustomer(mykad) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('customer').doc(mykad);

    final DocumentSnapshot documentSnapshot = await documentReference.get();

    return documentSnapshot.exists;
  }

  Future<bool> login(mykad, password) async {
    try {
      final DocumentReference documentReference =
          FirebaseFirestore.instance.collection('customer').doc(mykad);

      final DocumentSnapshot documentSnapshot = await documentReference.get();
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;
      if (data['password'] == password) {
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }

  Future<String> getCustomerName(mykad) async {
    try {
      final DocumentReference documentReference =
          FirebaseFirestore.instance.collection('customer').doc(mykad);

      final DocumentSnapshot documentSnapshot = await documentReference.get();
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;
      return data['name'];
    } catch (e) {
      return '';
    }
  }

  Future<QuerySnapshot> getCustomerList() async {
    return await FirebaseFirestore.instance.collection('customer').get();
  }

  Future<Map<String, dynamic>> getCustomerDetail(mykad) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('customer').doc(mykad);

    final DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data =
        documentSnapshot.data()! as Map<String, dynamic>;
    return data;
  }

  Future uploadPolicy(mykad) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      file = File(result.files.single.path!);
      final storageRef = FirebaseStorage.instance.ref();
      final uploadTask = storageRef
          .child('policy/$mykad/${basename(file.path)}')
          .putFile(file);

      // check whether there is policy
      final DocumentReference documentReference =
          FirebaseFirestore.instance.collection('customer').doc(mykad);

      final DocumentSnapshot documentSnapshot = await documentReference.get();

      final CollectionReference reference =
          FirebaseFirestore.instance.collection("customer");

      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;

      if (data['filename'] != 'None/Not active') {
        // add the new policy to old policy
        String policy = '${basename(file.path)}/Unreviewed,${data['filename']}';

        reference.doc(mykad).update({'filename': policy, 'status': 'Unassigned'});
      } else {
        reference
            .doc(mykad)
            .update({'filename': '${basename(file.path)}/Unreviewed', 'status':'Unassigned'});
      }
    }
  }

  Future<String> getAllPolicy(mykad) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('customer').doc(mykad);
    final DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data =
        documentSnapshot.data()! as Map<String, dynamic>;
    if (data['filename'] != "None/Not active") {
      return data['filename'];
    } else {
      return '';
    }
  }

  Future createRedemptionRequest(mykad, value, point) async {
    final CollectionReference redemption =
        FirebaseFirestore.instance.collection("redemption");
    final CollectionReference transaction =
        FirebaseFirestore.instance.collection("transaction");

    redemption.doc(mykad).set({
      'category': 'customer',
      'mykad': mykad,
      'value': value,
      'point': point
    });
    transaction.doc(mykad).set({
      'category': 'customer',
      'mykad': mykad,
      'value': value,
      'point': point,
      'date': "${now.year}-${now.month}-${now.day}",
      'status': 'Pending'
    });
  }

  Future<String> getCustomerPoint(mykad) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('customer').doc(mykad);
    final DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data =
        documentSnapshot.data()! as Map<String, dynamic>;
    return data['reward point'];
  }

  Future<QuerySnapshot> getAllTransaction() async {
    return await FirebaseFirestore.instance.collection('transaction').get();
  }

  Future<Map<String, dynamic>> getReport(filechange) async{
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('review report').doc(filechange);
        final DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data =
        documentSnapshot.data()! as Map<String, dynamic>;
    return data;
  }

}