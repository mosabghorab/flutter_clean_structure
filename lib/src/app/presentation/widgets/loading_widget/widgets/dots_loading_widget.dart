import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_streamline/src/core/styles/text_styles_constants.dart';

class DotsLoadingWidget extends StatefulWidget {
  final int dotsNumber;
  final Duration duration;

  const DotsLoadingWidget({
    super.key,
    this.dotsNumber = 3,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  State<DotsLoadingWidget> createState() => _DotsLoadingWidgetState();
}

class _DotsLoadingWidgetState extends State<DotsLoadingWidget> {
  // vars.
  late List<bool> dots = List.generate(widget.dotsNumber, (index) => false);
  int index = 0;
  late Timer timer;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  // start timer.
  void startTimer() {
    timer = Timer.periodic(widget.duration, (timer) {
      setState(() {
        if (index == dots.length) {
          index = 0;
          dots = List.generate(widget.dotsNumber, (index) => false);
        } else {
          dots[index] = true;
          index++;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        dots.length,
        (index) => Row(
          children: [
            Opacity(
              opacity: dots[index] ? 1 : 0,
              child: Text(
                '.',
                style: TextStylesConstants.font15DarkerGreyMedium,
              ),
            ),
            2.horizontalSpace,
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
