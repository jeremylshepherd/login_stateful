import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            topSpacer(),
            passwordField(),
            topSpacer(),
            submitButton()
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (String? value) {
        email = value ?? '';
      },
      validator: validateEmail,
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Must be at least 8 characters long',
      ),
      onSaved: (String? value) {
        password = value ?? '';
      },
      validator: validatePassword,
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState?.validate() ?? false) {
          formKey.currentState?.save();
          formKey.currentState?.reset();
        }
        String jsony =
            '''{
            email: $email,
            password: $password
          }''';
        print(jsony);
      },
      child: const Text('Touch me 😉'),
    );
  }

  Widget topSpacer() {
    return Container(
      margin: const EdgeInsets.only(top: 25.0),
    );
  }
}
