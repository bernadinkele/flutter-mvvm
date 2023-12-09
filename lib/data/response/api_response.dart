
import 'package:mvvm/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse({this.data, this.message, this.status});

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.comleted() : status = Status.completed;

  ApiResponse.error() : status = Status.error;

  @override
  String toString() {
    return "status: $status, message: $message , data: $data";
  }
}
