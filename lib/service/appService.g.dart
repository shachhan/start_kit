// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppService)
const appServiceProvider = AppServiceProvider._();

final class AppServiceProvider extends $NotifierProvider<AppService, AppState> {
  const AppServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appServiceHash();

  @$internal
  @override
  AppService create() => AppService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppState>(value),
    );
  }
}

String _$appServiceHash() => r'b40cec4bbd6ef579b9e93a71ffda10d005dd1616';

abstract class _$AppService extends $Notifier<AppState> {
  AppState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AppState, AppState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppState, AppState>,
              AppState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
