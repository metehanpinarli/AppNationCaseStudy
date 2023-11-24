import 'package:app_nation_case_study/product/resources/sizes/sizes.dart';
import 'package:app_nation_case_study/view/home/widgets/grid_view_item_card.dart';
import 'package:app_nation_case_study/view/home/widgets/search_input_widget.dart';
import 'package:flutter/material.dart';

import '../../product/widgets/navigation_bar/navigation_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Name'),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.defaultPadding),
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Sizes.defaultPadding,
                  mainAxisSpacing: Sizes.defaultPadding,
                  childAspectRatio: (1 / 1),
                ),
                itemBuilder: (context, _) {
                  return const GridViewItemCard();
                },
              ),
            ),
            const SearchInputWidget(),
          ],
        ),
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
