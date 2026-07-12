import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/view_models/favorites/favorite_cubit.dart';
import 'package:ecommerce/view_models/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatelessWidget {
  final ProductItemModel product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white54,
              ),
              alignment: Alignment.center,
              clipBehavior: Clip.antiAlias,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: product.imgUrl,
                  width: 160,
                  height: 95,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: IconButton(
                  onPressed: () async {
                    await homeCubit.toggleFavorite(product);
                    try {
                      await context.read<FavoriteCubit>().getFavorites();
                    } catch (_) {}
                  },
                  icon: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: product.isFavorite ? Colors.red : null,
                  ),
                ),
              ),
            ),
          ],
        ),
        Text(
          product.title,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          product.category,
          style: textTheme.labelMedium?.copyWith(color: Colors.grey),
        ),
        Text(
          "\$${product.price}",
          style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
