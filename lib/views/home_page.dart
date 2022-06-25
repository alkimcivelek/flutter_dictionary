import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../components/search.dart';
import '../components/word_card.dart';
import '../controllers/DictionaryController.dart';
import '../controllers/FavoriteController.dart';
import '../models/dictionary_model.dart';
import '../utils/database_helper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DictionaryController _dictionaryController =
      Get.put<DictionaryController>(DictionaryController());

  final FavoriteController _favoriteController =
      Get.put<FavoriteController>(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: HexColor("#18191A"),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                CustomAppBar(
                  dictionaryController: _dictionaryController,
                ),
                Search(
                    dictionaryController: _dictionaryController,
                    favoriteController: _favoriteController),
                WordCard(
                    dictionaryController: _dictionaryController,
                    favoriteController: _favoriteController),
              ],
            ),
          )),
    );
  }
}
