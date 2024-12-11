import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  MyProfileScreenState createState() => MyProfileScreenState();
}

class MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final iconTheme = Theme.of(context).iconTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CircleAvatar for the profile picture
            CircleAvatar(
              radius: 60, // Adjust the radius to your desired size
              backgroundImage: AssetImage('assets/images/profile_placeholder.png'), // Replace with your image
            ),
            SizedBox(height: 20), // Space between avatar and card

            // Tappable Card for profile details
            GestureDetector(
              onTap: () {
                // Handle card tap here
                print("Card tapped!");
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
                      // Profile details
                      Row(
                        children: [
                          Text(
                            'Norvin Crujido', // Name
                            style: textTheme.titleLarge,
                          ),
                          Icon(Icons.email, size: 16, color: iconTheme.color),
                          
                          
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
