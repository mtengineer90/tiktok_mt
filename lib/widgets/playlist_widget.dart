import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/assets.dart';
import '../utils/colors.dart';
import '../utils/customized_screen_utils.dart';
import '../utils/styles.dart';


class PlayListContainer extends StatelessWidget {
  const PlayListContainer({super.key, required this.playlist});
  final String playlist;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: CustomizedScreenUtils.screenWidth,
      padding: const EdgeInsets.all(10),
      color: AppColors.whiteColor.withOpacity(0.20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            Assets.play,
            height: 20.sp,
            width: 20.sp,
          ),
          const Spacer(),
          CustomizedText.sfProCustomized(
            "Playlist: $playlist",
            fontWeight: FontWeight.w600,
            size: 13.sp,
            color: AppColors.whiteColor,
          ),
          const Spacer(
            flex: 10,
          ),
          Icon(
            Icons.navigate_next,
            color: AppColors.whiteColor,
            size: 20.sp,
          )
        ],
      ),
    );
  }
}
