import 'package:ecommerce/utils/app_routes.dart';
import 'package:ecommerce/view_models/auth/auth_cubit.dart';
import 'package:ecommerce/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);
    return Center(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LogoutDone) {
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil(AppRoutes.loginRoute, (route) => false);
          } else if (state is LogoutError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        listenWhen: (previous, current) =>
            current is LogoutDone || current is LogoutError,
        buildWhen: (previous, current) =>
            current is LogoutDone || current is LogoutLoading,
        builder: (context, state) {
          if (state is LogoutLoading) {
            return MainButton(onPress: () {}, isLoading: true);
          }
          return MainButton(
            onPress: () async {
              await cubit.logout();
            },
            title: "Logout",
          );
        },
      ),
    );
  }
}
