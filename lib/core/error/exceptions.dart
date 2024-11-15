import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kf_sample/core/error/failures.dart';

/// A custom exception class for database errors.
///
/// This class extends the `Equatable` and `Exception` classes.
///
/// The `message` property is a string that holds the error message.
///
/// The `DatabaseException.fromIsarError` constructor takes an `IsarError` object
/// and initializes the `message` property with the error message from the `IsarError`.
///
/// The `props` getter returns a list containing the `message` property.
class DatabaseException extends Equatable implements Exception {
  late final String message;

  DatabaseException.fromIsarError(IsarError isarError)
      : message = isarError.message;

  @override
  List<Object?> get props => [message];
}

///
/// This class extends [Equatable] and implements [Exception].
/// It contains a [message] and a [statusCode] property.
/// The [message] property contains the error message and the [statusCode]
/// property contains the HTTP status code of the response.
///
/// This class has a constructor [fromDioError] which takes a [DioException]
/// as a parameter and sets the [statusCode] and [message] properties based on
/// the type of the [DioException].
///
/// This class also overrides the [props] getter from [Equatable] to compare
/// instances of this class based on the [message] and [statusCode] properties.
///
/// Example usage:
/// ```dart
/// try {
///   // some network request
/// } on DioException catch (e) {
///   throw NetworkException.fromDioError(e);
/// }
/// ```
class NetworkException extends Equatable implements Exception {
  late final String message;
  late final int? statusCode;

  NetworkException.fromDioError(DioException dioException) {
    statusCode = dioException.response?.statusCode;

    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
        break;

      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;

      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;

      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;

      case DioExceptionType.connectionError:
        if (dioException.error.runtimeType == SocketException) {
          message = 'Please check your internet connection';
          break;
        } else {
          message = 'Unexpected error occurred';
          break;
        }

      case DioExceptionType.badCertificate:
        message = 'Bad Certificate';
        break;

      case DioExceptionType.badResponse:
        const model = NetworkErrorModel(statusMessage: 'Bad reponse');
        message = model.statusMessage ?? 'Unexpected bad response';
        break;

      case DioExceptionType.unknown:
        message = 'Unexpected error occurred';
        break;
    }
  }

  @override
  List<Object?> get props => [message, statusCode];
}
