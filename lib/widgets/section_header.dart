import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String linkText;
  final String linkRoute;
  const SectionHeader({
    super.key,
    required this.title,
    required this.linkText,
    required this.linkRoute,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(linkText);
          },
          child: Text(
            linkText,
            style: textTheme.labelLarge?.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
