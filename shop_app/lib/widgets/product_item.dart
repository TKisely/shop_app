import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem({required this.id, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        leading: IconButton(
          icon: Icon(Icons.star),
          onPressed: () {
            print('TODO:fav');
          },
        ),
        backgroundColor: Colors.black45,
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_bag),
          onPressed: () {
            print('TODO:shop');
          },
        ),
      ),
    );
  }
}
