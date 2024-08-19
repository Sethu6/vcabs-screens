import 'package:flutter/material.dart';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int _rating = 0;
  final List<bool> _feedbackOptions = List<bool>.filled(12, false);
  final TextEditingController _commentController = TextEditingController();

  void _submitRating() {
    // Handle the rating submission
  }

  Widget _buildFeedbackOptions() {
    List<String> options;
    if (_rating == 5) {
      options = [
        'Polite and professional driver',
        'On-time pickup',
        'Comfortable ride',
        'Driver familiar with the route',
        'Value for Money',
        'My reason is not listed'
      ];
    } else if (_rating >= 3) {
      options = [
        'Smelly cab',
        'Dirty seat covers',
        'Dirty floor/roof',
        'AC is not working',
        'Mechanical issue',
        'Rude/Misbehaving driver',
        'Using phone while driving',
        'Incorrect pickup/drop location',
        'Delayed pickup/drop',
        'Driver took extra money',
        'My reason is not listed'
      ];
    } else {
      options = [
        'Charged extra',
        'Delayed Pickup',
        'Driver Unprofessional',
        'Long/incorrect route',
        'Did not take this ride',
        'My reason is not listed'
      ];
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: options.length,
      itemBuilder: (context, index) {
        return CheckboxListTile(
          title: Text(options[index]),
          value: _feedbackOptions[index],
          onChanged: (bool? value) {
            setState(() {
              _feedbackOptions[index] = value!;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your bill'),
        actions: [
          IconButton(
            icon: Icon(Icons.support_agent),
            onPressed: () {
              // Support button action
            },
          ),
          if (_rating < 5)
            IconButton(
              icon: Icon(Icons.emergency),
              onPressed: () {
                // Emergency button action
              },
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              _rating == 5
                  ? 'A great ride!'
                  : _rating >= 3
                      ? 'A good ride!'
                      : 'A bad one!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Icon(
              _rating == 5
                  ? Icons.thumb_up_alt_outlined
                  : _rating >= 3
                      ? Icons.thumb_up_off_alt_outlined
                      : Icons.thumb_down_alt_outlined,
              size: 50,
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating
                        ? Icons.star
                        : Icons.star_border,
                    color: Colors.yellow,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 8),
            Expanded(child: _buildFeedbackOptions()),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: 'Leave a comment ...',
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: _submitRating,
              child: Text('SUBMIT'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
