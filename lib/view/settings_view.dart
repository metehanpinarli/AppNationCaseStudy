import 'package:app_nation_case_study/product/resources/assets/assets_constants.dart';
import 'package:app_nation_case_study/product/resources/sizes/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: Sizes.defaultPadding, top: Sizes.defaultPadding),
          child: const Column(
            children: [
              CustomListTileWidget(title: 'Help', icon: AssetIcons.ic_Info),
              CustomDividerWidget(),
              CustomListTileWidget(title: 'Rate US', icon: AssetIcons.ic_star),
              CustomDividerWidget(),
              CustomListTileWidget(title: 'Share with Friends', icon: AssetIcons.ic_export),
              CustomDividerWidget(),
              CustomListTileWidget(title: 'Therms of Use', icon: AssetIcons.ic_scroll),
              CustomDividerWidget(),
              CustomListTileWidget(title: 'Privacy Policy', icon: AssetIcons.ic_shield_check),
              CustomDividerWidget(),
              CustomListTileWidget(title: 'OS Version', icon: AssetIcons.ic_git_branch),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color(0xFFE5E5EA),
      thickness: 2,
    );
  }
}

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
      contentPadding:  EdgeInsets.only(right: Sizes.defaultPadding),
      visualDensity: const VisualDensity(horizontal: 0, vertical:-4),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
      ),
      leading: SvgPicture.asset(icon.path()),
      trailing: SvgPicture.asset(AssetIcons.ic_arrow_up_right.path()),
    );
  }
}
