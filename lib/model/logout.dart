class userLogoutResponse {
  final bool success;
  final String? message;
  final dynamic data;

  userLogoutResponse({
    required this.success,
    this.message,
    this.data,
  });

  factory userLogoutResponse.fromJson(Map<String, dynamic> json) {
    return userLogoutResponse(
      success: json['success'] ?? false,
      message: json['message'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data,
    };
  }
}