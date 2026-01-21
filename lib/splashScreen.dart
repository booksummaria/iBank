import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ibank/utils/colors.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    _initializeSplash();
  }

  Future<void> _initializeSplash() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/user_icon.png', height: 100),
                const SizedBox(height: 20),
                const Text(
                  'iBank',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                const Text(
                  'Worlds best banking service',
                  style: TextStyle(fontSize: 18, color: AppColors.white70),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                children: [
                  const Text(
                    'Powered by',
                    style: TextStyle(color: AppColors.white70),
                  ),
                  const SizedBox(height: 10),
                  Image.asset('assets/images/logo.png', height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
