import 'package:app_nation_case_study/product/extension/context_extension.dart';
import 'package:app_nation_case_study/product/resources/style/color_palette.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/bloc/home/home_bloc.dart';

class SearchInputWidget extends StatefulWidget {
  const SearchInputWidget({super.key});

  @override
  _SearchInputWidgetState createState() => _SearchInputWidgetState();
}

class _SearchInputWidgetState extends State<SearchInputWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
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
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autofocus: true,
                    maxLines: null,
                    controller: _searchController,
                    textInputAction: TextInputAction.search,
                    cursorColor: ColorPalette.darkBlue,
                    decoration: const InputDecoration(hintText: "Search"),
                    onChanged: (value) => context.read<HomeBloc>().add(Search(searchValue: value)),
                    onFieldSubmitted: (_) => context.pop(),
                  ),
                ),
              ));
        },
        child: Container(
            height: 64,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 16, right: 20, top: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
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
              "Search",
              style: context.textTheme.bodyMedium?.copyWith(color: ColorPalette.secondaryLabel),
              textAlign: TextAlign.start,
            )),
      ),
    );
  }
}
