import '../../../modals/following_modal.dart';
import '../../../modals/foryou_modal.dart';

abstract class HomeScreenState {
  const HomeScreenState();
}

class HomeScreenInitial extends HomeScreenState {
  const HomeScreenInitial();
}

class HomeScreenLoading extends HomeScreenState {
  const HomeScreenLoading();
}

class HomeScreenLoaded extends HomeScreenState {
  final FollowingModal? followingModal;
  final ForyouModal? foryouModal;

  const HomeScreenLoaded({this.followingModal, this.foryouModal});
}

class HomeScreenError extends HomeScreenState {
  final String message;

  const HomeScreenError(this.message);
}
