import 'package:chatflutter/firebase_options.dart';
import 'package:chatflutter/pages/app.dart';
import 'package:chatflutter/repository/chat_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

var getit = GetIt.asNewInstance();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  getit.registerFactory<ChatRepository>((){
    return ChatRepository(FirebaseFirestore.instance);
  });

  runApp(const MyApp());
}