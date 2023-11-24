import 'package:app_nation_case_study/product/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../product/resources/assets/assets_constants.dart';
import '../../../product/resources/sizes/sizes.dart';

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final AssetIcons icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      minLeadingWidth: 0,
      contentPadding: EdgeInsets.only(right: Sizes.defaultPadding),
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      title: Text(title, style: context.textTheme.bodyMedium),
      leading: SvgPicture.asset(icon.path()),
      trailing: SvgPicture.asset(AssetIcons.ic_arrow_up_right.path()),
    );
  }
}
