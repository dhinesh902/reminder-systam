import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder/utils/constants/colors.dart';
import 'package:reminder/routes/app_routes.dart';
import 'package:reminder/utils/constants/images.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Setup premium staggered animation
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0.0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.2, 1.0, curve: Curves.easeOutCubic),
          ),
        );

    _animationController.forward();

    // Navigate to onboard
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go(AppRoutes.onboard);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.splash),
            fit: BoxFit.cover,
            // Add a light overlay so the gradient text pops perfectly
            colorFilter: ColorFilter.mode(
              AppColors.white.withValues(alpha: 0.55),
              BlendMode.lighten,
            ),
          ),
        ),
        child: SafeArea(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(position: _slideAnimation, child: child),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                // Elevated Logo Graphic
                Container(
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryBlue.withValues(alpha: 0.15),
                        blurRadius: 40,
                        offset: const Offset(0, 15),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    AppImages.splash,
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.water_drop_rounded,
                        size: 80,
                        color: AppColors.primaryBlue,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 48),

                // Stylish Gradient Heading
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [AppColors.primaryBlue, AppColors.lightBlue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: const Text(
                    'AquaPure',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      color: AppColors.white,
                      letterSpacing: -1.0,
                      height: 1.0,
                    ),
                  ),
                ),

                const SizedBox(height: 12),
                const Text(
                  'RO WATER PURIFIER',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 10,
                    letterSpacing: 5.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                // Minimalist Divider
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.lightBlue,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),

                const Text(
                  'PURE WATER. HEALTHY LIFE.',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 12,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),

                // Modern Loading Indicator
                SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.primaryBlue,
                    ),
                    strokeWidth: 3,
                    backgroundColor: AppColors.primaryBlue.withValues(
                      alpha: 0.1,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Initializing system...',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
