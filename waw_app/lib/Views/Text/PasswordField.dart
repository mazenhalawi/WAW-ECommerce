import 'package:flutter/material.dart';
import 'package:waw_app/Utility/wawapp_icons.dart';

class PasswordField extends StatefulWidget {
  final Function(String) onChanged;

  PasswordField(this.onChanged);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscurePassword,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: 'Password',
        suffixIcon: IconButton(
          icon: _obscurePassword
              ? Icon(
                  WAWApp.eye,
                  color: Colors.black26,
                )
              : Icon(WAWApp.eye_off),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black26,
            width: 0.5,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
