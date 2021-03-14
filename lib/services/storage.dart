import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

abstract class StorageBase {
  Future<String> uploadUserImage({File imageFile});
}

class Storage implements StorageBase {
  final String uid;
  Storage({@required this.uid}) : assert(uid != null);

  @override
  Future<String> uploadUserImage({File imageFile}) async {
    try {
      final ref = FirebaseStorage.instance.ref();
      await ref.child('users_images').child('$uid.jpg').putFile(imageFile);
      final url = await ref.child('users_images/$uid.jpg').getDownloadURL();
      return url;
    } catch (e) {
      rethrow;
    }
  }
}
