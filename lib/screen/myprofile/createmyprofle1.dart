import 'package:flutter/material.dart';
import 'createmyprofile2.dart';
class CreateMyProfileScreen1 extends StatefulWidget {
  final int userId;
  final String name;
  final String email;

  CreateMyProfileScreen1({
    required this.userId,
    required this.name,
    required this.email,
  });

  @override
  CreateMyProfileScreenState1 createState() => CreateMyProfileScreenState1();
}

class CreateMyProfileScreenState1 extends State<CreateMyProfileScreen1> {
  String profileImageUrl = "https://via.placeholder.com/150"; // Placeholder image URL
  final TextEditingController phoneNumberController = TextEditingController();

  // var phoneNumber = phoneNumberController.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Profile"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Centering the profile details section
            Expanded(
              child: Center( // Use Center here to center the content
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                    children: [
                      // Profile Picture
                      Center(
                        child: CircleAvatar(
                          radius: 100,
                          backgroundImage: NetworkImage(profileImageUrl),
                          onBackgroundImageError: (error, stackTrace) {
                            // Fallback in case the image fails to load
                            debugPrint("Error loading profile image: $error");
                          },
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
                    ],
                  ),
                ),
              ),
            ),
            // Button to Continue at the Bottom
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the next screen for address details
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateMyProfileScreen2(
                        userId: widget.userId,
                        name: widget.name,
                        email: widget.email,
                        profileImageUrl: profileImageUrl,
                        phoneNumber: phoneNumberController.text
                      ), // Replace with actual screen
                    ),
                  );
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
    );
  }
}

// class AddressScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Address Details"),
//       ),
//       body: const Center(
//         child: Text("Address Screen Placeholder"), // Replace with actual UI
//       ),
//     );
//   }
// }
