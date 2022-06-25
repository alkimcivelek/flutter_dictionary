import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/dictionary_model.dart';

class DictionaryController extends GetxController {
  var dictWord = DictionaryModel().obs;

  Future<void> fetchDictionary(String word) async {
    List<DictionaryModel> words = [];
    //https://sozluk.gov.tr/gts?ara=kelime
    var url = Uri.https('sozluk.gov.tr', '/gts', {'ara': word});
    var response = await http.get(url);

    if (response.statusCode == 200 && !response.body.contains("error")) {
      try {
        Iterable list = jsonDecode(response.body);
        words = list.map((e) => DictionaryModel.fromObject(e)).toList();
        dictWord.value = words[0];
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      dictWord.value = DictionaryModel();
    }
  }
}
