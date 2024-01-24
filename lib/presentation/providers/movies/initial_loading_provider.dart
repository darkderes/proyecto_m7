import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final step1 = ref.watch(nowPlayingMoviesProviders).isEmpty;
    final step2 = ref.watch(popularMoviesProviders).isEmpty;
    final step3 = ref.watch(upcomingMoviesProviders).isEmpty;
    final tstep4 = ref.watch(topRatedMoviesProviders).isEmpty;
    if (step1 || step2 || step3 || tstep4) {
      return true;
    }
  return false;
});
