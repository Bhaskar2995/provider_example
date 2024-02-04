import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/model.dart';
import 'package:provider_example/secondScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NumbersListProvider(),
        ),
      ],
      child: MaterialApp(
          home: Consumer<NumbersListProvider>(
        builder: ((context, value, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue,
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  value.add();
                },
                backgroundColor: Colors.blue,
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
              body: SizedBox(
                child: Column(children: [
                  Text(value.numbers.last.toString(),
                      style: const TextStyle(fontSize: 40)),
                  Expanded(
                      child: ListView.builder(
                          itemCount: value.numbers.length,
                          itemBuilder: (ctx, index) {
                            return Text(
                              value.numbers[index].toString(),
                              style: const TextStyle(fontSize: 30),
                            );
                          })),
                  Builder(builder: (context) {
                    return ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => SecondScreen()));
                        },
                        child: const Text("Second page"));
                  })
                ]),
              ),
            )),
      )),
    );
  }
}
