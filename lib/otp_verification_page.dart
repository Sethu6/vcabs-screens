
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'Setup_page.dart';


class OtpVerificationPage extends StatefulWidget {
  final String mobileNumber;
  OtpVerificationPage({required this.mobileNumber});

  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  bool _isOTPCorrect = true;

  void _verifyOTP() {
    String otp = _controllers.map((controller) => controller.text).join();
    setState(() {
      _isOTPCorrect = otp == '1234';
    });
    if (_isOTPCorrect) {
     Navigator.push(context,MaterialPageRoute(builder: (context)=>SetupPage()),);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid OTP. Please try again.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'Image assest/mail.jpg',
                  width: 500, // Adjust width as needed
                  height: 250, // Adjust height as needed
                ),
                SizedBox(height: 20),
                Text('Verification Code',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),),
                Text('Please type the Verification code sent to ${widget.mobileNumber}'),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Container(
                      width: 40,
                      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 20),
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30), // Set the border radius here
                          ),
                        ),
                        onChanged: (value) {
                          if (value.length == 1 && index < 3) {
                            FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                          }
                        },
                        onSubmitted: (value) {
                          if (index == 5) {
                            _verifyOTP();
                          }
                        },
                      ),
                    );
                  }),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _verifyOTP,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20)
                  ),
                  child: Text('Verify OTP'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

