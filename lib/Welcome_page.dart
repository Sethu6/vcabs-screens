

import 'package:cab_booking_vcabs/rating_page.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_1/location_permission_page';


class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'Image assest/7.jpg',
                height: 300,
                width: 500,
              ),
              SizedBox(height: 40),
              Text(
                'Welcome to Ola',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Have a hassle-free booking experience by giving us the following permissions.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Icon(Icons.brightness_1, size: 10), // Small dot
                  SizedBox(width: 10), // Space between dot and text
                  Expanded(
                    child: Text(
                      'Location (for finding available rides)',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10), // Space between the two rows
              Row(
                children: [
                  Icon(Icons.brightness_1, size: 10),
                  SizedBox(width: 10), // Space between dot and text
                  Expanded(
                    child: Text(
                      'Phone (for security verification)',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(), 
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RatingPage(),),);
                  
                },
                child: Text('Allow'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Round rectangle border
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


