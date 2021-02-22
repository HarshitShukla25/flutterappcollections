import 'package:flutter/material.dart';
import 'dart:async';

class CountDownTimerApp extends StatefulWidget {
  @override
  _CountDownTimerAppState createState() => _CountDownTimerAppState();
}

class _CountDownTimerAppState extends State<CountDownTimerApp> {
  var minute = 0;
  var seconds = 0;
  Timer timer;
  int totalTime;
  void startTimer() {
    final oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (timer) {
      totalTime = minute * 60 + seconds;
      setState(() {
        if (totalTime < 1) {
          timer.cancel();
        } else {
          totalTime -= 1;
          minute = (totalTime / 60).floor();
          seconds = totalTime % 60;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primarySwatch: Colors.deepPurple),
      child: Scaffold(
        appBar: AppBar(
          title: Text('CountDown timer'),
        ),
        body: Center(
          child: Text(
            '$minute:$seconds',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              child: SimpleDialog(
                contentPadding: EdgeInsets.all(15),
                children: [
                  Text('Set your time'),
                  DropdownButton<int>(
                      value: minute,
                      icon: Text(
                        'Minutes',
                        // style: TextStyle(color: Colors.black),
                      ),
                      items: List.generate(60, (index) {
                        return DropdownMenuItem(
                            value: index, child: Text(index.toString()));
                      }),
                      onChanged: (value) {
                        minute = value;
                      }),
                  DropdownButton<int>(
                      value: seconds,
                      icon: Text(
                        'Seconds',
                        // style: TextStyle(color: Colors.black),
                      ),
                      items: List.generate(60, (index) {
                        return DropdownMenuItem(
                            value: index, child: Text(index.toString()));
                      }),
                      onChanged: (value) {
                        setState(() {
                          seconds = value;
                        });
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  OutlineButton(
                    onPressed: () {
                      startTimer();
                      Navigator.of(context).pop();
                    },
                    child: Text('Start'),
                  ),
                ],
              ),
            );
          },
          child: Icon(Icons.alarm_add_outlined),
        ),
      ),
    );
  }
}
