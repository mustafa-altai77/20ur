import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:twenty_r/category.dart';
import 'package:twenty_r/colors.dart';
import 'package:twenty_r/display_image.dart';
import 'package:twenty_r/size_options.dart';
import 'package:twenty_r/widgets/app_bar_detail.dart';
import 'package:twenty_r/widgets/size_option_item.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int selectedSize = 1;
  int quantity = 1;
  List<Order> orderList = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: moreLighter,
      appBar:
          AppBarDetail(context, "Details", showCart: true, order: orderList),
      body: Stack(
        children: [
          Positioned(
              left: 20,
              right: 20,
              child: Column(
                children: [
                  Hero(
                    tag: widget.product.name,
                    child: SizedBox(
                      width: size.width * 0.81,
                      height: size.height * 0.5,
                      child: DisplayImage(product: widget.product),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        //width: size.width / 1.5,
                        child: Text(
                          widget.product.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: brown),
                        ),
                      ),
                      Column(
                        children: [
                          AnimatedDigitWidget(
                            value: widget.product.price * quantity,
                            suffix: ' SAR',
                            textStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                color: brown),
                            fractionDigits: 2,
                          ),
                          const Text(
                            "Best Sale",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Size Options",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(sizeOptions.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = index;
                              });
                            },
                            child: SizeOptionItem(
                                index: index,
                                sizeOption: sizeOptions[index],
                                selected: selectedSize == index ? true : false),
                          );
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (quantity > 1) {
                              quantity--;
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: brown,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.remove,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        quantity.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: brown,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: brown,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          orderList.add(Order(
                              name: widget.product.name,
                              image: widget.product.image,
                              size: selectedSize,
                              total: widget.product.price * quantity));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: brown,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              "Add to Order",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ))
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
