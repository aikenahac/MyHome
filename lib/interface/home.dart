import 'package:MyHome/config/colors.dart';
import 'package:MyHome/interface/lights.dart';
import 'package:MyHome/interface/lock.dart';
import 'package:MyHome/interface/settings.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State < Home > {

  int currentIndex = 0;

  List < SalomonBottomBarItem > items = [
    SalomonBottomBarItem(
      title: Text('Live Location'),
      icon: Icon(Icons.near_me),
      selectedColor: lights
    ),
    SalomonBottomBarItem(
      title: Text('Areas'),
      icon: Icon(Icons.crop_landscape),
      selectedColor: lock
    ),
    SalomonBottomBarItem(
      title: Text('History'),
      icon: Icon(Icons.history),
      selectedColor: settings
    ),
  ];

  List < String > labels = [
    'lights',
    'lock',
    'settings',
  ];

  List < Widget > pages = [
    Lights(),
    Lock(),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: new Theme(
      data: Theme.of(context).copyWith(
        canvasColor: primaryColor
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.0),
        child: SalomonBottomBar(
          currentIndex: currentIndex,
          unselectedItemColor: Colors.grey[400],
          items: items,
          onTap: _onItemTapped,
          
        ),
      )
      )
    );
  }
}