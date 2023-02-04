import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Map<String, dynamic>> getData() async {
    final response = await http.get(
        Uri.parse("https://632017e19f82827dcf24a655.mockapi.io/api/programs#"));
    return jsonDecode(response.body)["items"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getData(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Text((snapshot.data as Map)["createdAt"]),
              );
            } else {
              return Text("error");
            }
          })),
    );
  }
}
