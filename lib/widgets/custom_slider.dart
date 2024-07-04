import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';
import 'slider_Divider.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    required this.value,
    required this.setValue,
    required this.firstTitle,
    required this.lastTitle,
  });
  final double value;
  final Function setValue;
  final String firstTitle;
  final String lastTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: const [
          BoxShadow(
            spreadRadius: 0,
            blurRadius: 10.8,
            offset: Offset(2, 4),
            color: Color.fromRGBO(182, 161, 192, 0.11),
          ),
        ],
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SliderDivider(),
              SliderDivider(),
              SliderDivider(),
              SliderDivider(),
              SliderDivider(),
              SliderDivider(),
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 6,
              trackShape: CustomTrackShape(),
              inactiveTrackColor: CustomColors.grey5,
              disabledThumbColor: CustomColors.grey5,
              disabledActiveTickMarkColor: CustomColors.grey5,
            ),
            child: Slider(
              activeColor: CustomColors.mandarin,
              value: value,
              inactiveColor: CustomColors.grey5,
              autofocus: false,
              onChanged: (value) {
                setValue(value);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                firstTitle,
                style: const TextStyle(
                  color: CustomColors.grey2,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                lastTitle,
                style: const TextStyle(
                  color: CustomColors.grey2,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
