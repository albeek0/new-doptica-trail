enum SignInStatus { initial, loading, success, failure }

class SignInState {
  final SignInStatus status;
  final Map<String, dynamic>? user;
  final String? error;

  const SignInState({
    required this.status,
    this.user,
    this.error,
  });

  factory SignInState.initial() => const SignInState(status: SignInStatus.initial);
  factory SignInState.loading() => const SignInState(status: SignInStatus.loading);
  factory SignInState.success(Map<String, dynamic> user) =>
      SignInState(status: SignInStatus.success, user: user);
  factory SignInState.failure(String error) =>
      SignInState(status: SignInStatus.failure, error: error);
}
