import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:summamove/pages/Account/registerPage.dart';
import '../../classes/ApiHandler.dart';
import '../../models/User.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title, required this.loginSuccess});
  final VoidCallback loginSuccess;
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(50),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("Login"),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).emailHint,
                  ),
                  validator: (String? value) {
                    if (value == null ||
                        value.isEmpty ||
                        !RegExp(r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                                r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                                r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                                r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                                r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                                r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                                r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])')
                            .hasMatch(value)) {
                      return AppLocalizations.of(context).emailValidationFailed;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).passwordHint,
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      // should have regex for latin characters only
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            String email = emailController.text;
                            String password = passwordController.text;
                            User? user =
                                await ApiHandler().login(email, password);

                            if (!context.mounted) return;
                            if (user != null) {
                              widget.loginSuccess();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      AppLocalizations.of(context).loginFailed),
                                ),
                              );
                            }
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                    const Spacer(),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage(title: AppLocalizations.of(context).register)),
                        );
                      },
                      child: Text(AppLocalizations.of(context).register),
                    ),
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
