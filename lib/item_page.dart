import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';

class ItemPage extends StatefulWidget {
  final Product product;
  const ItemPage({super.key,required this.product});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ItemPage"),backgroundColor: Colors.pink.shade200,),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Text(widget.product.title,style: TextStyle(fontSize: 32),),
          Image.network(widget.product.imageurl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.product.desc),
            ),),
          )
        ],
      )
    );
  }
}