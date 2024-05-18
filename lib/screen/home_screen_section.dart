import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twenty_r/display_image.dart';
import 'package:twenty_r/category.dart';
import 'package:twenty_r/category_items.dart';
import 'package:twenty_r/colors.dart';
import 'package:twenty_r/screen/cart.dart';
import 'package:twenty_r/screen/detail_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentCategory = 0;
  int currentProduct = 0;
  PageController? controller;
  double viewPortFractionTopping = 0.25;
  double? pageOffsetTopping = 2;
  late AnimationController animationController;

  double viewPoint = 0.5;
  double? pageOffSet = 1;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 1, viewportFraction: viewPoint)
      ..addListener(() {
        setState(() {
          pageOffSet = controller!.page;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Product> dataProducts = products
        .where(
            (element) => element.categoryId == categories[currentCategory].id)
        .toList();
    return Scaffold(
      backgroundColor: moreLighter,
      appBar: AppBar(
        elevation: 0,
        // automaticallyImplyLeading: false,
        backgroundColor: moreLighter,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 15.0,
              backgroundImage: AssetImage("images/20r.png"),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "COFFEE",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16, color: brown),
                ),
                // Text(
                //   "what u r",
                //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                // )
              ],
            )
          ],
        ),
        actions: [
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Carts()));
              },
              child: Stack(
                children: [
                  Image.asset(
                    "images/shopping-bag.png",
                    width: 22,
                    color: brown,
                  ),
                  Positioned(
                      right: 1,
                      top: -1,
                      child: Container(
                        height: 10,
                        width: 10,
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
      ),
      body: Stack(children: [
        const Positioned(
            top: 30,
            left: 40,
            child: Text(
              "Smooth Out\nYour Everyday",
              style: TextStyle(
                  height: 1.2, fontWeight: FontWeight.w900, fontSize: 35),
            )),
        Positioned(
          top: 120,
          child: ClipPath(
            clipper: Clip(),
            child: Container(
              height: 190,
              width: MediaQuery.of(context).size.width,
              color: brown,
              child: Row(
                children: List.generate(
                  categories.length,
                  (index) => Container(
                    height: 190,
                    width: MediaQuery.of(context).size.width / 4,
                    color: currentCategory == index
                        ? Colors.amber
                        : Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 125,
          child: ClipPath(
            clipper: Clip(),
            child: Container(
              height: 280,
              width: MediaQuery.of(context).size.width,
              color: brown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(categories.length, (index) {
                  int dec = 0;
                  int max = 1;
                  int bottomPadding = 1;
                  for (var i = 0; i < categories.length; i++) {
                    bottomPadding = index > max ? index - dec++ : index;
                  }
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentCategory = index;
                        dataProducts = products
                            .where((element) =>
                                element.categoryId ==
                                categories[currentCategory].id)
                            .toList();
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 10, bottom: bottomPadding.abs() * 75),
                      child: CategoryItems(
                        category: categories[index],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: Clip(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.58,
                width: MediaQuery.of(context).size.width,
                color: lighter,
              ),
            )),
        Positioned(
            bottom: 0,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipPath(
                  clipper: Clip(),
                  child: Container(
                    color: Colors.transparent,
                    height: MediaQuery.of(context).size.height * 0.58,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                        controller: controller,
                        onPageChanged: (value) {
                          setState(() {
                            currentProduct = value % dataProducts.length;
                          });
                        },
                        itemBuilder: (context, index) {
                          double scale = max(
                            viewPoint,
                            (1 - (pageOffSet! - index).abs() + viewPoint),
                          );
                          double ang = 0.0;
                          final items =
                              dataProducts[index % dataProducts.length];
                          return GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   CupertinoPageRoute(
                              //     builder: (context) => DetailScreen(
                              //         product: dataProducts[currentProduct %
                              //             dataProducts.length]),
                              //   ),
                              // );

                              Navigator.of(context).push(_createRoute(
                                  dataProducts[
                                      currentProduct % dataProducts.length]));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 200 - (scale / 1.6 * 170),
                              ),
                              child: Transform.rotate(
                                angle: ang * pi,
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [DisplayImage(product: items)],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        children: [
                          Text(
                            dataProducts[currentProduct % dataProducts.length]
                                .name,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                height: 1.2),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${(dataProducts[currentProduct % dataProducts.length].price).toString()}-SAR",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: List.generate(
                          dataProducts.length, (index) => indicator(index)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ))
      ]),
    );
  }

  AnimatedContainer indicator(int index) {
    return AnimatedContainer(
      height: 4,
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: index == currentProduct ? Colors.amber : brownlig,
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      child: Container(
        width: 3,
        height: 3,
        decoration:
            BoxDecoration(color: index == currentProduct ? brown : brownLight),
      ),
    );
  }

  Route _createRoute(Product product) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            DetailScreen(product: product),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.easeInSine;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        });
  }
}

class Clip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 100);
    path.quadraticBezierTo(size.width / 2, -40, 0, 100);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
