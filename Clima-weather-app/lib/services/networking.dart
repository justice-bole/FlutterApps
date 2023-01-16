import 'dart:convert';
import 'package:http/http.dart';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future<dynamic> getData() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Data could not be loaded. Error: ${response.statusCode}');
    }
  }
}
