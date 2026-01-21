import 'package:flutter/material.dart';
import 'package:ibank/utils/colors.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final bool isSuffixIcon;

  const LoginTextField({
    super.key,
    required this.hintText,
    this.isSuffixIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.grey300),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.grey500, fontSize: 15),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          suffixIcon: isSuffixIcon
              ? const Icon(Icons.keyboard_arrow_down, color: AppColors.grey)
              : null,
        ),
      ),
    );
  }
}

class CircleDot extends StatelessWidget {
  final Color color;
  final double size;
  const CircleDot({super.key, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
