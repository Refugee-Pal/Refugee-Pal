// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future batchUpdate(
  String updateCollection,
  String updateField,
  String currentValue,
  String newValue,
) async {
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection(updateCollection);

  WriteBatch batch = FirebaseFirestore.instance.batch();

  collectionRef
      .where(updateField, isEqualTo: currentValue)
      .get()
      .then((querySnapshot) {
    querySnapshot.docs.forEach((document) {
      batch.update(document.reference, {updateField: newValue});
    });
    return batch.commit();
  });
}
