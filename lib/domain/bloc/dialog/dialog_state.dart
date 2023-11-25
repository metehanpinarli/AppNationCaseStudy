part of 'dialog_bloc.dart';

abstract class DialogState extends Equatable {
  const DialogState();
}

class DialogInitial extends DialogState {
  @override
  List<Object> get props => [];
}

class Success extends DialogState {
  final String imageUrl;

  const Success({required this.imageUrl});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class Error extends DialogState {
  @override
  List<Object> get props => [];
}
