import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_streamline/src/core/styles/text_styles_constants.dart';

class AppButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String? icon;
  final Color? textColor;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final bool isBordered;
  final double? width;

  const AppButtonWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.icon,
    this.textColor,
    this.backgroundColor,
    this.padding,
    this.isBordered = false,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4.r),
      child: Container(
        width: width ?? double.infinity,
        padding: padding ??
            EdgeInsets.symmetric(
              vertical: 8.h,
            ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          border: isBordered
              ? Border.all(
                  color: backgroundColor ?? Theme.of(context).primaryColor)
              : null,
          color: isBordered
              ? null
              : backgroundColor ?? Theme.of(context).primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              SvgPicture.asset(icon!),
              10.horizontalSpace,
            ],
            Text(
              title,
              style: TextStylesConstants.font15WhiteMedium.copyWith(
                  color: isBordered ? Theme.of(context).primaryColor : null),
            ),
          ],
        ),
      ),
    );
  }
}
