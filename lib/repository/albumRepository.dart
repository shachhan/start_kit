import '../model/album.dart';
import '../service/dioService.dart';

/// 데이터 저장과 접근에 대한 로직을 추상화합니다.
/// 데이터를 로컬 저장소나 원격 서버에서 가져오거나 저장하는 등의 작업을 수행합니다.
/// 데이터를 조회하고 클라이언트가 사용할 수 있도록 저장할 때 일관된 접근 방식을 정하는 역할을 합니다.
/// 작은 규모에서는 Service가 따로 분리되지 않고 Repository에 속할 수도 있습니다.
/// Repository는 데이터를 가져오는 방법을 알고 있으며, 데이터를 가져오는 방법이 변경되어도 클라이언트에 영향을 주지 않습니다.
/// model에 대한 여러 개의 request를 처리할 수 있습니다.
class AlbumRepository {
  final _dioService = DioService().to();
  /// Fetch data from server
  Future<List<Album>> albumListRequest() async {
    try {
      final response = await _dioService.get('https://jsonplaceholder.typicode.com/albums');

      if (response.statusCode == 200) {
        // logger.i(response.data);
        final List<dynamic> data = response.data;
        return data.map((json) => Album.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}