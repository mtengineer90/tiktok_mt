import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_mt/utils/enums.dart';
import '../../../utils/customized_screen_utils.dart';

import '../../../utils/colors.dart';
import '../../../utils/providers.dart';
import '../../../widgets/bottom_navigation_bar.dart';
import '../../../widgets/title_widget.dart';
import 'home_screen_following_view.dart';
import 'home_screen_foryou_view.dart';

class HomeScreenPage extends ConsumerStatefulWidget {
  const HomeScreenPage({super.key});

  @override
  ConsumerState<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends ConsumerState<HomeScreenPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeSection = ref.watch(homeScreenFragmentProvider);
    return Scaffold(
      bottomNavigationBar: const CustomizedBottomNavigationBar(),
      body: Container(
        height: CustomizedScreenUtils.screenHeight,
        width: CustomizedScreenUtils.screenWidth,
        decoration: const BoxDecoration(
          gradient: AppColors.globalGradient,
        ),
        child: Column(
          children: [
            const SafeArea(
              child: TitleWidget(),
            ),
            Expanded(
              child: homeSection == EnumHomeFragment.following
                  ? const HomeFollowingView()
                  : const HomeForYou(),
            ),
          ],
        ),
      ),
    );
  }
}
