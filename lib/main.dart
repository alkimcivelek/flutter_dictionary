import 'package:flutter/material.dart';
import '../controllers/DictionaryController.dart';
import '../models/dictionary_model.dart';
import '../views/home_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // for navigation
      debugShowCheckedModeBanner: false,
      title: 'Dictionary',
      home: HomePage(),
    );
  }
}
