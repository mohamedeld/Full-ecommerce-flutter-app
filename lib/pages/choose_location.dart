import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/widgets/address/add_address.dart';
import 'package:ecommerce/widgets/address/addresses_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseLocation extends StatelessWidget {
  const ChooseLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text("Address")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Choose your location",
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Let\'s find an unforgettable event! choose a location below to get started",
                  style: textTheme.labelLarge?.copyWith(color: AppColors.grey),
                ),
                const SizedBox(height: 32),
                AddAddress(cubit: BlocProvider.of(context)),
                const SizedBox(height: 16),
                Text(
                  "Select location",
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                AddressesList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
