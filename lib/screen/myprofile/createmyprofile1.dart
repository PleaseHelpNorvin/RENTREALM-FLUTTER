import 'dart:io'; // Import the required package for File
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image/image.dart' as img;
import '../../api/api.dart';
import 'createmyprofile2.dart'; // Make sure this screen is properly defined
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mime/mime.dart';



class CreateMyProfileScreen1 extends StatefulWidget {
  final String token;
  final int userId;
  final String name;
  final String email;

  CreateMyProfileScreen1({
    required this.token,
    required this.userId,
    required this.name,
    required this.email,
  });

  @override
  CreateMyProfileScreenState1 createState() => CreateMyProfileScreenState1();
}

class CreateMyProfileScreenState1 extends State<CreateMyProfileScreen1> {
  String profileImageUrl = "assets/images/profile_placeholder.png"; // Placeholder image URL
  File? _selectedImage; // Store selected image

  TextEditingController phoneNumberController = TextEditingController(text: '09454365069');
  TextEditingController socialMediaLinksController = TextEditingController(text: 'Norvin S Crujido - facebook');

  // Add a key for the form validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Create Profile"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: SingleChildScrollView( // Wrap the entire content with a SingleChildScrollView
          child: Form( // Wrap the content inside the Form widget
            key: _formKey,
            child: Column(
              children: [
                // Centering the profile details section
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                      children: [
                        // Profile Picture
                        GestureDetector(
                          onTap: () async {
                            await pickSaveUploadImageWithDio(context);
                          }, // Open gallery/camera on tap
                          child: CircleAvatar(
                            radius: 100,
                            backgroundImage: _selectedImage != null
                                ? FileImage(_selectedImage!) // Display selected image
                                : AssetImage("assets/images/profile_placeholder.png")
                                    as ImageProvider,
                            child: _selectedImage == null
                                ? Icon(Icons.camera_alt, size: 40, color: Colors.white)
                                : null,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // User Name
                        Text(
                          widget.name,
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // User Email
                        Text(
                          widget.email,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Phone Number Field
                        TextFormField(
                          controller: phoneNumberController,
                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Phone number is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        // Social Media Links Field
                        TextFormField(
                          controller: socialMediaLinksController,
                          decoration: const InputDecoration(
                            labelText: 'Social Media Links',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Social Media Links are required';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                // Button to Continue at the Bottom
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // If form is valid, navigate to the next screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateMyProfileScreen2(
                              token: widget.token,
                              userId: widget.userId,
                              name: widget.name,
                              email: widget.email,
                              profileImageUrl: _selectedImage?.path ?? profileImageUrl,
                              phoneNumber: phoneNumberController.text,
                              socialMediaLinks: socialMediaLinksController.text,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Next: Address",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Pick image from gallery
  Future<void> pickSaveUploadImageWithDio(context) async {
    try {
      // Step 1: Pick an image from the camera
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);

      if (pickedFile == null) {
        print("No image selected.");
        return;
      }

      // Step 2: Load the image file into memory and compress
      final img.Image? image = img.decodeImage(await File(pickedFile.path).readAsBytes());
      
      if (image == null) {
        print("Failed to decode image.");
        return;
      }

      // Compress the image (you can adjust the quality as needed)
      final compressedImage = img.encodeJpg(image, quality: 80); // Compress to JPG with 80% quality

      // Step 3: Save the compressed image to a persistent directory
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = pickedFile.name; // Preserve the original filename
      final savedPath = '${appDir.path}/$fileName';

      final savedFile = await File(savedPath).writeAsBytes(compressedImage);
      print("Saved file path: $savedPath");

      // Step 4: Update the state with the compressed image
      setState(() {
        _selectedImage = savedFile; // Update the selected image
        profileImageUrl = savedFile.path; // Update the profileImageUrl (optional)
      });

      // Step 5: Prepare Dio and the API endpoint
      final dio = Dio();
      final apiUrl = '${Api.baseUrl}/tenant/profile/store?user_id=${widget.userId}'; // Replace with your endpoint
      final filetype = lookupMimeType(savedFile.path) ?? 'image/jpeg';

      // Step 6: Create FormData with compressed image
      final formData = FormData.fromMap({
        'profile_picture_url': await MultipartFile.fromFile(
          savedFile.path, 
          filename: fileName,
          contentType: MediaType.parse(filetype),
        ),
      });

      // Step 7: Upload the image with progress tracking
      final response = await dio.post(
        apiUrl,
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${widget.token}', // Replace with your token
          },
          validateStatus: (status) {
            return status! < 600;
          }
        ),
        onSendProgress: (sent, total) {
          print("Progress: ${(sent / total * 100).toStringAsFixed(0)}%");
        },
      );

      print('response: $response');

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Image uploaded successfully: ${response.data}");
        // Step 8: Delete the saved file after successful upload (optional)
        // await savedFile.delete();
        print("Local image deleted after upload.");
      } else {
        print("Failed to upload image: ${response.statusCode} - ${response.data}");
      }
    } catch (e) {
      if (e is DioError) {
        print("DioError: ${e.response?.data}"); // Log more details if DioError occurs
      } else {
        print("Error: $e");
      }
    }
  }

}
