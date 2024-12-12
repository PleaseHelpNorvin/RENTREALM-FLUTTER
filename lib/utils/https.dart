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

    final url = Uri.parse('${Api.baseUrl}/create/tenant'); // Replace with your API endpoint

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
        return userRegisterResponse.fromJson(responseData); // Parse response into model
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
  Future<userLoginResponse?>loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('${Api.baseUrl}/login');

    try {
      // Prepare request body
      final body = {
        "email" : email,
        "password" : password,
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

      if(response.statusCode == 200 || response.statusCode == 201) {
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
  Future<userLogoutResponse?>logout({
    required String token,
  }) async {
    final url = Uri.parse('${Api.baseUrl}/logout');

    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization" : " Bearer $token",
        },
      );

      if(response.statusCode == 200 || response.statusCode == 201 ) {
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

  Future<UserProfileResponse?>fetchUserProfile({
    required int userId,
    required String token,
  }) async {
    final url = Uri.parse('${Api.baseUrl}/tenant/profile/show/${userId}');
    
    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization" : " Bearer $token",
        }
      );
      print(response.body); 
      if(response.statusCode == 200 || response.statusCode == 201) {
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
    required int userId,
    required String name,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('${Api.baseUrl}/updateUser/$userId'); // Adjust the endpoint

    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
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
    required int userId,
    required Map<String, String> profileData,
  }) async {
    final url = Uri.parse('${Api.baseUrl}/updateProfile/$userId'); // Adjust the endpoint

    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(profileData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update profile data');
    }
  }

  
}