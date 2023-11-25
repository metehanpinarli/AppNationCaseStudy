import 'dart:async';
import 'package:app_nation_case_study/domain/entities/dog_entity.dart';
import 'package:app_nation_case_study/domain/entities/failure_model.dart';
import 'package:app_nation_case_study/product/routes/route_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../domain/repository/breends/i_breends_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBreedsRepository _iBreedsRepository;
  List<DogEntity> _dogList = [];
  List<String> _imageList = [];

  HomeBloc(this._iBreedsRepository) : super(SplashInitial()) {
    on<GetData>(_onGetData);
    on<Search>(_onSearchData);
    on<CacheImage>(_onImageCacheTest);

    add(GetData());
  }

  FutureOr<void> _onGetData(event, emit) async {
    emit(Loading());
    final dogList = await _iBreedsRepository.getDogList();
    await dogList.fold((error) => emit(Error()), (dogEntityList) async {
      final imagesResponses = await Future.wait(futures(dogEntityList));

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
    emit(Success(dogList: searchResult));
  }

  FutureOr<void> _onImageCacheTest(CacheImage event, emit) async {
    for (final image in _imageList) {
      await precacheImage(CachedNetworkImageProvider(image), event.context);
    }
  }


  List<Future<Either<FailureModel, String>>> futures(List<DogEntity> dogList) {
    List<Future<Either<FailureModel, String>>> futures = [];
    for (var i = 0; i < dogList.length; i++) {
      futures.add(_iBreedsRepository.getDogeImage(breedName: dogList[i].breed));
    }
    return futures;
  }
}
