import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (_) => Counter())],
    child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Count',
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Provider'),
        centerTitle: true),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Quantidade de vezes clicadas:'),
            Count()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){context.read<Counter>()._increment();
        },
        child: const Icon( Icons.plus_one),
      ),
    );
  }
}


class Counter extends ChangeNotifier{
  int _counter = 0;

  int get count => _counter;

  void _increment(){
    _counter+=1;
    notifyListeners();
  }
}



class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<Counter>().count}');
  }
}
