import 'package:app_nation_case_study/domain/entities/dog_entity.dart';
import 'package:app_nation_case_study/presentation/home/widgets/image_dialog.dart';
import 'package:app_nation_case_study/product/extension/context_extension.dart';
import 'package:app_nation_case_study/product/widgets/Divider/custom_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../product/resources/assets/assets_constants.dart';
import '../../../product/resources/sizes/sizes.dart';

class DetailDialog extends StatelessWidget {
  const DetailDialog({super.key, required this.dogEntity});

  final DogEntity dogEntity;

  show(BuildContext context) {
    showDialog(context: context, builder: (_) => this);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: Sizes.defaultPadding, vertical: 91),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Sizes.minBorderRadius),
        ),
        child: Column(
          children: [
            Expanded(child: DialogImageWidget(imageUrl: dogEntity.imageUrl)),
            Expanded(
                child: DialogInformationWidget(
              breed: dogEntity.breed,
              subBreedFirst: dogEntity.subBreeds.isNotEmpty ? dogEntity.subBreeds[0]! : '',
              subBreedSecond: dogEntity.subBreeds.length > 1 ? dogEntity.subBreeds[1]! : '',
            )),
          ],
        ),
      ),
    );
  }
}

class DialogInformationWidget extends StatelessWidget {
  const DialogInformationWidget({
    super.key,
    required this.breed,
    required this.subBreedFirst,
    required this.subBreedSecond,
  });

  final String breed;
  final String subBreedFirst;
  final String subBreedSecond;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: Sizes.defaultPadding, top: 12, left: Sizes.defaultPadding, right: Sizes.defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Breed', style: context.textTheme.headlineMedium),
          const CustomDividerWidget(),
          Text(breed, style: context.textTheme.bodyMedium),
          Text('Sub Breed', style: context.textTheme.headlineMedium),
          const CustomDividerWidget(),
          Text(subBreedFirst, style: context.textTheme.bodyMedium),
          Text(subBreedSecond, style: context.textTheme.bodyMedium),
          ElevatedButton(onPressed: () => const ImageDialog().show(context), child: const Text('Generate')),
        ],
      ),
    );
  }
}

class DialogImageWidget extends StatelessWidget {
  const DialogImageWidget({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(Sizes.minBorderRadius)),
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(Sizes.minPadding),
                child: SvgPicture.asset(AssetIcons.ic_close.path()),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
