import 'package:flutter/material.dart';
import 'package:interoons_machinetest/custom/custom_text.dart';
import 'package:interoons_machinetest/providers/home_page_provider.dart';
import 'package:interoons_machinetest/screens/home_screen.dart';
import 'package:interoons_machinetest/screens/menu_screen.dart';
import 'package:interoons_machinetest/screens/search_and_account_screen.dart';
import 'package:provider/provider.dart';
class BottomScreen extends StatefulWidget {
  const BottomScreen({Key? key}) : super(key: key);

  @override
  _BottomScreenState createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  List<Widget>bodyItems=[
    const HomeScreen(),
    MenuScreen(),
    SearchAndAccountScreen(text: "Search"),
    SearchAndAccountScreen(text: "Account"),
  ];
  int selectedIndex=0;
  @override
  void initState() => super.initState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyItems[selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          InkWell(
            onTap: (){
              setState(() {
                selectedIndex =0;

              });
            },
            child: SizedBox(
              height: 45,
              width: 50,
              child: Column(
                children:  [
                  Icon(Icons.home,color: selectedIndex ==0?Colors.red.shade900:Colors.grey.shade900,),
                  CustomText(text: "Home",size: 12,color: selectedIndex ==0?Colors.red.shade900:Colors.grey.shade900,),
                ],
              ),
            ),
          ),
            InkWell(
              onTap: (){
                setState(() {
                  selectedIndex =1;

                });
              },
              child: SizedBox(
                height: 45,
                width: 50,
                child: Column(
                  children:  [
                    Icon(Icons.menu,color: selectedIndex ==1?Colors.red.shade900:Colors.grey.shade900),
                    CustomText(text: "Menu",size: 12,color: selectedIndex ==1?Colors.red.shade900:Colors.grey.shade900),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  selectedIndex =2;

                });
              },
              child: SizedBox(
                height: 45,
                width: 50,
                child: Column(
                  children:  [
                    Icon(Icons.search,color: selectedIndex ==2?Colors.red.shade900:Colors.grey.shade900),
                    CustomText(text: "Search",size: 12,color: selectedIndex ==2?Colors.red.shade900:Colors.grey.shade900),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  selectedIndex =3;

                });
              },
              child: SizedBox(
                height: 45,
                width: 55,
                child: Column(
                  children:  [
                    Icon(Icons.settings_applications_rounded,color: selectedIndex ==3?Colors.red.shade900:Colors.grey.shade900),
                    CustomText(text: "Account",size: 12,color: selectedIndex ==3?Colors.red.shade900:Colors.grey.shade900),
                  ],
                ),
              ),
            ),
              ]
        ),
      ),
    );
  }
}
