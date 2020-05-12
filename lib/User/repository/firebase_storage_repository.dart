import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/repository/firebase_storage_api.dart';

class FirebaseStorageRepository{

  final _firebaseStorageAPI = FirebaseStorageAPI();

  Future<StorageUploadTask> uploadImageFirebaseStorage(String path, File image) => _firebaseStorageAPI.uploadImage(path, image);
  
}