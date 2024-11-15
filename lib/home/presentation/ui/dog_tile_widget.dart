import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kf_sample/core/utils/app_colors.dart';
import 'package:kf_sample/home/domain/entities/dog_entity.dart';

class DogTileWidget extends StatelessWidget {
  final DogEntity dogEntity;

  const DogTileWidget({super.key, required this.dogEntity});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Stack(children: [
        Positioned(
            left: (MediaQuery.of(context).size.width / 3 - 10),
            right: 0,
            bottom: 0,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  color: AppColors.accentColor,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 7, top: 4, bottom: 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${dogEntity.name}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryColor)),
                        const SizedBox(height: 12),
                        Text('${dogEntity.description}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryColor)),
                        const SizedBox(height: 8),
                        Text('Almost ${dogEntity.age} years',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.secondaryColor)),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ))),
        Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
                height: 210,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                        placeholder: (context, url) => const SizedBox(
                              height: 50,
                              width: 50,
                              child:
                                  FittedBox(child: CircularProgressIndicator()),
                            ),
                        imageUrl: dogEntity.photoUrl ?? '')))),
      ]),
    );
  }
}
