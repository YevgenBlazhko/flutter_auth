import 'package:flutter/material.dart';
import 'package:flutter_auth/widgets/email_form_field.dart';
import 'package:flutter_auth/widgets/password_form_field.dart';
import 'package:flutter_auth/widgets/success_state_view.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({
    super.key,
  });

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool successState = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: successState
                ? SuccessStateView(
                    onPressed: () {
                      setState(() {
                        successState = false;
                      });
                    },
                  )
                : Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: constraints.maxWidth / 2,
                          height: 80,
                          child: EmailFormField(
                            controller: _emailController,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: constraints.maxWidth / 2,
                          height: 80,
                          child: PasswordFormField(
                            controller: _passwordController,
                          ),
                        ),
                        const SizedBox(height: 24),
                        OutlinedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                successState = true;
                                _emailController.clear();
                                _passwordController.clear();
                              });
                            }
                          },
                          child: const Text('Sign in'),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
