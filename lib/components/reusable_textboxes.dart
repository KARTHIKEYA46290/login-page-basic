
import 'package:flutter/material.dart';
final GlobalKey<FormState> _keyform =GlobalKey<FormState>();
String? validateuser(value){
  if(value!.isEmpty){
    return "Please enter the Username";
  }
  return null;
}
String? validatepass(value){
  if(value!.isEmpty){
    return "Please Enter Password";
  }
  RegExp special = RegExp(r'(?=.*[@#$%^&*+=])');
  RegExp size = RegExp(r'.{8,20}');
  RegExp caps = RegExp("[A-Z]+");
  if(!size.hasMatch(value)){
    return 'Password is too short';
  }
  if(!special.hasMatch(value)){
    return 'Password has no special characters';
  }
  if(!caps.hasMatch(value)){
    return 'Password has no Capital Letters';
  }
  return null;
}


Container title_top(String text){
  return Container(
    height: 250,
    width: 300,
    child: Center(child: Text(text,style:TextStyle(
      fontStyle: FontStyle.normal,
      fontFamily: "Calligraffitti",
      fontSize: 60,
      color: Colors.black,
    ),

    ),
    ),
  );
}

Container fields(double sw,String label,String hint, int valid,double width,IconData next,bool see){
  return Container(
    height: 75,
    width: sw*width,
    child: TextFormField(
      obscureText: see,
      style: TextStyle(
          fontFamily: "PoetsenOne",
          fontSize: 20
      ),
      decoration: InputDecoration(
        labelText: label,
        filled: false,
        fillColor: Colors.white,
        hintText: hint,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40)
        ),
        prefixIcon: Icon(next),
      ),
      validator: (value){
        if (valid==1){
          return validateuser(value);
        }
        if (valid ==2){
          return validatepass(value);
        }
      },
    ),
  );
}


