import 'package:flutter/material.dart';
import 'my_site.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAO-uazil50EROYAnEi7Erxx0RTIt_UX8E",
  authDomain: "absoluter-server.firebaseapp.com",
  projectId: "absoluter-server",
  storageBucket: "absoluter-server.appspot.com",
  messagingSenderId: "25099964769",
  appId: "1:25099964769:web:85e48921072405c0d87520",
  measurementId: "G-5V038ND7DJ"
      ));
  runApp(const MySite());

}
