import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/album.dart';
import '../repository/albumRepository.dart';
import '../util/logger.dart';

part 'albumViewModel.g.dart';

@riverpod
AlbumRepository albumRepository(Ref ref) {
  return AlbumRepository();
}

/// ViewModel은 UI와 Repository 사이에서 데이터를 처리하고 관리합니다.
/// ViewModel은 UI에 표시할 데이터를 가져오고, UI에서 사용자 입력을 처리하며, Repository에 데이터를 요청합니다.
@riverpod
class AlbumViewModel extends _$AlbumViewModel {
  @override
  AsyncValue<List<Album>> build() {
    getAlbumList();
    return AsyncLoading();
  }

  Future<void> getAlbumList() async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final albums = await ref.read(albumRepositoryProvider).albumListRequest();
      return albums;
    });
  }
}