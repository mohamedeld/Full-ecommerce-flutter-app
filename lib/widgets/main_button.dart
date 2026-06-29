import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final bool? isLoading;

  const MainButton({
    super.key,
    this.title = '',
    required this.onPress,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: isLoading == true
              ? null
              : onPress, // Disable button while loading
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.primaryColor,
            foregroundColor: AppColors.white,
          ),
          child: isLoading == true
              ? const Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                  ),
                )
              : Text(title), // Wrap title in Text widget
        ),
      ),
    );
  }
}
