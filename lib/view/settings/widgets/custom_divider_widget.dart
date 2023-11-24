import 'package:app_nation_case_study/product/resources/style/color_palette.dart';
import 'package:flutter/material.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: ColorPalette.gray,
      thickness: 2,
    );
  }
}