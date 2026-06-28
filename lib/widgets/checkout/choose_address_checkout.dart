import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/models/location_item_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/utils/app_routes.dart';
import 'package:ecommerce/view_models/checkout/checkout_cubit.dart';
import 'package:flutter/material.dart';

class ChooseAddressCheckout extends StatelessWidget {
  final LocationItemModel location;
  final VoidCallback onNavigate;
  const ChooseAddressCheckout({
    super.key,
    required this.location,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CachedNetworkImage(
              imageUrl: location.imgUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              placeholder: (context, url) => SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(location.city, style: textTheme.labelLarge),
                Text(
                  "${location.city}, ${location.country}",
                  style: textTheme.labelLarge?.copyWith(color: AppColors.grey),
                ),
              ],
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.chooseLocation)
              ..then((_) {
                // Refresh checkout when returning from location page
                onNavigate();
              });
            ;
          },
          child: Text("Add"),
        ),
      ],
    );
  }
}
