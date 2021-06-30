import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_app/providers/orders.dart';

class SingleOrder extends StatefulWidget {
  final OrderItem order;
  const SingleOrder({Key? key, required this.order}) : super(key: key);

  @override
  _SingleOrderState createState() => _SingleOrderState();
}

class _SingleOrderState extends State<SingleOrder> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$' + widget.order.amount.toString()),
            subtitle: Text(widget.order.dateTime.toString()),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more)),
          ),
          if (_expanded)
            Container(
                height: min(widget.order.products.length * 20 + 100, 140),
                child: ListView.builder(
                    itemCount: widget.order.products.length,
                    itemBuilder: (ctx, i) => Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 4),
                              child: Text(
                                widget.order.products[i].title.toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 4),
                              child: Text(widget.order.products[i].quantity
                                      .toString() +
                                  ' x \$' +
                                  widget.order.products[i].price.toString()),
                            )
                          ],
                        )))
        ],
      ),
    );
  }
}
