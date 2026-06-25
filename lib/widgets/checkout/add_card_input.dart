import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AddCardInput extends StatefulWidget {
  final String title;
  final Widget Icon;
  final String hitText;
  final TextEditingController controller;
  final String? errorText;

  const AddCardInput({
    super.key,
    required this.title,
    required this.Icon,
    required this.hitText,
    required this.controller,
    this.errorText,
  });

  @override
  State<AddCardInput> createState() => _AddCardInputState();
}

class _AddCardInputState extends State<AddCardInput> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          validator: (value) =>
              value == null || value.isEmpty ? 'This field is required' : null,
          decoration: InputDecoration(
            fillColor: AppColors.grey1,
            prefixIcon: widget.Icon,
            errorText: widget.errorText,

            hintText: widget.hitText,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.red),
            ),
          ),
        ),
      ],
    );
  }
}
