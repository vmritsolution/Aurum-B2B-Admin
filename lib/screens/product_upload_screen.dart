// ignore_for_file: missing_return

import 'dart:io';

import 'package:auraum_b2b_admin/constants/constants.dart';
import 'package:auraum_b2b_admin/screens/my_products_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProductUploadScreen extends StatefulWidget {
  const ProductUploadScreen({ Key key }) : super(key: key);

  @override
  _ProductUploadScreenState createState() => _ProductUploadScreenState();
}

class _ProductUploadScreenState extends State<ProductUploadScreen> {

  final _formKey = GlobalKey<FormState>();

  File shopImage;
  // Image Picker methods
  Future shopTakeImage() async {
    try {
      XFile shopImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (shopImage == null) return;
      final imageTemporary = File(shopImage.path);
      setState(() => this.shopImage = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick shopImage $e');
    }
    // print(shopImage.path);
  }

  Future shopPickImage() async {
    try {
      XFile shopImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (shopImage == null) return;
      final imageTemporary = File(shopImage.path);
      setState(() => this.shopImage = imageTemporary);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick shopImage $e');
    }
    // dropDown List data

    String valueChoose;
    List listItems = [
      
    ];

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorNames.rsBgColor,
      appBar: AppBar(
        title: const Text(
          'Product Upload Screen',
          ),
        foregroundColor: ColorNames.rsFgColor,
        backgroundColor: Colors.transparent, 
        elevation: 0.0, 
      ),
      drawer: Drawer(
        backgroundColor: ColorNames.rsBgColor,
        child: ListView(
          children:   [
            const DrawerHeader(
              child: Image(image: AssetImage("assets/logo.png"),fit: BoxFit.contain,),
            ),
            ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
             tileColor: ColorNames.rsFgColor,
             title: const Text(
               'My Products',
               style: TextStyle(color: ColorNames.rsBgColor,fontSize: 20,fontWeight: FontWeight.bold),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (contex)=> const MyProducts()));
                
              },
            ),
            const Divider(
              color: ColorNames.rsBgColor,
              height: 2,
            ),
            ListTile(
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), 
             tileColor: ColorNames.rsFgColor,
             title: const Text(
               'My Account',
               style: TextStyle(color: ColorNames.rsBgColor,fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(
              color: ColorNames.rsBgColor,
              height: 2,
            ),

          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Builder(
                    builder: (context) {
                      return InkWell(
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorNames.rsFgColor,width: 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child:shopImage != null ? ClipRRect(child: Image(image: FileImage(shopImage),fit: BoxFit.fill,),borderRadius: BorderRadius.circular(10),) : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.upload,color: ColorNames.rsFgColor,size: 60,),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "Upload Product Image",
                                    style: TextStyle(fontSize: 18,color: ColorNames.rsFgColor),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: (){
                          Scaffold.of(context).showBottomSheet<void>((BuildContext context){
                            return Container(
                              height: 180,
                              decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                        ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      TextButton(
                                        onPressed: (){
                                          shopTakeImage();
                                          Navigator.pop(context);
                                        },
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.camera_alt,
                                              size: 40,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                               'Take Photo',
                                               style: TextStyle(fontSize: 20),
                                               )
                                          ],
                                        ),
                                      ),
                                      // pick product button
                                      TextButton(
                                        onPressed: (){
                                          shopPickImage();
                                          Navigator.pop(context);
                                        },
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.camera_alt,
                                              size: 40,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                               'Pick Photo',
                                               style: TextStyle(fontSize: 20),
                                               )
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: (){Navigator.pop(context);}, 
                                          child: const Text("Cancel"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),          
                            );
                          });
                        },
                      );
                    }
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    validator: (value){
                      if(value.isEmpty){
                        return "Please Enter some text";
                      }else if (value.length <= 5){
                        return "Please Enter valid Product Name";
                      }
                    },
                    style: const TextStyle(color: ColorNames.rsFgColor),
                    cursorColor: ColorNames.rsFgColor,
                    decoration:  const InputDecoration(
                       hintText: "Enter Product Name",
                       hintStyle: TextStyle(color:ColorNames.rsFgColor),
                      floatingLabelStyle: TextStyle(color: ColorNames.rsFgColor),
                      enabled: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorNames.rsFgColor,width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorNames.rsFgColor,width: 2),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorNames.rsFgColor,width: 2),
                      )
                      
                      )
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    validator: (value){
                      if(value.isEmpty){
                        return "Please Enter some text";
                      }
                    },
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: ColorNames.rsFgColor),
                    cursorColor: ColorNames.rsFgColor,
                    decoration:  const InputDecoration(
                       hintText: "Enter Product Weight",
                       hintStyle: TextStyle(color:ColorNames.rsFgColor),
                      floatingLabelStyle: TextStyle(color: ColorNames.rsFgColor),
                      enabled: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorNames.rsFgColor,width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorNames.rsFgColor,width: 2),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorNames.rsFgColor,width: 2),
                      )
                      
                      )
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    style: const TextStyle(color: ColorNames.rsFgColor),
                    cursorColor: ColorNames.rsFgColor,
                    decoration:  const InputDecoration(
                       hintText: "Enter Product Descripton",
                       hintStyle: TextStyle(color:ColorNames.rsFgColor),
                      floatingLabelStyle: TextStyle(color: ColorNames.rsFgColor),
                      enabled: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorNames.rsFgColor,width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorNames.rsFgColor,width: 2),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorNames.rsFgColor,width: 2),
                      )
                      
                      )
                  ),
                  const SizedBox(height: 50,),
                  // Upload button
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
                                content: const Text('Product is Uploaded'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {},
                                ),
                                duration: const Duration(seconds: 1),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              // Navigator.push(context, MaterialPageRoute(builder: (context) =>  const ProductUploadScreen()));
                        }
                      },
                      child: const Text(
                        'Upload Product',
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