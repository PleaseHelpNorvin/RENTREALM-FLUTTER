import 'dart:async';
import 'package:flutter/material.dart';

class CreatemyprofileScreen3 extends StatefulWidget {
  // user related params
  final int userId;
  final String name;
  final String email;
  final String profileImageUrl;
  final String phoneNumber;
  // address related params
  final String city;
  final String municipality;
  final String State;
  final String country;
  final String barangay;
  final String street;
  final String zone;
  final String postalCode;

  CreatemyprofileScreen3({
    // user related params
    required this.userId,
    required this.name,
    required this.email,
    required this.profileImageUrl,
    required this.phoneNumber,
    // address related params
    required this.city,
    required this.municipality,
    required this.State,
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
                      // If the form is valid, proceed to the next action
                      // Add logic here to save data or navigate to another screen
                      // For example, you can print the entered values:
                      print('Driver License: ${driverLicenseController.text}');
                      print('National ID: ${nationalIdController.text}');
                      print('Passport Number: ${passportNumberController.text}');
                      print('SSN: ${ssnController.text}');
                      print('Occupation: ${occupationController.text}');
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
}
