import 'package:flutter/material.dart';
import 'package:flutter_auth/validator.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: Validator.email,
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Enter your email',
        labelText: 'Email',
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(16),
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.clear,
            size: 16,
          ),
          onPressed: controller.clear,
        ),
      ),
    );
  }
}
