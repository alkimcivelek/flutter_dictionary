import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/DictionaryController.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../views/favorites_page.dart';

class CustomAppBar extends StatelessWidget {
  final DictionaryController dictionaryController;
  const CustomAppBar({Key? key, required this.dictionaryController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.08,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Center(
                child: Text(
                  "Dictionary",
                  style: GoogleFonts.lora(
                      textStyle: TextStyle(
                          color: HexColor("E4E6EB"),
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () async {
                    dictionaryController.fetchDictionary("");
                    await Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => FavoritesPage()));
                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.038,
                      width: MediaQuery.of(context).size.width * 0.18,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.transparent)),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 3),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.star_rate,
                                size: 19,
                                color: HexColor("#FEDE00"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Favs",
                                style: GoogleFonts.lora(
                                    textStyle: TextStyle(
                                        color: HexColor("E4E6EB"),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13)),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
