import 'package:fevent/src/network/repositories/authentication/auth_repository.dart';
import 'package:fevent/src/network/repositories/event/event_repository.dart';
import 'package:fevent/src/network/repositories/event/event_repository_impl.dart';

import 'repositories/authentication/auth_repository_impl.dart';

class Domain {
  static Domain? _internal;
  factory Domain() {
    _internal ??= Domain._();

    return _internal!;
  }
  late EventRepository eventRepository;
  late AuthRepository authRepository;
  Domain._() {
    eventRepository = EventRepositoryImpl();
    authRepository = AuthRepositoryImpl();
  }
}
