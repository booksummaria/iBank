import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibank/utils/colors.dart';
import 'package:ibank/components/LoginScreenHelper.dart';
import 'package:local_auth/local_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LocalAuthentication auth = LocalAuthentication();

  Future<void> _authenticate() async {
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to login',
        options: const AuthenticationOptions(stickyAuth: true),
      );

      if (didAuthenticate && mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } on PlatformException catch (e) {
      debugPrint("Authentication error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepBlue,
      appBar: AppBar(
        backgroundColor: AppColors.deepBlue,
        toolbarHeight: 40,

        title: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 10),
          child: const Text(
            "Sign in",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        centerTitle: false,
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.deepBlue,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Hello there, sign in to continue",
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 30),

                    Center(
                      child: SizedBox(
                        height: 140,
                        width: 160,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: const BoxDecoration(
                                color: AppColors.lightPurple,
                                shape: BoxShape.circle,
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.darkPurple,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: AppColors.white,
                                  width: 2,
                                ),
                              ),
                              child: const Icon(
                                Icons.lock_outline_rounded,
                                color: AppColors.white,
                                size: 40,
                              ),
                            ),

                            const Positioned(
                              top: 20,
                              right: 20,
                              child: CircleDot(
                                color: AppColors.dotPink,
                                size: 24,
                              ),
                            ),
                            const Positioned(
                              top: 10,
                              left: 90,
                              child: CircleDot(
                                color: AppColors.dotIndigo,
                                size: 10,
                              ),
                            ),
                            const Positioned(
                              top: 60,
                              left: 20,
                              child: CircleDot(
                                color: AppColors.dotTeal,
                                size: 10,
                              ),
                            ),
                            const Positioned(
                              bottom: 30,
                              left: 30,
                              child: CircleDot(
                                color: AppColors.dotAmber,
                                size: 20,
                              ),
                            ),
                            const Positioned(
                              bottom: 40,
                              right: 30,
                              child: CircleDot(
                                color: AppColors.dotBlue2,
                                size: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    const LoginTextField(hintText: "Phone Number"),
                    const SizedBox(height: 16),
                    const LoginTextField(hintText: "OTP", isSuffixIcon: true),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot your password ?",
                          style: TextStyle(
                            color: AppColors.deepBlue,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.deepBlue,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    Center(
                      child: GestureDetector(
                        onTap: _authenticate,
                        child: const Icon(
                          Icons.fingerprint,
                          size: 60,
                          color: AppColors.deepBlue,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    Center(
                      child: RichText(
                        text: const TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            color: AppColors.black54,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: "Sign Up",
                              style: TextStyle(
                                color: AppColors.deepBlue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
