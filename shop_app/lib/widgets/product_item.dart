import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product_pr.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product_pr>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: IconButton(
            color: Theme.of(context).accentColor,
            icon: Icon(product.isFavorite ? Icons.star : Icons.favorite),
            onPressed: () {
              product.toggleFavoriteStatus();
              print('TODO:fav');
            },
          ),
          backgroundColor: Colors.black45,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.shopping_bag),
            onPressed: () {
              print('TODO:shop');
            },
          ),
        ),
      ),
    );
  }
}
