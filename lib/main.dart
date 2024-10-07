import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverapp/num_provider.dart';

void main() {
  runApp(MyApp());
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

class Bottom extends StatelessWidget {
  const Bottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: InkWell(
          onTap: () {
            print("증가 클릭됨");
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

    int num = ref.read(numProvider); // num_provider.dart의 Provider의 익명함수가 실행됨
    int num2 = ref.read(numProvider); // num_provider.dart의 Provider의 익명함수가 실행됨


    return Center(
      child: Container(
        child: Text("1", style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
