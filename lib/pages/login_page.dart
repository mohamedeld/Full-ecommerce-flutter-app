import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/utils/app_routes.dart';
import 'package:ecommerce/view_models/auth/auth_cubit.dart';
import 'package:ecommerce/widgets/auth/login_form.dart';
import 'package:ecommerce/widgets/auth/social_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Login Account", style: textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  "Please login with registered account",
                  style: textTheme.labelLarge?.copyWith(color: AppColors.grey),
                ),
                const SizedBox(height: 32),
                LoginForm(cubit: cubit),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don'\t have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushNamed(AppRoutes.registerRoute);
                      },
                      child: Text("Register"),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 2),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Or using other methods",
                    style: textTheme.labelLarge?.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SocialLogin(
                  title: "Login with Google",
                  onTap: () {},
                  imgUrl:
                      'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
                ),
                const SizedBox(height: 16),
                SocialLogin(
                  title: "Login with Facebook",
                  onTap: () {},
                  imgUrl:
                      'https://www.freepnglogos.com/uploads/facebook-logo-icon/facebook-logo-icon-facebook-logo-png-transparent-svg-vector-bie-supply-15.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
