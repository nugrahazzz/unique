import 'package:unique/core/utils/enums/data_source.dart';
import 'package:unique/core/utils/error/failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {

      failure = Failure(
        ResponseCode.custom,
        error.toString(),
      );

  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(ResponseCode.success, ResponseMessage.success);
      case DataSource.noContent:
        return Failure(ResponseCode.noContent, ResponseMessage.noContent);
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.unauthorised:
        return Failure(ResponseCode.unauthorised, ResponseMessage.unauthorised);
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.internalServerError:
        return Failure(ResponseCode.internalServerError, ResponseMessage.internalServerError);
      case DataSource.connectTimeout:
        return Failure(ResponseCode.connectTimeout, ResponseMessage.connectTimeout);
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.failure:
        return Failure(ResponseCode.receiveTimeout, ResponseMessage.failure);
      case DataSource.sendTimeout:
        return Failure(ResponseCode.sendTimeout, ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection, ResponseMessage.noInternetConnection);

      case DataSource.parserError:
        return Failure(ResponseCode.parserError, ResponseMessage.parserError);
      case DataSource.custom:
        return Failure(ResponseCode.custom, ResponseMessage.custom);
    }
  }

  Failure setFailure(String message) {
    return Failure(
      ResponseCode.custom,
      message,
    );
  }
}

class ResponseCode {
  // Server status code
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int unauthorised = 401; // failure, user is not authorised
  static const int forbidden = 403; // failure, API rejected request
  static const int notFound = 404; // failure, not found
  static const int internalServerError = 500; // failure, crash in server side

  // Local status code
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int custom = -7;
  static const int connectionError = -8;
  static const int parserError = -9;
}

class ResponseMessage {
  static const String success = AppStrings.success; // success with data
  static const String noContent = AppStrings.strNoContent; // success with no data (no content)
  static const String badRequest = AppStrings.strBadRequestError; // failure, API rejected request
  static const String unauthorised = AppStrings.strUnauthorizedError; // failure, user is not authorised
  static const String forbidden = AppStrings.strForbiddenError; // failure, API rejected request
  static const String internalServerError = AppStrings.strInternalServerError; // failure, crash in server side
  static const String notFound = AppStrings.strNotFoundError; // failure, not found

  // Local status code
  static const String connectTimeout = AppStrings.strTimeoutError;
  static const String cancel = AppStrings.strDefaultError;
  static const String failure = AppStrings.strTimeoutError;
  static const String sendTimeout = AppStrings.strTimeoutError;
  static const String cacheError = AppStrings.strCacheError;
  static const String noInternetConnection = AppStrings.strNoInternetError;
  static const String custom = AppStrings.strDefaultError;
  static const String parserError = AppStrings.strParserError;
}

class AppStrings {
  static const strNoRouteFound = "no_route_found";
  static const strAppName = "app_name";

  static const String success = "success";

  // error handler
  static const String strBadRequestError = "bad_request_error";
  static const String strNoContent = "no_content";
  static const String strForbiddenError = "forbidden_error";
  static const String strUnauthorizedError = "unauthorized_error";

  // static const String strNotFoundError = "not_found_error";
  static const String strNotFoundError = "Requested could not be found on this server!";

  static const String strConflictError = "conflict_error";
  static const String strInternalServerError = "internal_server_error, /";
  static const String strUnknownError = "unknown_error";
  static const String strTimeoutError = "timeout_error";
  static const String strDefaultError = "default_error";
  static const String strCacheError = "cache_error";
  static const String strNoInternetError = "No connection detected, please check your internet";
  static const String strParserError = "data_parser_error";
}
