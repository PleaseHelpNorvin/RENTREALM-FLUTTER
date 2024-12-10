class userRegisterResponse {
  final bool success;
  final String message;
  final UserData? data;

  userRegisterResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory userRegisterResponse.fromJson(Map<String, dynamic> json) {
    return userRegisterResponse(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class UserData {
  final String token;
  final User user;

  UserData({
    required this.token,
    required this.user,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      token: json['token'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'user': user.toJson(),
    };
  }
}

class User {
  final String name;
  final String email;
  final String role;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  User({
    required this.name,
    required this.email,
    required this.role,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      role: json['role'],
      updatedAt: DateTime.parse(json['updated_at']),
      createdAt: DateTime.parse(json['created_at']),
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'role': role,
      'updated_at': updatedAt.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'id': id,
    };
  }
}
