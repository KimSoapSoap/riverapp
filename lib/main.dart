import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverapp/num_provider.dart';

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

    NumStore store = ref.read(numProvider);

    return Center(
      child: Container(
        child: InkWell(
          onTap: () {
            print("증가 클릭됨");
            //클릭시 num의 상태는 증가되지만 화면에 갱신되지는 않는다.
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

    NumStore store = ref.read(numProvider); // num_provider.dart의 Provider의 익명함수가 실행됨
    //int num = ref.read(numProvider); // 구조 바뀌기 전 예시 코드


    return Center(
      child: Container(
        child: Text("1", style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
