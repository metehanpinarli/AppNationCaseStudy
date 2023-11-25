import 'package:app_nation_case_study/product/resources/assets/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../product/resources/sizes/sizes.dart';

class ImageDialog extends StatelessWidget {
  const ImageDialog({super.key, required this.imageUrl});

  final String imageUrl;

  show(BuildContext context) {
    showDialog(context: context, builder: (_) => this);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageWidget(imageUrl: imageUrl),
          SizedBox(height: Sizes.defaultPadding),
          const CloseButton(),
        ],
      ),
    );
  }
}

class CloseButton extends StatelessWidget {
  const CloseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: Colors.white,
        ),
        child: SvgPicture.asset(AssetIcons.ic_close.path()),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Sizes.minBorderRadius),
      child: Image.network(
        imageUrl,
        width: 256,
        height: 256,
        fit: BoxFit.fill,
      ),
    );
  }
}
