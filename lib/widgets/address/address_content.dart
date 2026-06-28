import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/models/location_item_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/view_models/choose_location/choose_location_cubit.dart';
import 'package:flutter/material.dart';

class AddressContent extends StatelessWidget {
  final LocationItemModel location;
  Color borderColor;
  final ChooseLocationCubit cubit;
  final VoidCallback onTap;
  AddressContent({
    super.key,
    required this.location,
    required this.cubit,
    this.borderColor = AppColors.grey,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(location.city, style: textTheme.titleMedium),
                  Text(
                    "${location.city}, ${location.country}",
                    style: textTheme.titleSmall?.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
              Container(
                width: 54, // Slightly larger than the image to show border
                height: 54,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.fromBorderSide(
                    BorderSide(color: borderColor, width: 2.0),
                  ),
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: location.imgUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.location_city),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
