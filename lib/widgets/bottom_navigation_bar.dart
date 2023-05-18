import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';

import '../utils/colors.dart';
import '../utils/strings.dart';


class CustomizedBottomNavigationBar extends StatelessWidget {
  const CustomizedBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.gunMetal,
      unselectedItemColor: AppColors.whiteColor,
      selectedLabelStyle: TextStyle(
        fontSize: 10.sp,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 10.sp,
        color: AppColors.whiteColor.withOpacity(0.40),
        fontWeight: FontWeight.w500,
      ),
      currentIndex: 0,
      onTap: (_) {},
      type: BottomNavigationBarType.fixed,
      items: const [
         BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: AppColors.whiteColor,
          ),
          label: AppStrings.homeBNString,
        ),
        BottomNavigationBarItem(
          icon: Icon(LineIcons.compass),
          label: AppStrings.leaderBoardBNString,
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.timer),
          label: AppStrings.activityBNString,
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: AppStrings.bookmarksBNString,
        ),
         BottomNavigationBarItem(
          icon: Icon(LineIcons.userCircle),
          label: AppStrings.profileBNString,
        ),
      ],
    );
  }
}
