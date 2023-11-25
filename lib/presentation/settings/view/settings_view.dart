import 'package:app_nation_case_study/domain/bloc/Settings/settings_bloc.dart';
import 'package:app_nation_case_study/injectable.dart';
import 'package:app_nation_case_study/presentation/settings/widgets/custom_list_tile_widget.dart';
import 'package:app_nation_case_study/product/resources/assets/assets_constants.dart';
import 'package:app_nation_case_study/product/resources/sizes/sizes.dart';
import 'package:app_nation_case_study/product/widgets/Divider/custom_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      movementDuration: Duration.zero,
      resizeDuration: null,
      key: const Key('settings'),
      direction: DismissDirection.vertical,
      onUpdate: (_) => context.pop(),
      child: BlocProvider(
        create: (context) => locator<SettingsBloc>(),
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: Sizes.defaultPadding, top: Sizes.defaultPadding),
                  child: Column(
                    children: [
                      const CustomListTileWidget(title: 'Help', icon: AssetIcons.ic_Info),
                      const CustomDividerWidget(),
                      const CustomListTileWidget(title: 'Rate US', icon: AssetIcons.ic_star),
                      const CustomDividerWidget(),
                      const CustomListTileWidget(title: 'Share with Friends', icon: AssetIcons.ic_export),
                      const CustomDividerWidget(),
                      const CustomListTileWidget(title: 'Therms of Use', icon: AssetIcons.ic_scroll),
                      const CustomDividerWidget(),
                      const CustomListTileWidget(title: 'Privacy Policy', icon: AssetIcons.ic_shield_check),
                      const CustomDividerWidget(),
                      CustomListTileWidget(
                          title: 'OS Version', trailingText: state.osVersion, icon: AssetIcons.ic_git_branch),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
