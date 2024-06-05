// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:login_page_validations/components/reusable_buttons.dart';
import 'package:login_page_validations/components/reusable_textboxes.dart';
final GlobalKey<FormState> _keyform =GlobalKey<FormState>();
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
   MyApp({super.key});
  final GlobalKey<FormState> _keyform =GlobalKey<FormState>();

  void formsubmit(){
    if(_keyform.currentState!.validate()){}
  }
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
  String? validateemail(value){
    if(value!.isEmpty){
      return "Please Enter Email";
    }
    RegExp email = RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$');
    if(!email.hasMatch(value)){
      return 'Enter valid email';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    double sw=MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("images/aesthetic1.jpeg"),
              fit: BoxFit.cover
          ),
        ),
        child:  Scaffold(
          backgroundColor: Colors.transparent,
          body:sw<1200?
          Center(
            child: Column(
              children: [
                title_top("Login"),
                Form(
                  key: _keyform,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child:fields(sw,"Username","Enter Username",1,0.75,Icons.policy_sharp,false),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child:fields(sw,"PassWord","Enter PassWord",2,0.75,Icons.password,true),
                          ),
                        ),
                        SizedBox(
                          child: Container(
                            height: 50,
                          ),
                        ),
                        button_login("Login",formsubmit),
                      ],
                    )
                ),
              ],
            ),
          )
              :
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(80),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(image:  AssetImage("images/welcomebackpic.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              // SizedBox(
              //   width:MediaQuery.of(context).size.width*0.1,
              // ),
              Center(
                child: Column(
                  children: [
                    title_top("Login"),
                    Form(
                        key: _keyform,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child:fields(sw,"Username","Enter Username",1,0.3,Icons.policy_sharp,false),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child:fields(sw,"PassWord","Enter PassWord",2,0.3,Icons.password,true),
                              ),
                            ),
                            SizedBox(
                              child: Container(
                                height: 20,
                              ),
                            ),
                            button_login("Login",formsubmit),
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}

// Container button_login(){
//   final GlobalKey<FormState> _keyform =GlobalKey<FormState>();
//   return Container(
//       height: 50,
//       width: 150,
//       child: FloatingActionButton(
//         onPressed: (){
//           if(_keyform.currentState!.validate()){}
//         },
//         elevation: 15,
//         focusColor: Colors.blueGrey,
//         foregroundColor: Colors.black,
//         backgroundColor: Colors.blueGrey,
//         child: Text("Login",style: TextStyle(
//           fontFamily: "PoetsenOne",
//           fontSize: 15,
//         ),),
//       ),
//   );
// }
