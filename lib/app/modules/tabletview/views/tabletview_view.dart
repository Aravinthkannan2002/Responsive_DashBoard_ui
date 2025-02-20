import 'package:dashboardresponsive/constants.dart'
    show defaultBackgroundColor, myAppBar, myDrawer;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../util/my_box.dart' show MyBox;
import '../../../../util/my_tile.dart' show MyTile;
import '../controllers/tabletview_controller.dart';

class TabletviewView extends GetView<TabletviewController> {
  const TabletviewView({super.key});

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen size
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: myAppBar,
      drawer: myDrawer,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // first 4 boxes in grid with responsive grid based on screen width
            AspectRatio(
              aspectRatio: 4,
              child: SizedBox(
                width: double.infinity,
                child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        width > 600
                            ? 4
                            : 2, // Use 4 columns for wider screens, 2 columns for smaller screens
                  ),
                  itemBuilder: (context, index) {
                    List<String> titles = [
                      "Projects",
                      "Employees",
                      "Enquiries",
                      "Client Enquiries",
                    ];
                    List<IconData> icons = [
                      CupertinoIcons.phone,
                      CupertinoIcons.chat_bubble,
                      CupertinoIcons.settings,
                      CupertinoIcons.person,
                    ];
                    List<VoidCallback> actions = [
                      () => print("ProjectsW Pressed"),
                      () => print("EmployeesW Pressed"),
                      () => print("EnquiriesW Pressed"),
                      () => print("Client EnquiriesW Pressed"),
                    ];
                    List<Color> colors = [
                      Colors.blue,
                      Colors.green,
                      Colors.orange,
                      Colors.purple,
                    ];

                    return MyBox(
                      title: titles[index],
                      icon: icons[index],
                      onTap: actions[index],
                      color: colors[index],
                    );
                  },
                ),
              ),
            ),

            // list of previous days
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const MyTile();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
