import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/view_models/product_details/product_details_cubit.dart';
import 'package:ecommerce/widgets/product_details/product_details_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productId;
  const ProductDetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final productDetailsCubit = BlocProvider.of<ProductDetailsCubit>(context);
    final textTheme = Theme.of(context).textTheme;
    return BlocListener<ProductDetailsCubit, ProductDetailsState>(
      listener: (context, state) {
        if (state is ProductDetailsError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }

        if (state is AddedToCart) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Added to cart successfully")),
          );
        }

        if (state is ProductAddingToCart) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Adding to cart...")));
        }
      },
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        bloc: productDetailsCubit,
        buildWhen: (pre, current) =>
            current is ProductDetailsLoading || current is ProductDetailsLoaded,
        builder: (context, state) {
          if (state is ProductDetailsLoading) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator.adaptive()),
            );
          } else if (state is ProductDetailsLoaded) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Product Details"),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border),
                  ),
                ],
              ),
              body: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(color: AppColors.grey),
                    child: CachedNetworkImage(
                      imageUrl: state.product.imgUrl,
                      placeholder: (context, url) => SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                  ProductDetailsContent(product: state.product),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
