import 'package:flutter/material.dart';
// import '../../model/userprofile.dart';
import '../../api/api.dart';

class MyProfileScreen extends StatefulWidget {
  final int userId;
  final String profile_picture_url;
  final String phone_number;
  final String social_media_links;
  final String address;
  final String country;
  final String city;
  final String municipality;
  final String barangay;
  final String zone;
  final String street;
  final String postal_code;
  final String driver_license_number;
  final String national_id;
  final String passport_number;
  final String social_security_number;
  final String occupation;
  final DateTime? updated_at;


  MyProfileScreen({
    required this.userId,
    required this.profile_picture_url,
    required this.phone_number,
    required this.social_media_links,
    required this.address,
    required this.country,
    required this.city,
    required this.municipality,
    required this.barangay,
    required this.zone,
    required this.street,
    required this.postal_code,
    required this.driver_license_number,
    required this.national_id,
    required this.passport_number,
    required this.social_security_number,
    required this.occupation,
    this.updated_at,
  });

  @override
  MyProfileScreenState createState() => MyProfileScreenState();
}

class MyProfileScreenState extends State<MyProfileScreen> {
  
  // This variable will control the expansion of each card
  bool isProfileExpanded = false;
  bool isAddressExpanded = false;
  bool isIdExpanded = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final iconTheme = Theme.of(context).iconTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView( // Wrap the entire content in a scroll view
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CircleAvatar for the profile picture
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                widget.profile_picture_url.isNotEmpty
                    ? widget.profile_picture_url.replaceAll(Api.baseUrl, '')
                    : 'assets/images/profile_placeholder.png', // Default placeholder
              ),

            ),
            SizedBox(height: 20), // Space between avatar and card

            // Expandable Card for Profile Details
            GestureDetector(
              onTap: () {
                setState(() {
                  isProfileExpanded = !isProfileExpanded;
                });
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Profile',
                            style: textTheme.titleLarge,
                          ),
                          Icon(
                            isProfileExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                            size: 16,
                            color: iconTheme.color,
                          ),
                        ],
                      ),
                      // Display input fields if expanded
                      if (isProfileExpanded) ...[
                        TextField(
                          decoration: InputDecoration(labelText: 'Name'),
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Email'),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),

            // Expandable Card for Address Details
            GestureDetector(
              onTap: () {
                setState(() {
                  isAddressExpanded = !isAddressExpanded;
                });
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Address Related Row',
                            style: textTheme.titleLarge,
                          ),
                          Icon(
                            isAddressExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                            size: 16,
                            color: iconTheme.color,
                          ),
                        ],
                      ),
                      // Display input fields if expanded
                      if (isAddressExpanded) ...[
                        TextField(
                          decoration: InputDecoration(labelText: 'Address Line 1'),
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'City'),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),

            // Expandable Card for ID Details
            GestureDetector(
              onTap: () {
                setState(() {
                  isIdExpanded = !isIdExpanded;
                });
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Id Related Row',
                            style: textTheme.titleLarge,
                          ),
                          Icon(
                            isIdExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                            size: 16,
                            color: iconTheme.color,
                          ),
                        ],
                      ),
                      // Display input fields if expanded
                      if (isIdExpanded) ...[
                        TextField(
                          decoration: InputDecoration(labelText: 'ID Number'),
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Issuing Authority'),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => (),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Save Profile",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),  
      ),
    );
    
  }
}
