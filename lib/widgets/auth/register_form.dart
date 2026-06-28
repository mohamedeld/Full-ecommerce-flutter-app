import 'package:ecommerce/widgets/checkout/add_card_input.dart';
import 'package:ecommerce/widgets/main_button.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
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
        MainButton(title: "Create Account", onPress: () {}),
      ],
    );
  }
}
