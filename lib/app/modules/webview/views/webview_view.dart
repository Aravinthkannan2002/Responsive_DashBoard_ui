import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../constants.dart'
    show defaultBackgroundColor, myAppBar, myDrawer;
import '../../../../util/my_box.dart' show MyBox;
import '../../../../util/my_tile.dart' show MyTile;
import '../controllers/webview_controller.dart';

class WebviewView extends GetView<WebviewController> {
  final List<Map<String, dynamic>> jobList1 = [
    {
      "title": "Android Developer",
      "applications": 95,
      "color": Colors.orange,
    },
    {"title": "UX/UI Designer", "applications": 80, "color": Colors.purple},
    {"title": "Flutter Developer", "applications": 120, "color": Colors.blue},
    {
      "title": "React Native Developer",
      "applications": 85,
      "color": Colors.green,
    },
  ];

  WebviewView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    int gridCrossAxisCount = screenWidth < 600 ? 2 : 4;

    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: myAppBar,
      body: Padding(
        padding: EdgeInsets.all(screenWidth < 600 ? 4.0 : 8.0),
        child:
            screenWidth < 800
                ? Column(
                  children: [
                    _buildMainContent(screenWidth, gridCrossAxisCount),
                  ],
                )
                : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myDrawer,
                    Expanded(
                      flex: 2,
                      child: _buildMainContent(screenWidth, gridCrossAxisCount),
                    ),
                    Expanded(child: _buildSideContent(screenHeight)),
                  ],
                ),
      ),
    );
  }

  Widget _buildMainContent(double screenWidth, int gridCrossAxisCount) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 4,
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridCrossAxisCount,
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
              List<Color> colors = [
                Colors.blue,
                Colors.green,
                Colors.orange,
                Colors.purple,
              ];

              return MyBox(
                title: titles[index],
                icon: icons[index],
                onTap: () => print("${titles[index]} Pressed"),
                color: colors[index],
              );
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              return const MyTile();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSideContent(double screenHeight) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: screenHeight * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[200],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                  sections: [
                    PieChartSectionData(
                      value: 40,
                      title: '40%',
                      color: Colors.blue,
                      radius: 55,
                    ),
                    PieChartSectionData(
                      value: 30,
                      title: '30%',
                      color: Colors.green,
                      radius: 55,
                    ),
                    PieChartSectionData(
                      value: 20,
                      title: '20%',
                      color: Colors.orange,
                      radius: 55,
                    ),
                    PieChartSectionData(
                      value: 10,
                      title: '10%',
                      color: Colors.red,
                      radius: 55,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: _buildJobList("Development Jobs", jobList1),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildJobList(String title, List<Map<String, dynamic>> jobList) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: jobList.length,
        itemBuilder: (context, index) {
          final job = jobList[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: job["color"],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      child: Text(
                        job["applications"].toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          job["title"],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "Total Applications",
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                Switch(
                  value: true,
                  onChanged: (bool value) {},
                  activeColor: Colors.white,
                ),
              ],
            ),
          );
        },
      ),
    ],
  );
}
