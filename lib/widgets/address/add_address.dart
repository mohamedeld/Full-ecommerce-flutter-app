import 'package:ecommerce/view_models/choose_location/choose_location_cubit.dart';
import 'package:ecommerce/widgets/checkout/add_card_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAddress extends StatefulWidget {
  final ChooseLocationCubit cubit;
  const AddAddress({super.key, required this.cubit});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final TextEditingController _writeLocaiton = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddCardInput(
          title: "Location",
          Icon: Icon(Icons.location_on),
          hitText: "Write your location",
          controller: _writeLocaiton,
          isFormField: false,
          suffixIcon: BlocConsumer<ChooseLocationCubit, ChooseLocationState>(
            listener: (context, state) {
              if (state is AddedLocation) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Address Added successfully")),
                );
                _writeLocaiton.clear();
              }
            },
            listenWhen: (previous, current) => current is AddedLocation,
            bloc: widget.cubit,
            buildWhen: (previous, current) =>
                current is AddingLocation ||
                current is AddedLocation ||
                current is ErrorAddingLocation,
            builder: (context, state) {
              if (state is AddingLocation) {
                return Center(child: CircularProgressIndicator.adaptive());
              }
              return IconButton(
                onPressed: () {
                  if (_writeLocaiton.text.isNotEmpty) {
                    widget.cubit.addLocation(_writeLocaiton.text);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Enter your location")),
                    );
                  }
                },
                icon: Icon(Icons.add),
              );
            },
          ),
        ),
      ],
    );
  }
}
