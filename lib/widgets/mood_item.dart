import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

// ignore: must_be_immutable
class MoodItem extends StatelessWidget {
  MoodItem({
    super.key,
    required this.title,
    required this.imagePath,
    this.isSelected = false,
  });

  final String title;
  final String imagePath;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
      width: 83,
      padding: const EdgeInsets.symmetric(vertical: 23),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isSelected ? CustomColors.mandarin : Colors.transparent,
        ),
        boxShadow: const [
          BoxShadow(
            spreadRadius: 0,
            blurRadius: 10.8,
            offset: Offset(2, 4),
            color: Color.fromRGBO(182, 161, 192, 0.11),
          ),
        ],
        borderRadius: BorderRadius.circular(76),
      ),
      margin: const EdgeInsets.only(top: 8, right: 8, bottom: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width: 53,
            height: 50,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: CustomColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
