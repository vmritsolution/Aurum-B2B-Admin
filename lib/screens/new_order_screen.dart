import 'package:auraum_b2b_admin/constants/constants.dart';
import 'package:auraum_b2b_admin/screens/new_order_details_screen.dart';
import 'package:flutter/material.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({Key key}) : super(key: key);

  @override
  _NewOrderScreenState createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorNames.rsBgColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('New Order Screen'),
        backgroundColor: Colors.transparent,
        foregroundColor: ColorNames.rsFgColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const NewOrderDetailsScreen()));
                  },
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorNames.rsFgColor, width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                const Text(
                                  'Shop Name',
                                  style: TextStyle(
                                      color: ColorNames.rsFgColor,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Product Name',
                                  style: TextStyle(
                                    color: ColorNames.rsFgColor,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Weight ',
                                  style: TextStyle(
                                    color: ColorNames.rsFgColor,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                ButtonBar(
                                  children: [
                                    ElevatedButton(
                                      child: const Text(
                                        'Confirm',
                                        style: TextStyle(
                                            color: ColorNames.rsBgColor),
                                      ),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                content: const Text(
                                                    'Order Is Confirmed'),
                                                actions: [
                                                  FlatButton(
                                                    child: const Text('Cancel'),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  )
                                                ],
                                              );
                                            });
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) =>
                                                    ColorNames.buttonBgColor),
                                      ),
                                    ),
                                    ElevatedButton(
                                      child: const Text('Reject',
                                          style: TextStyle(
                                              color: ColorNames.rsBgColor)),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                content: const Text(
                                                    'Give a Reason To Reject'),
                                                actions: [
                                                  const TextField(),
                                                  FlatButton(
                                                    child: const Text('cancel'),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  FlatButton(
                                                    child: const Text('Submit'),
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return const AlertDialog(
                                                              content: Text(
                                                                  'Order Is Rejected'),
                                                            );
                                                          });
                                                    },
                                                  )
                                                ],
                                              );
                                            });
                                      },
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
                        const Text(
                          'Click For More Details',
                          style: TextStyle(color: ColorNames.rsFgColor),
                        )
                      ],
                    ),
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
