// ignore_for_file: missing_return

import 'package:auraum_b2b_admin/constants/constants.dart';
import 'package:auraum_b2b_admin/screens/product_upload_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DetailsScreen extends StatelessWidget {
   DetailsScreen({ Key key }) : super(key: key);
  
    final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorNames.rsBgColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Details Screen',
          ),
        foregroundColor: ColorNames.rsFgColor,
        backgroundColor: Colors.transparent, 
        elevation: 0.0, 
      ),
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter Details',
                      style: TextStyle(color: ColorNames.rsFgColor,fontSize: 20),
                  
                      ),
                  ),
                  const SizedBox(height: 5,),
                  const Divider(color: ColorNames.rsFgColor,),
                  const SizedBox(height: 5,),
                  // Shop Name field
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter Shop Name',
                      style: TextStyle(color: ColorNames.rsFgColor,fontSize: 18),
                  
                      ),
                  ),
                  const SizedBox(height: 10,),    
                  TextFormField(
                   
                    validator: (value){
                      if(value.isEmpty){
                        return "Please Enter some text";
                      }else if (value.length <= 5){
                        return "Please Enter valid ShopName";
                      }
                    },
                    style: const TextStyle(color: ColorNames.rsFgColor),
                    decoration: InputDecoration(
                  
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
                            // labelText: 'Enter Shop Name',
                            // labelStyle:
                            //     const TextStyle(color: ColorNames.tfLetterColor),
                          ),
                  ),
                   const SizedBox(height: 5,),
                  const Divider(color: ColorNames.rsFgColor,),
                  const SizedBox(height: 5,),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter GSTIN Number',
                      style: TextStyle(color: ColorNames.rsFgColor,fontSize: 18),
                  
                      ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    style: const TextStyle(color: ColorNames.rsFgColor),
                    validator: (value){
                      if(value.isEmpty){
                        return "Please Enter some text";
                      }else if (value.length <= 5){
                        return "Please Enter valid GSTIN no";
                      }
                    },
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
                            // labelText: 'Enter GSTIN Number',
                            // labelStyle:
                            //     const TextStyle(color: ColorNames.tfLetterColor),
                          ),
                  ),
                  const SizedBox(height: 5,),
                  const Divider(color: ColorNames.rsFgColor,),
                  const SizedBox(height: 5,),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter Shop Address',
                      style: TextStyle(color: ColorNames.rsFgColor,fontSize: 18),
                  
                      ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    style: const TextStyle(color: ColorNames.rsFgColor),
                    validator: (value){
                      if(value.isEmpty){
                        return "Please Enter some text";
                      }else if (value.length <= 5){
                        return "Please Enter valid ShopAddress";
                      }
                    },
                    decoration: InputDecoration(
                            
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
                            // labelText: 'Enter Shop Address',
                            // labelStyle:
                            //     const TextStyle(color: ColorNames.tfLetterColor),
                          ),
                  ),
                  const SizedBox(height: 30,),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => ColorNames.buttonBgColor),
                      ),
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          final snackBar = SnackBar(
                                content: const Text('Shop Details are Submitted'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {},
                                ),
                                duration: const Duration(seconds: 1),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                               Navigator.pushAndRemoveUntil(
                                context,
                                 MaterialPageRoute(
                                  builder: (context) =>  const ProductUploadScreen(),
                                  ),
                                     (route) => false);
                        }
                      },
                      child: const Text(
                                    "Submit",
                                    style: TextStyle(
                                     color: ColorNames.rsBgColor,
                                     fontSize: 20,
                                     fontWeight: FontWeight.bold,
                                   ),
                      ),
                      ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}