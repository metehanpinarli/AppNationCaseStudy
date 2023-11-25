import 'package:app_nation_case_study/product/extension/context_extension.dart';
import 'package:flutter/material.dart';
import '../../../product/resources/sizes/sizes.dart';
import 'detail_dialog.dart';

class GridViewItemCard extends StatelessWidget {
  const GridViewItemCard({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        const DetailDialog().show(context);
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            height: 164,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(Sizes.defaultBorderRadius),
            ),
          ),
          Container(
            padding: EdgeInsets.all(Sizes.minPadding),
            decoration: BoxDecoration(
              color: Colors.black.withBlue(2).withOpacity(0.24),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Sizes.defaultBorderRadius),
                  topRight: Radius.circular(Sizes.maxBorderRadius)),
            ),
            child: Text(title, style: context.textTheme.bodyMedium?.copyWith(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
