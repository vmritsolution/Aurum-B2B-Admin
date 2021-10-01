import 'package:auraum_b2b_admin/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DODScreen extends StatefulWidget {
  const DODScreen({Key key}) : super(key: key);

  @override
  _DODScreenState createState() => _DODScreenState();
}

class _DODScreenState extends State<DODScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorNames.rsBgColor,
      appBar: AppBar(
        title: const Text('OrderDetails'),
        foregroundColor: ColorNames.rsFgColor,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: const Image(
                        image: AssetImage(
                          'assets/image1.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                // order ID details
                const Divider(
                  height: 2,
                  color: ColorNames.rsFgColor,
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'OrderId: S328673HE3H337646',
                  style: TextStyle(
                    color: ColorNames.rsFgColor,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Divider(
                  height: 2,
                  color: ColorNames.rsFgColor,
                ),
                const SizedBox(
                  height: 7,
                ),

                // Order Status
                const Text(
                  'Order Status : Pending',
                  style: TextStyle(
                    color: ColorNames.rsFgColor,
                    fontSize: 18
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Divider(
                  height: 2,
                  color: ColorNames.rsFgColor,
                ),
                const SizedBox(
                  height: 7,
                ),

                // Product Details
                const Text(
                  'Product Details',
                  style: TextStyle(color: ColorNames.rsFgColor, fontSize: 18),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Divider(
                  height: 2,
                  color: ColorNames.rsFgColor,
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'Product Name',
                  style: TextStyle(
                      color: ColorNames.rsFgColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'Category',
                  style: TextStyle(
                    color: ColorNames.rsFgColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'Weight',
                  style: TextStyle(
                    color: ColorNames.rsFgColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Divider(
                  height: 2,
                  color: ColorNames.rsFgColor,
                ),
                const SizedBox(
                  height: 7,
                ),

                //Shipping details
                const Text(
                  'Shipping Details',
                  style: TextStyle(color: ColorNames.rsFgColor, fontSize: 18),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Divider(
                  height: 2,
                  color: ColorNames.rsFgColor,
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'Shop Name',
                  style: TextStyle(
                      color: ColorNames.rsFgColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'GSTIN Number',
                  style: TextStyle(
                    color: ColorNames.rsFgColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'Orderd date : 00/00/0000',
                  style: TextStyle(
                    color: ColorNames.rsFgColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'Delivered Date : 00/00/0000',
                  style: TextStyle(
                    color: ColorNames.rsFgColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'Address:',
                  style: TextStyle(
                      color: ColorNames.rsFgColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'CJ jewellers,',
                  style: TextStyle(
                    color: ColorNames.rsFgColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'Landmark Of Address',
                  style: TextStyle(
                    color: ColorNames.rsFgColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'Street Address',
                  style: TextStyle(
                    color: ColorNames.rsFgColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'Street Name',
                  style: TextStyle(
                    color: ColorNames.rsFgColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'District',
                  style: TextStyle(
                    color: ColorNames.rsFgColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'State Name - PinCode',
                  style: TextStyle(
                    color: ColorNames.rsFgColor,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'Mobile Numbers: 99999 99999 , 99999 99999',
                  style: TextStyle(
                    color: ColorNames.rsFgColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 100,
                      width: 100,
                      child: Image(
                    image: AssetImage('assets/logo.png'),
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
