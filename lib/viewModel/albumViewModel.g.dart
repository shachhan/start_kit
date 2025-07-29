// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albumViewModel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$albumRepositoryHash() => r'de92e6969699abb63bdb71d3a79928cc01597def';

/// See also [albumRepository].
@ProviderFor(albumRepository)
final albumRepositoryProvider = AutoDisposeProvider<AlbumRepository>.internal(
  albumRepository,
  name: r'albumRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$albumRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AlbumRepositoryRef = AutoDisposeProviderRef<AlbumRepository>;
String _$albumViewModelHash() => r'273621dbdaf75639af1ccbfafb65c619dd291635';

/// ViewModel은 UI와 Repository 사이에서 데이터를 처리하고 관리합니다.
/// ViewModel은 UI에 표시할 데이터를 가져오고, UI에서 사용자 입력을 처리하며, Repository에 데이터를 요청합니다.
///
/// Copied from [AlbumViewModel].
@ProviderFor(AlbumViewModel)
final albumViewModelProvider =
    AutoDisposeNotifierProvider<
      AlbumViewModel,
      AsyncValue<List<Album>>
    >.internal(
      AlbumViewModel.new,
      name: r'albumViewModelProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$albumViewModelHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AlbumViewModel = AutoDisposeNotifier<AsyncValue<List<Album>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
