import 'package:flutter/material.dart';
import 'package:flutter_workout_application/features/auth/sign_in/sign_in_view_model.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: const Center(
        child: Column(
          children: [
            _Form(),
            SizedBox(height: 8),
            _TextButton(),
          ],
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form();

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = SignInViewModel();

    final emailTextController = TextEditingController();
    final passwordTextController = TextEditingController();

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: emailTextController,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please fill Email field';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: passwordTextController,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Password'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please fill Password field';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              final currentState = _formKey.currentState;
              if (currentState == null) return;
              if (currentState.validate()) {
                const snackBarText = Text('In Progress');
                const snackBar = SnackBar(content: snackBarText);
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                final email = emailTextController.text;
                final password = passwordTextController.text;
                viewModel.onSignInPressed(
                  context: context,
                  email: email,
                  password: password,
                );
              }
            },
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  }
}

class _TextButton extends StatelessWidget {
  const _TextButton();

  @override
  Widget build(BuildContext context) {
    final viewModel = SignInViewModel();

    return TextButton(
      onPressed: () => viewModel.onSignUpPressed(),
      child: const Text(
        'Dont have an account? Sign Up.',
      ),
    );
  }
}
