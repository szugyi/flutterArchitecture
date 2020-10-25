abstract class CounterAction {
  Future<void> start();

  Future<void> stop();

  Future<void> reset();
}
