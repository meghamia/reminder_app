



import 'package:final1/Api_screens/pagination_screen1.dart';
import 'package:final1/Api_screens/product_screen2.dart';
import 'package:final1/frequency_bright_assessment.dart';
import 'package:final1/pattern_bright_assesment.dart';
import 'package:final1/posts/post_list.dart';
import 'package:final1/remainder_file.dart';

import 'package:flutter/material.dart';


import 'Api_screens/Modelui_screen3.dart';

import 'package:timezone/data/latest.dart' as tz;

void main() {
  tz.initializeTimeZones();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
          primaryColor: Colors.black87,

          //colors changing insisde the body where container is whcih held buttons
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey),
          appBarTheme: AppBarTheme(
            color: Colors.blue,
          )

        //primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

             
              ElevatedButton(
                child: Text("Click here"),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReminderScreen()),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
