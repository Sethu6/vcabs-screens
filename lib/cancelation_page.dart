
//import 'package:cab_booking_vcabs/new/yourbill_page.dart';
import 'package:flutter/material.dart';
import 'rating_screen.dart.dart';
class CancelationPage extends StatefulWidget {
  @override
  _CancelationPageState createState() => _CancelationPageState();
}

class _CancelationPageState extends State<CancelationPage> {
  List<bool> _selections = List<bool>.filled(7, false);
  TextEditingController _otherReasonController = TextEditingController();

  void _submitCancellation() {
    bool anySelected = _selections.any((element) => element) ||
        _otherReasonController.text.isNotEmpty;
    if (anySelected) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.emoji_emotions_outlined,
                  color: Colors.yellow,
                  size: 50,
                ),
                SizedBox(height: 10),
                Text(
                  'We\'re so sad about your cancellation',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'We will continue to improve our service & satisfy you on the next trip.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.yellow,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // Show error if no reason is selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a reason for cancellation.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cancel Taxi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Please select the reason for cancellation:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            CheckboxListTile(
              title: Text('Waiting for long time'),
              value: _selections[0],
              onChanged: (bool? value) {
                setState(() {
                  _selections[0] = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Unable to contact driver'),
              value: _selections[1],
              onChanged: (bool? value) {
                setState(() {
                  _selections[1] = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Driver denied to go to destination'),
              value: _selections[2],
              onChanged: (bool? value) {
                setState(() {
                  _selections[2] = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Driver denied to come to pickup'),
              value: _selections[3],
              onChanged: (bool? value) {
                setState(() {
                  _selections[3] = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Wrong address shown'),
              value: _selections[4],
              onChanged: (bool? value) {
                setState(() {
                  _selections[4] = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('The price is not reasonable'),
              value: _selections[5],
              onChanged: (bool? value) {
                setState(() {
                  _selections[5] = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Others'),
              value: _selections[6],
              onChanged: (bool? value) {
                setState(() {
                  _selections[6] = value!;
                });
              },
            ),
            if (_selections[6])
              TextField(
                controller: _otherReasonController,
                decoration: InputDecoration(
                  labelText: 'Other reason',
                ),
              ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RatingScreen()),);
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
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

