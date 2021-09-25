import 'dart:async';

import 'package:auraum_b2b_admin/constants/constants.dart';
import 'package:auraum_b2b_admin/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class OTPScreen extends StatefulWidget {
  const OTPScreen({ Key key }) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  final TextEditingController _controller = TextEditingController();

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText  = "";
  final formKey = GlobalKey<FormState>();

  @override 
  void initState(){
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }
  @override
  void dispose(){
    errorController.close();
    super.dispose();
  }

  //snackBar widget
  snackBar(String message){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
  
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorNames.rsBgColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: ColorNames.rsFgColor,
        title: const Text('LogIn'),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children:[
              const Text(
                'Enter OTP',
                style: TextStyle(fontSize: 20,color: ColorNames.rsFgColor),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                height: 70,
                width: double.infinity,
                child: Form(
                  key: formKey,
                  child: Padding(
                     padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(
                      appContext: context,
                      
                      textStyle: const TextStyle(color: ColorNames.rsFgColor),
                      pastedTextStyle: const TextStyle(
                          color: ColorNames.rsFgColor,
                          fontWeight: FontWeight.bold,
                        ),
                      length: 6,
                      // obscureText: true,
                      // obscuringCharacter: '*',  
                      validator: (v) {
                          if (v.length < 3) {
                            return ;
                          } else {
                            return null;
                          }
                       },
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                          activeColor: ColorNames.rsFgColor,
                          inactiveColor: ColorNames.rsFgColor,

                      ), 
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  hasError ? "*Please fill up all the cells properly" : "",
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't receive the code? ",
                    style: TextStyle(color: ColorNames.rsFgColor, fontSize: 15),
                  ),
                  TextButton(
                      onPressed: () => snackBar("OTP resend!!"),
                      child: const Text(
                        "RESEND",
                        style: TextStyle(
                            color: ColorNames.rsFgColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ))
                ],
              ),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => ColorNames.buttonBgColor),
                  ),
                  onPressed: (){
                    formKey.currentState.validate();
                   if (currentText.length != 6 || currentText != "123456") {
                        errorController.add(ErrorAnimationType
                            .shake); // Triggering error shake animation
                        setState(() => hasError = true);
                      } else {
                        setState(
                          () {
                            hasError = false;
                            snackBar("OTP Verified!!");
                             Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetailsScreen()));
                          },
                        );
                      }
                  }, 
                  child: const Text(
                    "Verify",
                    style: TextStyle(color: ColorNames.rsBgColor,fontSize: 20,
                    ),
                ),
          
              ),
              ),
              ],
          ),
        ),
      ),
    );
  }
}