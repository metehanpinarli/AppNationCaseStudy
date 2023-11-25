part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();
}

class SplashInitial extends SplashState {
  @override
  List<Object> get props => [];
}

class Loading extends SplashState {
  @override
  List<Object> get props => [];
}

class Success extends SplashState {
  final List<DogEntity> dogList;

  const Success({required this.dogList});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class Error extends SplashState {
  @override
  List<Object> get props => [];
}
