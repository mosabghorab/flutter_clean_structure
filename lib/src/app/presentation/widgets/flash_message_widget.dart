import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_streamline/src/core/enums.dart';
import 'package:new_streamline/src/core/styles/colors_constant.dart';
import 'package:new_streamline/src/core/styles/text_styles_constants.dart';

class FlashMessageWidget extends StatelessWidget {
  final FlashController flashController;
  final MessageType messageType;
  final String message;

  const FlashMessageWidget({
    super.key,
    required this.flashController,
    required this.messageType,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.center,
      child: SizedBox(
        width: 500.w,
        child: Flash(
          controller: flashController,
          forwardAnimationCurve: Curves.bounceInOut,
          reverseAnimationCurve: Curves.easeIn,
          child: FlashBar(
            position: FlashPosition.top,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
            backgroundColor: messageType == MessageType.success
                ? ColorsConstants.green
                : ColorsConstants.red,
            content: Text(
              message,
              style: TextStylesConstants.font17WhiteMedium,
            ),
            icon: Icon(
              messageType == MessageType.success ? Icons.check : Icons.error,
              color: ColorsConstants.white,
              size: 30.h,
            ),
            primaryAction: TextButton(
              onPressed: () => flashController.dismiss(),
              child: Text(
                'DISMISS',
                style: TextStylesConstants.font17WhiteBold,
              ),
            ),
            controller: flashController,
          ),
        ),
      ),
    );
  }
}
