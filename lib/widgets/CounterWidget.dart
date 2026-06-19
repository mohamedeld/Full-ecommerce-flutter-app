import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Counterwidget extends StatefulWidget {
  final int value;
  const Counterwidget({super.key, required this.value});

  @override
  State<Counterwidget> createState() => _CounterwidgetState();
}

class _CounterwidgetState extends State<Counterwidget> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: AppColors.grey),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
            Text("${widget.value}"),
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
