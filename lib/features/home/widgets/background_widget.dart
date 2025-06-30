import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sport_app/core/constants/app_colors.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.green.withOpacity(0.7),
                      blurRadius: 80,
                      spreadRadius: 20,
                    ),
                  ],
                  gradient: const RadialGradient(
                    colors: [
                    AppColors.green,
                    AppColors.yellow,
                    ],
                    center: Alignment.center,
                    radius: 0.8,
                    stops: [0.1, 1.0],
                  ),
                ),
              );
  }
}