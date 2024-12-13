import 'dart:io'; // Import the required package for File
import 'package:flutter/material.dart';
import 'createmyprofile2.dart'; // Make sure this screen is properly defined
import 'package:image_picker/image_picker.dart';

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

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController socialMediaLinksController = TextEditingController();

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
                          onTap: _pickImage, // Open gallery/camera on tap
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
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery, // Use ImageSource.camera for camera
    );
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path); // Store the selected file
      });
    }
  }
}
