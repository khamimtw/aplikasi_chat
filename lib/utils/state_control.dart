import 'dart:async';

class StateControl {
  final StreamController streamController;

  StateControl() : streamController = StreamController();

  void notifyListeners() {
    streamController.add('change');
  }

  void init() {}

  void dispose() {
    streamController.close();
  }
}
