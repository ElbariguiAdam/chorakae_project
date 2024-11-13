import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {}

class CacheFailure extends Failure {}

class ServerFailure extends Failure {}

class AuthenticationFailure extends Failure {}

class CredentialFailure extends Failure {}

class ExceptionFailure extends Failure {}
