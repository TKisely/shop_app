import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/userproducts';
  const UserProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your products'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (ctx, i) => Column(
                children: [
                  UserProductItem(
                      imgURL: productsData.items[i].imageUrl,
                      title: productsData.items[i].title),
                  Divider()
                ],
              )),
      drawer: AppDrawer(),
    );
  }
}
