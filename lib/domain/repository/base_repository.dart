import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../entities/failure_model.dart';


abstract class BaseRepository {
  BaseRepository();

  Future<Either<FailureModel, T>> serviceResponseHandler<T>(Function func) async {
    try {
      return Right(await func());
    } on FailureModel catch (failureModel) {
      log('Error: $failureModel');
      return Left(failureModel);
    } catch (e) {
      log('Error: $e');
      log('Type: $T');

      return Left(FailureModel(code: '404', message: 'Something Went Wrong', description: e.toString()));
    }
  }
}
