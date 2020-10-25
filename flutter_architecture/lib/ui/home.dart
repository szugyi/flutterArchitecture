import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/service/counter_service_impl.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _counterService = CounterServiceImpl();
  StreamSubscription _subscription;
  int _counter = 0;

  @override
  void initState() {
    super.initState();

    _subscription = _counterService.get().listen((count) {
      setState(() {
        _counter = count;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }

  void _startCounter() async {
    _counterService.start();
  }

  void _stopCounter() async {
    _counterService.stop();
  }

  void _resetCounter() async {
    _counterService.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Counter value:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
          Row(children: [
            Expanded(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: ElevatedButton(
                        onPressed: _startCounter, child: Text("Start"))))
          ]),
          Row(children: [
            Expanded(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: ElevatedButton(
                        onPressed: _stopCounter, child: Text("Stop"))))
          ]),
          Row(children: [
            Expanded(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: ElevatedButton(
                        onPressed: _resetCounter, child: Text("Reset"))))
          ]),
        ],
      ),
    );
  }
}
