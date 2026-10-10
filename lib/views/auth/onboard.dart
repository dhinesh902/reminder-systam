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
          "https://img.magnific.com/free-vector/tiny-woman-pouring-clean-water-from-faucet-with-mountain-landscape_74855-11024.jpg?semt=ais_hybrid&w=740&q=80",
    },
    {
      "title": "Automated Maintenance",
      "subtitle":
          "Receive intelligent alerts for filter replacements and schedule expert servicing with a single tap.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYlE31sKIFk9ruqdd6fmXqpemq5kCcwV-fGrbWHUvKgg&s=10",
    },
    {
      "title": "Purity Guaranteed",
      "subtitle":
          "Ensuring the highest standards of water quality for your workspace and family. Health begins with pure water.",
      "image":
          "https://img.magnific.com/free-vector/event-calendar-notification-freelancer-project-deadline-date-appointment-reminder-calendar-megaphone-isolated-design-element-time-management-concept-illustration_335657-1693.jpg?semt=ais_hybrid&w=740&q=80",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          // Dynamic Top Image/Graphic Section
          Expanded(
            flex: 11,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: _onboardData.length,
              itemBuilder: (context, index) {
                return _buildCorporateGraphic(_onboardData[index]["image"]);
              },
            ),
          ),

          // Content Section
          Expanded(
            flex: 9,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 32.0,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryBlue.withValues(alpha: 0.08),
                    offset: const Offset(0, -10),
                    blurRadius: 30,
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Page Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _onboardData.length,
                      (index) => _buildDot(index),
                    ),
                  ),
                  const Spacer(),
                  // Text Content
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0.0, 0.1),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            ),
                          );
                        },
                    child: Column(
                      key: ValueKey<int>(_currentIndex),
                      children: [
                        // Stylish Gradient Heading
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [
                              AppColors.primaryBlue,
                              AppColors.lightBlue,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds),
                          child: Text(
                            _onboardData[_currentIndex]["title"],
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              color: AppColors.white,
                              // Required for ShaderMask
                              letterSpacing: -0.5,
                              height: 1.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _onboardData[_currentIndex]["subtitle"],
                          style: const TextStyle(
                            fontSize: 15,
                            color: AppColors.textSecondary,
                            height: 1.6,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),

                  // Bottom Actions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => context.go(AppRoutes.login),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.textSecondary,
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        child: const Text("Skip"),
                      ),

                      // Stylish Animated Next/Get Started Button
                      GestureDetector(
                        onTap: () {
                          if (_currentIndex == _onboardData.length - 1) {
                            context.go(AppRoutes.login);
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.fastOutSlowIn,
                            );
                          }
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: _currentIndex == _onboardData.length - 1
                              ? 160
                              : 64,
                          height: 64,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                AppColors.primaryBlue,
                                AppColors.lightBlue,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(32),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryBlue.withValues(
                                  alpha: 0.3,
                                ),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Center(
                            child: _currentIndex == _onboardData.length - 1
                                ? const Text(
                                    "Get Started",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                    ),
                                  )
                                : const Icon(
                                    Icons.arrow_forward_rounded,
                                    color: AppColors.white,
                                    size: 28,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCorporateGraphic(String imagePath) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.lightBlue.withValues(alpha: 0.01),
            AppColors.lightBlue.withValues(alpha: 0.01),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Elegant Radial Background Glows
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.splashGradient2.withValues(alpha: 0.15),
                    AppColors.white.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            left: -60,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primaryBlue.withValues(alpha: 0.1),
                    AppColors.white.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),

          // Concentric decorative rings for a premium tech feel
          Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primaryBlue.withValues(alpha: 0.05),
                width: 2,
              ),
            ),
          ),
          Container(
            width: 230,
            height: 230,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.lightBlue.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
          ),

          // Main Graphic Container with elastic pop & double shadow
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 1200),
            curve: Curves.elasticOut,
            builder: (context, value, child) {
              return Transform.scale(
                scale: 0.8 + (0.2 * value),
                child: Opacity(
                  opacity: value.clamp(0.0, 1.0),
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryBlue.withValues(alpha: 0.08),
                          blurRadius: 40,
                          offset: const Offset(0, 20),
                        ),
                        BoxShadow(
                          color: AppColors.lightBlue.withValues(alpha: 0.15),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.splashGradient1.withValues(alpha: 0.3),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          imagePath,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.water_drop_outlined,
                              size: 90,
                              color: AppColors.primaryBlue.withValues(
                                alpha: 0.4,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
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
        gradient: isActive
            ? const LinearGradient(
                colors: [AppColors.primaryBlue, AppColors.lightBlue],
              )
            : null,
        color: isActive ? null : AppColors.inputBorder,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
