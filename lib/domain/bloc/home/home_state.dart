part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class SplashInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class Loading extends HomeState {
  @override
  List<Object> get props => [];
}

class Success extends HomeState {
  final List<DogEntity> dogList;

  const Success({required this.dogList});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class Error extends HomeState {
  @override
  List<Object> get props => [];
}

class NoResult extends HomeState {
  @override
  List<Object> get props => [];
}
