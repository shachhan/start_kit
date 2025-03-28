// State class to hold the app state
class AppState {
  final bool loginState;
  final bool initialized;

  const AppState({
    required this.loginState,
    required this.initialized,
  });

  // Initial state factory
  factory AppState.initial() => const AppState(
    loginState: false,
    initialized: false,
  );

  // CopyWith method for immutable state updates
  AppState copyWith({
    bool? loginState,
    bool? initialized,
  }) {
    return AppState(
      loginState: loginState ?? this.loginState,
      initialized: initialized ?? this.initialized,
    );
  }
}