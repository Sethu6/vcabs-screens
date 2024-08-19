import 'package:flutter/material.dart';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int _rating = 5;
  List<String> _selectedOptions = [];
  TextEditingController _commentController = TextEditingController();

  final Map<int, List<String>> options = {
    5: [
      "Polite and professional driver",
      "On-time pickup",
      "Comfortable ride",
      "Driver familiar with the route",
      "Value for Money",
      "My reason is not listed",
    ],
    4: [
      "Smelly cab",
      "Dirty seat covers",
      "Dirty floor/roof",
      "AC is not working",
      "Mechanical issue",
      "Rude/Misbehaving driver",
      "Using phone while driving",
      "Incorrect pickup/drop location",
      "Delayed pickup/drop",
      "Driver took extra money",
      "My reason is not listed",
    ],
    3: [
      "Charged extra",
      "Delayed Pickup",
      "Driver Unprofessional",
      "Long/incorrect route",
      "Did not take this ride",
      "My reason is not listed",
    ],
  };

  void _submitRating() {
    // Handle the submission logic here
    print('Rating: $_rating');
    print('Selected Options: $_selectedOptions');
    print('Comment: ${_commentController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate Your Ride'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              _rating == 5
                  ? 'A great ride!'
                  : _rating == 4
                      ? 'A good ride!'
                      : 'A bad one!',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 16.0),
            Text('Tell us what went ${_rating == 5 ? "perfect for you" : "wrong"}:'),
            Expanded(
              child: ListView(
                children: options[_rating]
                    ?.map(
                      (option) => CheckboxListTile(
                        title: Text(option),
                        value: _selectedOptions.contains(option),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value == true) {
                              _selectedOptions.add(option);
                            } else {
                              _selectedOptions.remove(option);
                            }
                          });
                        },
                      ),
                    )
                    .toList() ??
                    [],
              ),
            ),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: 'Leave a comment...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitRating,
              child: Text('SUBMIT'),
            ),
          ],
        ),
      ),
    );
  }
}

