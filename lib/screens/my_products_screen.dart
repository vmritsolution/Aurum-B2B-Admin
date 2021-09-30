import 'package:auraum_b2b_admin/constants/constants.dart';
import 'package:flutter/material.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({Key key}) : super(key: key);

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    // check box properties
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return ColorNames.rsFgColor;
    }

    return Scaffold(
      backgroundColor: ColorNames.rsBgColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("My Products"),
        backgroundColor: Colors.transparent,
        foregroundColor: ColorNames.rsFgColor,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorNames.rsFgColor, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: SizedBox(
                              height: 140,
                              width: 140,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: const Image(
                                  image: AssetImage('assets/image1.png'),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 10,),
                                child: Text(
                                  'ProductName',
                                  style: TextStyle(
                                      color: ColorNames.rsFgColor,
                                      fontSize: 18),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              const Padding(
                                padding: EdgeInsets.only(right: 55),
                                child: Text(
                                  'Weight',
                                  style: TextStyle(
                                    color: ColorNames.rsFgColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              const Padding(
                                padding: EdgeInsets.only(right: 45),
                                child: Text(
                                  'Category',
                                  style: TextStyle(
                                    color: ColorNames.rsFgColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ButtonBar(
                                children: [
                                  ElevatedButton(
                                    child: const Text(
                                      'Edit',
                                      style: TextStyle(
                                          color: ColorNames.rsBgColor),
                                    ),
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) =>
                                                  ColorNames.buttonBgColor),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  ElevatedButton(
                                    child: const Text('Delete',
                                        style: TextStyle(
                                            color: ColorNames.rsBgColor)),
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) =>
                                                  ColorNames.buttonBgColor),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      /* Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          const SizedBox(
                            width: 10,
                          ),

                          Align(
                            alignment: Alignment.topRight,
                            child: Checkbox(
                              checkColor: ColorNames.rsBgColor,
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: isChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  isChecked = value;
                                });
                              },
                            ),
                          )
                        ],
                      ),*/
                      /* Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                            onPressed: () {},
                            child: const Text(
                              'Edit',
                              style: TextStyle(
                                  color: ColorNames.rsBgColor, fontSize: 16),
                            ),
                            color: ColorNames.rsFgColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          RaisedButton(
                            onPressed: () {},
                            child: const Text(
                              'Delete',
                              style: TextStyle(
                                color: ColorNames.rsBgColor,
                                fontSize: 16,
                              ),
                            ),
                            color: ColorNames.rsFgColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ],
                      )*/
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorNames.rsFgColor, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: SizedBox(
                              height: 140,
                              width: 140,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: const Image(
                                  image: AssetImage('assets/image1.png'),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 10,),
                                child: Text(
                                  'ProductName',
                                  style: TextStyle(
                                      color: ColorNames.rsFgColor,
                                      fontSize: 18),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              const Padding(
                                padding: EdgeInsets.only(right: 55),
                                child: Text(
                                  'Weight',
                                  style: TextStyle(
                                    color: ColorNames.rsFgColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              const Padding(
                                padding: EdgeInsets.only(right: 45),
                                child: Text(
                                  'Category',
                                  style: TextStyle(
                                    color: ColorNames.rsFgColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ButtonBar(
                                children: [
                                  ElevatedButton(
                                    child: const Text(
                                      'Edit',
                                      style: TextStyle(
                                          color: ColorNames.rsBgColor),
                                    ),
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                              (states) =>
                                          ColorNames.buttonBgColor),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  ElevatedButton(
                                    child: const Text('Delete',
                                        style: TextStyle(
                                            color: ColorNames.rsBgColor)),
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                              (states) =>
                                          ColorNames.buttonBgColor),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
