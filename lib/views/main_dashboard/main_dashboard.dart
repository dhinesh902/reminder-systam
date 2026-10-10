import 'package:flutter/material.dart';
import 'package:reminder/utils/constants/colors.dart';
import 'package:reminder/views/main_dashboard/dashboard/dashboard.dart';
import 'package:reminder/views/main_dashboard/customers/customers.dart';
import 'package:reminder/views/main_dashboard/followups/follwups.dart';
import 'package:reminder/views/main_dashboard/services/services.dart';
import 'package:reminder/views/main_dashboard/profile/profile.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => MainDashboardState();
}

class MainDashboardState extends State<MainDashboard> {
  final _pageController = PageController(initialPage: 0);
  final _notchBottomBarController = NotchBottomBarController(index: 0);

  void changeTab(int index) {
    _pageController.jumpToPage(index);
    _notchBottomBarController.jumpTo(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _notchBottomBarController.dispose();
    super.dispose();
  }

  final List<Widget> _screens = [
    const Dashboard(),
    const Customers(),
    const Followups(),
    const Services(),
    const Profile(), // Maps to "More"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FC),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      extendBody: true,
      bottomNavigationBar: (_screens.length <= 5)
          ? AnimatedNotchBottomBar(
              notchBottomBarController: _notchBottomBarController,
              color: AppColors.white,
              showLabel: true,
              shadowElevation: 5,
              kBottomRadius: 28.0,
              notchColor: AppColors.primaryBlue,
              removeMargins: false,
              bottomBarWidth: 500,
              durationInMilliSeconds: 300,
              kIconSize: 20.0,
              itemLabelStyle: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
              bottomBarItems: [
                BottomBarItem(
                  inActiveItem: Image.network(
                    "https://cdn-icons-png.flaticon.com/128/1946/1946488.png",
                    color: AppColors.textPrimary,
                  ),
                  activeItem: Image.network(
                    'https://cdn-icons-png.flaticon.com/128/1946/1946436.png',
                    color: AppColors.white,
                  ),
                  itemLabel: 'Home',
                ),
                BottomBarItem(
                  inActiveItem: Image.network(
                    "https://cdn-icons-png.flaticon.com/128/10104/10104044.png",
                    color: AppColors.textPrimary,
                  ),
                  activeItem: Image.network(
                    "https://cdn-icons-png.flaticon.com/128/3394/3394785.png",
                    color: AppColors.white,
                  ),
                  itemLabel: 'Customers',
                ),
                BottomBarItem(
                  inActiveItem: Image.network(
                    "https://cdn-icons-png.flaticon.com/128/12887/12887924.png",
                    color: AppColors.textPrimary,
                  ),
                  activeItem: Image.network(
                    "https://cdn-icons-png.flaticon.com/128/12887/12887972.png",
                    color: AppColors.white,
                  ),
                  itemLabel: 'Follow Up',
                ),
                BottomBarItem(
                  inActiveItem: Image.network(
                    "https://cdn-icons-png.flaticon.com/128/2040/2040504.png",
                    color: AppColors.textPrimary,
                  ),
                  activeItem: Image.network(
                    "https://cdn-icons-png.flaticon.com/128/3524/3524659.png",
                    color: AppColors.white,
                  ),
                  itemLabel: 'Service',
                ),
                BottomBarItem(
                  inActiveItem: Image.network(
                    "https://cdn-icons-png.flaticon.com/128/9091/9091427.png",
                    color: AppColors.textPrimary,
                  ),
                  activeItem: Image.network(
                    "https://cdn-icons-png.flaticon.com/128/9091/9091427.png",
                    color: AppColors.white,
                  ),
                  itemLabel: 'More',
                ),
              ],
              onTap: (index) {
                _pageController.jumpToPage(index);
              },
            )
          : const SizedBox.shrink(),
    );
  }
}
