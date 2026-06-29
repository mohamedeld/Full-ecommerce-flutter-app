import 'package:ecommerce/utils/app_routes.dart';
import 'package:ecommerce/view_models/auth/auth_cubit.dart';
import 'package:ecommerce/widgets/checkout/add_card_input.dart';
import 'package:ecommerce/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  final AuthCubit cubit;
  const RegisterForm({super.key, required this.cubit});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddCardInput(
            title: "Username",
            Icon: Icon(Icons.person),
            hitText: "Enter your username",
            controller: _userNameController,
          ),
          const SizedBox(height: 16),
          AddCardInput(
            title: "Email",
            Icon: Icon(Icons.email),
            hitText: "Enter your email",
            controller: _emailController,
          ),
          const SizedBox(height: 16),

          AddCardInput(
            title: "Password",
            Icon: Icon(Icons.password),
            hitText: "Enter your password",
            controller: _passwordController,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObsecure = !isObsecure;
                });
              },
              icon: isObsecure
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
            ),
            obscureText: isObsecure,
          ),

          const SizedBox(height: 16),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthDone) {
                Navigator.of(context).pushNamed(AppRoutes.homeRoute);
              } else if (state is AuthError) {
                ScaffoldMessenger(
                  child: SnackBar(content: Text(state.message)),
                );
              }
            },
            listenWhen: (previous, current) =>
                current is AuthDone || current is AuthError,
            bloc: widget.cubit,
            buildWhen: (previous, current) =>
                current is AuthLoading ||
                current is AuthError ||
                current is AuthDone,
            builder: (context, state) {
              if (state is AuthLoading) {
                return MainButton(isLoading: true, onPress: () {});
              }
              return MainButton(
                title: "Create Account",
                onPress: () async {
                  if (_formKey.currentState!.validate()) {
                    await widget.cubit.registerWithEmailPassword(
                      _emailController.text,
                      _passwordController.text,
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
