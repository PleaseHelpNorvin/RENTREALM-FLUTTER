//libraries
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
//api
import '../api/api.dart';
//models
import '../model/register.dart';
// import '';
class ApiService {


  Future<userRegisterResponse?> registerUser({
    required String name,
    required String email,
    required String password,
    // required String role,
  }) async {

    final url = Uri.parse('${Api.baseUrl}/create/tenant'); // Replace with your API endpoint

    try {
      // Prepare request body
      final body = {
        "name": name,
        "email": email,
        "password": password,
        // "role": role,
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
}