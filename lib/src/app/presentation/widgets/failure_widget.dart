import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:new_streamline/src/app/presentation/widgets/app_button_widget.dart';
import 'package:new_streamline/src/core/assets/assets_constants.dart';
import 'package:new_streamline/src/core/constants.dart';
import 'package:new_streamline/src/core/extentions.dart';
import 'package:new_streamline/src/core/styles/colors_constant.dart';
import 'package:new_streamline/src/core/styles/text_styles_constants.dart';

class FailureWidget extends StatelessWidget {
  final String description;
  final VoidCallback onTryAgainTapped;

  const FailureWidget({
    super.key,
    required this.description,
    required this.onTryAgainTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(
          AssetsConstants.sampleAnimation,
          height: 120.h,
          repeat: false,
        ),
        Text(
          Constants.defaultErrorMessage,
          style: TextStylesConstants.font15Bold.copyWith(
            color: 'darkerGrey_white'.th,
          ),
        ),
        5.verticalSpace,
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStylesConstants.font13Medium.copyWith(
            color: 'darkerGrey_white'.th,
          ),
        ),
        10.verticalSpace,
        AppButtonWidget(
          width: 150.w,
          title: 'Try Again',
          backgroundColor: ColorsConstants.red,
          onTap: onTryAgainTapped,
        ),
      ],
    );
  }
}
