part of 'dialog_bloc.dart';

abstract class DialogEvent{
  const DialogEvent();
}

class GenerateImage extends DialogEvent {
  final String breedName;

  const GenerateImage({required this.breedName});

}

