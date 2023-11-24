import 'package:app_nation_case_study/product/extension/context_extension.dart';
import 'package:app_nation_case_study/product/resources/style/color_palette.dart';
import 'package:flutter/material.dart';

class SearchInputWidget extends StatefulWidget {
  const SearchInputWidget({super.key});

  @override
  _SearchInputWidgetState createState() => _SearchInputWidgetState();
}

class _SearchInputWidgetState extends State<SearchInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        maxLines: null,
        style: context.textTheme.bodyMedium,
        cursorColor: ColorPalette.darkBlue,
        textInputAction: TextInputAction.search,
        decoration: const InputDecoration(hintText: 'Search'),
      ),
    );
  }
}
