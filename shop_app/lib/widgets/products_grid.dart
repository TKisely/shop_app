import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showOnlyFavorites;

  ProductsGrid({required this.showOnlyFavorites});
  @override
  Widget build(BuildContext context) {
    final productsData =
        Provider.of<Products>(context); // we want to listen here
    final products =
        showOnlyFavorites ? productsData.favorites : productsData.items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        //single item, so .value prefered
        value: products[i], //dont want to rebuild products
        child: ProductItem(),
      ),
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
    );
  }
}
