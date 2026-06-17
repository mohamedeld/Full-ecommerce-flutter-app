import 'package:flutter/material.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/mohamed.jpeg"),
              radius: 25,
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Mohamed Elrfaay", style: textTheme.labelLarge),
                SizedBox(height: 2),
                Text(
                  "Let\'s go shopping",
                  style: textTheme.labelSmall?.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          ],
        ),
      ],
    );
  }
}
