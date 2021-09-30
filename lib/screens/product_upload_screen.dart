import 'dart:io';

import 'package:auraum_b2b_admin/constants/constants.dart';
import 'package:auraum_b2b_admin/screens/my_products_screen.dart';
import 'package:auraum_b2b_admin/screens/new_order_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import 'order_deliver_screen.dart';

class ProductUploadScreen extends StatefulWidget {
  const ProductUploadScreen({Key key}) : super(key: key);

  @override
  _ProductUploadScreenState createState() => _ProductUploadScreenState();
}

class _ProductUploadScreenState extends State<ProductUploadScreen> {
  final _formKey = GlobalKey<FormState>();
  String category;
  String dropDownValue = 'Select Category';

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
  }

  List listItems;

  // @override
  // void initState() {
  //   super.initState();
  //   dropDownValue;
  //   setState(() {
  //      listItems = category as List;
  //   });
  // }

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const DrawerHeader(
                child: Image(
                  image: AssetImage("assets/logo.png"),
                  fit: BoxFit.contain,
                ),
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                tileColor: ColorNames.rsFgColor,
                title: const Text(
                  'My Products',
                  style: TextStyle(
                      color: ColorNames.rsBgColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyProducts()));
                },
              ),
              const Divider(
                color: ColorNames.rsBgColor,
                height: 2,
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                tileColor: ColorNames.rsFgColor,
                title: const Text(
                  'My Account',
                  style: TextStyle(
                      color: ColorNames.rsBgColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                color: ColorNames.rsBgColor,
                height: 2,
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                tileColor: ColorNames.rsFgColor,
                title: const Text(
                  'New Orders',
                  style: TextStyle(
                      color: ColorNames.rsBgColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const NewOrderScreen()));
                },
              ),
              const Divider(
                color: ColorNames.rsBgColor,
                height: 2,
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                tileColor: ColorNames.rsFgColor,
                title: const Text(
                  'Order Delivers',
                  style: TextStyle(
                      color: ColorNames.rsBgColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const OrderDeliverScreen()));
                },
              ),
            ],
          ),
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
                  Builder(builder: (context) {
                    return InkWell(
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          border:
                          Border.all(color: ColorNames.rsFgColor, width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: shopImage != null
                            ? ClipRRect(
                          child: Image(
                            image: FileImage(shopImage),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        )
                            : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.upload,
                                color: ColorNames.rsFgColor,
                                size: 60,
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "Upload Product Image",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: ColorNames.rsFgColor),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Scaffold.of(context)
                            .showBottomSheet<void>((BuildContext context) {
                          return Container(
                            height: 180,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    TextButton(
                                      onPressed: () {
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
                                      onPressed: () {
                                        shopPickImage();
                                        Navigator.pop(context);
                                      },
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.photo_library_outlined,
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
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
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
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  //drop down
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 60,
                            child: DropdownButton<String>(
                              value: dropDownValue,
                              icon: const Icon(
                                Icons.arrow_downward,
                                color: ColorNames.rsFgColor,
                              ),
                              dropdownColor: ColorNames.rsBgColor,
                              iconSize: 20,
                              elevation: 16,
                              isExpanded: true,
                              style: const TextStyle(
                                  color: ColorNames.rsFgColor,
                                  backgroundColor: ColorNames.rsBgColor,
                                  fontSize: 16
                              ),
                              underline: Container(
                                height: 2,
                                width: double.infinity,
                                color: ColorNames.rsFgColor,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropDownValue = newValue;
                                });
                              },
                              items: <String>[
                                'Select Category',
                                'rings',
                                'bangles',
                                'bracelets',
                                'chains',
                                'ornaments',
                                'neckless',
                                'earrings',
                                'Dumas',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 80,
                          child: TextFormField(
                            /*validator: (value) {
                            if (value.isEmpty) {
                              return "Please Add Category";
                            } else if (value.length <= 2) {
                              return "Please Add Valid Category";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            category = val;
                          },*/
                              style: const TextStyle(
                                  color: ColorNames.rsFgColor, fontSize: 18),
                              cursorColor: ColorNames.rsFgColor,
                              readOnly: false,
                              decoration: const InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.add,
                                    color: ColorNames.rsFgColor,
                                  ),
                                  labelText: "Add Category",
                                  labelStyle: TextStyle(
                                      color: ColorNames.rsFgColor,
                                      fontSize: 16),
                                  floatingLabelStyle:
                                  TextStyle(color: ColorNames.rsFgColor),
                                  enabled: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorNames.rsFgColor, width: 2),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorNames.rsFgColor, width: 2),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorNames.rsFgColor, width: 2),
                                  ))),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  // Product field
                  TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please Enter some text";
                        } else if (value.length <= 5) {
                          return "Please Enter valid Product Name";
                        }
                        return null;
                      },
                      style: const TextStyle(color: ColorNames.rsFgColor),
                      cursorColor: ColorNames.rsFgColor,
                      decoration: const InputDecoration(
                          labelText: "Product Name",
                          labelStyle: TextStyle(
                              color: ColorNames.rsFgColor, fontSize: 16),
                          floatingLabelStyle:
                          TextStyle(color: ColorNames.rsFgColor),
                          enabled: true,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorNames.rsFgColor, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorNames.rsFgColor, width: 2),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorNames.rsFgColor, width: 2),
                          ))),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please Enter some text";
                        } else if (value.length <= 1) {
                          return "Please Enter valid Product Name";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: ColorNames.rsFgColor),
                      cursorColor: ColorNames.rsFgColor,
                      decoration: const InputDecoration(
                          suffixText: 'grams',
                          suffixStyle: TextStyle(color: ColorNames.rsFgColor),
                          labelText: "Product Weight",
                          labelStyle: TextStyle(
                              color: ColorNames.rsFgColor, fontSize: 16),
                          floatingLabelStyle:
                          TextStyle(color: ColorNames.rsFgColor),
                          enabled: true,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorNames.rsFgColor, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorNames.rsFgColor, width: 2),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorNames.rsFgColor, width: 2),
                          ))),

                  //GstIn no field

                  const SizedBox(
                    height: 10,
                  ),

                  //description field
                  TextFormField(
                      style: const TextStyle(color: ColorNames.rsFgColor),
                      cursorColor: ColorNames.rsFgColor,
                      decoration: const InputDecoration(
                          labelText: "Product Description",
                          labelStyle: TextStyle(
                              color: ColorNames.rsFgColor, fontSize: 16),
                          floatingLabelStyle:
                          TextStyle(color: ColorNames.rsFgColor),
                          enabled: true,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorNames.rsFgColor, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorNames.rsFgColor, width: 2),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorNames.rsFgColor, width: 2),
                          ))),
                  const SizedBox(
                    height: 50,
                  ),
                  // Upload button
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => ColorNames.buttonBgColor),
                      ),
                      onPressed: () {
                        if (shopImage == null) {
                          final snackBar = SnackBar(
                            content: const Text('Please Upload Product Image'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {},
                            ),
                            duration: const Duration(seconds: 1),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();

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
                          print(listItems);
                        } else if (_formKey.currentState.validate()) {
                          final snackBar = SnackBar(
                            content: const Text('Category is Added'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {},
                            ),
                            duration: const Duration(seconds: 3),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (shopImage == null) {
                          final snackBar = SnackBar(
                            content: const Text('Please Upload Product Image'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {},
                            ),
                            duration: const Duration(seconds: 2),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
