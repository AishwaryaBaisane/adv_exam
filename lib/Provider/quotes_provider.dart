
import 'package:flutter/cupertino.dart';

import '../Api_calling/quotes.dart';
import '../Modal/modal.dart';
import '../Screens/HomePage/HomePage.dart';

class QuotesProvider extends ChangeNotifier
{
  Api_Calling api_calling = Api_Calling();
   QuotesModal? quotesModal;
   List FavList =[];

  Future<QuotesModal?> FromJson()
  async {
    final data = await api_calling.Quotes_Api();
    quotesModal = QuotesModal.fromJson(data);
    notifyListeners();
    return quotesModal;
  }

  void AddtoFav()
  {
    // FavList.add(Value);
    print(FavList2);
    notifyListeners();
  }
  QuotesProvider()
  {
    FromJson();
  }

}
