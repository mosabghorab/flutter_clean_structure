import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:new_streamline/src/app/presentation/widgets/app_button_widget.dart';
import 'package:new_streamline/src/core/assets/assets_constants.dart';
import 'package:new_streamline/src/core/extentions.dart';
import 'package:new_streamline/src/core/styles/text_styles_constants.dart';

class EmptyContentWidget extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onRefreshTapped;

  const EmptyContentWidget({
    super.key,
    required this.title,
    required this.description,
    required this.onRefreshTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(
          AssetsConstants.sampleAnimation,
          height: 150.h,
        ),
        5.verticalSpace,
        Text(
          title,
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
          title: 'Refresh',
          onTap: onRefreshTapped,
        ),
      ],
    );
  }
}
