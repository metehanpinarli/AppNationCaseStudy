import 'package:app_nation_case_study/product/extension/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../product/resources/sizes/sizes.dart';
import 'detail_dialog.dart';

class GridViewItemCard extends StatelessWidget {
  const GridViewItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
         DetailDialog().show(context);
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            height: 164,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage('https://images.dog.ceo/breeds/chihuahua/n02085620_8636.jpg'),
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
            child: Text('Breed', style: context.textTheme.bodyMedium?.copyWith(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
