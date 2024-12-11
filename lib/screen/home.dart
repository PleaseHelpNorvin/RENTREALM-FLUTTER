import 'package:flutter/material.dart';

import 'myprofile/myProfile.dart';

class HomeScreen extends StatefulWidget {
  final int userId;
  final String name;
  final String email;
  final String token;

  HomeScreen({
    required this.userId,
    required this.name,
    required this.email,
    required this.token,
  });

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
  final textTheme = Theme.of(context).textTheme;
  final iconTheme = Theme.of(context).iconTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 0.0),  // Adjust the padding as needed
          child: Image.asset('assets/images/rentrealm_logo.png'),  // Your image path
        ),
        title: Text('Welcome Back!'),
        // backgroundColor: const Color.fromARGB(255, 251, 251, 251),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app_rounded), // You can use any icon you prefer
            onPressed: () {
              // Handle logout logic here
              print("Logging out...");
            },
          ),
        ],
      ),
      body: Padding(
        
        padding: const EdgeInsets.all(16.0),
        child: Column(
          
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigate to MyProfileScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyProfileScreen(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/profile_placeholder.png'), // Replace with your asset
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Norvin Crujido',
                              style: textTheme.titleLarge,
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Flutter Developer',
                              style: textTheme.titleMedium,
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.email, size: 16, color: iconTheme.color),
                                SizedBox(width: 8),
                                Text(
                                  'norvin@example.com',
                                  style: textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 5),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/profile_placeholder.png'), // Replace with your asset
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Norvin Crujido',
                            style: textTheme.titleLarge,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Flutter Developer',
                            style: textTheme.titleMedium,
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.email, size: 16, color: iconTheme.color),
                              SizedBox(width: 8),
                              Text(
                                'norvin@example.com',
                                style: textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Add more widgets below the profile card as needed
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: 150,
                    height: 150,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.payment,  // Choose your desired icon
                      size: 50,
                      color: iconTheme.color,
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: 150,
                    height: 150,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.home_repair_service,  // Choose your desired icon
                      size: 50,
                      color: iconTheme.color,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: 150,
                    height: 150,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.house,  // Choose your desired icon
                      size: 50,
                      color: iconTheme.color,
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: 150,
                    height: 150,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.edit_document,  // Choose your desired icon
                      size: 50,
                      color: iconTheme.color,
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
