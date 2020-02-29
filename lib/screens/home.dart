import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int seconds = 0, minutes = 0, hours = 0;
  Timer timer;
  bool active = false;

  void stop() {
    this.timer.cancel();
    setState(() {
      this.active = false;
    });
  }

  void reset() {
    if(timer != null)
      this.timer.cancel();
    setState(() {
      this.seconds = 0;
      this.minutes = 0;
      this.hours = 0;
      this.active = false;
    });
  }

  void increment() {
    setState(() {
      this.active = true;
    });
    Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = this.seconds + 1;
      int localMinutes = this.minutes;
      int localHours = this.hours;
      if(localSeconds > 60) {
        localMinutes++;
        if(localMinutes > 60) {
          localHours++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }
      setState(() {
        this.seconds = localSeconds;
        this.minutes = localMinutes;
        this.hours = localHours;
        this.timer = timer;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Timer',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 50.0),
                child: Text(
                  ((this.hours >= 10) ? '${this.hours}' : '0${this.hours}')
                  + ':'
                  + ((this.minutes >= 10) ? '${this.minutes}' : '0${this.minutes}')
                  + ':' 
                  + ((this.seconds >= 10) ? '${this.seconds}' : '0${this.seconds}'),
                  style: TextStyle(
                    fontSize: 70.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: this.reset,
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white60,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(
                          180.0,
                        ),
                      ),
                      child: Container(
                        height: 70.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(
                            180.0,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.refresh,
                            color: Colors.white,
                            size: 40.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (this.active) ? this.stop : this.increment,
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(174, 83, 169, 0.6),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(
                          180.0,
                        ),
                      ),
                      child: Container(
                        height: 90.0,
                        width: 90.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(174, 83, 169, 1.0),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(
                            180.0,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            (this.active) ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                            size: 60.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white60,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(
                        180.0,
                      ),
                    ),
                    child: Container(
                      height: 70.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(
                          180.0,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.flag,
                          color: Colors.white,
                          size: 40.0,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
