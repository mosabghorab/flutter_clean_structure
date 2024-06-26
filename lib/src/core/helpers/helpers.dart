import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_streamline/src/app/presentation/widgets/flash_message_widget.dart';
import 'package:new_streamline/src/app/presentation/widgets/loading_widget/loading_widget.dart';
import 'package:new_streamline/src/core/app_shared_data.dart';
import 'package:new_streamline/src/core/di/dependency_injection.dart';
import 'package:new_streamline/src/core/enums.dart';
import 'package:new_streamline/src/extra/shared_pref/shared_pref_manager.dart';

abstract class Helpers {
  // show message.
  static void showMessage({
    required String message,
    required MessageType messageType,
  }) {
    showFlash(
      context: AppSharedData.navigationKey!.currentContext!,
      duration: const Duration(seconds: 3),
      builder: (_, controller) {
        return FlashMessageWidget(
          flashController: controller,
          message: message,
          messageType: messageType,
        );
      },
    );
  }

  // shortcut for showing bottom sheet.
  static Future showBottomSheet({
    required Widget child,
    Color? backgroundColor,
    int radius = 8,
    bool isScrollControlled = true,
  }) async {
    return await showModalBottomSheet(
      context: AppSharedData.navigationKey!.currentContext!,
      builder: (_) => child,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(radius.r),
        ),
      ),
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
    );
  }

  // shortcut for showing a dialog.
  static Future showADialog({
    required Widget child,
    bool barrierDismissible = true,
  }) async {
    return await showDialog(
      context: AppSharedData.navigationKey!.currentContext!,
      barrierDismissible: barrierDismissible,
      builder: (_) => child,
    );
  }

  // shortcut for showing a loading.
  static void showLoading({
    String? title,
  }) {
    showADialog(
      child: LoadingWidget(
        title: title,
      ),
      barrierDismissible: false,
    );
  }

  // show confirmation.
  // static void showConfirmation({
  //   required final String title,
  //   required final String description,
  //   required final String confirmationText,
  //   required final VoidCallback onConfirm,
  //   final Color? confirmationTextColor,
  // }) {
  //   showADialog(
  //     child: ConfirmationWidget(
  //       title: title,
  //       description: description,
  //       confirmationText: confirmationText,
  //       onConfirm: onConfirm,
  //       confirmationTextColor: confirmationTextColor,
  //     ),
  //   );
  // }

  // get current font family.
  static String getFontFamily() =>
      DependencyInjection.get<SharedPrefManager>().getLocale() == 'en'
          ? 'montserrat'
          : 'montserrat';

  // convert hash color to hex color.
  static Color convertHashColorToHexColor({required String hashColor}) {
    return Color(int.parse('0xff${hashColor.substring(1)}'));
  }
}
