import 'package:ecommerce/models/location_item_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/view_models/choose_location/choose_location_cubit.dart';
import 'package:ecommerce/widgets/address/address_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressesList extends StatefulWidget {
  const AddressesList({super.key});

  @override
  State<AddressesList> createState() => _AddressesListState();
}

class _AddressesListState extends State<AddressesList> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ChooseLocationCubit>(context);
    return Column(
      children: [
        BlocBuilder<ChooseLocationCubit, ChooseLocationState>(
          bloc: cubit,
          buildWhen: (prev, curr) =>
              curr is FetchingLocation ||
              curr is FetchedLocation ||
              curr is ErrorLocation,
          builder: (context, state) {
            if (state is FetchedLocation) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dummyLocations.length,
                itemBuilder: (context, index) =>
                    AddressItem(location: state.locations[index], cubit: cubit),
              );
            } else if (state is FetchingLocation) {
              return Center(child: CircularProgressIndicator.adaptive());
            } else if (state is ErrorLocation) {
              return Center(child: Text(state.message));
            } else {
              return SizedBox.shrink();
            }
          },
        ),
        const SizedBox(height: 16),
        BlocBuilder<ChooseLocationCubit, ChooseLocationState>(
          buildWhen: (previous, current) =>
              current is ConfirmLocationError ||
              current is ConfirmLocationLoaded ||
              current is ConfirmLocationLoading,
          bloc: cubit,
          builder: (context, state) {
            if (state is ConfirmLocationLoading) {
              return SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                  ),
                  child: Center(child: CircularProgressIndicator.adaptive()),
                ),
              );
            }
            return SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  cubit.confirmChosenLocation();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                ),
                child: const Text("Confirm Address"),
              ),
            );
          },
        ),
      ],
    );
  }
}
