import 'package:flutter/material.dart';

Container button_login(String name,Function()? name1){
  return Container(
    height: 50,
    width: 150,
    child: FloatingActionButton(
      onPressed: name1,
      elevation: 15,
      focusColor: Colors.blueGrey,
      foregroundColor: Colors.black,
      backgroundColor: Colors.grey,
      child: Text(name,style: TextStyle(
        fontFamily: "PoetsenOne",
        fontSize: 15,
      ),),
    ),
  );
}