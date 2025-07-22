import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ai_app/apis/apis.dart';

import '../helper/prefs.dart';
import '../models/home_type.dart';
import '../widgets/homecard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Prefs.onBoarding = false;
    APIs.getAnswer("What is Artificial Intelligence");
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar : AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text("Ai Assistant",
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w500,
          fontSize: 20
        ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(onPressed: (){

            }, icon: Icon(Icons.brightness_4, color: Colors.blue,)),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.015
        ),
        children: HomeType.values.map((e)=>Homecard(homeType: e,)).toList()
      )
    );
  }
}
