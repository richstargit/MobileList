import 'package:flutter/material.dart';

class MyFutureBuilderPage extends StatefulWidget {
  const MyFutureBuilderPage({super.key});

  @override
  State<MyFutureBuilderPage> createState() => _MyFutureBuilderPageState();
}

class _MyFutureBuilderPageState extends State<MyFutureBuilderPage> {
  // Simulating an asynchronous operation that returns a Future
  Future<String> fetchData() async {
    await Future.delayed(const Duration(seconds: 5));
    return "Hello, FutureBuilder!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: const Text('FutureBuilder Page'),
        ),
        body: Center(
          child: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('Result: ${snapshot.data}',
                    style: TextStyle(fontSize: 20));
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return Image.network("https://media.tenor.com/eFde1mp-8fYAAAAM/carregando.gif");
            },
          ),
        ));
  }
}
