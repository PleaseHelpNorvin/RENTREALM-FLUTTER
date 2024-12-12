import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rentrealm/utils/https.dart';
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

  const MyProfileScreen({
    super.key,
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
  bool isProfileExpanded = true;
  bool isAddressExpanded = false;
  bool isIdExpanded = false;

  // Variables to track the editable state of fields
  bool isEditingProfilePictureUrl = false; //not yet
  bool isEditingName = false;
  bool isEditingEmail = false;
  bool isEditingPassword = false;
  bool isEditingAddress = false;
  bool isEditingCountry = false;
  bool isEditingCity = false; 
  bool isEditingMunicipality = false;
  bool isEditingBarangay = false;
  bool isEditingZone = false;
  bool isEditingStreet = false;
  bool isEditingPostalCode = false;
  bool isEditingDriverLicense = false;
  bool isEditingNationalId = false;
  bool isEditingPassport = false; //not yet
  bool isEditingSssNumber = false;

  //User Related Controller;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // Controllers to manage the text field input
  //profiles related controllers
  final TextEditingController profilePictureUrlController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController municipalityController = TextEditingController();
  final TextEditingController barangayController = TextEditingController();
  final TextEditingController zoneController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController driverLicenseController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController passportNumberController = TextEditingController();
  final TextEditingController sssNumberContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final iconTheme = Theme.of(context).iconTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
            SizedBox(height: 20),

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
                            isProfileExpanded
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            size: 16,
                            color: iconTheme.color,
                          ),
                        ],
                      ),
                      // Profile fields with "Edit" button
                      if (isProfileExpanded) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isEditingName
                                ? Expanded(
                                    child: TextField(
                                      controller: nameController,
                                      decoration:
                                          InputDecoration(labelText: 'Name'),
                                    ),
                                  )
                                : Text(nameController.text.isEmpty
                                    ? 'Name'
                                    : nameController.text),
                            IconButton(
                              icon: Icon(
                                  isEditingName ? Icons.check : Icons.edit),
                              onPressed: () {
                                setState(() {
                                  isEditingName = !isEditingName;
                                  if (!isEditingName) {
                                    // Save the edited name when done
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isEditingEmail
                                ? Expanded(
                                    child: TextField(
                                      controller: emailController,
                                      decoration:
                                          InputDecoration(labelText: 'Email'),
                                    ),
                                  )
                                : Text(emailController.text.isEmpty
                                    ? 'Email'
                                    : emailController.text),
                            IconButton(
                              icon: Icon(
                                  isEditingEmail ? Icons.check : Icons.edit),
                              onPressed: () {
                                setState(() {
                                  isEditingEmail = !isEditingEmail;
                                  if (!isEditingEmail) {
                                    // Save the edited email when done
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isEditingPassword
                                ? Expanded(
                                    child: TextField(
                                      controller: passwordController,
                                      decoration:
                                          InputDecoration(labelText: 'Password'),
                                    ),
                                  )
                                : Text(passwordController.text.isEmpty
                                    ? 'Password'
                                    : passwordController.text),
                            IconButton(
                              icon: Icon(
                                  isEditingPassword ? Icons.check : Icons.edit),
                              onPressed: () {
                                setState(() {
                                  isEditingPassword = !isEditingPassword;
                                  if (!isEditingPassword) {
                                    // Save the edited password when done
                                  }
                                });
                              },
                            ),
                          ],
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
                            'Address',
                            style: textTheme.titleLarge,
                          ),
                          Icon(
                            isAddressExpanded
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            size: 16,
                            color: iconTheme.color,
                          ),
                        ],
                      ),
                      if (isAddressExpanded) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isEditingAddress
                                ? Expanded(
                                    child: TextField(
                                      controller: addressController,
                                      decoration:
                                          InputDecoration(labelText: 'Address'),
                                    ),
                                  )
                                : Text(addressController.text.isEmpty
                                    ? 'Address'
                                    : addressController.text),
                            IconButton(
                              icon: Icon(
                                  isEditingAddress ? Icons.check : Icons.edit),
                              onPressed: () {
                                setState(() {
                                  isEditingAddress = !isEditingAddress;
                                  if (!isEditingAddress) {
                                    // Save the edited address when done
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        // Repeat the same for other address fields
                        // Country row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isEditingCountry
                                ? Expanded(
                                    child: TextField(
                                      controller: countryController,
                                      decoration:
                                          InputDecoration(labelText: 'Country'),
                                    ),
                                  )
                                : Text(countryController.text.isEmpty
                                    ? 'Country'
                                    : countryController.text),
                            IconButton(
                              icon: Icon(
                                  isEditingCountry ? Icons.check : Icons.edit),
                              onPressed: () {
                                setState(() {
                                  isEditingCountry = !isEditingCountry;
                                  if (!isEditingCountry) {
                                    // Save the edited country when done
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        // City row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isEditingCity
                                ? Expanded(
                                    child: TextField(
                                      controller: cityController,
                                      decoration:
                                          InputDecoration(labelText: 'City'),
                                    ),
                                  )
                                : Text(cityController.text.isEmpty
                                    ? 'City'
                                    : cityController.text),
                            IconButton(
                              icon: Icon(
                                  isEditingCity ? Icons.check : Icons.edit),
                              onPressed: () {
                                setState(() {
                                  isEditingCity = !isEditingCity;
                                  if (!isEditingCity) {
                                    // Save the edited country when done
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        //municipality row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isEditingCity
                                ? Expanded(
                                    child: TextField(
                                      controller: municipalityController,
                                      decoration:
                                          InputDecoration(labelText: 'Municipality'),
                                    ),
                                  )
                                : Text(municipalityController.text.isEmpty
                                    ? 'Municipality'
                                    : municipalityController.text),
                            IconButton(
                              icon: Icon(
                                  isEditingCity ? Icons.check : Icons.edit),
                              onPressed: () {
                                setState(() {
                                  isEditingCity = !isEditingCity;
                                  if (!isEditingCity) {
                                    // Save the edited country when done
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        //Barangay row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isEditingBarangay
                                ? Expanded(
                                    child: TextField(
                                      controller: barangayController,
                                      decoration:
                                          InputDecoration(labelText: 'Barangay'),
                                    ),
                                  )
                                : Text(barangayController.text.isEmpty
                                    ? 'Barangay'
                                    : barangayController.text),
                            IconButton(
                              icon: Icon(
                                  isEditingBarangay ? Icons.check : Icons.edit),
                              onPressed: () {
                                setState(() {
                                  isEditingBarangay = !isEditingBarangay;
                                  if (!isEditingBarangay) {
                                    // Save the edited country when done
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        //Zone row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isEditingZone
                                ? Expanded(
                                    child: TextField(
                                      controller: zoneController,
                                      decoration:
                                          InputDecoration(labelText: 'Zone'),
                                    ),
                                  )
                                : Text(zoneController.text.isEmpty
                                    ? 'Zone'
                                    : zoneController.text),
                            IconButton(
                              icon: Icon(
                                  isEditingZone ? Icons.check : Icons.edit),
                              onPressed: () {
                                setState(() {
                                  isEditingZone = !isEditingZone;
                                  if (!isEditingZone) {
                                    // Save the edited country when done
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        //Street row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isEditingStreet
                                ? Expanded(
                                    child: TextField(
                                      controller: streetController,
                                      decoration:
                                          InputDecoration(labelText: 'Street'),
                                    ),
                                  )
                                : Text(streetController.text.isEmpty
                                    ? 'Street'
                                    : streetController.text),
                            IconButton(
                              icon: Icon(
                                  isEditingStreet ? Icons.check : Icons.edit),
                              onPressed: () {
                                setState(() {
                                  isEditingStreet = !isEditingStreet;
                                  if (!isEditingStreet) {
                                    // Save the edited country when done
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        //Street row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isEditingStreet
                                ? Expanded(
                                    child: TextField(
                                      controller: streetController,
                                      decoration:
                                          InputDecoration(labelText: 'Street'),
                                    ),
                                  )
                                : Text(streetController.text.isEmpty
                                    ? 'Street'
                                    : streetController.text),
                            IconButton(
                              icon: Icon(
                                  isEditingStreet ? Icons.check : Icons.edit),
                              onPressed: () {
                                setState(() {
                                  isEditingStreet = !isEditingStreet;
                                  if (!isEditingStreet) {
                                    // Save the edited country when done
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isEditingPostalCode
                                ? Expanded(
                                    child: TextField(
                                      controller: postalCodeController,
                                      decoration:
                                          InputDecoration(labelText: 'Postal Code'),
                                    ),
                                  )
                                : Text(postalCodeController.text.isEmpty
                                    ? 'Postal Code'
                                    : postalCodeController.text),
                            IconButton(
                              icon: Icon(
                                  isEditingPostalCode ? Icons.check : Icons.edit),
                              onPressed: () {
                                setState(() {
                                  isEditingPostalCode = !isEditingPostalCode;
                                  if (!isEditingPostalCode) {
                                    // Save the edited country when done
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),

            // More expandable cards for Identification here...
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
                            'Identification',
                            style: textTheme.titleLarge,
                          ),
                          Icon(
                            isIdExpanded
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            size: 16,
                            color: iconTheme.color,
                          ),
                        ],
                      ),
                      if (isIdExpanded) ...[
                        //Driver License Field
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isEditingDriverLicense
                                ? Expanded(
                                    child: TextField(
                                      controller: driverLicenseController,
                                      decoration:
                                          InputDecoration(labelText: 'Driver License Number'),
                                    ),
                                  )
                                : Text(driverLicenseController.text.isEmpty
                                    ? 'Driver License Number'
                                    : driverLicenseController.text),
                            IconButton(
                              icon: Icon(
                                  isEditingDriverLicense ? Icons.check : Icons.edit),
                              onPressed: () {
                                setState(() {
                                  isEditingDriverLicense = !isEditingDriverLicense;
                                  if (!isEditingDriverLicense) {
                                    // Save the edited address when done
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        // National Id row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isEditingNationalId
                                ? Expanded(
                                    child: TextField(
                                      controller: nationalIdController,
                                      decoration:
                                          InputDecoration(labelText: 'National Id Number'),
                                    ),
                                  )
                                : Text(nationalIdController.text.isEmpty
                                    ? 'National Id Number'
                                    : nationalIdController.text),
                            IconButton(
                              icon: Icon(
                                  isEditingNationalId ? Icons.check : Icons.edit),
                              onPressed: () {
                                setState(() {
                                  isEditingNationalId = !isEditingNationalId;
                                  if (!isEditingNationalId) {
                                    // Save the edited country when done
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isEditingPassport
                                ? Expanded(
                                    child: TextField(
                                      controller: passportNumberController,
                                      decoration:
                                          InputDecoration(labelText: 'Passport Number'),
                                    ),
                                  )
                                : Text(passportNumberController.text.isEmpty
                                    ? 'Passport Number'
                                    : passportNumberController.text),
                            IconButton(
                              icon: Icon(
                                  isEditingPassport ? Icons.check : Icons.edit),
                              onPressed: () {
                                setState(() {
                                  isEditingPassport = !isEditingPassport;
                                  if (!isEditingPassport) {
                                    // Save the edited country when done
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        //sssNumber row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isEditingSssNumber
                                ? Expanded(
                                    child: TextField(
                                      controller: sssNumberContoller,
                                      decoration:
                                          InputDecoration(labelText: 'Social Security System Number'),
                                    ),
                                  )
                                : Text(sssNumberContoller.text.isEmpty
                                    ? 'Social Security System Number'
                                    : sssNumberContoller.text),
                            IconButton(
                              icon: Icon(
                                  isEditingSssNumber ? Icons.check : Icons.edit),
                              onPressed: () {
                                setState(() {
                                  isEditingSssNumber = !isEditingSssNumber;
                                  if (!isEditingSssNumber) {
                                    // Save the edited country when done
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),

            // More expandable cards for other sections here...

            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _onUpdatedProfile(context),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
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
            ),
          ],
        ),
      ),
    );
  }
  
  Future<void> _onUpdatedProfile(BuildContext context) async {
    // Gather the data from the controllers
    int userId = widget.userId; // Replace with actual user ID

    // Prepare user data for the update
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    Map<String, String> profileData = {
      'profile_picture_url': profilePictureUrlController.text,
      // 'address': addressController.text, // Uncomment if needed
      'country': countryController.text,
      'city': cityController.text,
      'municipality': municipalityController.text,
      'barangay': barangayController.text,
      'zone': zoneController.text,
      'street': streetController.text,
      'postal_code': postalCodeController.text,
      'driver_license_number': driverLicenseController.text,
      'national_id': nationalIdController.text,
      'passport_number': passportNumberController.text,
      'social_security_number': sssNumberContoller.text,
    };

    try {
      // Update user data (e.g., name, email, password)
      await ApiService.updateUser(
        userId: userId,
        name: name,
        email: email,
        password: password,
      );

      // Update profile data (e.g., address, country, etc.)
      await ApiService.updateProfileData(
        userId: userId,
        profileData: profileData,
        
      );

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile updated successfully!')),
      );
    } catch (error) {
      // Handle errors (e.g., API call failure)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update profile.')),
      );
    }
  }

  
}
