import 'package:app_nation_case_study/product/resources/assets/assets_constants.dart';
import 'package:app_nation_case_study/product/resources/sizes/sizes.dart';
import 'package:app_nation_case_study/product/widgets/Divider/custom_divider_widget.dart';
import 'package:app_nation_case_study/view/settings/widgets/custom_list_tile_widget.dart';
import 'package:flutter/material.dart';

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


