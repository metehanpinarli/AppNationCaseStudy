part of 'dialog_bloc.dart';

abstract class DialogEvent extends Equatable {
  const DialogEvent();
}

class GenerateImage extends DialogEvent {
  final String breedName;

  const GenerateImage({required this.breedName});

  @override
  List<Object?> get props => throw UnimplementedError();
}
