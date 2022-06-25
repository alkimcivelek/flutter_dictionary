import 'package:flutter/material.dart';
import '../controllers/DictionaryController.dart';
import '../models/dictionary_model.dart';
import '../utils/database_helper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/FavoriteController.dart';

class FavoritesPage extends StatefulWidget {
  FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  bool isDisplayed = false;
  final FavoriteController _favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: HexColor("#18191A"),
      body: FutureBuilder(
        future: DbHelper.instance.getWords(),
        builder: ((BuildContext context,
            AsyncSnapshot<List<DictionaryModel>> snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      "Favorites",
                      style: GoogleFonts.lora(
                          textStyle: TextStyle(
                              color: HexColor("E4E6EB"),
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.0870),
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03);
                    },
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      return ExpansionTile(
                        trailing: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        controlAffinity: ListTileControlAffinity.trailing,
                        tilePadding: const EdgeInsets.all(8),
                        title: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.transparent)),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.09,
                                    height: MediaQuery.of(context).size.height *
                                        0.09,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: HexColor("#89CFF0")),
                                    child: Center(
                                      child: Text(
                                        snapshot.data![index].type,
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
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  snapshot.data![index].word,
                                  style: GoogleFonts.lora(
                                      textStyle: TextStyle(
                                          color: HexColor("E4E6EB"),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 8,
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          bottom: 5.0),
                                      child: Container(
                                        width: 50,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            color: HexColor("#18191A"),
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(8)),
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
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.0,
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.060,
                                          bottom: 5.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        child: Text(
                                          snapshot.data![index].meaning,
                                          overflow: TextOverflow.fade,
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
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 8,
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.13,
                                          bottom: 5.0),
                                      child: Container(
                                        width: 50,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            color: HexColor("#18191A"),
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(8)),
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
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.0,
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.17,
                                        bottom: 5.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      child: Text(
                                        snapshot.data![index].sample,
                                        overflow: TextOverflow.fade,
                                        style: GoogleFonts.lora(
                                            textStyle: TextStyle(
                                                color: HexColor("E4E6EB"),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14)),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.015,
                                          right: 8),
                                      child: GestureDetector(
                                        onTap: () async {
                                          setState(() {
                                            DbHelper.instance.deleteDict(
                                                snapshot.data![index].id);
                                          });
                                        },
                                        child: Icon(Icons.star_rate,
                                            color: HexColor("#FEDE00")),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            );
          }
          return Container();
        }),
      ),
    ));
  }
}
