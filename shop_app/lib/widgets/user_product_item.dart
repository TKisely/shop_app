import 'package:flutter/material.dart';
import 'package:shop_app/screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgURL;
  const UserProductItem(
      {Key? key, required this.id, required this.imgURL, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imgURL),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, EditProductScreen.routeName,
                      arguments: id);
                },
                icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                )),
          ],
        ),
      ),
    );
  }
}
