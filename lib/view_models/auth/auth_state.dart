part of 'auth_cubit.dart';

sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthDone extends AuthState {
  const AuthDone();
}

final class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}

final class LogoutLoading extends AuthState {}

final class LogoutDone extends AuthState {
  const LogoutDone();
}

final class LogoutError extends AuthState {
  final String message;

  LogoutError({required this.message});
}
