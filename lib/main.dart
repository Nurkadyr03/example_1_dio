import 'package:example_1_dio/ui/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
// валюта менен иштедим
// Dio пакетин колдонуп Api -дан маалымат чакырдым
//  Country Flags пакетин колдонуп ар бир валютанын флагын чыгардым
// экранда  флаг-валютанын аты- курсу(узбек сум менен коргозулгон)
// НБ Узбекстан api- ы

