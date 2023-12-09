class AppExceptions implements Exception {
  final dynamic message;

  final dynamic prefix;
  AppExceptions(this.message, this.prefix);

  @override
  String toString() {
    return "$prefix $message";
  }
}

class FetchDataExceptions extends AppExceptions {
  FetchDataExceptions(String? message)
      : super(message, "Error during communication");
}

class BadRequestExceptions extends AppExceptions {
  BadRequestExceptions(String? message)
      : super(message, "Error during communication");
}

class InvalidRequestExceptions extends AppExceptions {
  InvalidRequestExceptions(String? message)
      : super(message, "Error during communication");
}

class UnauthorisationExceptions extends AppExceptions {
  UnauthorisationExceptions(String? message)
      : super(message, "Error during communication");
}
