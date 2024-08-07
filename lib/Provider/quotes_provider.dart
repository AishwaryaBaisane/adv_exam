import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api_calling/quotes.dart';
import '../Modal/modal.dart';
import '../Screens/HomePage/HomePage.dart';

class QuotesProvider extends ChangeNotifier {
  Api_Calling api_calling = Api_Calling();
  QuotesModal? quotesModal;
  List<String> FavList = [];

  Future<QuotesModal?> FromJson() async {
    final data = await api_calling.Quotes_Api();
    quotesModal = QuotesModal.fromJson(data);
    notifyListeners();
    return quotesModal;
  }

  Future AddtoFav({required int index, required String quotes}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(FavList);
    String data = '$quotes ';
    FavList.add(data);
    sharedPreferences.setStringList('quote', FavList);
    notifyListeners();
  }

  Future<void> getSharedPreferencesLike() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    FavList = sharedPreferences.getStringList('quote') ?? [];
    print(FavList);
    notifyListeners();
  }

  void removeList({required int index}) {
    FavList.removeAt(index);
    print(FavList);
    notifyListeners();
  }

  QuotesProvider() {
    getSharedPreferencesLike();
    FromJson();
  }
}
