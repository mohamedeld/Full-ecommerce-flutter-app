import 'package:ecommerce/services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthServices firebaseAuthServices = AuthServicesImp();

  Future<void> loginWithEmailPassword(String email, String password) async {
    emit(AuthLoading());
    try {
      final isLogin = await firebaseAuthServices.login(email, password);
      if (isLogin) {
        emit(AuthDone());
      } else {
        emit(AuthError(message: "Login Failed"));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> registerWithEmailPassword(String email, String password) async {
    emit(AuthLoading());
    try {
      final isRegister = await firebaseAuthServices.register(email, password);
      debugPrint("is registe ${isRegister}");
      if (isRegister) {
        emit(AuthDone());
      } else {
        emit(AuthError(message: "Register Failed"));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  void authCheck() {
    final user = firebaseAuthServices.currentUser();
    if (user != null) {
      emit(AuthDone());
    }
  }

  Future<void> logout() async {
    try {
      emit(LogoutLoading());
      await firebaseAuthServices.logout();
      emit(LogoutDone());
    } catch (e) {
      emit(LogoutError(message: e.toString()));
    }
  }

  Future<void> authenticateWithGoogle() async {
    try {
      emit(GoogleAuthenticating());
      final isAuthenticated = await firebaseAuthServices
          .authenticateWithGoogle();
      if (isAuthenticated) {
        emit(GoogleAuthenticated());
      } else {
        emit(GoogleAuthenticateError(message: "Google Authentication Failed"));
      }
    } catch (e) {
      debugPrint("Google Authentication Error: ${e.toString()}");
      emit(GoogleAuthenticateError(message: e.toString()));
    }
  }
}
