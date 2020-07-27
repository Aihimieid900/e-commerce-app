class ApiResponse<T> {
  T data;
  bool error = false;
  String errorMsg;
  ApiResponse({this.data, this.error, this.errorMsg});
}
