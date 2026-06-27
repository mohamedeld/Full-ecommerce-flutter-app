import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/models/location_item_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AddressItem extends StatelessWidget {
  final LocationItemModel location;
  const AddressItem({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(),
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
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.fromBorderSide(
                    BorderSide(color: Colors.grey, width: 2.0),
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
