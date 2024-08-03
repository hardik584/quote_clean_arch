import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class GenricFailure extends Failure {
  GenricFailure(this.message);

  final String message;
  @override
  List<Object?> get props => [message];
}

class NetworkFailure extends Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class EmptyMutualFundsFailure extends Failure {}
