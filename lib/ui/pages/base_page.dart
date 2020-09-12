import 'package:covid19_awareness_app/ui/pages/account_page.dart';
import 'package:covid19_awareness_app/ui/pages/analytics_page.dart';
import 'package:covid19_awareness_app/ui/pages/home_page.dart';
import 'package:covid19_awareness_app/ui/pages/search_page.dart';
import 'package:covid19_awareness_app/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:covid19_awareness_app/ui/widgets/custom_bottom_navigation_bar_item.dart';
import 'package:covid19_awareness_app/utils/custom_icons_icons.dart';
import 'package:flutter/material.dart';

enum AppTab { home, analytics, search, account }

class TabHelper {
  static AppTab item(int index) {
    switch (index) {
      case 0:
        return AppTab.home;
      case 1:
        return AppTab.analytics;
      case 2:
        return AppTab.search;
      case 3:
        return AppTab.account;
    }
    return AppTab.home;
  }
}

class BasePage extends StatefulWidget {
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final PageController _controller = PageController(initialPage: 0, keepPage: false);
  AppTab activeTab = AppTab.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        items: [
          CustomBottomNavigationBarItem(
            icon: CustomIcons.home,
            isSelected: activeTab == AppTab.home,
            onTap: () => _controller.jumpToPage(0),
          ),
          CustomBottomNavigationBarItem(
            icon: CustomIcons.analytics,
            isSelected: activeTab == AppTab.analytics,
            onTap: () => _controller.jumpToPage(1),
          ),
          CustomBottomNavigationBarItem(
            icon: CustomIcons.search,
            isSelected: activeTab == AppTab.search,
            onTap: () => _controller.jumpToPage(2),
          ),
          CustomBottomNavigationBarItem(
            icon: CustomIcons.account,
            isSelected: activeTab == AppTab.account,
            onTap: () => _controller.jumpToPage(3),
          ),
        ],
      ),
      body: PageView(
        controller: _controller,
        children: [
          HomePage(),
          AnalyticsPage(),
          SearchPage(),
          AccountPage(),
        ],
        onPageChanged: (index) {
          setState(() {
            activeTab = TabHelper.item(index);
          });
        },
      ),
    );
  }
}
