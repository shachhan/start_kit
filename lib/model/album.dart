
/// 앱에서 사용되는 데이터와 비즈니스 로직을 처리하는 클래스입니다.
/// - 네트워크 요청, 데이터베이스 관리 등을 담당
/// - 각 데이터를 Dart 객체로 변환하여 ViewModel에 전달
/// - 데이터를 인스턴스화하고 나면 해당 데이터를 Flutter 내부에서 쉽게 사용할 수 있음
/// - 쉽게 말하면 Model은 ViewModel에 데이터를 전달해주기 위해 데이터를 가져오고 Dart의 객체로 만들어주는 역할. 데이터 자체와 관련된 로직만을 담당하는 것
/// - 따라서 모델은 View 및 ViewModel과 완전히 독립적이어야 하며 데이터 자체와 관련된 로직만 포함해야 함.
///
/// - Model은 데이터를 표현하고 캡슐화하는 Model, 데이터 액세스를 추상화하고 관리하여 데이터와의 상호 작용을 담당하는 Repository, 비지니스 로직과 외부 리소스와의 통신을 담당하는 Service로 나뉩니다. Model은 서비스의 규모에 따라 Service와 Repository를 한 번에 관리하기도 합니다.
class Album {
  int? userId;
  int? id;
  String? title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}