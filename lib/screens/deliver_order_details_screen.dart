
import 'package:auraum_b2b_admin/constants/constants.dart';
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
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: const Image(
                      image: AssetImage('assets/image1.png',),
                      fit: BoxFit.fill,
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
