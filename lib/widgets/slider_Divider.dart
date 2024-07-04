import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

class SliderDivider extends StatelessWidget {
  const SliderDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: 8,
      decoration: BoxDecoration(
        color: CustomColors.grey5,
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
