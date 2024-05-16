import 'dart:convert';
import 'dart:io';

import 'package:cropwise/recommendations.dart';
import 'package:cropwise/splash.dart';
import 'package:cropwise/tabTwo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/img-2.jpeg"), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.5),BlendMode.modulate),)),
          child: SplashScreen(),),
        ) 
      
      );
    }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return  DefaultTabController(
      length: 2,
      child: Scaffold(
      appBar: AppBar(
        leading: Container(padding: EdgeInsets.fromLTRB(10, 20, 0, 5),child: CircleAvatar(backgroundImage: AssetImage('assets/logo.png'),),),
        title: Container(padding: EdgeInsets.fromLTRB(80, 0, 0, 0) ,child:  Text('CropWise', style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.w500),)),
        backgroundColor:Color(0xFF1E1E1E)
,
        bottom: const TabBar(
                tabs: [
                  Tab(icon: Text('Recommend Me', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white,),)),
                  Tab(icon: Text('Estimate', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white,),)),
                ],
              ),
        ),
        body: const TabBarView(
            children: [
              CropRecommendation(),
              Tabtwo(),
            ],
          ),
          backgroundColor: Color(0xFF3B3B3D),
      ),
      
    );
  }
}
