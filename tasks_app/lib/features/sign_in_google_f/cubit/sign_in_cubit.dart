import 'package:bloc/bloc.dart';
import 'package:tasks_app/features/sign_in_google_f/cubit/google_auth_service.dart';

import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final GoogleAuthService authService;

  SignInCubit({required this.authService}) : super(SignInState.initial());

  Future<void> signInWithGoogle() async {
    emit(SignInState.loading());

    try {
      final result = await authService.signInWithGoogle();
      final user = result['user'];
      emit(SignInState.success(user));
    } catch (e) {
      emit(SignInState.failure(e.toString()));
      print("the error is here =========================================$e");
    }
  }

  Future<void> fetchUserProfile() async {
    emit(SignInState.loading());

    try {
      final user = await authService.fetchUserProfile();
      emit(SignInState.success(user));
    } catch (e) {
      emit(SignInState.failure(e.toString()));
    }
  }

  Future<void> signOut() async {
    await authService.signOut();
    emit(SignInState.initial());
  }
}
