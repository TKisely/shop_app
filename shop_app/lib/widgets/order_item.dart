import 'package:flutter/material.dart';
import 'package:shop_app/providers/orders.dart';

class SingleOrder extends StatelessWidget {
  final OrderItem order;
  const SingleOrder({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$' + order.amount.toString()),
            subtitle: Text(order.dateTime.toString()),
            trailing:
                IconButton(onPressed: () {}, icon: Icon(Icons.expand_more)),
          )
        ],
      ),
    );
  }
}
