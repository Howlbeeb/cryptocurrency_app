import 'dart:convert';
import 'dart:core';
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'dart:async';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List? currencies;
  List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.teal];

  @override
  void didChangeDependencies()

  async {
  super.initState();
  currencies = await getCurrencies();
  }

  Future<List> getCurrencies() async {
    String cryptoUrl =
        "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/historical";
    http.Response response = await http.get(Uri.parse(cryptoUrl));
    return json.decode(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto APP"),
        centerTitle: true,
      ),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return Container(
      child: Flexible(
        child: ListView.builder(
            itemCount: currencies!.length,
            itemBuilder: (BuildContext context, int index) {
              final Map currency = currencies![index];
              final MaterialColor color = _colors[index % _colors.length];
              return _getListItemUI(currency, color);
            }),
      ),
    );
  }

  Widget _getListItemUI(Map currency, MaterialColor color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(currency['name'][0]),
      ),
      title: Text(
        currency['name'],
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}