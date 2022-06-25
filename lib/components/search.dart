import 'package:flutter/material.dart';
import '../controllers/FavoriteController.dart';
import '../utils/database_helper.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/DictionaryController.dart';

class Search extends StatefulWidget {
  final DictionaryController dictionaryController;
  final FavoriteController favoriteController;
  Search(
      {Key? key,
      required this.dictionaryController,
      required this.favoriteController})
      : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.08,
      top: MediaQuery.of(context).size.height * 0.080,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardAppearance: Brightness.dark,
                controller: _searchController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 10),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.03),
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                    color: HexColor("#B0B3B8"),
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                  ),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                style: TextStyle(
                  color: HexColor("E4E6EB"),
                ),
              ),
            ),
          ),
          IconButton(
              color: HexColor("E4E6EB"),
              onPressed: () async {
                if (_searchController.text.isEmpty) {
                  await widget.dictionaryController.fetchDictionary("");
                  FocusManager.instance.primaryFocus?.unfocus();
                } else {
                  await widget.dictionaryController
                      .fetchDictionary(_searchController.text.toLowerCase());
                  if (widget.dictionaryController.dictWord.value.id.isEmpty) {
                    await widget.dictionaryController.fetchDictionary("");
                    FocusManager.instance.primaryFocus?.unfocus();
                  } else {
                    bool isTrue = await DbHelper.instance
                        .getWord(widget.dictionaryController.dictWord.value.id);
                    isTrue
                        ? widget.favoriteController.isFavorite(true)
                        : widget.favoriteController.isFavorite(false);
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                }
              },
              icon: Icon(Icons.search))
        ],
      ),
    );
  }
}
