import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/view_models/product_details/product_details_cubit.dart';

class ProductSizeItem extends StatelessWidget {
  final dynamic cubit;
  const ProductSizeItem({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Size", style: textTheme.bodyLarge),
        BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          bloc: cubit,
          buildWhen: (previous, current) =>
              current is SizeSelected || current is ProductDetailsLoaded,
          builder: (context, state) {
            return Row(
              children: [
                ...ProductSize.values.map(
                  (size) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {
                        cubit.selectSize(size);
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (state is SizeSelected && state.size == size)
                              ? Theme.of(context).primaryColor
                              : AppColors.grey2,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            size.name,
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  color:
                                      (state is SizeSelected &&
                                          state.size == size)
                                      ? AppColors.white
                                      : AppColors.black45,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
