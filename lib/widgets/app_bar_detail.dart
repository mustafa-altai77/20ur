import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twenty_r/colors.dart';
import 'package:twenty_r/screen/cart.dart';

AppBar AppBarDetail(context, title, {showCart, order}) {
  return AppBar(
    backgroundColor: moreLighter,
    // backgroundColor: Colors.transparent,
    elevation: 0,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: brown,
      ),
    ),
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: brown),
    ),
    centerTitle: true,
    actions: [
      if (showCart)
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => Carts(
                          order: order,
                        )));
          },
          child: Center(
            child: Stack(
              children: [
                Image.asset(
                  "images/shopping-bag.png",
                  width: 22,
                  color: brown,
                ),
                Positioned(
                    right: 3,
                    top: 1,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.amber),
                    ))
              ],
            ),
          ),
        ),
      SizedBox(
        width: 15,
      )
    ],
  );
}
