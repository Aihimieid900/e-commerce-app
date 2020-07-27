class Language {
  String englishName;
  String localName;
  String flag;
  String code;

  Language(this.englishName, this.localName, this.flag, this.code);
}

class LanguagesList {
  List<Language> _languages;

  LanguagesList() {
    this._languages = [
      new Language(
          "English", "English", "img/united-states-of-america.png", "en"),
      new Language("Arabic", "العربية", "img/united-arab-emirates.png", "ar"),
    ];
  }

  List<Language> get languages => _languages;
}
