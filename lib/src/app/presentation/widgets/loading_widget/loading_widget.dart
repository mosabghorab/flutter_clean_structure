import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:new_streamline/src/core/styles/colors_constant.dart';
import 'package:new_streamline/src/core/styles/text_styles_constants.dart';
import 'package:new_streamline/src/app/presentation/widgets/loading_widget/widgets/dots_loading_widget.dart';

class LoadingWidget extends StatelessWidget {
  final String? title;

  const LoadingWidget({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          padding: EdgeInsets.symmetric(vertical: 14.h),
          decoration: BoxDecoration(
            color: ColorsConstants.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SpinKitCircle(
                    color: Theme.of(context).primaryColor,
                    size: 30.r,
                  ),
                  10.horizontalSpace,
                  Text(
                    title ?? 'Please Wait',
                    style: TextStylesConstants.font15DarkerGreyMedium,
                  ),
                  1.horizontalSpace,
                  const DotsLoadingWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
