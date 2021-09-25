// ignore_for_file: missing_return

import 'package:auraum_b2b_admin/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path/path.dart';

import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

final TextEditingController _mobileController = TextEditingController();
final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorNames.rsBgColor,
      appBar: AppBar(
        title: const Text("Login",style: TextStyle(color: ColorNames.rsFgColor),),
        backgroundColor: Colors.transparent,
        foregroundColor: ColorNames.rsFgColor,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset("assets/logo.png",fit: BoxFit.fill,),
                ),
                const SizedBox(height: 10,),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter Mobile Number",
                    style: TextStyle(color: ColorNames.rsFgColor,fontSize: 20),
                  ),
                ),
                const SizedBox(height: 10,),
                const SizedBox(height: 10,),
                TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                        return "Please Enter some text";
                      }else if (value.length <= 5){
                        return "Please Enter valid ShopName";
                      }
                  },
                          keyboardType: TextInputType.phone,
                          controller: _mobileController,
                          style: const TextStyle(color: ColorNames.tfLetterColor),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: ColorNames.tfLetterColor, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: ColorNames.tfLetterColor, width: 2),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: ColorNames.tfLetterColor, width: 2),
                            ),
                            // hintText: 'Enter Mobile Number',
                            // hintStyle: const TextStyle(color: ColorNames.tfLetterColor),
                            // labelText: 'Enter Mobile Number',
                            // labelStyle:
                            //     const TextStyle(color: ColorNames.tfLetterColor),
                          ),
                        ), 
                const SizedBox(height: 20,),
                // Login Button
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => ColorNames.buttonBgColor),
                    ),
                    child: const Text(
                                  "LogIn",
                                  style: TextStyle(
                                   color: ColorNames.rsBgColor,
                                   fontSize: 20,
                                   fontWeight: FontWeight.bold,
                                 ),
                    ),
                    onPressed: (){
                              // mobile number validation
                      // if (_mobileController.text.isEmpty) {
                      // final snackBar = SnackBar(
                      //             content: const Text('Please Enter Mobile Number'),
                      //             action: SnackBarAction(
                      //               label: 'Undo',
                      //               onPressed: () {},
                      //             ),
                      //             duration: const Duration(seconds: 1),
                      //           );
                      //           ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      //         } else if (_mobileController.text.length < 10) {
                      //         final snackBar = SnackBar(
                      //           content: const Text('Please Enter Valid Mobile Number'),
                      //           action: SnackBarAction(
                      //             label: 'Undo',
                      //             onPressed: () {},
                      //           ),
                      //           duration: const Duration(seconds: 1),
                      //         );
                      //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      //         }else{
                      //          Navigator.push(context, MaterialPageRoute(builder: (context) => const OTPScreen()));
                      //         }
                      if(_formKey.currentState.validate()){
                        final snackBar = SnackBar(
                                  content: const Text('Please Enter OTP'),
                                  action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {},
                                  ),
                                  duration: const Duration(seconds: 1),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const OTPScreen()));
                      }
                    }, 
                            
                   ),
                        
                ),        
              ],
            ),
          ),
        ),
      )  
    );
  }
}