import 'package:freezed_annotation/freezed_annotation.dart';

part 'appState.freezed.dart';
part 'appState.g.dart';

@freezed
abstract class AppState with _$AppState {
  factory AppState({
    @Default(false) bool loginState,
    @Default(false) bool initialized,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);
}
