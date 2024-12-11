import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
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
              radius: 60, // Adjust the radius to your desired size
              backgroundImage: AssetImage('assets/images/profile_placeholder.png'), // Replace with your image
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
          ],
        ),
      ),
    );
  }
}
