import 'package:app_nation_case_study/domain/bloc/home_bloc.dart';
import 'package:app_nation_case_study/presentation/home/widgets/grid_view_item_card.dart';
import 'package:app_nation_case_study/presentation/home/widgets/search_input_widget.dart';
import 'package:app_nation_case_study/product/resources/sizes/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/widgets/navigation_bar/navigation_bar_widget.dart';
import '../widgets/detail_dialog.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is Success) {
          return SuccessStateWidget(state: state);
        } else if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class SuccessStateWidget extends StatelessWidget {
  const SuccessStateWidget({super.key, required this.state});

  final Success state;

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
                itemCount: state.dogList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Sizes.defaultPadding,
                  mainAxisSpacing: Sizes.defaultPadding,
                  childAspectRatio: (1 / 1),
                ),
                itemBuilder: (context, index) {
                  final doge = state.dogList[index];
                  return GridViewItemCard(
                      title: state.dogList[index].breed,
                      imageUrl: state.dogList[index].imageUrl,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => DetailDialog(dogEntity: doge),
                        );
                      });
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
