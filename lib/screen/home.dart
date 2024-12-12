import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rentrealm/screen/auth/login.dart';
import 'package:rentrealm/utils/https.dart';
import '../api/api.dart';

import '../model/userprofile.dart';
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
  bool _profileFound = false; 
  final apiService = ApiService();
    UserProfileResponse? userProfile; //for fetching userprofilersponse

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
  final textTheme = Theme.of(context).textTheme;
  final iconTheme = Theme.of(context).iconTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 0.0),  // Adjust the padding as needed
          child: 
          Image.asset('assets/images/rentrealm_logo.png'),  // Your image path
        ),
        title: Text('Welcome Back!'),
        // backgroundColor: const Color.fromARGB(255, 251, 251, 251),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app_rounded), // You can use any icon you prefer
            onPressed: () => userOnLogout(context)
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
                        builder: (context) => MyProfileScreen(
                          userId: widget.userId,
                          profile_picture_url: userProfile?.data.profilePictureUrl?? '',
                          phone_number: userProfile?.data.phoneNumber?? '',
                          social_media_links: userProfile?.data.socialMediaLinks?? '', 
                          address: userProfile?.data.address ?? '', 
                          country: userProfile?.data.country ?? '', 
                          city: userProfile?.data.city ?? '', 
                          municipality: userProfile?.data.municipality ?? '', 
                          barangay: userProfile?.data.barangay ?? '', 
                          zone: userProfile?.data.zone ?? '', 
                          street: userProfile?.data.street ?? '', 
                          postal_code: userProfile?.data.postalCode ?? '', 
                          driver_license_number: userProfile?.data.driverLicenseNumber ?? '', 
                          national_id: userProfile?.data.driverLicenseNumber ?? '', 
                          passport_number: userProfile?.data.passportNumber ?? '', 
                          social_security_number: userProfile?.data.socialSecurityNumber ?? '', 
                          occupation: userProfile?.data.occupation ?? '', 
                          updated_at: userProfile?.data.updatedAt ,  
                      )),                      
                    );
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          userProfile != null && userProfile!.data.profilePictureUrl.isNotEmpty
                              ? userProfile!.data.profilePictureUrl.replaceAll('${Api.baseUrl}', '')
                              : 'assets/images/profile_placeholder.png', // Default placeholder
                        ),
                        
                      ),

                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              style: textTheme.titleLarge,
                            ),
                            SizedBox(height: 4),
                            Text(
                              userProfile?.data.occupation ?? '',  // Fallback if no profile is found
                              style: textTheme.titleMedium,
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.email, size: 16, color: iconTheme.color),
                                SizedBox(width: 8),
                                Text(
                                  widget.email,
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

    Future<void> _fetchUserProfile() async {
      final response = await apiService.fetchUserProfile(userId: widget.userId, token: widget.token);
      if (response != null) {
        setState(() {
          userProfile = response;
          _profileFound = true;
        });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyProfileScreen(
              userId: widget.userId,
              profile_picture_url: userProfile?.data.profilePictureUrl?? '',
              phone_number: userProfile?.data.phoneNumber?? '',
              social_media_links: userProfile?.data.socialMediaLinks?? '', 
              address: userProfile?.data.address ?? '', 
              country: userProfile?.data.country ?? '', 
              city: userProfile?.data.city ?? '', 
              municipality: userProfile?.data.municipality ?? '', 
              barangay: userProfile?.data.barangay ?? '', 
              zone: userProfile?.data.zone ?? '', 
              street: userProfile?.data.street ?? '', 
              postal_code: userProfile?.data.postalCode ?? '', 
              driver_license_number: userProfile?.data.driverLicenseNumber ?? '', 
              national_id: userProfile?.data.driverLicenseNumber ?? '', 
              passport_number: userProfile?.data.passportNumber ?? '', 
              social_security_number: userProfile?.data.socialSecurityNumber ?? '', 
              occupation: userProfile?.data.occupation ?? '', 
              updated_at: userProfile?.data.updatedAt ,  
          )),
        );
        setState(() {
          _profileFound = false ;
        });
      }
    }


  Future<void>userOnLogout(BuildContext context) async {
    final response = await apiService.logout(token: widget.token);

    if(response != null && response.success){
      setState(() {
        userProfile = null;
        _profileFound = false;
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout Successful: ${response.message}')),
      );

      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (context) => LoginScreen()
        )
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Logout Failed: ${response?.message}")),
      );
    }
  }
}
