import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  String? selectedDay;
  TimeOfDay? selectedTime;
  String? selectedActivity;

  @override
  void initState() {
    super.initState();
  }

  void scheduleNotification(BuildContext context) {
    if (selectedDay != null && selectedTime != null && selectedActivity != null) {
      final now = DateTime.now();
      var scheduledDate = DateTime(
        now.year,
        now.month,
        now.day,
        selectedTime!.hour,
        selectedTime!.minute,
      );

      // Check if the scheduled date is in the past, if so, add a day
      if (scheduledDate.isBefore(now)) {
        scheduledDate = scheduledDate.add(Duration(days: 1));
      }

      final duration = scheduledDate.difference(now);
      Future.delayed(duration, () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Time for $selectedActivity'),
          ),
        );
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Reminder set for $selectedActivity at ${selectedTime!.format(context)} on $selectedDay'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select all fields'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Reminder App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              hint: Text('Select Day'),
              value: selectedDay,
              items: [
                'Monday',
                'Tuesday',
                'Wednesday',
                'Thursday',
                'Friday',
                'Saturday',
                'Sunday',
              ].map((day) {
                return DropdownMenuItem<String>(
                  value: day,
                  child: Text(day),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedDay = value;
                });
              },
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () async {
                final TimeOfDay? timeOfDay = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (timeOfDay != null) {
                  setState(() {
                    selectedTime = timeOfDay;
                  });
                }
              },
              child: Text(selectedTime == null
                  ? 'Select Time'
                  : selectedTime!.format(context)),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              hint: Text('Select Activity'),
              value: selectedActivity,
              items: [
                'Wake up',
                'Go to gym',
                'Breakfast',
                'Meetings',
                'Lunch',
                'Quick nap',
                'Go to library',
                'Dinner',
                'Go to sleep',
              ].map((activity) {
                return DropdownMenuItem<String>(
                  value: activity,
                  child: Text(activity),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedActivity = value;
                });
              },
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                scheduleNotification(context);
              },
              child: Text('Set Reminder'),
            ),
          ],
        ),
      ),
    );
  }
}
