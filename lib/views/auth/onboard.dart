import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder/routes/app_routes.dart';
import 'package:reminder/utils/constants/colors.dart';
import 'package:reminder/utils/constants/images.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _onboardData = [
    {
      "title": "Smart Purifier Control",
      "subtitle":
          "Seamlessly monitor your RO system's health, TDS levels, and water flow directly from your corporate dashboard.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDMCO4w0xfbv92P9-H1xN7U9EZs2brareUWyzMlg4I8Q&s=10",
    },
    {
      "title": "Automated Maintenance",
      "subtitle":
          "Receive intelligent alerts for filter replacements and schedule expert servicing with a single tap.",
      "image":
          "https://roserviceman.com/wp-content/uploads/2024/03/Ro-Repair-1.jpg",
    },
    {
      "title": "Purity Guaranteed",
      "subtitle":
          "Ensuring the highest standards of water quality for your workspace and family. Health begins with pure water.",
      "image":
          "https://livpure.com/cdn/shop/articles/family-spending-time-together-outside_23-2148659464_683a981c-1051-4676-8502-7cb9a7020969-793391.jpg?v=1726726266",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          // Fixed Background Image
          Image.asset(
            AppImages.onboard,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Container(color: AppColors.primaryBlue);
            },
          ),
          // Dark gradient overlay for text readability
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.transparent,
                  AppColors.primaryBlue.withValues(alpha: 0.7),
                  AppColors.primaryBlue.withValues(alpha: 0.95),
                ],
                stops: const [0.3, 0.7, 1.0],
              ),
            ),
          ),

          // Foreground Content
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Bar with Skip Button
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => context.go(AppRoutes.login),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: AppColors.white.withValues(alpha: 0.3),
                                ),
                              ),
                              child: const Text(
                                "Skip",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // PageView for Graphic Vectors
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemCount: _onboardData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Graphic Vector Image
                            TweenAnimationBuilder<double>(
                              tween: Tween<double>(begin: 0.8, end: 1.0),
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.easeOutBack,
                              builder: (context, value, child) {
                                return Transform.scale(
                                  scale: value,
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.white.withValues(
                                        alpha: 0.1,
                                      ),
                                      border: Border.all(
                                        color: AppColors.white.withValues(
                                          alpha: 0.2,
                                        ),
                                        width: 2,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.primaryBlue
                                              .withValues(alpha: 0.3),
                                          blurRadius: 30,
                                          spreadRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: ClipOval(
                                      child: Image.network(
                                        _onboardData[index]["image"],
                                        width: 220,
                                        height: 220,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                              return Container(
                                                width: 220,
                                                height: 220,
                                                color: AppColors.white
                                                    .withValues(alpha: 0.2),
                                                child: const Icon(
                                                  Icons.water_drop_rounded,
                                                  size: 80,
                                                  color: AppColors.white,
                                                ),
                                              );
                                            },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // Bottom Glassmorphism Card
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(36),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: AppColors.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(36),
                          border: Border.all(
                            color: AppColors.white.withValues(alpha: 0.2),
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Text Content (AnimatedSwitcher)
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: SlideTransition(
                                        position: Tween<Offset>(
                                          begin: const Offset(0.0, 0.2),
                                          end: Offset.zero,
                                        ).animate(animation),
                                        child: child,
                                      ),
                                    );
                                  },
                              child: Column(
                                key: ValueKey<int>(_currentIndex),
                                children: [
                                  Text(
                                    _onboardData[_currentIndex]["title"],
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.white,
                                      letterSpacing: 0.5,
                                      height: 1.2,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    _onboardData[_currentIndex]["subtitle"],
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.white.withValues(
                                        alpha: 0.85,
                                      ),
                                      height: 1.6,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40),

                            // Indicators and Action Button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Page Indicators
                                Row(
                                  children: List.generate(
                                    _onboardData.length,
                                    (index) => _buildDot(index),
                                  ),
                                ),

                                // Next / Get Started Button
                                GestureDetector(
                                  onTap: () {
                                    if (_currentIndex ==
                                        _onboardData.length - 1) {
                                      context.go(AppRoutes.login);
                                    } else {
                                      _pageController.nextPage(
                                        duration: const Duration(
                                          milliseconds: 600,
                                        ),
                                        curve: Curves.fastOutSlowIn,
                                      );
                                    }
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          _currentIndex ==
                                              _onboardData.length - 1
                                          ? 24
                                          : 16,
                                      vertical: 16,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(32),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.white.withValues(
                                            alpha: 0.2,
                                          ),
                                          blurRadius: 15,
                                          offset: const Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (_currentIndex ==
                                            _onboardData.length - 1)
                                          const Padding(
                                            padding: EdgeInsets.only(
                                              right: 8.0,
                                            ),
                                            child: Text(
                                              "Get Started",
                                              style: TextStyle(
                                                color: AppColors.primaryBlue,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        const Icon(
                                          Icons.arrow_forward_rounded,
                                          color: AppColors.primaryBlue,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    bool isActive = _currentIndex == index;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutQuint,
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: isActive ? 32 : 8,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.white
            : AppColors.white.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
