import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../services/api_services.dart';
import '../../../utils/api_constants.dart';
import '../../../modals/answer_modal.dart';
import '../../../modals/following_modal.dart';
import '../../../modals/foryou_modal.dart';
import '../state/home_screen_state.dart';

class HomeScreenNotif extends StateNotifier<HomeScreenState> {
  HomeScreenNotif(super.state);

  Future<void> getFollowing() async {
    state = const HomeScreenLoading();
    try {
      state = const HomeScreenLoading();
      final Response response = await APIServices().get(APIUrls.following);
      final data = response.data;
      if (data != null) {
        state = HomeScreenLoaded(followingModal: FollowingModal.fromJson(data));
      } else {
        state = const HomeScreenError('No data found');
      }
    } catch (e) {
      state = HomeScreenError(e.toString());
    }
  }

  Future<void> getForYou() async {
    state = const HomeScreenLoading();
    try {
      state = const HomeScreenLoading();
      final Response response = await APIServices().get(APIUrls.forYou);
      final data = response.data;
      if (data != null) {
        final model = ForyouModal.fromJson(data);
        final correct = await getAnswer(model.id);
        model.correctAnswer = correct;
        state = HomeScreenLoaded(foryouModal: model);
      } else {
        state = const HomeScreenError('No data found');
      }
    } catch (e) {
      state = HomeScreenError(e.toString());
    }
  }

  Future<AnswerModal?> getAnswer(int? id) async {
    if (id == null) return null;
    try {
      final Response response =
      await APIServices().get(APIUrls.revealAnswerById(id));
      final data = response.data;
      final correct = AnswerModal.fromJson(data);
      return correct;
    } catch (e) {
      rethrow;
    }
  }
}
