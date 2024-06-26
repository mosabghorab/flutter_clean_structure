import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_streamline/src/app/presentation/screens/splash_screen/splash_screen_controller.dart';
import 'package:new_streamline/src/core/assets/assets_constants.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SplashScreenController>();
    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    return Scaffold(
      body: Center(
        child: Image.asset(
          AssetsConstants.sampleImage,
          width: 200.w,
        ),
      ),
    );
  }
}
