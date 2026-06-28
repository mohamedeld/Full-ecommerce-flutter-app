import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/utils/app_colors.dart';

class SocialLogin extends StatelessWidget {
  final String title;
  final String imgUrl;
  final VoidCallback onTap;
  const SocialLogin({
    super.key,
    required this.title,
    required this.onTap,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey3),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: imgUrl,
                width: 25,
                height: 25,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 8),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
