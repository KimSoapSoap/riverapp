import 'package:flutter_riverpod/flutter_riverpod.dart';

//stateNotifierProvider는 그냥 stateProvider과 다르게
//상태를 전달해야 한다.


// 창고 데이터 (책임 : 데이터)
class BunModel {
  int bun = 1;
  BunModel(this.bun);
}

//창고 (책임 : 비지니스 로직관리)
//stateProvider과는 다르게 창고 데이터를 바로 extends 하는 것이 아니고
//StateNotifier의 <> 제네릭에 창고 데이터를 넣어 준다.
class BunStore extends StateNotifier<BunModel> {
  //생성자에서 상태를 넘겨준다.
  BunStore(super.state);

  void increase() {
    //상태가 모델이므로 모델을 받아 와서 변경
    BunModel model = super.state;

    //그냥 값만 바꾸기 때문에 변경감지가 안 된다. 이를 state에 갱신시켜줘야 한다.
    model.bun++;

    //창고의 state를 갱신시켜줬다. 이렇게 해도 화면이 바뀌지 않는다.
    //state는 바꼈지만 바뀐 상태가 아닌 기존 상태를 전달하고 있기 때문?
    //아니면 state는 바꼈지만 바뀐 상태를 그대로 전달하기 때문에 이전 상태와 비교가 되지 않아
    //바꼈는지 감지를 하지 못 한다. 그렇기 때문에 이전 상태는 놔두고 바뀐 상태를 가지고
    //새로운 객체를 만들어서 전달하면 기존 상태와 새로운 상태가 비교가 가능하므로 변경 감지가 가능하다.
    // Flutter에서 변경 감지를 위해서는 새로운 객체를 전달해야 한다는 원리에 기반한다.
    //super.state = model;

    //BunModel(this.bun);  BunModel의 생성자를 추가해주고 생성자에 변경된 상태를 전달한다.
    //즉 BunModel의 현재 값을 이용해서 깊은 복사를 하고 새로운 객체를 만들어서 전달한다.
    super.state = BunModel(model.bun);
  }

  void decrease() {
    BunModel model = super.state;
    model.bun--;
    super.state = BunModel(model.bun);
  }
}

//창고 관리자 (책임 : 창고 관리)
final bunProvider = StateNotifierProvider<BunStore,BunModel>((ref) {
  BunModel model = BunModel(1);
  return BunStore(model);
});