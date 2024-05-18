import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:twenty_r/colors.dart';
import 'package:twenty_r/screen/home_screen_section.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> with TickerProviderStateMixin {
  late AnimationController animationController;
  final List<String> titles = [
    'Profile',
    'orders',
    'offer and promo',
    'Privacy policy',
    'Security'
  ];
  final List<String> icons = [
    'images/logos/profile.png',
    'images/logos/order.png',
    'images/logos/offer.png',
    'images/logos/privacy.png',
    'images/logos/security.png'
  ];

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  _toggle() => animationController.isCompleted
      ? animationController.reverse()
      : animationController.forward();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        var scale = 1 - (animationController.value * 0.3);
        var maxSide = MediaQuery.of(context).size.width;
        var side = (maxSide * (animationController.value * 0.6));
        return GestureDetector(
          onTap: _toggle,
          child: Stack(
            children: [
              Material(
                color: brown,
                child: SafeArea(
                  child: Theme(
                      data: ThemeData(brightness: Brightness.dark),
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                        AssetImage('images/image.png'),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text("Mustafa",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                              color: Colors.amber))
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Expanded(
                                child: ListView.builder(
                                    itemCount: titles.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          ListTile(
                                            leading: Image.asset(icons[index]),
                                            title: Text(
                                              titles[index].toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17,
                                                  color: Colors.white),
                                            ),
                                            onTap: () {},
                                          ),
                                          if (index != titles.length - 1)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 60, right: 230),
                                              child: Divider(
                                                color: Colors.white
                                                    .withOpacity(0.3),
                                              ),
                                            )
                                        ],
                                      );
                                    })),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.amber,
                                  ),
                                  Text("Sign-out",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18,
                                          color: Colors.amber)),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                ),
              ),
              Transform(
                transform: Matrix4.identity()
                  ..translate(side)
                  ..scale(scale),
                // // ..setEntry(3, 2, 001)
                // ..rotateY(animationController.value -
                //     70 * animationController.value * pi / 180),
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    child: HomePage()),
              ),
            ],
          ),
        );
      },
    );
  }
}
