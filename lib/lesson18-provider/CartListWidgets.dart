// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CartModel.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('get Products'.toUpperCase()),
          style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
        )
      ),
    );
  }

  ListView buildListView(CartModel cart) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) => ListTile(
        trailing: IconButton(
          color: Colors.indigoAccent,
          icon: const Icon(Icons.add_shopping_cart),
          onPressed: () {
            // TODO Handle adding to cart
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Item Added to cart')));
          },
        ),
        title: Text(
          'cart.items[index].productName',
          style: TextStyle(fontFamily: 'eczar'),
        ),
        subtitle: Text(
          '{cart.items[index].price}',
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
