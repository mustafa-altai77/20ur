import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:twenty_r/colors.dart';
import 'package:twenty_r/display_image.dart';
import 'package:twenty_r/display_image_order.dart';
import 'package:twenty_r/size_options.dart';
import 'package:twenty_r/widgets/app_bar_detail.dart';

class Carts extends StatefulWidget {
  final List<Order>? order;

  const Carts({super.key, this.order});

  @override
  State<Carts> createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: moreLighter,
      appBar: AppBarDetail(context, "Carts", showCart: false),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: widget.order?.length ?? 0,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: moreLighter,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: -1,
                                  blurRadius: 22,
                                  offset: Offset(-9, 9),
                                )
                              ]),
                          child: Stack(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: size.width / 3 * 0.81,
                                      height: size.height / 3 * 0.5,
                                      child: DisplayImageOrder(
                                          image: widget.order![index].image),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.order![index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: brown),
                                      ),
                                      Text(
                                        widget.order![index].total.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: brown),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    })),
              )
            ],
          )
        ],
      ),
    );
  }
}
