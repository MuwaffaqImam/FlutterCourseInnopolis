// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CartModel.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartModel cartModel= context.watch<CartModel>();
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: cartModel.items.isEmpty
          ? buildElevatedButton(context)
          : buildListView(cartModel),
    );
  }
  /// -----------------
  Consumer<CartModel> buildConsumer() {
    return Consumer<CartModel>(
      builder: (context, cartModel, child) {
        return Center(
            child: cartModel.items.isEmpty
                ? buildElevatedButton(context)
                : buildListView(cartModel));
      },
    );
  }

  Widget buildElevatedButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
                      onPressed: () {
                        context.read<CartModel>().getProductList();
                        print(context.read<CartModel>().items);
                      },
                      child: Text('get Products'.toUpperCase()),
                      style:
                          ElevatedButton.styleFrom(primary: Colors.deepPurple),
                    ),
    );
  }

  ListView buildListView(CartModel cart) {
    return ListView.separated(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        trailing: IconButton(
          color: Colors.indigoAccent,
          icon: const Icon(Icons.remove_shopping_cart),
          onPressed: () {
            context.read<CartModel>().removeCartItem(cart.items[index]);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Item removed from cart')));
          },
        ),
        title: Text(
          '${cart.items[index].productName}',
          style: TextStyle(fontFamily: 'eczar'),
        ),
        subtitle: Text(
          '${cart.items[index].price}',
        ),
      ),
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.indigo,
          thickness: 3,
        );
      },
    );
  }
}
