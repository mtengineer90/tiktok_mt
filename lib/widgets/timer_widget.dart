import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
import '../utils/providers.dart';
import '../utils/styles.dart';

class TimerWidget extends ConsumerWidget {
  const TimerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(privoderTimer);
    return Row(
      children: [
        Icon(
          Icons.timer,
          color: AppColors.whiteColor.withOpacity(0.60),
          size: 20.sp,
        ),
        const SizedBox(width: 4),
        CustomizedText.sfProCustomized(
          "$timer min",
          fontWeight: FontWeight.w400,
          size: 16.sp,
          color: AppColors.whiteColor.withOpacity(0.60),
        )
      ],
    );
  }
}
