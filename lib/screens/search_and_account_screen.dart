import 'package:flutter/material.dart';
import 'package:interoons_machinetest/custom/custom_text.dart';
class SearchAndAccountScreen extends StatelessWidget {
  String text;
   SearchAndAccountScreen({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: CustomText(text: text,size: 20,))
        ],
      ),
    );
  }
}
