import 'package:flutter/material.dart';
import 'package:flutter_application_1/catalog_products.dart';
import 'package:flutter_application_1/item_page.dart';
class MyListPage extends StatefulWidget {
  const MyListPage({super.key});

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MyListPage"),backgroundColor: Colors.pink.shade200,),
      backgroundColor: Colors.white,
      body: ListView.separated(
        itemCount: CatalogProducts.items.length,
        itemBuilder: (context, index) => ListTile(
          leading: Image.network(CatalogProducts.items[index].imageurl),
          title: Text(CatalogProducts.items[index].title),
          subtitle: Text(CatalogProducts.items[index].desc),
          trailing: Icon(Icons.navigate_next_rounded),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemPage(product: CatalogProducts.items[index])));
          },
        ),
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}