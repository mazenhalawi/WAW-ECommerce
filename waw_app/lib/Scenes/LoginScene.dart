import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:waw_app/Blocs/LoginBloc.dart';
import 'package:waw_app/Models/Result.dart';
import 'package:waw_app/Views/Alert.dart';
import 'package:waw_app/Views/Buttons/DefaultButton.dart';
import 'package:waw_app/Views/Buttons/DefaultIconButton.dart';
import 'package:waw_app/Views/Spinner.dart';
import 'package:waw_app/Views/Text/PasswordField.dart';

class LoginScene extends StatefulWidget {
  static const SceneName = 'LoginScene';

  @override
  _LoginSceneState createState() => _LoginSceneState();
}

class _LoginSceneState extends State<LoginScene> {
  MediaQueryData _mediaQuery;
  String _email = '';
  String _password = '';
  LoginBloc _bloc;
  bool _isLoading = false;
  StreamSubscription<Result<dynamic>> subscriptionLogin;

  @override
  void dispose() {
    super.dispose();
    subscriptionLogin.cancel();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_mediaQuery == null) {
      _mediaQuery = MediaQuery.of(context);
    }

    if (_bloc == null) {
      _bloc = Provider.of<LoginBloc>(context, listen: false);
      subscriptionLogin = _bloc.loginStream$.listen((event) {
        setState(() {
          _isLoading = false;
          print('user has signed in successfully');
        });
      }, onError: (error) {
        setState(() {
          _isLoading = false;
          Alert(context: context, title: 'Failure', content: error.message)
              .show();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Spinner(
        isVisible: _isLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            children: [
              //TODO: Place image instead of container
              Container(
                height: _mediaQuery.size.height * 0.3,
              ),
              Expanded(
                child: ListView(children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _getHeadingTexts(context),
                      _getUsernameField(),
                      _getPasswordField(),
                      _getEmailLoginButton(context),
                      _getOrTextSeparator(),
                      _getFacebookLoginButton(),
                      _getForgetPasswordButton(),
                      _getSignUpButton(context),
                    ],
                  ),
                ]),
              ),
            ],
          ),
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
        controller: TextEditingController(text: _email),
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
        onChanged: (value) => _email = value,
      ),
    );
  }

  Widget _getPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: PasswordField((value) => this._password = value),
    );
  }

  Widget _getEmailLoginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        children: [
          Expanded(
            child: DefaultButton(
              title: 'Login',
              onPressed: () {
                // setState(() {
                //   _isLoading = true;
                // });
                _bloc.loginUserWithEmail(_email, _password);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _getOrTextSeparator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text('or'),
    );
  }

  Widget _getFacebookLoginButton() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
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
