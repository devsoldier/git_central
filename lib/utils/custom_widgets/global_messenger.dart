import 'dart:async';

class GlobalMessenger {
  final messenger = StreamController<GlobalMessengerEvent>.broadcast();
}

abstract class GlobalMessengerEvent {}

class NoNetwork extends GlobalMessengerEvent {}
