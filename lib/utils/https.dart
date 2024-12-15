//libraries
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:rentrealm/model/login.dart';
import 'package:rentrealm/model/logout.dart';
//api
import '../api/api.dart';
//models
import '../model/register.dart';
import '../model/logout.dart';
import '../model/userprofile.dart';

// import '';
class ApiService {
  //register api call
  Future<userRegisterResponse?> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(
        '${Api.baseUrl}/create/tenant'); // Replace with your API endpoint

    try {
      // Prepare request body
      final body = {
        "name": name,
        "email": email,
        "password": password,
      };

      // Make POST request
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode(body),
      );

      // Check for successful response
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return userRegisterResponse
            .fromJson(responseData); // Parse response into model
      } else {
        // Handle errors
        print('Error: ${response.statusCode} - ${response.body}');
        return null;
      }
    } catch (e) {
      // Handle exception
      print('Exception: $e');
      return null;
    }
  }

  //login api call
  Future<userLoginResponse?> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('${Api.baseUrl}/login');

    try {
      // Prepare request body
      final body = {
        "email": email,
        "password": password,
      };

      // Make POST request
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return userLoginResponse.fromJson(responseData);
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        return null;
      }
    } catch (e) {
      print('Exeption: $e');
      return null;
    }
  }

  //logout api call
  Future<userLogoutResponse?> logout({
    required String token,
  }) async {
    final url = Uri.parse('${Api.baseUrl}/logout');

    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": " Bearer $token",
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return userLogoutResponse.fromJson(responseData);
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        return null;
      }
    } catch (e) {
      print('Exception: $e');
      return null;
    }
  }

  Future<UserProfileResponse?> fetchUserProfile({
    required int userId,
    required String token,
  }) async {
    final url = Uri.parse('${Api.baseUrl}/tenant/profile/show/${userId}');

    try {
      final response = await http.get(url, headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": " Bearer $token",
      });
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return UserProfileResponse.fromJson(responseData);
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        return null;
      }
    } catch (e) {
      print('Exception: ${e}');
      return null;
    }
  }

  static Future<void> updateUser({
    required String token,
    required int userId,
    required String name,
    required String email,
    required String password,
  }) async {
    final url =
        Uri.parse('${Api.baseUrl}/updateUser/$userId'); // Adjust the endpoint

    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user data');
    }
  }

  static Future<void> updateProfileData({
    required String token,
    required int userId,
    required Map<String, String> profileData,
  }) async {
    final url = Uri.parse(
        '${Api.baseUrl}/updateProfile/$userId'); // Adjust the endpoint

    final response = await http.put(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": " Bearer $token",
      },
      body: jsonEncode(profileData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update profile data');
    }
  }

  //solution 1
  // static Future<UserProfileResponse?> storeProfileData({
  //   required String token,
  //   required int userId,
  //   required Map<String, String> profileData,
  //   File? profilePicture, // Profile picture file (optional)
  // }) async {
  //   final url = Uri.parse('${Api.baseUrl}/tenant/profile/store?user_id=$userId');

  //   try {
  //     var request = http.MultipartRequest('POST', url)
  //       ..headers.addAll({
  //         "Authorization": "Bearer $token", // Corrected header
  //       });

  //     // Add other fields as form data
  //     request.fields['profile_picture_url'] = profileData["profile_picture_url"] ?? "";
  //     request.fields['phone_number'] = profileData["phone_number"] ?? "";
  //     request.fields['country'] = profileData["country"] ?? "";
  //     request.fields['municipality'] = profileData["municipality"] ?? "";
  //     request.fields['city'] = profileData["city"] ?? "";
  //     request.fields['barangay'] = profileData["barangay"] ?? "";
  //     request.fields['street'] = profileData["street"] ?? "";
  //     request.fields['zone'] = profileData["zone"] ?? "";
  //     request.fields['postal_code'] = profileData["postal_code"] ?? "";
  //     request.fields['driver_license_number'] = profileData["driver_license_number"] ?? "";
  //     request.fields['national_id'] = profileData["national_id"] ?? "";
  //     request.fields['passport_number'] = profileData["passport_number"] ?? "";
  //     request.fields['social_security_number'] = profileData["social_security_number"] ?? "";
  //     request.fields['occupation'] = profileData["occupation"] ?? "";

  //     // Add the image file if available
  //     if (profileData != null) {
  //       request.files.add(await http.MultipartFile.fromPath(
  //         'profile_picture_url', 
  //         profilePicture.path,
  //         contentType: MediaType('image', 'jpeg'), // Change if it's another image format
  //       ));
  //     }

  //     // Send the request
  //     final response = await request.send();

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       // Read the response stream
  //       final responseData = await response.stream.bytesToString();
  //       print("Success: $responseData");

  //       // Parse and return the response as needed
  //       return UserProfileResponse.fromJson(jsonDecode(responseData));
  //     } else {
  //       print("Failed: ${response.statusCode}");
  //       return null;
  //     }
  //   } catch (e) {
  //     print('Exception: $e');
  //     return null;
  //   }
  // }

  // solution 2
  static Future<UserProfileResponse?> storeProfileData({
    required String token,
    required int userId,
    required Map<String, String> profileData,
  }) async {
    final url = Uri.parse('${Api.baseUrl}/tenant/profile/store?user_id=$userId');

    try {
      var request = http.MultipartRequest('POST', url)
        ..headers.addAll({
          "Authorization": "Bearer $token", // Corrected header
        });

      // Add other fields as form data
      request.fields['phone_number'] = profileData["phone_number"] ?? "";
      request.fields['country'] = profileData["country"] ?? "";
      request.fields['municipality'] = profileData["municipality"] ?? "";
      request.fields['city'] = profileData["city"] ?? "";
      request.fields['barangay'] = profileData["barangay"] ?? "";
      request.fields['street'] = profileData["street"] ?? "";
      request.fields['zone'] = profileData["zone"] ?? "";
      request.fields['postal_code'] = profileData["postal_code"] ?? "";
      request.fields['driver_license_number'] = profileData["driver_license_number"] ?? "";
      request.fields['national_id'] = profileData["national_id"] ?? "";
      request.fields['passport_number'] = profileData["passport_number"] ?? "";
      request.fields['social_security_number'] = profileData["social_security_number"] ?? "";
      request.fields['occupation'] = profileData["occupation"] ?? "";

      // Add the image file if available
      String? imagePath = profileData["profile_picture_url"];
      if (imagePath != null && imagePath.isNotEmpty) {
        // Check if the path is a valid file
        File imageFile = File(imagePath);
        if (imageFile.existsSync()) {
          request.files.add(await http.MultipartFile.fromPath(
            'profile_picture_url',
            imagePath,
            contentType: MediaType('image', 'jpeg'), // Change if it's another image format
          ));
        }
      }

      // Send the request
      final response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Read the response stream
        final responseData = await response.stream.bytesToString();
        print("Success: $responseData");

        // Parse and return the response as needed
        return UserProfileResponse.fromJson(jsonDecode(responseData));
      } else {
        print("Failed: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print('Exception: $e');
      return null;
    }
  }

}
