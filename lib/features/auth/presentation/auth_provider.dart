import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  bool build() {
    // Mock authentication state: starts as false (unauthenticated)
    return false;
  }

  void login() {
    state = true;
  }

  void logout() {
    state = false;
  }
}
