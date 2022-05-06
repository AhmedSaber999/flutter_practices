// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:bitcoin_tricker/coin_data.dart';
import 'package:bitcoin_tricker/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String? selectedCurrency = 'USD';
  String btcCuurencyRate = '?';
  @override
  void initState() {
    super.initState();
    getCoinCurrencyRate('BTC', 'USD').then((value) {
      setState(() {
        btcCuurencyRate = value;    
      }); 
    });
  }

  List<DropdownMenuItem<String>> getCurrenciesItems(){
    List<DropdownMenuItem<String>> items = [];
    for(var currency in currenciesList) {
      items.add(DropdownMenuItem<String>(child: Text(currency), value: currency,));
    }

    return items;
  }

  List<Text> getPickerItems(){
    List<Text> items = [];
    for(var currency in currenciesList) {
      items.add(Text(currency));
    }

    return items;
  }

  Widget getIosPicker(){
    return
     CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        children: getPickerItems(),
        itemExtent: 32,
        onSelectedItemChanged: (index){
          ApiService.getCoinExchange('BTC', currenciesList[index]);
        },
      );
  }
  
  Future<String> getCoinCurrencyRate(String coin, String currency) async {
    var data = await ApiService.getCoinExchange(coin, currency);
    var json = jsonDecode(data);
    return json['rate'].toStringAsFixed(3);
  }

  Widget getAndroidPicker(){
    return
      DropdownButton<String>(
        value: selectedCurrency,
        items: getCurrenciesItems(),
        onChanged: (value) async{
          var temp = await getCoinCurrencyRate('BTC', value ?? 'USD');
          setState(() {
            btcCuurencyRate = temp;
            selectedCurrency = value;
          });
        },
      );
  }

  Widget getPicker(){
    try{
      if(Platform.isIOS){
        return getIosPicker();
      }
      return getAndroidPicker();
    }catch(ex){
      print(ex);
      return getAndroidPicker();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
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
                  '1 BTC = $btcCuurencyRate $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}


