import 'dart:async';
import 'package:app_nation_case_study/domain/entities/dog_entity.dart';
import 'package:app_nation_case_study/domain/entities/failure_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/repository/breends/i_breends_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBreedsRepository _iBreedsRepository;
  List<DogEntity> _dogList = [];
  final List<String> _imageList = [];

  HomeBloc(this._iBreedsRepository) : super(SplashInitial()) {
    on<GetData>(_onGetData);
    on<Search>(_onSearchData);
    on<CacheImage>(_onCacheImage);

    add(GetData());
  }

  FutureOr<void> _onGetData(event, emit) async {
    emit(Loading());
    final dogList = await _iBreedsRepository.getDogList();
    await dogList.fold((error) => emit(Error()), (dogEntityList) async {
      final imagesResponses = await Future.wait(getImageRequestList(dogEntityList));

      for (final image in imagesResponses) {
        image.fold((error) => emit(Error()), (imageUrl) {
          _imageList.add(imageUrl);

          dogEntityList[imagesResponses.indexOf(image)] =
              dogEntityList[imagesResponses.indexOf(image)].copyWith(imageUrl: imageUrl);
        });
      }
      _dogList = dogEntityList;
      await emit(Success(dogList: dogEntityList));
    });
  }

  FutureOr<void> _onSearchData(Search event, emit) async {
    emit(Loading());
    final searchResult = _dogList.where((element) => element.breed.contains(event.searchValue)).toList();
    if (searchResult.isEmpty) {
      emit(NoResult());
      return;
    }
    emit(Success(dogList: searchResult));
  }

  FutureOr<void> _onCacheImage(CacheImage event, emit) async {
    for (final image in _imageList) {
      await precacheImage(CachedNetworkImageProvider(image), event.context);
    }
  }

  List<Future<Either<FailureModel, String>>> getImageRequestList(List<DogEntity> dogList) {
    List<Future<Either<FailureModel, String>>> requestList = [];
    for (var i = 0; i < dogList.length; i++) {
      requestList.add(_iBreedsRepository.getDogeImage(breedName: dogList[i].breed));
    }
    return requestList;
  }
}
