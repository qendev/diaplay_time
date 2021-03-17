import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';


void main() {
  runApp(MyTime());
}

class MyTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Display My Time',
      home: DispalyTime(),
    );
  }
}

class DispalyTime extends StatefulWidget {
  @override
  _DispalyTimeState createState() => _DispalyTimeState();
}

class _DispalyTimeState extends State<DispalyTime> {
  String _setTime;
  String _hour, _minute, _time;

  //to display time you have decalre an Object of Time
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  //define the time controller.
  TextEditingController _timeController = TextEditingController();

  //funtion of picking selecting time from time picker
  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  @override
  void initState() {
    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Time'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              FlatButton(
                onPressed: (){
                  _selectTime(context);

                },
                child: Text(
                  'Choose Time',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,

                      letterSpacing: 0.5),
                ),
              ),

              Text(selectedTime.toString())
            ],
          ),
        ),
      ),
    );
  }
}
