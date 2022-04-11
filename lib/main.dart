import 'package:dio_provider/pages/create_page.dart';
import 'package:dio_provider/pages/home_page.dart';
import 'package:dio_provider/pages/update_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => const HomePage(),
        UpdatePage.id: (context) => UpdatePage(),
        CreatePage.id: (context) => const CreatePage(),
      },
    );
  }
}