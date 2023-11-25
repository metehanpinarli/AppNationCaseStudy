import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/breends/i_breends_repository.dart';

part 'dialog_event.dart';

part 'dialog_state.dart';

class DialogBloc extends Bloc<DialogEvent, DialogState> {
  final IBreedsRepository _iBreedsRepository;

  DialogBloc(this._iBreedsRepository) : super(DialogInitial()) {
    on<GenerateImage>(_onGenerateImage);
  }

  FutureOr<void> _onGenerateImage(GenerateImage event, emit) async {
    emit(DialogInitial());
    final imageResponse = await _iBreedsRepository.getDogeImage(breedName: event.breedName);
    await imageResponse.fold((error) => emit(Error()), (imageUrl) async {
      await emit(Success(imageUrl: imageUrl));
    });
  }
}
