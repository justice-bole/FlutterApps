import 'package:http/http.dart';
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = '3798E3A4-F90D-4AEA-A38B-3570DE107A4F';
const url = 'http://rest.coinapi.io/v1/exchangerate/';
//BTC/USD?apikey=3798E3A4-F90D-4AEA-A38B-3570DE107A4F';

class CoinData {
  Future<double> getCoinData(int index, int coin) async {
    Response response = await get(Uri.parse(
        '$url${cryptoList[coin]}/${currenciesList[index]}?apikey=$apiKey'));
    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      double rate = decodedResponse['rate'];
      return rate;
    } else {
      print(response.statusCode);
    }
  }
}
