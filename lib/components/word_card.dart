import 'package:flutter/material.dart';
import '../controllers/DictionaryController.dart';
import '../controllers/FavoriteController.dart';
import '../models/dictionary_model.dart';
import '../utils/database_helper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class WordCard extends StatelessWidget {
  final DictionaryController dictionaryController;
  final FavoriteController favoriteController;
  WordCard(
      {Key? key,
      required this.dictionaryController,
      required this.favoriteController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.35,
        top: MediaQuery.of(context).size.height * 0.18,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.transparent)),
              child: Obx((() => Stack(
                    children: [
                      Visibility(
                        visible:
                            dictionaryController.dictWord.value.word.isNotEmpty,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.015,
                                left: 8),
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: HexColor("#89CFF0")),
                              child: Center(
                                child: Text(
                                  dictionaryController.dictWord.value.type,
                                  style: GoogleFonts.lora(
                                      textStyle: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible:
                            dictionaryController.dictWord.value.word.isNotEmpty,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.03,
                            ),
                            child: Text(
                              dictionaryController.dictWord.value.word,
                              style: GoogleFonts.lora(
                                  textStyle: TextStyle(
                                      color: HexColor("E4E6EB"),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15)),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible:
                            dictionaryController.dictWord.value.word.isNotEmpty,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 8,
                                top: MediaQuery.of(context).size.height * 0.095,
                                bottom: 5.0),
                            child: Container(
                              width: 50,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: HexColor("#18191A"),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Text(
                                  "Anlam",
                                  style: GoogleFonts.lora(
                                      textStyle: TextStyle(
                                          color: HexColor("E4E6EB"),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible:
                            dictionaryController.dictWord.value.word.isNotEmpty,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 8.0,
                                top: MediaQuery.of(context).size.height * 0.138,
                                bottom: 5.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: Text(
                                overflow: TextOverflow.fade,
                                dictionaryController.dictWord.value.meaning,
                                style: GoogleFonts.lora(
                                    textStyle: TextStyle(
                                        color: HexColor("E4E6EB"),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible:
                            dictionaryController.dictWord.value.word.isNotEmpty,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 8,
                                top: MediaQuery.of(context).size.height * 0.24,
                                bottom: 5.0),
                            child: Container(
                              width: 50,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: HexColor("#18191A"),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Text(
                                  "Örnek",
                                  style: GoogleFonts.lora(
                                      textStyle: TextStyle(
                                          color: HexColor("E4E6EB"),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible:
                            dictionaryController.dictWord.value.word.isNotEmpty,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 8.0,
                              top: MediaQuery.of(context).size.height * 0.283,
                              bottom: 5.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Text(
                              overflow: TextOverflow.fade,
                              dictionaryController.dictWord.value.sample,
                              style: GoogleFonts.lora(
                                  textStyle: TextStyle(
                                      color: HexColor("E4E6EB"),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14)),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.027,
                              right: 8),
                          child: GestureDetector(
                            onTap: () async {
                              favoriteController.switchFavButtons();
                              favoriteController.isFavorite.value == true
                                  ? await DbHelper.instance.insertWords(
                                      DictionaryModel(
                                          id: dictionaryController.dictWord.value
                                              .id,
                                          meaning:
                                              dictionaryController.dictWord.value
                                                  .meaning,
                                          sample:
                                              dictionaryController.dictWord.value
                                                  .sample,
                                          type: dictionaryController
                                              .dictWord.value.type,
                                          word: dictionaryController
                                              .dictWord.value.word,
                                          favorite: 1))
                                  : await DbHelper.instance.deleteDict(
                                      dictionaryController.dictWord.value.id);
                            },
                            child: Visibility(
                              visible: dictionaryController
                                  .dictWord.value.word.isNotEmpty,
                              child: Icon(
                                Icons.star_rate,
                                color: favoriteController.isFavorite.value
                                    ? HexColor("#FEDE00")
                                    : Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )))),
        ));
  }
}
