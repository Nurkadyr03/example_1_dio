import 'package:country_flags/country_flags.dart';
import 'package:dio/dio.dart';
import 'package:example_1_dio/data/models/currency.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List> getDataFromApi() async {
    var response = await Dio().get("https://nbu.uz/exchange-rates/json/");
    List currencies = response.data
        .map((current_currency) => Currency.fromJson(current_currency))
        .toList();
    print("keldi   ...................................");
    return currencies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("dounload..."));
          }
          if (snapshot.hasError) {
            return Center(child: Text("error"));
          }
          if (snapshot.hasData) {
            List data = snapshot.data!;
            return ListView.builder(
              
              itemCount: data.length,
              itemBuilder: (context, index) {
                
                return Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 50,
                  color: Colors.black12,
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CountryFlag.fromCountryCode(data[index].code.substring(0, 2),
                          height: 50, width: 100),
                      Text(data[index].title),
                      Text("${data[index].cb_price} sum"),
                    ],
                  ),
                );
              },
            );
          }
          return Container();
        }),
        future: getDataFromApi(),
      )),
    );
  }
}
