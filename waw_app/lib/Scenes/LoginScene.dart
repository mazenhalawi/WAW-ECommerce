import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:waw_app/Views/Buttons/DefaultButton.dart';
import 'package:waw_app/Views/Buttons/DefaultIconButton.dart';
import 'package:waw_app/Views/Text/PasswordField.dart';

class LoginScene extends StatefulWidget {
  @override
  _LoginSceneState createState() => _LoginSceneState();
}

class _LoginSceneState extends State<LoginScene> {
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _getHeadingTexts(context),
            _getUsernameField(),
            _getPasswordField(),
            _getEmailLoginButton(),
            Text('or'),
            _getFacebookLoginButton(),
            _getForgetPasswordButton(),
            _getSignUpButton(context),
          ],
        ),
      ),
    );
  }

  Widget _getHeadingTexts(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Welcome,',
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 15),
          child: Row(
            children: [
              Text(
                'Sign in to continue',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.black87),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getUsernameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Username',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black26,
              width: 0.5,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: PasswordField((value) {
        this._password = value;
      }),
    );
  }

  Widget _getEmailLoginButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: DefaultButton(
              title: 'Login',
              onPressed: () {
                print(_password);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _getFacebookLoginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Row(
        children: [
          Expanded(
            child: DefaultIconButton(
              title: 'Login with facebook',
              prefixIcon: Image.asset('assets/images/icon_facebook_gray.png'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _getForgetPasswordButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        height: 20,
        child: FlatButton(
          child: Text('Forgot Password?'),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _getSignUpButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        height: 20,
        child: FlatButton(
          child: RichText(
            text: TextSpan(
                text: 'Don\'t have an account? ',
                style: Theme.of(context).textTheme.button,
                children: [
                  TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor),
                  ),
                ]),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
