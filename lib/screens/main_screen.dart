import 'package:flutter/material.dart';
import 'package:wrenchy_admin/screens/user_management_screen.dart';
import 'package:wrenchy_admin/screens/vehicaleReportScreen.dart';
import 'package:wrenchy_admin/widgets/app_logo.dart';


import '../constant/app_text_styles.dart';
import '../constant/color_panel.dart';
import 'dashboard_screen.dart';

final List<Map<String, dynamic>> mainHeadings = [
  {
    'title': 'Dashboard',
    'icon': Icons.dashboard,
  },

  {
    'title': 'User Management',
    'icon': Icons.group,
  },
  {
    'title': 'Vehicle Reports',
    'icon': Icons.directions_car,
  },
  {
    'title': 'Subscription Management',
    'icon': Icons.attach_money,
  },
  {
    'title': 'Customer Support Inbox',
    'icon': Icons.help_outline,
  },
  {
    'title': 'Analytics',
    'icon': Icons.analytics,
  },
  {
    'title': 'App Settings',
    'icon': Icons.settings,
  },
];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: ColorPanel.lightBlue,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  AppLogo(width: 100,),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: mainHeadings.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = mainHeadings[index];
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: _currentIndex == index ? ColorPanel.secondaryColor : Colors.transparent
                          ),
                          child: ListTile(
                            onTap: (){
                              _currentIndex = index;
                              setState(() {

                              });
                            },
                            leading: Icon(item["icon"],
                                color: _currentIndex == index ? Colors.white : Colors.black

                            ),
                            title: Text(item["title"],style: AppTextStyles.medium.copyWith(
                                color: _currentIndex == index ? Colors.white : Colors.black

                            ),),
                          ),
                        );
                      },),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: _currentIndex == 0 ? DashboardScreen() : _currentIndex == 1 ? UserManagementScreen() : VehicleReportsScreen())
        ],
      ),
    );
  }
}
