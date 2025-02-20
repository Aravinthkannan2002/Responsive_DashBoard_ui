import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var defaultBackgroundColor = Colors.grey[300];
var appBarColor = Colors.deepPurpleAccent;

var myAppBar = AppBar(
  iconTheme: IconThemeData(color: Colors.white),
  backgroundColor: appBarColor,
  title: Text('D A S H B O A R D', style: TextStyle(color: Colors.white)),
  centerTitle: true,
);

var drawerTextColor = TextStyle(color: Colors.grey[600]);
var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);

Widget buildDrawerTile(IconData icon, String title, VoidCallback onTap) {
  return Padding(
    padding: tilePadding,
    child: ListTile(
      leading: Icon(icon),
      title: Text(title, style: drawerTextColor),
      onTap: onTap,
    ),
  );
}

var myDrawer = Drawer(
  backgroundColor: Colors.grey[300],
  elevation: 0,
  child: SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      children: [
        DrawerHeader(
          child: Icon(color: Colors.deepPurple, Icons.favorite, size: 64),
        ),
        buildDrawerTile(CupertinoIcons.home, 'DASHBOARD', () {
          print("Dashboard Clicked");
        }),
        buildDrawerTile(CupertinoIcons.gear, 'PROJECTS', () {
          print("Projects Clicked");
        }),
        buildDrawerTile(CupertinoIcons.info, 'EMPLOYEES', () {
          print("Employees Clicked");
        }),
        buildDrawerTile(CupertinoIcons.power, 'ENQUIRIES', () {
          print("Enquiries Clicked");
        }),
        buildDrawerTile(
          CupertinoIcons.arrow_right_square,
          'CLIENTS ENQUIRIES',
          () {
            print("Clients Enquiries Clicked");
          },
        ),
        buildDrawerTile(CupertinoIcons.settings, 'SETTINGS', () {
          print("Settings Clicked");
        }),
        buildDrawerTile(CupertinoIcons.square_arrow_right, 'LOGOUT', () {
          print("Logout Clicked");
        }),
      ],
    ),
  ),
);
