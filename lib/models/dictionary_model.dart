class DictionaryModel {
  String id;
  String word;
  String meaning;
  String type;
  String sample;
  int favorite;

  DictionaryModel(
      {this.id = "",
      this.word = "",
      this.meaning = "",
      this.type = "",
      this.sample = "",
      this.favorite = 0});

  factory DictionaryModel.fromObject(Map<String, dynamic> json) {
    return DictionaryModel(
        id: json["kelime_no"],
        word: json["madde"],
        meaning: json["anlamlarListe"][0]["anlam"],
        type: json["anlamlarListe"][0]["ozelliklerListe"][0]["tam_adi"],
        sample: json["anlamlarListe"][0]["orneklerListe"] == null
            ? "Örnek bulunamadı"
            : json["anlamlarListe"][0]["orneklerListe"][0]["ornek"],
        favorite: json["favorite"] ?? 0);
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "word": word,
        "meaning": meaning,
        "type": type,
        "sample": sample,
        "favorite": favorite
      };

  factory DictionaryModel.fromMap(Map<String, dynamic> json) {
    return DictionaryModel(
        id: json["id"],
        word: json["word"],
        meaning: json["meaning"],
        type: json["type"],
        sample: json["sample"],
        favorite: json["favorite"]);
  }

}
