import 'package:flutter/material.dart';
import 'package:reminder/utils/constants/colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                  children: [
                    TextSpan(
                      text: 'Aqua',
                      style: TextStyle(color: AppColors.primaryBlue),
                    ),
                    TextSpan(
                      text: 'Puré',
                      style: TextStyle(color: AppColors.lightBlue),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'RO WATER PURIFIER',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 10,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 50),
              // Headings
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlue,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Sign in to access your purifier\nand water quality details.',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.textSecondary,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 40),
              // Email/Phone Field
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Mobile Number / Email',
                  prefixIcon: Icon(Icons.phone_android, size: 20),
                ),
              ),
              const SizedBox(height: 16),
              // Password Field
              TextFormField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline, size: 20),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: AppColors.primaryBlue,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Login Button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Login'),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // OR Divider
              Row(
                children: const [
                  Expanded(child: Divider(color: AppColors.inputBorder)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'OR',
                      style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
                    ),
                  ),
                  Expanded(child: Divider(color: AppColors.inputBorder)),
                ],
              ),
              const SizedBox(height: 32),
              // OTP Login Button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.lightBlue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.mail_outline, color: AppColors.primaryBlue, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Login with OTP',
                        style: TextStyle(
                          color: AppColors.primaryBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Create Account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Trust Badge
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.trustBadgeBg,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.verified_user, color: AppColors.lightBlue, size: 24),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Your data is safe with us',
                            style: TextStyle(
                              color: AppColors.primaryBlue,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'We value your privacy and security',
                            style: TextStyle(
                              color: AppColors.lightBlue,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
