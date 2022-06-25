import '../models/dictionary_model.dart';
import '../utils/database_helper.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  var isFavorite = false.obs;
  
  void switchFavButtons() async {
    isFavorite.value == false ? isFavorite(true) : isFavorite(false);
  }
}
