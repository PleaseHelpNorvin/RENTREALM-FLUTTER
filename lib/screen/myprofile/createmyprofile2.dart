import 'package:flutter/material.dart';
import 'createmyprofile3.dart';

class CreateMyProfileScreen2 extends StatefulWidget {
  final String token;
  final int userId;
  final String name;
  final String email;
  final String profileImageUrl;
  final String phoneNumber;
  final String socialMediaLinks;

  CreateMyProfileScreen2({
    required this.token,
    required this.userId,
    required this.name,
    required this.email,
    required this.profileImageUrl,
    required this.phoneNumber,
    required this.socialMediaLinks,
  });

  @override
  CreateMyProfileScreen2State createState() => CreateMyProfileScreen2State();
}

class CreateMyProfileScreen2State extends State<CreateMyProfileScreen2> {
  final _formKey = GlobalKey<FormState>();

  // Controllers to capture the input data
  final TextEditingController cityController = TextEditingController();
  final TextEditingController municipalityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController barangayController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController zoneController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input your address"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView( // Allow scrolling when the keyboard appears
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // City Field
                            TextFormField(
                              controller: cityController,
                              decoration: const InputDecoration(
                                labelText: 'City',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty && value.length > 100) {
                                  return 'City should not exceed 100 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),

                            // Municipality Field
                            TextFormField(
                              controller: municipalityController,
                              decoration: const InputDecoration(
                                labelText: 'Municipality',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty && value.length > 100) {
                                  return 'Municipality should not exceed 100 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),

                            // State Field
                            TextFormField(
                              controller: stateController,
                              decoration: const InputDecoration(
                                labelText: 'State',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty && value.length > 100) {
                                  return 'State should not exceed 100 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),

                            // Country Field
                            TextFormField(
                              controller: countryController,
                              decoration: const InputDecoration(
                                labelText: 'Country',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty && value.length > 100) {
                                  return 'Country should not exceed 100 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),

                            // Barangay Field
                            TextFormField(
                              controller: barangayController,
                              decoration: const InputDecoration(
                                labelText: 'Barangay',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty && value.length > 255) {
                                  return 'Barangay should not exceed 255 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),

                            // Street Field
                            TextFormField(
                              controller: streetController,
                              decoration: const InputDecoration(
                                labelText: 'Street',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty && value.length > 255) {
                                  return 'Street should not exceed 255 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),

                            // Zone Field
                            TextFormField(
                              controller: zoneController,
                              decoration: const InputDecoration(
                                labelText: 'Zone',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty && value.length > 255) {
                                  return 'Zone should not exceed 255 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),

                            // Postal Code Field
                            TextFormField(
                              controller: postalCodeController,
                              decoration: const InputDecoration(
                                labelText: 'Postal Code',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty && value.length > 20) {
                                  return 'Postal code should not exceed 20 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 24),

                            // Submit Button
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() ?? false) {
                                  // Form is valid, proceed to save or navigate
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CreatemyprofileScreen3(
                                        // Pass user-rerlated fields
                                        token: widget.token,
                                        userId: widget.userId,
                                        name: widget.name,
                                        email: widget.email,
                                        profileImageUrl: widget.profileImageUrl,
                                        phoneNumber: widget.phoneNumber,
                                        socialMediaLinks:widget.socialMediaLinks,
                                        
                                        // Pass address-related fields
                                        city: cityController.text,
                                        municipality: municipalityController.text,
                                        state: stateController.text,
                                        country: countryController.text,
                                        barangay: barangayController.text,
                                        street: streetController.text,
                                        zone: zoneController.text,
                                        postalCode: postalCodeController.text,
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
                                "Next: Identifications",
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
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
}
