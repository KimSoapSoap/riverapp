import 'package:flutter_riverpod/flutter_riverpod.dart';


//창고 데이터 (책임 : 데이터)
class Model {
  int num = 1;
}

// 창고가 창고 데이터를 has하고 있다. mixin - with 사용.
// 참고로 mixin이 나오지 않았을 때는 창고 데이터를 그냥 class로 만들었고
// 창고가 Model을 extends 해서 사용했다.
// mixin-with로 사용할지 그냥 class-extends로 사용할지 컨벤션을 정한다.(최신 방식인 mixin 굳)
//창고 (책임 : 비지니스 로직 관리)
class NumStore extends Model {

  //증가 로직
  void increase() {
    super.num++;
  }

  //감소 로직
  void decrease() {
    super.num--;
  }

}

//창고 관리자(StateProvider)는 return 1;을 관리했지만 창고와 창고 데이터가 생겼기 때문에
//이제 창고 관리자는 제네릭에 NumStore를 넣고 창고를 관리한다.
//그냥 return 1로 했을 때는 처음 예시를 든 것이었고 이제는 그냥 int를 관리한다 해도
//전체적인 모양은 이렇게 창고 관리자가 창고를 관리하는 모양이 되어야 한다.

//창고 관리자
//ref 쪽은 생성자 내부의 익명 함수이다. 즉 파라미터에 함수를 받는다는 것이다.
final numProvider = StateProvider<NumStore>((ref) {
  print("StateProvider 창고 생성됨");
  return NumStore();
});
