import 'package:state_notifier/state_notifier.dart';

class UsageIsolateStateHolder extends StateNotifier<bool> {
  UsageIsolateStateHolder() : super(false);

  bool getState() => state;

  void setState(bool newState) {
    if (!mounted) {
      return;
    }

    state = newState;
  }
}
