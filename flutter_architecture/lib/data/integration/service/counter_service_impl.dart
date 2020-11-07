import 'dart:async';

import 'package:flutter_architecture/domain/action/counter_action.dart';
import 'package:flutter_architecture/domain/store/counter_store.dart';
import 'package:rxdart/rxdart.dart';

class CounterServiceImpl implements CounterAction, CounterStore {
  var _timer;
  var _counter = BehaviorSubject.seeded(0);

  @override
  Stream<int> get() {
    return _counter;
  }

  @override
  Future<void> reset() async {
    _counter.value = 0;
  }

  @override
  Future<void> start() async {
    stop();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _counter.value++;
    });
  }

  @override
  Future<void> stop() async {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }
}
