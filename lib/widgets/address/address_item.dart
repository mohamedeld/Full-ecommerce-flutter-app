import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/models/location_item_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/view_models/choose_location/choose_location_cubit.dart';
import 'package:ecommerce/widgets/address/address_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressItem extends StatelessWidget {
  final LocationItemModel location;
  final ChooseLocationCubit cubit;
  const AddressItem({super.key, required this.location, required this.cubit});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: BlocBuilder<ChooseLocationCubit, ChooseLocationState>(
        bloc: cubit,
        buildWhen: (previous, current) => current is LocationChosen,
        builder: (context, state) {
          if (state is LocationChosen) {
            final choseLocaiton = state.chosenLocation;
            return AddressContent(
              location: location,
              cubit: cubit,
              borderColor: choseLocaiton.id == location.id
                  ? AppColors.primary
                  : AppColors.grey,
              onTap: () {
                cubit.chosenLocation(location.id);
              },
            );
          }
          return AddressContent(
            location: location,
            cubit: cubit,
            onTap: () {
              cubit.chosenLocation(location.id);
            },
          );
        },
      ),
    );
  }
}
