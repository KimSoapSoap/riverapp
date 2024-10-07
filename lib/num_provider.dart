import 'package:flutter_riverpod/flutter_riverpod.dart';

//창고 관리자(StateProvider)는 return 1;을 관리한다.

//창고 관리자
//ref 쪽은 생성자 내부의 익명 함수이다. 즉 파라미터에 함수를 받는다는 것이다.
final numProvider = StateProvider<int>((ref) {
  print("StateProvider 창고 생성됨");
  return 2;
});
