import 'package:app_nation_case_study/domain/bloc/home/home_bloc.dart';
import 'package:app_nation_case_study/presentation/home/widgets/grid_view_item_card.dart';
import 'package:app_nation_case_study/presentation/home/widgets/search_input_widget.dart';
import 'package:app_nation_case_study/product/extension/context_extension.dart';
import 'package:app_nation_case_study/product/resources/sizes/sizes.dart';
import 'package:app_nation_case_study/product/resources/style/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/dog_entity.dart';
import '../../../product/widgets/navigation_bar/navigation_bar_widget.dart';
import '../widgets/detail_dialog.dart';

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
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is Success) {
                    return SuccessStateWidget(dogList: state.dogList);
                  } else if (state is Loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is NoResult) {
                    return const NoResultStateWidget();
                  }
                  return const SizedBox.shrink();
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

class NoResultStateWidget extends StatelessWidget {
  const NoResultStateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('No result found'),
          SizedBox(height: Sizes.defaultPadding),
          Text('Try searching with another word',
              style: context.textTheme.bodyMedium?.copyWith(color: ColorPalette.secondaryLabel)),
        ],
      ),
    );
  }
}

class SuccessStateWidget extends StatelessWidget {
  const SuccessStateWidget({
    super.key,
    required this.dogList,
  });

  final List<DogEntity> dogList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: dogList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: Sizes.defaultPadding,
        mainAxisSpacing: Sizes.defaultPadding,
        childAspectRatio: (1 / 1),
      ),
      itemBuilder: (context, index) {
        final dog = dogList[index];
        return GridViewItemCard(
            title: dog.breed,
            imageUrl: dog.imageUrl,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => DetailDialog(dogEntity: dog),
              );
            });
      },
    );
  }
}
