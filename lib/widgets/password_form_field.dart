import 'package:flutter/material.dart';
import 'package:flutter_auth/validator.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      validator: Validator.password,
      maxLines: 1,
      maxLength: 64,
      decoration: InputDecoration(
        hintText: 'Enter your password',
        labelText: 'Password',
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(16),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                size: 16,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.clear,
                size: 16,
              ),
              onPressed: widget.controller.clear,
            ),
          ],
        ),
      ),
    );
  }
}
