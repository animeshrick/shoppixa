class ApiResponse {
  String? successMessage;
  String? errorMessage;

  ApiResponse({this.successMessage, this.errorMessage});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    successMessage = json['successMessage'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['successMessage'] = successMessage;
    data['errorMessage'] = errorMessage;
    return data;
  }
}
