import 'package:app_nation_case_study/data/constants/api_constants.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/failure_model.dart';

abstract class BaseService {
  BaseService();

  Dio get _dio => Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 15),
        ),
      );

  Future request({required String path, required Method httpMethod, dynamic data}) async {
    switch (httpMethod) {
      case Method.post:
        try {
          return await _dio.post(path, data: data);
        } on DioException catch (error) {
          throw handleError(error);
        }
      case Method.get:
        try {
          return await _dio.get(path);
        } on DioException catch (error) {
          throw handleError(error);
        }
      case Method.delete:
        try {
          return await _dio.delete(path, data: data);
        } on DioException catch (error) {
          throw handleError(error);
        }
      case Method.put:
        try {
          return await _dio.put(path, data: data);
        } on DioException catch (error) {
          throw handleError(error);
        }
    }
  }

  handleError(DioException error) {
    throw FailureModel(
        code: error.response?.statusCode, description: error.error.toString(), message: error.message.toString());
  }
}

enum Method {
  get,
  post,
  delete,
  put,
}
