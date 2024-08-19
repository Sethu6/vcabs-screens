
import 'package:flutter/material.dart';
//import 'package:flutter_application_1/otp_verification_page.dart';
import 'otp_verification_page.dart';
class MobileNumberEntryPage extends StatefulWidget {
  @override
  _MobileNumberEntryPageState createState() => _MobileNumberEntryPageState();
}

class _MobileNumberEntryPageState extends State<MobileNumberEntryPage> {
  final TextEditingController _mobileController = TextEditingController();

  void _navigateToOTPPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OtpVerificationPage(mobileNumber: _mobileController.text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ 
              Image.asset(
                'Image assest/CAB.jpg', // Path to your image asset
                width: 600, // Adjust width as needed
                height: 500, // Adjust height as needed
              ),
              SizedBox(height: 20), // Space below the image
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Welcome to VCABS',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _mobileController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Enter Mobile Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(onPressed: 
                _navigateToOTPPage,
              style: ElevatedButton.styleFrom(
                backgroundColor:Colors.black,
                foregroundColor:Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 150,vertical: 20),
              ),
              child: Text('Get Started'),)
            ],
          ),
        ),
      ),
    );
  }
}

