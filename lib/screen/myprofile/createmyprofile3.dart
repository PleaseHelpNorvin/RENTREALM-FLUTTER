import 'dart:async';
import 'package:flutter/material.dart';
import '../../utils/https.dart';

class CreatemyprofileScreen3 extends StatefulWidget {
  // user related params
  final String token;
  final int userId;
  final String name;
  final String email;
  final String profileImageUrl;
  final String phoneNumber;
  final String socialMediaLinks;
  // address related params
  final String city;
  final String municipality;
  final String state;
  final String country;
  final String barangay;
  final String street;
  final String zone;
  final String postalCode;

  CreatemyprofileScreen3({
    // user related params
    required this.token,
    required this.userId,
    required this.name,
    required this.email,
    required this.profileImageUrl,
    required this.phoneNumber,
    required this.socialMediaLinks,
    // address related params
    required this.city,
    required this.municipality,
    required this.state,
    required this.country,
    required this.barangay,
    required this.street,
    required this.zone,
    required this.postalCode,
  });

  @override
  CreateMyProfileScreen3State createState() => CreateMyProfileScreen3State();
}

class CreateMyProfileScreen3State extends State<CreatemyprofileScreen3> {
  final _formKey = GlobalKey<FormState>();

  // profilePicturetest = ''
  // Controllers for the new fields
  final TextEditingController driverLicenseController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController passportNumberController = TextEditingController();
  final TextEditingController ssnController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Identification"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Driver License Number
                TextFormField(
                  controller: driverLicenseController,
                  decoration: const InputDecoration(
                    labelText: 'Driver License Number',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Driver License Number is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // National ID
                TextFormField(
                  controller: nationalIdController,
                  decoration: const InputDecoration(
                    labelText: 'National ID',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'National ID is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Passport Number
                TextFormField(
                  controller: passportNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Passport Number',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Passport Number is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Social Security Number
                TextFormField(
                  controller: ssnController,
                  decoration: const InputDecoration(
                    labelText: 'Social Security Number',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'SSN is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Occupation
                TextFormField(
                  controller: occupationController,
                  decoration: const InputDecoration(
                    labelText: 'Occupation',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Occupation is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _onstoreProfile(context);
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
                    "Submit",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 Future<void> _onstoreProfile(BuildContext context) async {
  // Collect the data into a Map
  final profileData = {
    "profile_picture_url": widget.profileImageUrl,
    "phone_number": widget.phoneNumber,
    "social_media_links": widget.socialMediaLinks,
    "country": widget.country,
    "municipality": widget.municipality,
    "city": widget.city,
    "barangay": widget.barangay,
    "street": widget.street,
    "zone": widget.zone,
    "postal_code": widget.postalCode,
    "driver_license_number": driverLicenseController.text,
    "national_id": nationalIdController.text,
    "passport_number": passportNumberController.text,
    "social_security_number": ssnController.text,
    "occupation": occupationController.text,
  };

  // Debugging: Print all collected data
  print('------------------Collected Profile Data------------------');
  profileData.forEach((key, value) {
    print('$key: $value');
  });

  // Call the API to store profile data
  try {
    final response = await ApiService.storeProfileData(
      token: widget.token,
      userId: widget.userId,
      profileData: profileData,
    );

     

    if (response != null && response.success) {
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile stored successfully: ${response.message}')),
      );
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to store profile: ${response?.message ?? "Unknown error"}')),
      );
    }
  } catch (e) {
    print('Exception occurred: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error storing profile: $e')),
    );
  }
}

}
