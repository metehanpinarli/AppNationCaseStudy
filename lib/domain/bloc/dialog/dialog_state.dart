part of 'dialog_bloc.dart';

abstract class DialogState{
  const DialogState();
}

class DialogInitial extends DialogState {
  @override
  List<Object> get props => [];
}

class Success extends DialogState {
  final String imageUrl;

  const Success({required this.imageUrl});

}

class Error extends DialogState {
  @override
  List<Object> get props => [];
}
