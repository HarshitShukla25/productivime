import 'dart:html';

import 'package:flutter/material.dart';
import 'package:productivime/index.dart';

class HomesidepagePage extends StatefulWidget {
  static const String routeName = '/homesidepage';

  @override
  _HomesidepagePageState createState() => _HomesidepagePageState();
}

class _HomesidepagePageState extends State<HomesidepagePage> {
  final _homesidepageBloc = HomesidepageBloc(UnHomesidepageState());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homesidepage'),
      ),
      body: HomesidepageScreen(homesidepageBloc: _homesidepageBloc),
    );
  }
}
