import 'package:auraum_b2b_admin/constants/constants.dart';
import 'package:auraum_b2b_admin/screens/deliver_order_details_screen.dart';
import 'package:flutter/material.dart';

class OrderDeliverScreen extends StatefulWidget {
  const OrderDeliverScreen({Key key}) : super(key: key);

  @override
  _OrderDeliverScreenState createState() => _OrderDeliverScreenState();
}

class _OrderDeliverScreenState extends State<OrderDeliverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorNames.rsBgColor,
      appBar: AppBar(
        title: const Text(
          'Order Delivers',
        ),
        foregroundColor: ColorNames.rsFgColor,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DODScreen()));
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
                          const SizedBox(
                            width: 50,
                          ),
                          Column(
                            children: const [
                              Text(
                                'Shop Name',
                                style: TextStyle(
                                    color: ColorNames.rsFgColor, fontSize: 18),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Product Name',
                                style: TextStyle(
                                  color: ColorNames.rsFgColor,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Category',
                                style: TextStyle(
                                  color: ColorNames.rsFgColor,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Deliver Date',
                                style: TextStyle(
                                  color: ColorNames.rsFgColor,
                                  fontSize: 18,
                                ),
                              ),
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
    );
  }
}
