import 'package:app_nation_case_study/product/extension/context_extension.dart';
import 'package:app_nation_case_study/product/resources/style/color_palette.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/bloc/home/home_bloc.dart';
import '../../../product/resources/sizes/sizes.dart';

class SearchInputWidget extends StatefulWidget {
  const SearchInputWidget({super.key});

  @override
  State<SearchInputWidget> createState() => _SearchInputWidgetState();
}

class _SearchInputWidgetState extends State<SearchInputWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Sizes.defaultPadding),
      child: GestureDetector(
        onTap: () {
          DraggableMenu.open(
              context,
              DraggableMenu(
                controller: DraggableMenuController(),
                ui: const ClassicDraggableMenu(color: Colors.white),
                levels: [
                  DraggableMenuLevel.ratio(ratio: 7 / 10),
                  DraggableMenuLevel.ratio(ratio: 1),
                ],
                child: Padding(
                  padding: EdgeInsets.all(Sizes.minPadding),
                  child: TextFormField(
                      autofocus: true,
                      maxLines: null,
                      controller: _searchController,
                      textInputAction: TextInputAction.search,
                      cursorColor: ColorPalette.darkBlue,
                      decoration: const InputDecoration(hintText: "Search"),
                      onChanged: (value) => context.read<HomeBloc>().add(Search(searchValue: value)),
                      onFieldSubmitted: (_) {
                        context.pop();
                        setState(() {});
                      }),
                ),
              ));
        },
        child: Container(
            height: 64,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 16, right: 20, top: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Sizes.defaultBorderRadius),
              border: Border.all(width: 2, color: ColorPalette.systemGray5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.16),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Text(
              _searchController.text.isEmpty ? "Search" : _searchController.text,
              style: _searchController.text.isEmpty
                  ? context.textTheme.bodyMedium?.copyWith(color: ColorPalette.secondaryLabel)
                  : context.textTheme.bodyMedium,
              textAlign: TextAlign.start,
            )),
      ),
    );
  }
}
