part of 'authentication_cubit.dart';

abstract class AuthenticationState {
  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class AuthenticationSuccess extends AuthenticationState {
  final String success;
  AuthenticationSuccess(this.success);

  List<Object> get props => [success];
}

final class AuthenticationError extends AuthenticationState {
  final String error;

  AuthenticationError(this.error);

  @override
  List<Object> get props => [error];
}
