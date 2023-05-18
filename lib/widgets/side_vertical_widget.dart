import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/assets.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';

class SideIcons extends StatelessWidget {
  const SideIcons({
    super.key,
    required this.avatarIcon,
  });
  final String avatarIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 30),
                if (avatarIcon.isNotEmpty) ...[
                  Image.network(
                    avatarIcon,
                    width: 45.sp,
                    height: 45.sp,
                  ),
                  const Spacer(),
                ],
                Image.asset(
                  Assets.like,
                  width: 45.sp,
                  height: 45.sp,
                ),
                CustomizedText.sfProCustomized(
                  '89',
                  fontWeight: FontWeight.w400,
                  size: 12.sp,
                  color: AppColors.whiteColor,
                ),
                const Spacer(),
                Image.asset(
                  Assets.comments,
                  width: 45.sp,
                  height: 45.sp,
                ),
                CustomizedText.sfProCustomized(
                  '2',
                  fontWeight: FontWeight.w400,
                  size: 12.sp,
                  color: AppColors.whiteColor,
                ),
                const Spacer(),
                Image.asset(
                  Assets.share,
                  width: 45.sp,
                  height: 45.sp,
                ),
                CustomizedText.sfProCustomized(
                  '18',
                  fontWeight: FontWeight.w400,
                  size: 12.sp,
                  color: AppColors.whiteColor,
                ),
                const Spacer(),
                Image.asset(
                  Assets.bookmark,
                  width: 45.sp,
                  height: 45.sp,
                ),
                CustomizedText.sfProCustomized(
                  '205',
                  fontWeight: FontWeight.w400,
                  size: 12.sp,
                  color: AppColors.whiteColor,
                ),
                const Spacer(),
                Image.asset(
                  Assets.flip,
                  width: 45.sp,
                  height: 45.sp,
                ),
                CustomizedText.sfProCustomized(
                  'Flip',
                  fontWeight: FontWeight.w400,
                  size: 12.sp,
                  color: AppColors.whiteColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
