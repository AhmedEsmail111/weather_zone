import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200 && response.body != null) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
