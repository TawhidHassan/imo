import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundTextfield extends StatelessWidget {
  final String hintText;
  final bool readOnly;
  Color? bgColor=Color(0xFFE7EBF6);
  Color? borderColor=Color(0xFFE7EBF6);
  final bool isNumber;
  final bool isValueChnged;
  final bool isemail;
  final Function(String)? tap;
  BackgroundTextfield({super.key,required this.controller,
  required this.hintText,required this.readOnly,
  required this.isNumber,this.bgColor,this.borderColor, this.tap,  this.isValueChnged=false,  this.isemail=false});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      validator: (value) {

        if (value == null || value.isEmpty) {
          return "Fill the field";
        }else{
          String pattern =
              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
              r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
              r"{0,253}[a-zA-Z0-9])?)*$";
          RegExp regex = RegExp(pattern);

          if(isNumber){
            return value.length < 11 ?'invalid number':null;
          }
          else if(isemail){
           return !regex.hasMatch(value)?'invalid email':null;
          } else{
            return null;
          }

        }

      },
      keyboardType: isNumber?TextInputType.number:TextInputType.text,
      inputFormatters:isNumber? [
        LengthLimitingTextInputFormatter(11),
      ]:[],
      readOnly: readOnly,
      controller: controller,
      onChanged: isValueChnged?tap:null,

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black),

        contentPadding:
        EdgeInsets.symmetric(vertical: 22.h, horizontal: 12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color:borderColor!, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color:borderColor!, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
