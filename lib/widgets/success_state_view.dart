import 'package:flutter/material.dart';

class SuccessStateView extends StatelessWidget {
  const SuccessStateView({
    super.key,
    required this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.check,
          size: 64,
          color: Colors.green,
        ),
        const SizedBox(height: 16),
        const Text('Нou have successfully logged in'),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: onPressed,
          child: const Text('Back to auth screen'),
        ),
      ],
    );
  }
}
