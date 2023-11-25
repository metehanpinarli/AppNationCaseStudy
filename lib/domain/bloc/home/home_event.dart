part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetData extends HomeEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Search extends HomeEvent {
  final String searchValue;

  const Search({required this.searchValue});

  @override
  List<Object?> get props => throw UnimplementedError();
}
