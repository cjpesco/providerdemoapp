import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyText(),
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(context.watch<Data>().data);
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Text(context.watch<Data>().data); //this works when listening to data
    return Text(Provider.of<Data>(context, listen: false)
        .data); // this works only if you want to listen to data and turn it off
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        context.read<Data>().changeString(newText);
      },
    );
  }
}

class Data extends ChangeNotifier {
  String data = 'Some data';

  void changeString(String newString) {
    data = newString;
    notifyListeners();
  }
}
