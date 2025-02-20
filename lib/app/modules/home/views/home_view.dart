import 'package:dashboardresponsive/constants.dart'
    show defaultBackgroundColor, myAppBar, myDrawer;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/my_box.dart' show MyBox;
import '../../../../util/my_tile.dart' show MyTile;
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust grid column count based on screen size
    int crossAxisCount =
        screenWidth > 600 ? 3 : 2; // More columns for larger screens

    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: myAppBar,
      drawer: myDrawer,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // First 4 boxes in grid
            AspectRatio(
              aspectRatio: 1,
              child: SizedBox(
                width: double.infinity,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        crossAxisCount, // Use MediaQuery-based crossAxisCount
                    childAspectRatio:
                        screenWidth > 600
                            ? 1.2
                            : 1, // Adjust aspect ratio for larger screens
                  ),
                  itemBuilder: (context, index) {
                    // List of titles, icons, actions, and colors
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
                      Colors.blue, // Color for "Projects"
                      Colors.green, // Color for "Employees"
                      Colors.orange, // Color for "Enquiries"
                      Colors.purple, // Color for "Client Enquiries"
                    ];

                    return MyBox(
                      title: titles[index], // Pass title
                      icon: icons[index], // Pass icon
                      onTap: actions[index], // Pass different onTap functions
                      color: colors[index], // Pass color dynamically
                    );
                  },
                ),
              ),
            ),

            // List of previous days
            Expanded(
              child: ListView.builder(
                itemCount: 4,
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
