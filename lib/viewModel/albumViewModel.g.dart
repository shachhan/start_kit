// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albumViewModel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(albumRepository)
const albumRepositoryProvider = AlbumRepositoryProvider._();

final class AlbumRepositoryProvider
    extends
        $FunctionalProvider<AlbumRepository, AlbumRepository, AlbumRepository>
    with $Provider<AlbumRepository> {
  const AlbumRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'albumRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$albumRepositoryHash();

  @$internal
  @override
  $ProviderElement<AlbumRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AlbumRepository create(Ref ref) {
    return albumRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AlbumRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AlbumRepository>(value),
    );
  }
}

String _$albumRepositoryHash() => r'de92e6969699abb63bdb71d3a79928cc01597def';

/// ViewModel은 UI와 Repository 사이에서 데이터를 처리하고 관리합니다.
/// ViewModel은 UI에 표시할 데이터를 가져오고, UI에서 사용자 입력을 처리하며, Repository에 데이터를 요청합니다.

@ProviderFor(AlbumViewModel)
const albumViewModelProvider = AlbumViewModelProvider._();

/// ViewModel은 UI와 Repository 사이에서 데이터를 처리하고 관리합니다.
/// ViewModel은 UI에 표시할 데이터를 가져오고, UI에서 사용자 입력을 처리하며, Repository에 데이터를 요청합니다.
final class AlbumViewModelProvider
    extends $NotifierProvider<AlbumViewModel, AsyncValue<List<Album>>> {
  /// ViewModel은 UI와 Repository 사이에서 데이터를 처리하고 관리합니다.
  /// ViewModel은 UI에 표시할 데이터를 가져오고, UI에서 사용자 입력을 처리하며, Repository에 데이터를 요청합니다.
  const AlbumViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'albumViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$albumViewModelHash();

  @$internal
  @override
  AlbumViewModel create() => AlbumViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Album>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<Album>>>(value),
    );
  }
}

String _$albumViewModelHash() => r'273621dbdaf75639af1ccbfafb65c619dd291635';

/// ViewModel은 UI와 Repository 사이에서 데이터를 처리하고 관리합니다.
/// ViewModel은 UI에 표시할 데이터를 가져오고, UI에서 사용자 입력을 처리하며, Repository에 데이터를 요청합니다.

abstract class _$AlbumViewModel extends $Notifier<AsyncValue<List<Album>>> {
  AsyncValue<List<Album>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<Album>>, AsyncValue<List<Album>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Album>>, AsyncValue<List<Album>>>,
              AsyncValue<List<Album>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
