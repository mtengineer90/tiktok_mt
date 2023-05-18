import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../presentation/home_screen/notifier/home_screen_notif.dart';
import '../presentation/home_screen/state/home_screen_state.dart';
import 'enums.dart';

final privoderTimer = StateProvider<int>((ref) => 0);
final homeScreenFragmentProvider = StateProvider<EnumHomeFragment>((ref) => EnumHomeFragment.following);
final providerHome = StateNotifierProvider<HomeScreenNotif, HomeScreenState>((ref) => HomeScreenNotif(const HomeScreenInitial()));
