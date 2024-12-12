import '../api/api.dart';

class UserProfileResponse {
  final bool success;
  final String message;
  final ProfileData data;

  UserProfileResponse({required this.success, required this.message, required this.data});

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    return UserProfileResponse(
      success: json['success'],
      message: json['message'],
      data: ProfileData.fromJson(json['data']['profile']),
    );
  }
}

class ProfileData {
  final int userId;
  final String profilePictureUrl;
  final String phoneNumber;
  final String socialMediaLinks;
  final String municipality;
  final String city;
  final String barangay;
  final String street;
  final String zone;
  final String country;
  final String postalCode;
  final String driverLicenseNumber;
  final String nationalId;
  final String passportNumber;
  final String socialSecurityNumber;
  final String occupation;
  final String address;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int id;

  ProfileData({
    required this.userId,
    required this.profilePictureUrl,
    required this.phoneNumber,
    required this.socialMediaLinks,
    required this.municipality,
    required this.city,
    required this.barangay,
    required this.street,
    required this.zone,
    required this.country,
    required this.postalCode,
    required this.driverLicenseNumber,
    required this.nationalId,
    required this.passportNumber,
    required this.socialSecurityNumber,
    required this.occupation,
    required this.address,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      userId: json['user_id'],

      profilePictureUrl: json['profile_picture_url'] != null && json['profile_picture_url'].isNotEmpty
          ? json['profile_picture_url'] ?? ''
          : 'assets/images/default_profile_picture.png',

      phoneNumber: json['phone_number'],
      socialMediaLinks: json [''] ?? '',
      municipality: json['municipality'] ?? '',
      city: json['city'] ?? '',
      barangay: json['barangay'] ?? '',
      street: json['street'] ?? '',
      zone: json['zone'] ?? '',
      country: json['country'] ?? '',
      postalCode: json['postal_code'] ?? '',
      driverLicenseNumber: json['driver_license_number'] ?? '',
      nationalId: json['national_id'] ?? '',
      passportNumber: json['passport_number'] ?? '',
      socialSecurityNumber: json['social_security_number'] ?? '',
      occupation: json['occupation'] ?? 'Not set yet',
      address: json['address'] ?? '',
      updatedAt: DateTime.parse(json['updated_at']) ,
      createdAt: DateTime.parse(json['created_at']),
      id: json['id'],
    );
  }
}