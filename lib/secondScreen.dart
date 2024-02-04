import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/model.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SecondScreenState();
  }
}

class _SecondScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
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
                ]),
              ),
            )));
  }
}
