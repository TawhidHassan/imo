import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constants/Colors/app_colors.dart';

class PasswordTextfield extends StatefulWidget {
  final String lable;
  final String hintText;
  final bool readOnly;
  final bool isNumber;
  PasswordTextfield({required this.lable,required this.controller, required this.hintText,required this.readOnly, required this.isNumber});
  TextEditingController controller = TextEditingController();

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  bool _passwordVisible = true;

  @override
  void initState() {
    _passwordVisible = true;
  }
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      validator: (value) {

        if (value == null || value.isEmpty) {
          return 'Please fillup';
        }else{
          return null;
        }

      },
      obscureText: _passwordVisible,
      keyboardType: widget.isNumber?TextInputType.number:TextInputType.text,
      readOnly: widget.readOnly,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.black),
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            _passwordVisible
                ? Icons.visibility_off                           //visibility
                : Icons.visibility,
            color:textFieldBorder,
          ),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
        fillColor: Color(0xFFE7EBF6),
        filled: true,
        contentPadding:
        EdgeInsets.symmetric(vertical: 22.h, horizontal: 12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color:Colors.white, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
