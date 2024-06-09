part of 'authentication_bloc.dart';

// sealed class AuthenticationState extends Equatable {
//   const AuthenticationState();
  
//   @override
//   List<Object> get props => [];
// }

// final class AuthenticationInitial extends AuthenticationState {}

enum AuthenticationStatus{
  authenticated,unauthenticated,unknown
}

 class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.sttus=AuthenticationStatus.unknown,
    this.user
  });

  final AuthenticationStatus sttus;
  final MyUser? user;

  const AuthenticationState.unknown():this._();
  const AuthenticationState.authenticated(MyUser myUser):this._(sttus: AuthenticationStatus.authenticated, user: myUser);
  const AuthenticationState.unauthenticated():this._(sttus: AuthenticationStatus.unauthenticated);

  @override
  List<Object> get props => [];

 }