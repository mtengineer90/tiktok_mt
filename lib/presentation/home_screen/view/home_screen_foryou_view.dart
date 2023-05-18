import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_mt/utils/customized_screen_utils.dart';

import '../../../modals/foryou_modal.dart';
import '../../../utils/colors.dart';
import '../../../utils/providers.dart';
import '../../../utils/styles.dart';
import '../../../widgets/playlist_widget.dart';
import '../../../widgets/side_vertical_widget.dart';
import '../state/home_screen_state.dart';

class HomeForYou extends ConsumerStatefulWidget {
  const HomeForYou({
    super.key,
  });

  @override
  ConsumerState<HomeForYou> createState() => _FollowingViewState();
}

class _FollowingViewState extends ConsumerState<HomeForYou> {
  final PageController _pageController =
  PageController(initialPage: 0, keepPage: true);
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(providerHome.notifier).getForYou();
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
              if (state.foryouModal == null) return Container();
              return Column(
                children: [
                  Expanded(
                    child: _QuizCard(
                      foryouModal: state.foryouModal!,
                    ),
                  ),
                  PlaylistWidget(
                    playlist: state.foryouModal!.playlist ?? "",
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

class _QuizCard extends StatefulWidget {
  _QuizCard({
    super.key,
    required this.foryouModal,
  });

  final ForyouModal foryouModal;

  @override
  State<_QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<_QuizCard> {
  String selectedId = "";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: CustomizedScreenUtils.screenHeight,
            width: CustomizedScreenUtils.screenWidth,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 5),
                  CustomizedText.sfProCustomized(
                    widget.foryouModal.question ?? "",
                    fontWeight: FontWeight.w400,
                    size: 21.sp,
                    color: AppColors.whiteColor,
                    height: 1.5,
                  ),
                  const Spacer(flex: 20),
                  ..._optionsList(widget.foryouModal.options ?? []),
                  const Spacer(flex: 2),
                  CustomizedText.sfProCustomized(
                    widget.foryouModal.user?.name ?? "",
                    fontWeight: FontWeight.w400,
                    size: 18.sp,
                    color: AppColors.whiteColor,
                  ),
                  const Spacer(flex: 1),
                  CustomizedText.sfProCustomized(
                    widget.foryouModal.description ?? "",
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
        VerticalWidget(
          avatarIcon: widget.foryouModal.user?.avatar ?? "",
        ),
      ],
    );
  }

  List<Widget> _optionsList(List<Options> options) {
    List<Widget> _options = [];
    final _correctOption = widget.foryouModal.correctAnswer?.correctOptions;
    widget.foryouModal.options?.forEach(
          (element) {
        Color color = AppColors.whiteColor.withOpacity(0.2);
        bool thisIsCorrect = false;
        bool thisIsWrong = false;
        if (selectedId.isNotEmpty && (_correctOption?.isNotEmpty ?? false)) {
          if (_correctOption?.map((e) => e.id).contains(element.id) ?? false) {
            thisIsCorrect = true;
            color = AppColors.illuminatingEmerald;
          }
          if (selectedId == element.id) {
            if (!(_correctOption?.map((e) => e.id).contains(selectedId) ??
                true)) {
              thisIsWrong = true;
              color = AppColors.errorOnDark;
            }
          }
        }
        _options.add(
          InkWell(
            onTap: () {
              setState(() {
                selectedId = element.id ?? "";
              });
            },
            child: Container(
              width: CustomizedScreenUtils.screenWidth * 0.7,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 20,
                    child: CustomizedText.sfProCustomized(
                      element.answer ?? "",
                      fontWeight: FontWeight.w400,
                      size: 17.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  const Spacer(),
                  if (thisIsCorrect) ...[
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        Icons.check,
                        color: AppColors.illuminatingEmerald,
                        size: 14.sp,
                      ),
                    ),
                  ] else if (thisIsWrong) ...[
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        Icons.close,
                        color: AppColors.illuminatingEmerald,
                        size: 14.sp,
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ),
        );
        _options.add(const Spacer());
      },
    );
    return _options;
  }
}
