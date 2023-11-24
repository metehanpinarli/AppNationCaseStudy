import 'package:app_nation_case_study/product/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../resources/assets/assets_constants.dart';
import '../../resources/style/color_palette.dart';
import 'bottom_navigation_bar_painter.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(MediaQuery.of(context).size.width, 98),
      painter: BottomNavigationBarPainter(),
      child: const SizedBox(
        height: 98,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavigationBarItem(title: 'Home', titleColor: ColorPalette.darkBlue, icon: AssetIcons.ic_house_line),
            CustomVerticalDivider(),
            NavigationBarItem(title: 'Settings', titleColor: Colors.black, icon: AssetIcons.ic_wrench),
          ],
        ),
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.title,
    required this.titleColor,
    required this.icon,
  });

  final String title;
  final Color titleColor;
  final AssetIcons icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(icon.path()),
        Text(title, style: context.textTheme.bodySmall?.copyWith(color: titleColor)),
      ],
    );
  }
}

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
