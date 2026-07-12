import 'package:ecommerce/view_models/favorites/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FavoriteCubit>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        buildWhen: (previous, current) =>
            current is FavoriteLoading ||
            current is FavoriteLoaded ||
            current is FavoriteError ||
            current is RemoveFavoriteProductLoading ||
            current is RemoveFavoriteProductLoaded ||
            current is RemoveFavoriteError,
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavoriteLoaded) {
            final favoriteProducts = state.favoriteProducts;
            if (favoriteProducts.isEmpty) {
              return const Center(child: Text("No favorite products"));
            }
            return ListView.builder(
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                final product = favoriteProducts[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text("\$${product.price}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      cubit.removeFavorite(product.id);
                    },
                  ),
                );
              },
            );
          } else if (state is FavoriteError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
