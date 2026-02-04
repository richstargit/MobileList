import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<String> fetchData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
        headers:{
          "Accept":"application/json"
        });

    if (response.statusCode == 200) {
      final JSONBODY = json.decode(response.body);
      return JSONBODY;
    } else {
      throw Exception("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade200,
      ),
      body: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("waitting");
            } else if (snapshot.hasData) {
              return Text('Result: ${snapshot.data}',
                  style: TextStyle(fontSize: 20));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Text("process");
          }),
    );
  }
}
