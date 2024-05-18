import 'package:flutter/material.dart';
import 'package:twenty_r/colors.dart';
import 'package:twenty_r/size_options.dart';

class SizeOptionItem extends StatelessWidget {
  final int index;
  final SizeOptions sizeOption;
  final bool selected;
  const SizeOptionItem(
      {super.key,
      required this.index,
      required this.sizeOption,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
              color: selected ? brown : brownLight, shape: BoxShape.circle),
          child: Center(
            child: Image.asset(
              'images/cup.png',
              color: selected ? Colors.white : brown,
              width: 25 + (index * 5),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          sizeOption.name,
          style: TextStyle(
              color: brown,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2),
        ),
        Text(
          '${sizeOption.quantity} Fl 0z',
          style: TextStyle(
            color: brown,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
