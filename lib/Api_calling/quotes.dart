import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Api_Calling
{
  String api = 'https://dummyjson.com/quotes';

  Future Quotes_Api()
    async {
    Uri url = Uri.parse(api);
    Response response = await http.get(url);
    if(response.statusCode==200)
      {
        final json = response.body;
        final data = jsonDecode(json);
        // print(data);
        return data;
      }
    else
      {
        return {};
      }
  }
}
