import 'dart:async';
import 'package:app_nation_case_study/domain/entities/dog_entity.dart';
import 'package:app_nation_case_study/domain/entities/failure_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repository/breends/i_breends_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBreedsRepository _iBreedsRepository;
   List<DogEntity> _dogList = [];

  HomeBloc(this._iBreedsRepository) : super(SplashInitial()) {
    on<GetData>(_onGetData);
    on<Search>(_onSearchData);

    add(GetData());
  }

  FutureOr<void> _onGetData(event, emit) async {
    emit(Loading());
    final dogList = await _iBreedsRepository.getDogList();
    await dogList.fold((error) => emit(Error()), (dogEntityList) async {
      final imagesResponses = await Future.wait(futures(dogEntityList));

      for (final image in imagesResponses) {
        image.fold((error) => emit(Error()), (imageUrl) {
          dogEntityList[imagesResponses.indexOf(image)] =
              dogEntityList[imagesResponses.indexOf(image)].copyWith(imageUrl: imageUrl);
        });
      }
      _dogList=dogEntityList;
      await emit(Success(dogList: dogEntityList));
    });
  }

  FutureOr<void> _onSearchData(Search event, emit) async {
    emit(Loading());
    final searchResult = _dogList.where((element) => element.breed.contains(event.searchValue)).toList();
    emit(Success(dogList: searchResult));
  }





  List<Future<Either<FailureModel, String>>> futures(List<DogEntity> dogList) {
    List<Future<Either<FailureModel, String>>> futures = [];
    for (var i = 0; i < dogList.length; i++) {
      futures.add(_iBreedsRepository.getDogeImage(breedName: dogList[i].breed));
    }
    return futures;
  }
}
