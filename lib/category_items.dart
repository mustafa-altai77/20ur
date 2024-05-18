import 'package:flutter/material.dart';
import 'package:twenty_r/category.dart';

class CategoryItems extends StatelessWidget {
  final Category category;
  const CategoryItems({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 75,
          width: 75,
          padding: const EdgeInsets.all(10),
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Image.asset(
            "images/${category.image}",
            height: 20,
            width: 20,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          category.name.toUpperCase(),
          style: const TextStyle(
              fontWeight: FontWeight.w900, fontSize: 13, color: Colors.white),
        )
      ],
    );
  }
}
