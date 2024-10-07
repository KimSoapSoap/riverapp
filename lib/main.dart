import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverapp/num_provider.dart';

import 'num_notify_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('HomePage');
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Top(),
          ),
          Expanded(
            child: Bottom(),
          ),
        ],
      ),
    );
  }
}

class Bottom extends ConsumerWidget {
  const Bottom({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('Bottom');

    //창고에 접근
    BunStore store = ref.read(bunProvider.notifier);


    //NumStore store = ref.read(numProvider); // num_provider.dart의 Provider의 익명함수가 실행됨


    return Center(
      child: Container(
        child: InkWell(
          onTap: () {
            print("증가 클릭됨");
            //클릭시 num의 상태는 증가되지만 화면에 갱신되지는 않는다.(state_provider예시)

            //이전 데이터가 없어서 상태감지를 못 했다.
            store.increase();
          },
          child: Text(
            "증가",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}

class Top extends ConsumerWidget {

  const Top({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('Top');

    //StateNotifierProvider는 읽으면 bunProvider에서 return 하는 값을 바로 리턴 받는 것이 아니라
    //return 할 때 BunStore에 넣어서 전달하는 model에 접근한다.
    BunModel model = ref.watch(bunProvider);

    //이렇게 안 하고 값에 바로 접근한다.
    //BunStore bunStore = ref.read.watch(bunProvider);


    //NumStore store = ref.read(numProvider); // num_provider.dart의 Provider의 익명함수가 실행됨
    //int num = ref.read(numProvider); // 구조 바뀌기 전 예시 코드


    return Center(
      child: Container(
        child: Text("${model.bun}", style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
