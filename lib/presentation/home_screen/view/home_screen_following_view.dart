import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_mt/utils/customized_screen_utils.dart';

import '../../../modals/following_modal.dart';
import '../../../utils/colors.dart';
import '../../../utils/providers.dart';
import '../../../utils/strings.dart';
import '../../../utils/styles.dart';
import '../../../widgets/playlist_widget.dart';
import '../../../widgets/side_vertical_widget.dart';
import '../state/home_screen_state.dart';

class HomeFollowingView extends ConsumerStatefulWidget {
  const HomeFollowingView({
    super.key,
  });

  @override
  ConsumerState<HomeFollowingView> createState() => _FollowingViewState();
}

class _FollowingViewState extends ConsumerState<HomeFollowingView> {
  final PageController _pageController =
  PageController(initialPage: 0, keepPage: true);
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(providerHome.notifier).getFollowing();
      _pageController.addListener(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(providerHome);
        if (state is HomeScreenLoaded) {
          return PageView.builder(
            scrollDirection: Axis.vertical,
            controller: _pageController,
            itemCount: 10,
            itemBuilder: (context, index) {
              if (state.followingModal == null) return Container();
              return Column(
                children: [
                  Expanded(
                    child: _CardWidgetCustom(
                      followingModal: state.followingModal!,
                    ),
                  ),
                  PlaylistWidget(
                    playlist: state.followingModal!.playlist ?? "",
                  ),
                ],
              );
            },
          );
        } else if (state is HomeScreenLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.whiteColor,
            ),
          );
        } else if (state is HomeScreenError) {
          return CustomizedText.sfProCustomized(state.message,
              color: AppColors.whiteColor, fontWeight: FontWeight.w700, size: 12.sp);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class _CardWidgetCustom extends StatefulWidget {
  _CardWidgetCustom({
    super.key,
    required this.followingModal,
  });

  final FollowingModal followingModal;

  @override
  State<_CardWidgetCustom> createState() => _CardWidgetCustomState();
}

class _CardWidgetCustomState extends State<_CardWidgetCustom> {
  bool showAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                showAnswer = !showAnswer;
              });
            },
            child: Container(
              height: CustomizedScreenUtils.screenHeight,
              width: CustomizedScreenUtils.screenWidth,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: !showAnswer
                  ? Center(
                child: _cardWidgetCustomFront(),
              )
                  : Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _cardWidgetCustomFront(),
                    const Spacer(flex: 2),
                    Container(
                      width: CustomizedScreenUtils.screenWidth * 0.80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.whiteColor.withOpacity(0.20),
                          width: 1,
                        ),
                      ),
                    ),
                    const Spacer(flex: 1),
                    CustomizedText.sfProCustomized(
                      AppStrings.answer,
                      fontWeight: FontWeight.w800,
                      size: 13.sp,
                      color: AppColors.illuminatingEmerald,
                    ),
                    const Spacer(flex: 1),
                    CustomizedText.sfProCustomized(
                      widget.followingModal.flashcardBack ?? "",
                      fontWeight: FontWeight.w400,
                      size: 21.sp,
                      color: AppColors.whiteColor.withOpacity(0.70),
                    ),
                    const Spacer(flex: 3),
                    CustomizedText.sfProCustomized(
                      AppStrings.stringHowWellDid,
                      fontWeight: FontWeight.w400,
                      size: 15.sp,
                      color: AppColors.whiteColor.withOpacity(0.60),
                    ),
                    const Spacer(flex: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _howWellRating("1", AppColors.princetonOrange),
                        _howWellRating("2", AppColors.mellowApricot),
                        _howWellRating("3", AppColors.mustard),
                        _howWellRating("4", AppColors.colorFourthOption),
                        _howWellRating("5", AppColors.illuminatingEmerald),
                      ],
                    ),
                    const Spacer(flex: 2),
                    CustomizedText.sfProCustomized(
                      widget.followingModal.user?.name ?? "",
                      fontWeight: FontWeight.w400,
                      size: 18.sp,
                      color: AppColors.whiteColor,
                    ),
                    const Spacer(flex: 1),
                    CustomizedText.sfProCustomized(
                      widget.followingModal.description ?? "",
                      fontWeight: FontWeight.w400,
                      size: 15.sp,
                      color: AppColors.whiteColor,
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
              ),
            ),
          ),
        ),
        VerticalWidget(
          avatarIcon: widget.followingModal.user?.avatar ?? "",
        ),
      ],
    );
  }

  Container _howWellRating(String rating, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: CustomizedText.sfProCustomized(
        rating,
        fontWeight: FontWeight.w600,
        size: 17.sp,
        color: AppColors.whiteColor,
      ),
    );
  }

  Widget _cardWidgetCustomFront() {
    return CustomizedText.sfProCustomized(
      widget.followingModal.flashcardFront ?? "",
      fontWeight: FontWeight.w400,
      size: 21.sp,
      color: AppColors.whiteColor,
      height: 1.5,
    );
  }
}
