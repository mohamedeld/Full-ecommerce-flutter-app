import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/utils/app_routes.dart';
import 'package:ecommerce/view_models/card_payment/add_new_card_cubit.dart';
import 'package:ecommerce/widgets/checkout/add_card_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({super.key});

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardHolderNumberController =
      TextEditingController();
  final TextEditingController _expiredController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AddNewCardCubit>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Add new Card")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    AddCardInput(
                      title: "Card Number",
                      Icon: Icon(Icons.credit_card),
                      hitText: "Enter your card number",
                      controller: _cardNumberController,
                    ),
                    const SizedBox(height: 16),
                    AddCardInput(
                      title: "Card Holder Name",
                      Icon: Icon(Icons.person),
                      hitText: "Enter Holder Name",
                      controller: _cardHolderNumberController,
                    ),
                    const SizedBox(height: 16),
                    AddCardInput(
                      title: "Expired",
                      Icon: Icon(Icons.calendar_month),
                      hitText: "MM/YY",
                      controller: _expiredController,
                    ),
                    const SizedBox(height: 16),
                    AddCardInput(
                      title: "CVV Code",
                      Icon: Icon(Icons.credit_card),
                      hitText: "CVV",
                      controller: _cvvController,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),

              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: BlocConsumer<AddNewCardCubit, AddNewCardState>(
                  bloc: cubit,
                  buildWhen: (previous, current) =>
                      current is AddNewCardLoading ||
                      current is AddNewCardLoaded ||
                      current is AddNewCardError,
                  listener: (context, state) {
                    if (state is AddNewCardLoaded) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Cart added successfully"),
                        ),
                      );
                      Navigator.pop(context);
                    } else if (state is AddNewCardError) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  builder: (context, state) {
                    if (state is AddNewCardLoading) {
                      return ElevatedButton(
                        onPressed: null,
                        child: CircularProgressIndicator.adaptive(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.white,
                        ),
                      );
                    } else {
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            cubit.addNewCard(
                              _cardNumberController.text,
                              _cardNumberController.text,
                              _expiredController.text,
                              _cvvController.text,
                            );
                          }
                        },
                        child: const Text("Add Card"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.white,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
