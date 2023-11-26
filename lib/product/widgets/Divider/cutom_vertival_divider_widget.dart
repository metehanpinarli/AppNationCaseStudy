import 'package:flutter/material.dart';

import '../../resources/style/color_palette.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: 24,
      decoration: BoxDecoration(
        color: ColorPalette.darkGray,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}