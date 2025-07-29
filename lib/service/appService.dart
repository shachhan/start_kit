import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/appState.dart';
import '../util/logger.dart';

part 'appService.g.dart';

@riverpod
class AppService extends _$AppService {
  @override
  AppState build() {
    return AppState();
  }

  void onLoginSuccess() {
    state = state.copyWith(loginState: true);
  }

  void onLogout() {
    state = state.copyWith(loginState: false);
  }

  void onInitSuccess() {
    state = state.copyWith(initialized: true);
  }

  void onAutoLoginSuccess() {
    state = state.copyWith(initialized: true, loginState: true);
  }
}

// AppService의 상태 변화를 추적하기 위한 Listenable 클래스
class AppStateListenable extends ChangeNotifier {
  final Ref ref;

  AppStateListenable(this.ref) {
    ref.listen(appServiceProvider, (_, __) {
      notifyListeners();
    });
  }
}
