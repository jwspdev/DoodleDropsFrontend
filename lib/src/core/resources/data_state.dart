import 'package:dio/dio.dart';

// wrapper abstract class for network calls
// validate if response data has failed or has been successful
abstract class DataState<T> {
  final T? data;
  final Exception? exception;

  const DataState({this.data, this.exception});
}

//check if data has been returned
class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

//check if data contains failure
class DataFailure<T> extends DataState<T> {
  const DataFailure(Exception? exception) : super(exception: exception);
}
