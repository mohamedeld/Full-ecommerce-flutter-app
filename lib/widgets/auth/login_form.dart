import 'package:ecommerce/widgets/checkout/add_card_input.dart';
import 'package:ecommerce/widgets/main_button.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        const SizedBox(height: 4),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(onPressed: () {}, child: Text("Forget password?")),
        ),
        const SizedBox(height: 16),
        MainButton(title: "Sign in", onPress: () {}),
      ],
    );
  }
}
