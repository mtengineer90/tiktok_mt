import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/enums.dart';
import '../widgets/timer_widget.dart';
import '../utils/colors.dart';
import '../utils/providers.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';

class TitleWidget extends ConsumerWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSection = ref.watch(homeScreenFragmentProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TimerWidget(),
          const Spacer(),
          InkWell(
            onTap: () {
              ref.read(homeScreenFragmentProvider.notifier).state =
                  EnumHomeFragment.following;
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _topText(AppStrings.followingTitle),
                const SizedBox(height: 5),
                if (currentSection == EnumHomeFragment.following) _dividerCustomized(),
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              ref.read(homeScreenFragmentProvider.notifier).state =
                  EnumHomeFragment.forYou;
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _topText(AppStrings.forYouTitle),
                const SizedBox(height: 5),
                if (currentSection == EnumHomeFragment.forYou) _dividerCustomized(),
              ],
            ),
          ),
          const Spacer(),
          Icon(
            Icons.search,
            size: 20.sp,
            color: AppColors.whiteColor,
          )
        ],
      ),
    );
  }

  Widget _topText(String text) {
    return CustomizedText.sfProCustomized(
      text,
      fontWeight: FontWeight.w700,
      size: 18.sp,
      color: AppColors.whiteColor,
    );
  }

  Widget _dividerCustomized() {
    return Container(
      width: 30,
      height: 4,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}
