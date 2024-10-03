enum DataSource {
  success, //200 - success
  noContent, //201 - success with no content
  badRequest, //400 -  API rejected request
  unauthorised, //401 - user- is not authorised
  forbidden, //403 - API rejected request
  notFound, //404 - url/path not found
  internalServerError, //500 - crash in server side
  //
  connectTimeout,
  cancel,
  failure,
  sendTimeout,
  cacheError,
  noInternetConnection,
  custom,
  parserError
}
