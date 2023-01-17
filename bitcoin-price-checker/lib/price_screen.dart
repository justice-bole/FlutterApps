import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

Padding coinDisplay(String text) {
  return Padding(
    padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
    child: Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

class _PriceScreenState extends State<PriceScreen> {
  String currency = '';
  CoinData coinData = CoinData();
  double btc_value = 0.0;
  double eth_value = 0.0;
  double ltc_value = 0.0;
  int currentIndex = 0;

  @override
  void initState() {
    setValue();
    super.initState();
  }

  void setValue() async {
    btc_value = await coinData.getCoinData(0, 0);
    eth_value = await coinData.getCoinData(0, 1);
    ltc_value = await coinData.getCoinData(0, 2);
  }

  DropdownButton getAndroidPicker() {
    return DropdownButton(
      value: currency,
      items: getDropdownItems(),
      onChanged: (index) async {
        currentIndex = index;
        btc_value = await coinData.getCoinData(index, 0);
        eth_value = await coinData.getCoinData(index, 1);
        ltc_value = await coinData.getCoinData(index, 2);
        setState(() {});
      },
    );
  }

  CupertinoPicker getIOSPicker() {
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) async {
        currentIndex = selectedIndex;
        btc_value = await coinData.getCoinData(selectedIndex, 0);
        eth_value = await coinData.getCoinData(selectedIndex, 1);
        ltc_value = await coinData.getCoinData(selectedIndex, 2);
        setState(() {});
      },
      backgroundColor: Colors.lightBlue,
      children: getPickerItems(),
    );
  }

  List<DropdownMenuItem> getDropdownItems() {
    List<DropdownMenuItem> dropdownItems = [];

    for (String currency in currenciesList) {
      DropdownMenuItem dropdown =
          DropdownMenuItem(child: Text(currency), value: currency);
      dropdownItems.add(dropdown);
    }

    return dropdownItems;
  }

  List<Widget> getPickerItems() {
    List<Widget> dropdownItems = [];

    for (String currency in currenciesList) {
      dropdownItems.add(Text(currency));
    }

    return dropdownItems;
  }

  Widget getPlatformPicker() {
    if (Platform.isIOS) {
      return getIOSPicker();
    } else if (Platform.isAndroid) {
      return getAndroidPicker();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🪙 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          coinDisplay(
              '1 BTC = ${btc_value.toString()} ${currenciesList[currentIndex]}'),
          coinDisplay(
              '1 ETH = ${eth_value.toString()} ${currenciesList[currentIndex]}'),
          coinDisplay(
              '1 LTC = ${ltc_value.toString()} ${currenciesList[currentIndex]}'),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPlatformPicker(),
          ),
        ],
      ),
    );
  }
}
