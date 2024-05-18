import 'package:flutter/material.dart';
import 'package:twenty_r/category.dart';
import 'package:twenty_r/colors.dart';

class DisplayImageOrder extends StatelessWidget {
  final String image;
  const DisplayImageOrder({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrain) {
      return SizedBox(
        height: constrain.maxWidth * 1.25,
        width: constrain.maxWidth,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              width: constrain.maxWidth / 1.5,
              height: constrain.maxWidth * 0.9,
              decoration:
                  BoxDecoration(color: brownLight, shape: BoxShape.circle),
            ),
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(constrain.maxWidth * 0.45)),
              child: SizedBox(
                width: constrain.maxWidth * 0.9,
                height: constrain.maxWidth * 2,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Positioned(
                        top: -60,
                        width: 100,
                        height: constrain.maxWidth * 1.9,
                        child: Image.asset(
                          'images/${image}',
                          fit: BoxFit.contain,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
